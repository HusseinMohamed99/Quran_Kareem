part of './../../core/helpers/export_manager/export_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: Scaffold(
              backgroundColor: ColorsManager.kBackgroundColor,
              body: SizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      AlBasmalaWidget(
                        screenHeight: context.screenHeight,
                        screenWidth: context.screenWidth,
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          primary: false,
                          children: const [
                            ListOfGridWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
