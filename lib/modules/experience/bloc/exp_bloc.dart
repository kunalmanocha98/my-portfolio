import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/modules/experience/state/exp_state.dart';

import '../../../utils/firebase_keys.dart';
import '../models/experience_model.dart';

class ExpBloc extends Cubit<ExpState>{
  ExpBloc(super.initialState){
    fetchData();
  }

  void fetchData() async{
    var data = (await fireStoreInstance.collection(CollectionNames.experience).doc(DocumentNames.relevantExperience).get()).data();
    var experienceResponse = ExperienceResponse.fromJson(data!);
    experienceResponse.experiences!.sort((a,b)=>a.index!.compareTo(b.index!));
    emit(LoadedExpState(experienceResponse));
  }

}