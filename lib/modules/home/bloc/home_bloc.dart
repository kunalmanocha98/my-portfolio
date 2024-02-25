import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/home/state/home_state.dart';

class HomeBloc extends Cubit<HomeState>{
  HomeBloc(super.initialState){
    loadAnimation();
  }

  void loadAnimation() async{
    emit(LoadingHomeState());
    Future.delayed(const Duration(seconds: 3),(){
      emit(LoadedHomeState());
    });
  }

}