part of './../../../core/helpers/export_manager/export_manager.dart';

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
