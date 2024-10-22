part of './../../core/helpers/export_manager/export_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: backgroundImage(),
        child: UpgradeWrapper(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const OnBoardingImage(),
                  const CustomOnBoardingButton(),
                  SizedBox(height: context.screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
