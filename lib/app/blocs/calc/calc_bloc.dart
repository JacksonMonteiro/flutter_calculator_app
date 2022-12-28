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
        calc.result = calc.firstNum;
      } else {
        calc.secondNum += event.num;
        calc.result = calc.secondNum;
      }
    } else if (event is AddOperationEvent) {
      
      if (calc.firstNum.isNotEmpty) {
        calc.operation = event.operation;
        calc.result = '';
      }

      if (calc.operation.isNotEmpty && calc.secondNum.isNotEmpty) {
        double fn = double.parse(calc.firstNum);
        double sn = double.parse(calc.secondNum);
        _doCalc(calc.firstNum, calc.secondNum, calc.operation);
      }

    } else if (event is DoCalcEvent) {
      
      _doCalc(calc.firstNum, calc.secondNum, calc.operation);

    } else if (event is ClearEvent) {
      calc.firstNum = '';
      calc.operation = '';
      calc.secondNum = '';
      calc.result = '0';
    } else if (event is DelEvent) {
      if (calc.result == '0') return;

      if (calc.result != '0' && calc.result.length > 1) {
        calc.result = calc.result.substring(0, calc.result.length - 1);
        deleteChar();
      } else if (calc.result.length == 1) {
        calc.result = '0';
        deleteChar();
      }
    } else if (event is CommaEvent) {
      
      if (calc.firstNum.isNotEmpty && calc.operation.isEmpty) {
        addDecimalPoint();
      } else if (calc.secondNum.isNotEmpty) {
        addDecimalPoint();
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

  void _doCalc(String firstNum, String secondNum, String op) {
    // Numbers
    dynamic fn = 0.0;
    dynamic sn = 0.0;
    
    // Convert
    if (int.tryParse(firstNum) != null) {
      fn = int.parse(firstNum);
    } else {
      fn = double.parse(firstNum);
    }

    if (int.tryParse(secondNum) != null) {
      sn = int.parse(secondNum);
    } else {
      sn = double.parse(secondNum);
    }
    
    
    switch (op) {
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
    calc.operation = '';
    calc.secondNum = '';
  }

  void deleteChar() {
    if (calc.operation.isEmpty) {
      calc.firstNum = calc.firstNum.substring(0, calc.firstNum.length - 1);
    } else {
      calc.secondNum = calc.secondNum.substring(0, calc.secondNum.length - 1);
    }
  }

  void addDecimalPoint() {
    if (!calc.firstNum.contains(".") && calc.operation.isEmpty) {
      calc.firstNum += ".";
      calc.result = calc.firstNum;
    } else if (!calc.secondNum.contains(".")) {
      calc.secondNum += ".";
      calc.result = calc.secondNum;
    }
  }

}
