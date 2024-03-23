import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/modules/projects/state/project_state.dart';

import '../../../utils/firebase_keys.dart';
import '../models/project_model.dart';

class ProjectBloc extends Cubit<ProjectState>{
  ProjectBloc(super.initialState){
    fetchData();
  }

  void fetchData() async{
    var data = (await fireStoreInstance.collection(CollectionNames.projectsCollection).doc(DocumentNames.companyProjects).get()).data();
    var response = ProjectsResponse.fromJson(data!);
    response.projects!.sort((a,b)=> a.index!.compareTo(b.index!));
    emit(LoadedProjectState(response));
  }
}