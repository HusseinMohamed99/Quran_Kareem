part of './../../../core/helpers/export_manager/export_manager.dart';

class RadioListViewWidget extends StatefulWidget {
  const RadioListViewWidget(
      {super.key, required this.radioModel, required this.mainCubit});
  final Radios radioModel;
  final MainCubit mainCubit;
  @override
  State<RadioListViewWidget> createState() => _RadioListViewWidgetState();
}

class _RadioListViewWidgetState extends State<RadioListViewWidget> {
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
              CustomRadioIconButton(
                voidCallback: () {
                  widget.mainCubit.previousRadio();
                },
                imageIcon: Assets.imagesIconMetro,
              ),
              CustomRadioIconButton(
                voidCallback: () {
                  widget.mainCubit.clickOnPlay();
                },
                imageIcon: Assets.imagesIconPlay,
              ),
              CustomRadioIconButton(
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

class CustomRadioIconButton extends StatelessWidget {
  const CustomRadioIconButton({
    super.key,
    required this.voidCallback,
    required this.imageIcon,
  });

  final VoidCallback voidCallback;
  final String imageIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24.sp,
      onPressed: voidCallback,
      icon: SvgPicture.asset(
        imageIcon,
        width: 24.w,
        height: 24.h,
        colorFilter: const ColorFilter.mode(
          ColorsManager.kWhiteColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
