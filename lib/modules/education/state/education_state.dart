import 'package:equatable/equatable.dart';
import 'package:portfolio/modules/education/model/education_model.dart';

abstract class EducationState extends Equatable{}

class InitialEducationState extends EducationState{
  final EducationalResponse educationalResponse;
  InitialEducationState(this.educationalResponse);
  @override
  List<Object?> get props => [educationalResponse];
}

class LoadedEducationState extends EducationState{
  final EducationalResponse educationalResponse;
  LoadedEducationState(this.educationalResponse);
  @override
  List<Object?> get props => [educationalResponse];
}