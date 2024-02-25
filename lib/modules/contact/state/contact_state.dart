import 'package:equatable/equatable.dart';
import 'package:portfolio/modules/contact/model/contact_model.dart';

abstract class ContactState extends Equatable{}

class InitialContactState extends ContactState{
  final ContactResponse contactResponse;
  InitialContactState(this.contactResponse);
  @override
  List<Object?> get props => [contactResponse];
}

class LoadedContactState extends ContactState{
  final ContactResponse contactResponse;
  LoadedContactState(this.contactResponse);
  @override
  List<Object?> get props => [contactResponse];
}