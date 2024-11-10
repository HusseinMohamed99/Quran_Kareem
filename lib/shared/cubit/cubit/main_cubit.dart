part of './../../../core/helpers/export_manager/export_manager.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainCubitInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  SurahModel? surahModel;
  Future<void> getSurahEN() async {
    emit(GetSurahLoading());
    await DioHelper.getData(
      url: '$surah?language=eng',
    ).then((value) {
      surahModel = SurahModel.fromJson(value.data);
      emit(GetSurahSuccess());
    }).catchError((error) {
      emit(GetSurahError(error.toString()));
    });
  }

  AyatModel? ayatModel;
  void getQuran() {
    emit(GetQuranLoading());
    DioHelper.getData(url: 'http://api.alquran.cloud/v1/quran/ar.alafasy')
        .then((value) {
      ayatModel = AyatModel.fromJson(value.data);
      emit(GetQuranSuccess());
    }).catchError((error) {
      emit(GetQuranError(error));
    });
  }

  RiwayatModel? riwayatModel;
  void getRiwayat() {
    emit(GetRiwayatLoading());
    DioHelper.getData(
      url: rewayah,
    ).then((value) {
      riwayatModel = RiwayatModel.fromJson(value.data);
      emit(GetRiwayatSuccess());
    }).catchError((error) {
      emit(GetRiwayatError(error.toString()));
    });
  }

  previousTafasir() {
    if (currentIndexTafasir == 0) return;
    tafasirPlayer.stop();
    isTafasirPlay = false;
    currentIndexTafasir--;
    currentTafasir = soar![currentIndexTafasir];
    emit(GetTafasirSuccess());
  }

  nextTafasir() {
    if (currentIndexTafasir == soar!.length - 1) return;
    tafasirPlayer.stop();
    isTafasirPlay = false;
    currentIndexTafasir++;
    currentTafasir = soar![currentIndexTafasir];
    emit(GetTafasirSuccess());
  }

  clickOnTafasirPlay() async {
    try {
      if (isRadioPlay == true && radioPlayer.state == PlayerState.playing) {
        // Stop radio if playing
        await radioPlayer.stop();
        isRadioPlay = false;
      }

      // Control Tafasir playback based on current state
      if (tafasirPlayer.state == PlayerState.playing) {
        isTafasirPlay = false;
        await tafasirPlayer.pause();
      } else if (tafasirPlayer.state == PlayerState.paused) {
        isTafasirPlay = true;
        await tafasirPlayer.resume();
      } else {
        isTafasirPlay = true;
        await tafasirPlayer.play(UrlSource(currentTafasir!.url!));
      }
    } catch (e) {
      emit(GetTafasirError('Failed to play Tafasir audio: $e'));
    }

    emit(GetTafasirSuccess());
  }

  List<Soar>? soar = [];
  Soar? currentTafasir;
  int currentIndexTafasir = 0;
  bool isTafasirPlay = false;
  final tafasirPlayer = AudioPlayer();

  void getTafasir() {
    emit(GetTafasirLoading());
    DioHelper.getData(
      url: tafasir,
    ).then((value) {
      var data = TafasirModel.fromJson(value.data);
      soar = data.tafasir?.soar;
      if (soar != null && soar!.isNotEmpty) {
        currentTafasir = soar![currentIndexTafasir];
      }
      emit(GetTafasirSuccess());
    }).catchError((error) {
      emit(GetTafasirError(error.toString()));
    });
  }

  List<Radios>? radios = [];
  Radios? currentRadio;
  int currentIndex = 0;
  bool isRadioPlay = false;
  final radioPlayer = AudioPlayer();

  void getRadio() async {
    emit(GetRadioLoading());
    await DioHelper.getData(
      url: radio,
    ).then((value) {
      var data = RadioModel.fromJson(value.data);
      radios = data.radios;
      currentRadio = radios![currentIndex];
      emit(GetRadioSuccess());
    }).catchError((error) {
      emit(GetRadioError(error.toString()));
    });
  }

  previousRadio() {
    if (currentIndex == 0) return;
    radioPlayer.stop();
    isRadioPlay = false;
    currentIndex--;
    currentRadio = radios![currentIndex];
    emit(GetRadioSuccess());
  }

  nextRadio() {
    if (currentIndex == radios!.length - 1) return;
    radioPlayer.stop();
    isRadioPlay = false;
    currentIndex++;
    currentRadio = radios![currentIndex];
    emit(GetRadioSuccess());
  }

  clickOnPlay() async {
    try {
      if (isTafasirPlay == true && tafasirPlayer.state == PlayerState.playing) {
        // Stop Tafasir if playing
        await tafasirPlayer.stop();
        isTafasirPlay = false;
      }

      // Check and control radio playback states
      if (radioPlayer.state == PlayerState.playing) {
        isRadioPlay = false;
        await radioPlayer.pause();
      } else if (radioPlayer.state == PlayerState.paused) {
        isRadioPlay = true;
        await radioPlayer.resume();
      } else {
        isRadioPlay = true;
        await radioPlayer.play(UrlSource(currentRadio!.url!));
      }
    } catch (e) {
      emit(GetRadioError('Failed to play audio: $e'));
    }

    emit(GetRadioSuccess());
  }

  Dio dio = Dio();
  VideosModel? videosModel;
  void getVideo() async {
    emit(GetVideosLoading());
    await DioHelper.getData(
      url: videos,
    ).then((value) {
      videosModel = VideosModel.fromJson(value.data);
      emit(GetVideosSuccess());
    }).catchError((error) {
      emit(GetVideosError(error.toString()));
    });
  }

  RecitersModel? recitersModel;
  void getReciters() {
    emit(GetRecitersLoading());
    dio.get('https://mp3quran.net/api/v3/reciters?language=ar').then((value) {
      recitersModel = RecitersModel.fromJson(value.data);
      emit(GetRecitersSuccess());
    }).catchError((error) {
      emit(GetRecitersError(error.toString()));
    });
  }
}
