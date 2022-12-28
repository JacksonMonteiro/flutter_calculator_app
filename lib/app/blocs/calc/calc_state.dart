import 'package:calculator/app/models/calc_model.dart';

abstract class CalcState {
  CalcModel calc;
  CalcState({required this.calc});
}

class InitialCalcState extends CalcState {
  InitialCalcState() : super(calc: CalcModel(firstNum: '', secondNum: '', operation: '', result: '0'));
}

class CalcSuccessState extends CalcState {
  CalcSuccessState({required CalcModel calc}) : super(calc: calc);
}