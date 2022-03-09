import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ramadan_cmpetitions/core/models/point_template_model.dart';
import 'package:ramadan_cmpetitions/core/models/result_item_model.dart';
import 'package:ramadan_cmpetitions/core/models/top_person_model.dart';
import 'package:ramadan_cmpetitions/core/resources/strings.dart';
import 'package:ramadan_cmpetitions/core/servers/url.dart';
import 'package:ramadan_cmpetitions/cubit/login_and_register_cubit/account_cubit.dart';
import 'package:ramadan_cmpetitions/core/servers/dio_helper.dart';
import 'package:ramadan_cmpetitions/screens/home_page/pages/home_page.dart';
import 'package:ramadan_cmpetitions/screens/home_page/pages/input_data_page.dart';
import 'package:ramadan_cmpetitions/screens/home_page/pages/top_persons_page.dart';
import 'package:ramadan_cmpetitions/screens/home_page/pages/result_page.dart';
import 'package:ramadan_cmpetitions/shared_preferences.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  static HomePageCubit get(BuildContext context) => BlocProvider.of(context);
  HomePageCubit() : super(HomePageInitialState());

  bool? _contactUsPressed = false;
  List<ResultItemModel> results = [
    ResultItemModel(
      title: 'قراءة القرآن',
      number: 50,
      forPoint: 5,
    ),
    ResultItemModel(
      title: 'الأذكار',
      number: 100,
      forPoint: 4,
    ),
    ResultItemModel(
      title: 'صلاة على النبي',
      number: 1000,
      forPoint: 2,
    ),
  ];

  bool get contactUsPressed => _contactUsPressed!;
  set pressOnContactUs(bool value) {
    emit(DrawerLoadingState());
    _contactUsPressed = value;
    emit(DrawerLoadedState());
  }

  int _dropDownValue = 1;
  int get dropDownValue => _dropDownValue;
  set changeDropDownValue(int value) {
    emit(DropDownValueLoadingState());
    _dropDownValue = value;
    emit(DropDownValueLoadedState());
  }

  List<Widget> bottomNavigationBarScreens = [
    HomePage(),
    TopThreePersonPage(),
    InputDataPage(),
    ResultsPage(),
  ];
  List<String> announcementList = [
    "اعلان عن يوم قيام ليل لجميع طلاب المركز\n\nليلة الخميس\n\nمسجد عمر بن الخطاب",
    "اعلان عن يوم قيام ليل لجميع طلاب المركز\n\nليلة الخميس\n\nمسجد عمر بن الخطاب",
    "اعلان عن يوم قيام ليل لجميع طلاب المركز\n\nليلة الخميس\n\nمسجد عمر بن الخطاب",
    "اعلان عن يوم قيام ليل لجميع طلاب المركز\n\nليلة الخميس\n\nمسجد عمر بن الخطاب",
  ];
  List<Map<String ,dynamic>> bottomNavigationBarItems = [
    {HOMEPAGE:Icons.home},
    {TOP:Icons.star},
    {NEW_DATA:Icons.archive_outlined},
    {VIEW_PREVIOUS_DATA:Icons.stacked_bar_chart},
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void changeBottomIndex(int index) {
    emit(HomePageBottomNavLoadingState());
    _currentIndex = index;
    emit(HomePageBottomNavLoadedState());
  }

  int _sliderIndex=0;

  int get sliderIndex => _sliderIndex;
  void changeSliderIndex(int index) {
    emit(HomePageSliderLoadingState());
    _sliderIndex = index;
    emit(HomePageSliderLoadedState());
  }

  Future<void> openGallery(BuildContext context) async{
    emit(ImageProfileLoadingState());
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery ,
    );
    AccountCubit.get(context).setImageFile = image!;
    emit(ImageProfileLoadedState());
  }


  List<TopPerson> topPerson = [];

  Future<void> getTopPerson()async{
    emit(GetTopPersonLoadingState());
    DioHelper.getTopStudents(
      token: CacheHelper.getData(key: TOKEN_KEY),
      path: URL_GET_TOP_STUDENTS,
    ).then((value){
      value.data.forEach((person){
        topPerson.add(TopPerson.fromJson(person));
      });
      emit(GetTopPersonLoadedState());
    }).catchError((error){
      print(error.toString());
    });
  }

  List<PointTemplateModel> pointTemplateList = [];
  Future<void> getPointTemplateFromDio()async{
    emit(GetPointsTemplateLoadingState());
    DioHelper.getPointTemplates(
      token: CacheHelper.getData(key: TOKEN_KEY),
      path: URL_POINT_TEMPLATE,
    ).then((value){
      pointTemplateList = pointTemplateFromJson(value.data);
      print('========= point template data ======= ');
      print(value.data);
      print('========= point template data ======= ');
      emit(GetPointsTemplateLoadedState());
    }).catchError((error){
      print(error.toString());
      emit(GetPointsTemplateErrorState(message: error.toString()));
    });
  }

  Map<String,dynamic> totalPointsByDay ={};
  Future<void> getTotalPointsByDay()async{
    emit(GetTotalPointsByDayLoadingState());
    DioHelper.getTotalPointsByDay(
      token: CacheHelper.getData(key: TOKEN_KEY),
      path: URL_GET_TOTAL_POINTS_BY_DAY,
    ).then((value){
      totalPointsByDay=value.data;
      print(totalPointsByDay);
      emit(GetTotalPointsByDayLoadedState());
    }).catchError((error){
      print(error.toString());
      emit(GetTotalPointsByDayErrorState());
    });
  }

  Map<String,dynamic> totalPointsByType = {};
  Future<void> getTotalPointsByType()async{
    emit(GetTotalPointsByTypeLoadingState());
    DioHelper.getTotalPointsByDay(
      token: CacheHelper.getData(key: TOKEN_KEY),
      path: URL_GET_TOTAL_POINTS_BY_TYPE,
    ).then((value){
      totalPointsByType=value.data;
      print(totalPointsByType);
      emit(GetTotalPointsByTypeLoadedState());
    }).catchError((error){
      print(error.toString());
      emit(GetTotalPointsByTypeErrorState());
    });
  }

  Map<String,dynamic> dailyPointsByType = {};
  Future<void> getDailyPointsByType()async{
    emit(GetDailyPointsByTypeLoadingState());
    DioHelper.getTotalPointsByDay(
      token: CacheHelper.getData(key: TOKEN_KEY),
      path: URL_GET_DAILY_POINTS_BY_TYPE,
    ).then((value){
      dailyPointsByType=value.data;
      print(dailyPointsByType);
      emit(GetDailyPointsByTypeLoadedState());
    }).catchError((error){
      print(error.toString());
      emit(GetDailyPointsByTypeErrorState());
    });
  }

}
