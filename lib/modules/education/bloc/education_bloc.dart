import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/education/model/education_model.dart';
import 'package:portfolio/modules/education/state/education_state.dart';

import '../../../main.dart';
import '../../../utils/firebase_keys.dart';

class EducationBloc extends Cubit<EducationState>{
  EducationBloc(super.initialState){
    fetchData();
  }
  void fetchData() async{
    var data = (await fireStoreInstance.collection(CollectionNames.education).doc(DocumentNames.educationalDetails).get()).data();
    var educationalResponse = EducationalResponse.fromJson(data!);
    educationalResponse.educationalDetails!.sort((a,b)=>a.index!.compareTo(b.index!));
    emit(LoadedEducationState(educationalResponse));
  }

}