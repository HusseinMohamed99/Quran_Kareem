import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/radio_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
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
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.imagesBackground,
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              Expanded(child: Image.asset(Assets.imagesRadio)),
              Expanded(
                flex: 1,
                child: FutureBuilder(
                    future: Api.getRadios(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("something went wrong"),
                        );
                      }
                      var radios = snapshot.data ?? [];
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context, index) {
                          return RadioItem(radios[index], audioPlayer);
                        },
                        itemCount: radios.length,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Api {
  static Future<List<Radios>> getRadios() async {
    Uri url = Uri.https("api.mp3quran.net", "/radios/radio_arabic.json");
    http.Response response = await http.get(url);
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    RadioModel radioResponse = RadioModel.fromJson(data);
    return radioResponse.radios ?? [];
  }
}

class RadioItem extends StatelessWidget {
  const RadioItem(this.radio, this.audioPlayer, {super.key});
  final Radios radio;
  final AudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            radio.name ?? "",
            style:
                const TextStyle(color: ColorsManager.kWhiteColor, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  audioPlayer.play(
                    UrlSource(radio.url ?? ""),
                  );
                },
                icon: SvgPicture.asset(Assets.imagesIconmetro),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () async {
                  await audioPlayer.pause();
                },
                icon: SvgPicture.asset(Assets.imagesIconplay),
              ),
              IconButton(
                onPressed: () async {
                  await audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconmetroNext,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
