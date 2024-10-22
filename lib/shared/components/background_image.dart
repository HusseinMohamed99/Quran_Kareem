part of './../../core/helpers/export_manager/export_manager.dart';

BoxDecoration backgroundImage() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        Assets.imagesBackground,
      ),
      fit: BoxFit.fill,
    ),
  );
}
