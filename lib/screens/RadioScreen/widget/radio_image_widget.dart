part of './../../../core/helpers/export_manager/export_manager.dart';

class RadioImageWidget extends StatelessWidget {
  const RadioImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Image.asset(
        Assets.imagesRadio,
      ),
    );
  }
}
