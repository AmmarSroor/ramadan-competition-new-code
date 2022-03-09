part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}
class HomePageInitialState extends HomePageState {}

class HomePageBottomNavLoadingState extends HomePageState {}
class HomePageBottomNavLoadedState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}
class HomePageLoadedState extends HomePageState {}
class HomePageErrorState extends HomePageState {}

class DrawerLoadingState extends HomePageState {}
class DrawerLoadedState extends HomePageState {}
class DrawerErrorState extends HomePageState {}

class HomePageSliderLoadingState extends HomePageState {}
class HomePageSliderLoadedState extends HomePageState {}

class DropDownValueLoadingState extends HomePageState {}
class DropDownValueLoadedState extends HomePageState {}
class DropDownValueErrorState extends HomePageState {}

class ImageProfileLoadingState extends HomePageState {}
class ImageProfileLoadedState extends HomePageState {}

class GetTopPersonLoadingState extends HomePageState {}
class GetTopPersonLoadedState extends HomePageState {}

class GetTotalPointsByDayLoadingState extends HomePageState {}
class GetTotalPointsByDayLoadedState extends HomePageState {}
class GetTotalPointsByDayErrorState extends HomePageState {}

class GetPointsTemplateLoadingState extends HomePageState {}
class GetPointsTemplateLoadedState extends HomePageState {}
class GetPointsTemplateErrorState extends HomePageState {
  final String message;
  GetPointsTemplateErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class GetTotalPointsByTypeLoadingState extends HomePageState {}
class GetTotalPointsByTypeLoadedState extends HomePageState {}
class GetTotalPointsByTypeErrorState extends HomePageState {}

class GetDailyPointsByTypeLoadingState extends HomePageState {}
class GetDailyPointsByTypeLoadedState extends HomePageState {}
class GetDailyPointsByTypeErrorState extends HomePageState {}
