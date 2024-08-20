import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moshaf_app/screens/Home/home_page.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/Network/dio_helper.dart';
import 'package:moshaf_app/shared/bloc_observer.dart';
import 'package:moshaf_app/shared/components/app_font.dart';
import 'package:moshaf_app/shared/cubit/cubit/internet_bloc.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_cubit.dart';
import 'package:moshaf_app/shared/cubit/cubit/main_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  runApp(const QuranKareemApp());
}

class QuranKareemApp extends StatelessWidget {
  const QuranKareemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()
            ..getSurahEN()
            ..getQuran()
            ..getVideo()
            ..getRiwayat()
            ..getTafasir()
            ..getReciters()
            ..getRadio(),
        ),
        BlocProvider(
          create: (context) => InternetCubit(),
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
            title: 'QURAN KAREEM',
            theme: ThemeData(
              scaffoldBackgroundColor: ColorsManager.kBackgroundColor,
              fontFamily: AppFonts.fontFamily,
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
