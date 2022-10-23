abstract class NewsLayoutStates {}

class InitialNewsLayoutState extends NewsLayoutStates {}

class ChangeBottomNavigatorState extends NewsLayoutStates {}

class LoadingGetBusinessData extends NewsLayoutStates {}
class SuccessGetBusinessData extends NewsLayoutStates {}
class ErrorGetBusinessData extends NewsLayoutStates {
  final String error;
  ErrorGetBusinessData(this.error);

}



class LoadingGetSportData extends NewsLayoutStates {}
class SuccessGetSportData extends NewsLayoutStates {}
class ErrorGetSportData extends NewsLayoutStates {
  final String error;
  ErrorGetSportData(this.error);
}




class LoadingGetScienceData extends NewsLayoutStates {}
class SuccessGetScienceData extends NewsLayoutStates {}
class ErrorGetScienceData extends NewsLayoutStates {
  final String error;
  ErrorGetScienceData(this.error);
}





class LoadingGetSearchData extends NewsLayoutStates {}

class SuccessGetSearchData extends NewsLayoutStates {}
class ErrorGetSearchData extends NewsLayoutStates {
  final String error;
  ErrorGetSearchData(this.error);
}
