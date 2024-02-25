import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/theme/theme_bloc.dart';
import '../../../utils/firebase_keys.dart';
import '../model/personal_detail_model.dart';
import '../state/personal_state.dart';

class PersonalBloc extends Cubit<PersonalState> {
  PersonalBloc(super.initialState){
    fetchData();
  }

  fetchData() async{
    var data = (await fireStoreInstance
        .collection(CollectionNames.profileCollection)
        .doc(DocumentNames.personal)
        .get())
        .data();
    emit(LoadedPersonalState(PersonalDetailsResponse.fromJson(data!)));
  }
}
