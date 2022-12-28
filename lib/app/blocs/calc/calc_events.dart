abstract class CalcEvent {}

class AddNumEvent extends CalcEvent {
  String num;
  AddNumEvent({required this.num});
}

class AddOperationEvent extends CalcEvent {
  String operation;
  AddOperationEvent({required this.operation});
}

class DoCalcEvent extends CalcEvent {}

class ClearEvent extends CalcEvent {}

class DelEvent extends CalcEvent {}

class CommaEvent extends CalcEvent {}