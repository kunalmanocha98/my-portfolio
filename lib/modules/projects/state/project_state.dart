import 'package:equatable/equatable.dart';
import 'package:portfolio/modules/projects/models/project_model.dart';

abstract class ProjectState extends Equatable{}

class InitialProjectState extends ProjectState{
  final ProjectsResponse projectsResponse;
  InitialProjectState(this.projectsResponse);
  @override
  List<Object?> get props => [projectsResponse];
}

class LoadedProjectState extends ProjectState{
  final ProjectsResponse projectsResponse;
  LoadedProjectState(this.projectsResponse);
  @override
  List<Object?> get props => [projectsResponse];
}