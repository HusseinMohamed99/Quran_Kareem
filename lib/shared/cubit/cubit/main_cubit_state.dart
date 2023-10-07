abstract class MainState {}

class MainCubitInitial extends MainState {}

class MainCubitLoading extends MainState {}

class MainCubitSuccess extends MainState {}

class MainCubitError extends MainState {
  final String error;

  MainCubitError(this.error);
}
