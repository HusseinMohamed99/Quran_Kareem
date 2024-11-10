part of './../../../core/helpers/export_manager/export_manager.dart';

class TafasirWidget extends StatefulWidget {
  const TafasirWidget({
    super.key,
    required this.tafasirModel,
    required this.mainCubit,
  });
  final Soar tafasirModel;
  final MainCubit mainCubit;

  @override
  State<TafasirWidget> createState() => _TafasirWidgetState();
}

class _TafasirWidgetState extends State<TafasirWidget> {
  bool isPlaying = false;

  void _togglePlay() async {
    await widget.mainCubit.clickOnTafasirPlay();
    setState(() {
      isPlaying = widget.mainCubit.isTafasirPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.tafasirModel.name ?? '',
            style:
                const TextStyle(color: ColorsManager.kWhiteColor, fontSize: 20),
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomPlayerIconButton(
                imageIcon: Assets.imagesIconMetro,
                voidCallback: () {
                  widget.mainCubit.previousTafasir();
                },
              ),
              CustomPlayerIconButton(
                imageIcon: Assets.imagesIconPlay,
                voidCallback: _togglePlay,
              ),
              CustomPlayerIconButton(
                imageIcon: Assets.imagesIconMetroNext,
                voidCallback: () {
                  widget.mainCubit.nextTafasir();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
