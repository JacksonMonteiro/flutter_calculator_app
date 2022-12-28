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
        calc.result =  calc.firstNum;
      } else {
        calc.secondNum += event.num;
        calc.result = calc.secondNum;
      }

    } else if (event is AddOperationEvent) {
      
      if (calc.firstNum.isNotEmpty) {
        calc.operation = event.operation;
        calc.result = '';
      }

    } else if (event is DoCalcEvent) {
      
      double fn = double.parse(calc.firstNum);
      double sn = double.parse(calc.secondNum);
      _doCalc(fn, sn, calc.operation);

    } else if (event is ClearEvent) {

      calc.firstNum = '';
      calc.operation = '';
      calc.secondNum = '';
      calc.result = '0';
      
    } else if (event is DelEvent) {

      if (calc.result != '0' && calc.result.length > 1) {
        calc.result = calc.result.substring(0, calc.result.length - 1);   
        if (calc.operation.isEmpty) {
          calc.firstNum = calc.firstNum.substring(0, calc.firstNum.length - 1);
        } else {
          calc.secondNum = calc.secondNum.substring(0, calc.secondNum.length - 1);
        }

      } else if (calc.result.length == 1) {
        calc.result = '0';
      }

    }


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
      case '/':
        calc.result = (fn / sn).toString();
        break;
      case 'X':
        calc.result = (fn * sn).toString();
        break;
      case '-':
        calc.result = (fn - sn).toString();
        break;
      case '+':
        calc.result = (fn + sn).toString();
    }

    calc.firstNum = calc.result;
    calc.secondNum = '';
  }
}
