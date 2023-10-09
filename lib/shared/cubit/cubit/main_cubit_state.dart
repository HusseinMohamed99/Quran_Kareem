abstract class MainState {}

class MainCubitInitial extends MainState {}

class GetSurahLoading extends MainState {}

class GetSurahSuccess extends MainState {}

class GetSurahError extends MainState {
  final String error;

  GetSurahError(this.error);
}

class GetRadioLoading extends MainState {}

class GetRadioSuccess extends MainState {}

class GetRadioError extends MainState {
  final String error;

  GetRadioError(this.error);
}
