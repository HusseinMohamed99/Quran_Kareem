import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moshaf_app/model/surah_model.dart';
import 'package:moshaf_app/shared/Cubit/cubit/main_cubit_state.dart';
import 'package:moshaf_app/shared/Network/dio_helper.dart';
import 'package:moshaf_app/shared/Network/end_points.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainCubitInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  SurahModel? surahModel;
  void getSurah() {
    emit(MainCubitLoading());
    DioHelper.getData(
      url: surah,
    ).then((value) {
      surahModel = SurahModel.fromJson(value.data);
      emit(MainCubitSuccess());
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(MainCubitError(error.toString()));
    });
  }
}
