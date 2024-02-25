import 'package:equatable/equatable.dart';
import 'package:portfolio/modules/experience/models/experience_model.dart';

abstract class ExpState extends Equatable{}

class InitialExpState extends ExpState{
  final ExperienceResponse experienceResponse;
  InitialExpState(this.experienceResponse);
  @override
  List<Object?> get props => [experienceResponse];
}

class LoadedExpState extends ExpState{
  final ExperienceResponse experienceResponse;
  LoadedExpState(this.experienceResponse);
  @override
  List<Object?> get props => [experienceResponse];

}