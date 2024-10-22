part of './../../core/helpers/export_manager/export_manager.dart';

TextStyle buildTextStyle({
  required BuildContext context,
  required double fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: getResponsiveFontSize(
      context,
      fontSize: fontSize.sp,
    ),
    fontWeight: fontWeight ?? FontWeight.w600,
    color: color ?? ColorsManager.kWhiteColor,
  );
}
