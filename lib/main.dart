import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moshaf_app/firebase_options.dart';
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

  // Initialize Firebase and set up Crashlytics error handling
  await _initializeFirebase();

  // Initialize Dio helper and Bloc observer
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const QuranKareemApp());
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set up Firebase Crashlytics error handling
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

class QuranKareemApp extends StatelessWidget {
  const QuranKareemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()
            ..initializeAppData(), // Consolidating cubit initialization calls
        ),
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
      ],
      child: _buildApp(),
    );
  }

  Widget _buildApp() {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        _setPreferredOrientations();
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
    );
  }

  void _setPreferredOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

extension MainCubitExtensions on MainCubit {
  void initializeAppData() {
    getSurahEN();
    getQuran();
    getVideo();
    getRiwayat();
    getTafasir();
    getReciters();
    getRadio();
  }
}
