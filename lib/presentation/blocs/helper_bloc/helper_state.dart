import 'package:equatable/equatable.dart';

class HelperState extends Equatable {
  const HelperState(this.turnedOff);

  final bool turnedOff;

  bool get disabled => turnedOff == false;

  @override
  List<Object> get props => [turnedOff];
}