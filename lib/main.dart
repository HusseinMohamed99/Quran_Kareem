import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moshaf_app/screens/OnboardingScreen/onboarding_screen.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/bloc_observer.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit_state.dart';
import 'package:moshaf_app/shared/Network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()
            ..getSurahAR()
            ..getVideo()
            ..getRiwayat()
            ..getTafasir(),
        ),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Moshaf App',
            theme: ThemeData(
              scaffoldBackgroundColor: ColorsManager.kBackgroundColor,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
            home: const OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
