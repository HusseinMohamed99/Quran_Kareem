part of '../../core/helpers/export_manager/export_manager.dart';

class AlBasmalaBannerWidget extends StatelessWidget {
  const AlBasmalaBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .37,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: context.screenHeight * -.04,
            child: SvgPicture.asset(
              Assets.imagesLogo,
              width: context.screenWidth * .8,
            ),
          ),
          Positioned(
            top: context.screenHeight * .15,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: context.screenWidth * .9,
                  height: context.screenHeight * .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    gradient: const LinearGradient(
                      colors: [
                        ColorsManager.kGreenColor,
                        ColorsManager.kBlueColor,
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(Assets.imagesVectorOptimized),
                Positioned(
                  top: context.screenHeight * .08,
                  child: SvgPicture.asset(
                    Assets.imagesAlBasmala,
                    fit: BoxFit.fitHeight,
                    width: context.screenWidth * .6,
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
