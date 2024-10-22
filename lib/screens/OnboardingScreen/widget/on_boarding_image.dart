part of './../../../core/helpers/export_manager/export_manager.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesOnBoardingLogo,
      allowDrawingOutsideViewBox: true,
    );
  }
}
