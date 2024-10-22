part of './../../../core/helpers/export_manager/export_manager.dart';

class CustomOnBoardingButton extends StatelessWidget {
  const CustomOnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(
          context,
          const HomeScreen(),
        );
      },
      child: CustomOutline(
        strokeWidth: 3,
        radius: 20,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsManager.kBlackColor,
            ColorsManager.kGreenColor,
          ],
        ),
        width: 160,
        height: 38,
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 3.h,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorsManager.kBlackColor.withOpacity(0.5),
                ColorsManager.kGreenColor.withOpacity(0.5),
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: buildTextStyle(
                context: context,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
