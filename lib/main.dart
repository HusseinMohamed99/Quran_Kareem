import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moshaf_app/core/helpers/export_manager/export_manager.dart';
import 'package:moshaf_app/firebase_options.dart';
import 'package:moshaf_app/shared/Colors/color_manager.dart';
import 'package:moshaf_app/shared/Network/dio_helper.dart';
import 'package:moshaf_app/shared/bloc_observer.dart';
import 'package:moshaf_app/shared/components/app_font.dart';
import 'package:moshaf_app/shared/cubit/cubit/internet_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase and set up Crashlytics error handling
  await _initializeFirebase();

  // Initialize Dio helper and Bloc observer
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();

  runApp(const QuranKareemApp());
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kReleaseMode) {
    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}

class QuranKareemApp extends StatelessWidget {
  const QuranKareemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            _setPreferredOrientations();
            return InternetCubit();
          },
        ),
      ],
      child: _buildApp(),
    );
  }

  Widget _buildApp() {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'QURAN KAREEM',
            theme: ThemeData(
              scaffoldBackgroundColor: ColorsManager.kBackgroundColor,
              fontFamily: AppFonts.fontFamily,
            ),
            home: const LayoutPage(),
          ),
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
