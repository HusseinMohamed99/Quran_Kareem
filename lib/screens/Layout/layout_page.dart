part of './../../core/helpers/export_manager/export_manager.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.gained) {
                context.showSnackBar(
                  'Connected',
                );
              } else if (state == InternetState.lost) {
                context.showSnackBar(
                  'Not Connected',
                  color: Colors.red,
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.gained) {
                // Show your information when connected
                return const OnBoardingScreen();
              } else if (state == InternetState.lost) {
                return SvgPicture.asset(Assets.imagesErrorOptimized);
              } else {
                return const CircularProgressIndicator
                    .adaptive(); // Loading indicator
              }
            },
          ),
        ),
      ),
    );
  }
}
