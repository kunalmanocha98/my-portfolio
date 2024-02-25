import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/modules/contact/state/contact_state.dart';

import '../../../utils/firebase_keys.dart';
import '../model/contact_model.dart';

class ContactBloc extends Cubit<ContactState>{
  ContactBloc(super.initialState){
    fetchData();
  }

  void fetchData() async {
    var data = (await fireStoreInstance
        .collection(CollectionNames.profileCollection)
        .doc(DocumentNames.contact)
        .get())
        .data();
    emit(LoadedContactState(ContactResponse.fromJson(data!)));
  }
}