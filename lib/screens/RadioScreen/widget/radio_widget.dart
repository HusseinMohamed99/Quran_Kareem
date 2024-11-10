part of './../../../core/helpers/export_manager/export_manager.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget(
      {super.key, required this.radioModel, required this.mainCubit});
  final Radios radioModel;
  final MainCubit mainCubit;
  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isPlaying = false;

  void _togglePlay() async {
    await widget.mainCubit.clickOnTafasirPlay();
    setState(() {
      isPlaying = widget.mainCubit.isRadioPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.radioModel.name ?? '',
            style: buildTextStyle(context: context, fontSize: 16),
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomPlayerIconButton(
                voidCallback: () {
                  widget.mainCubit.previousRadio();
                },
                imageIcon: Assets.imagesIconMetro,
              ),
              CustomPlayerIconButton(
                voidCallback: _togglePlay,
                imageIcon: Assets.imagesIconPlay,
              ),
              CustomPlayerIconButton(
                voidCallback: () {
                  widget.mainCubit.nextRadio();
                },
                imageIcon: Assets.imagesIconMetroNext,
              ),
            ],
          )
        ],
      ),
    );
  }
}
