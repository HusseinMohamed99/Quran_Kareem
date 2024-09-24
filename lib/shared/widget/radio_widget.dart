import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moshaf_app/image_assets.dart';
import 'package:moshaf_app/model/radio_model.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key, required this.radioModel, required this.index});
  final RadioModel radioModel;
  final int index;

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
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
            widget.radioModel.radios![widget.index].name ?? '',
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
                  width: 24,
                  height: 24,
                  Assets.imagesIconMetro,
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
                  setState(
                    () {
                      audioPlayer.state == PlayerState.playing
                          ? audioPlayer.pause()
                          : audioPlayer.play(
                              UrlSource(
                                widget.radioModel.radios![widget.index].url ??
                                    '',
                              ),
                            );
                    },
                  );
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
                iconSize: 24,
                onPressed: () async {
                  await audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconMetroNext,
                  width: 24,
                  height: 24,
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
