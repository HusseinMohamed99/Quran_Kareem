part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildGridItem extends StatelessWidget {
  const BuildGridItem({
    super.key,
    required this.titleAR,
    required this.titleEN,
    required this.function,
  });
  final String titleAR;
  final String titleEN;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const GridImageBackgroundWidget(),
          Container(
            width: context.screenWidth,
            height: context.screenHeight * .18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorsManager.kGreenColor,
                  ColorsManager.kBlueColor.withOpacity(0.2),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleAR,
                  style: buildTextStyle(
                    context: context,
                    fontSize: 20,
                  ),
                ),
                Text(
                  titleEN,
                  style: buildTextStyle(
                    context: context,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
