part of './../../core/helpers/export_manager/export_manager.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message, {Color? color}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: ColorsManager.kGreyColor,
        content: Text(
          message,
          style: buildTextStyle(
            context: this,
            fontSize: 15,
            color: color ?? ColorsManager.kGreenColor,
          ),
        ),
      ),
    );
  }
}

onTap(BuildContext context) {
  // You Can Use
  context.showSnackBar('Tapped');

  // Instead Of
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Tapped'),
    ),
  );
}
