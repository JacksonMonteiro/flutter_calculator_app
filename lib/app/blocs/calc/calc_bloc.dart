import 'dart:async';

import 'package:calculator/app/blocs/calc/calc_events.dart';
import 'package:calculator/app/blocs/calc/calc_state.dart';
import 'package:calculator/app/models/calc_model.dart';

class CalcBloc {
  CalcModel calc = CalcModel(firstNum: '', secondNum: '', operation: '', result: '');
  
  final StreamController<CalcEvent> _inputCalcController = StreamController<CalcEvent>();
  final StreamController<CalcState> _outputCalcController = StreamController<CalcState>();

  Sink<CalcEvent> get inputCalc => _inputCalcController.sink;
  Stream<CalcState> get stream => _outputCalcController.stream;

  CalcBloc() {
    _inputCalcController.stream.listen(_mapEventToState);
  }

  _mapEventToState(CalcEvent event) {

    if (event is AddNumEvent) {
      if (calc.firstNum.isEmpty || calc.operation.isEmpty) {
        calc.firstNum += event.num;
      } else {
        calc.secondNum += event.num;
      }
    } else if (event is AddOperationEvent) {
      calc.operation = event.operation;
    } else if (event is DoCalcEvent) {
      double fn = double.parse(calc.firstNum);
      double sn = double.parse(calc.secondNum);
      _doCalc(fn, sn, calc.operation);
    }

    
    print('Número 1: ${calc.firstNum}');
    print('Operador: ${calc.operation}');
    print('Número 2: ${calc.secondNum}');
    print('Resultado: ${calc.result}');
    _outputCalcController.add(CalcSuccessState(calc: calc));
  }

  bool checkChar(String char) {
    try {
      double.parse(char);
      return true;
    } catch (e) {
      return false;
    }
  }

  _doCalc(double fn, double sn, String op) {
    switch(op) {
      case 'X':
        calc.result = (fn * sn).toString();
        break;
    }
  }
}
