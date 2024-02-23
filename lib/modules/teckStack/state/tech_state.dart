import 'package:equatable/equatable.dart';
import 'package:portfolio/modules/teckStack/model/tech_stack_model.dart';

abstract class TechState extends Equatable{}

class InitialTechState extends TechState{
  final TechStackResponse techStackResponse;
  InitialTechState(this.techStackResponse);
  @override
  List<Object?> get props => [techStackResponse];
}

class LoadedTechState extends TechState{
  final TechStackResponse techStackResponse;
  LoadedTechState(this.techStackResponse);
  @override
  List<Object?> get props => [techStackResponse];
}