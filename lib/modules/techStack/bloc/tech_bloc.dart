import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/modules/techStack/model/tech_stack_model.dart';
import '../../../utils/firebase_keys.dart';
import '../state/tech_state.dart';

class TechBloc extends Cubit<TechState>{

  TechBloc(super.initialState){
    fetchData();
  }

  void fetchData() async{
    var data = (await fireStoreInstance.collection(CollectionNames.techStackCollection).doc(DocumentNames.techStack).get()).data();
    emit(LoadedTechState(TechStackResponse.fromJson(data!)));
  }

}