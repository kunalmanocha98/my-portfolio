import 'package:equatable/equatable.dart';

import '../model/personal_detail_model.dart';

abstract class PersonalState extends Equatable{}
class InitialPersonalState extends PersonalState{
  final PersonalDetailsResponse personalDetailsResponse;
  InitialPersonalState(this.personalDetailsResponse);
  @override
  List<Object?> get props => [personalDetailsResponse];
}
class LoadingPersonalState extends PersonalState{
  @override
  List<Object?> get props => [];
}
class LoadedPersonalState extends PersonalState{
  final PersonalDetailsResponse personalDetailsResponse;
  LoadedPersonalState(this.personalDetailsResponse);
  @override
  List<Object?> get props => [personalDetailsResponse];
}