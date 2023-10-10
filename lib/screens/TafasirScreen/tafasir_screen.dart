import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/tafasir_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';

class TafasirScreen extends StatefulWidget {
  const TafasirScreen({super.key});

  @override
  State<TafasirScreen> createState() => _TafasirScreenState();
}

class _TafasirScreenState extends State<TafasirScreen> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.imagesBackground,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.imagesHelal,
                      ),
                      SvgPicture.asset(
                        Assets.imagesAlQuran,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: Api.getTafasir(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            "something went wrong",
                            style: TextStyle(
                              color: ColorsManager.kWhiteColor,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }
                      var sora = snapshot.data ?? [];
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TafasirItem(
                            soar: sora[index],
                            audioPlayer: audioPlayer,
                          );
                        },
                        itemCount: sora.length,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Api {
  static Future<List<Soar>> getTafasir() async {
    Uri url = Uri.https("mp3quran.net", "/api/v3/tafsir");
    http.Response response = await http.get(url);
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    TafasirModel tafasirResponse = TafasirModel.fromJson(data);
    return tafasirResponse.tafasir!.soar ?? [];
  }
}

class TafasirItem extends StatelessWidget {
  const TafasirItem({
    super.key,
    required this.soar,
    required this.audioPlayer,
  });
  final Soar soar;

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            soar.name ?? "",
            style:
                const TextStyle(color: ColorsManager.kWhiteColor, fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconMetro,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () async {
                  audioPlayer.play(
                    UrlSource(soar.url ?? ""),
                  );
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconPlay,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
              IconButton(
                onPressed: () async {
                  audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconMetroNext,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
