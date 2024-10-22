part of './../../../core/helpers/export_manager/export_manager.dart';

class GridImageBackgroundWidget extends StatelessWidget {
  const GridImageBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesLogo,
      height: 100.h,
      width: 100.w,
    );
  }
}
