import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/tafasir_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';

class TafasirWidget extends StatefulWidget {
  const TafasirWidget({
    super.key,
    required this.tafasirModel,
    required this.index,
  });
  final TafasirModel tafasirModel;
  final int index;

  @override
  State<TafasirWidget> createState() => _TafasirWidgetState();
}

class _TafasirWidgetState extends State<TafasirWidget> {
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.tafasirModel.tafasir!.soar![widget.index].name ?? '',
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
                iconSize: 24,
                onPressed: () {
                  audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconMetro,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.kWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                iconSize: 24,
                onPressed: () {
                  setState(() {
                    audioPlayer.state == PlayerState.playing
                        ? audioPlayer.pause()
                        : audioPlayer.play(
                            UrlSource(widget.tafasirModel.tafasir!
                                    .soar![widget.index].url ??
                                ''),
                          );
                  });
                },
                icon: SvgPicture.asset(
                  audioPlayer.state == PlayerState.playing
                      ? Assets.imagesPauseIcon
                      : Assets.imagesIconPlay,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.kWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  await audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconMetroNext,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.kWhiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
