import 'package:calculator/app/blocs/calc/calc_bloc.dart';
import 'package:calculator/app/blocs/calc/calc_events.dart';
import 'package:flutter/material.dart';

class KeyComponent extends StatelessWidget {
  final String char;
  final CalcBloc bloc;
  final bool isCalcButton;
  final bool isClearButton;
  final bool isDelButton;
  final bool isCommaButton;
  final bool isOperandButton;

  const KeyComponent(
      {super.key,
      required this.char,
      required this.bloc,
      this.isCalcButton = false,
      this.isClearButton = false,
      this.isDelButton = false,
      this.isCommaButton = false, 
      this.isOperandButton = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(64.0, 64.0),
          backgroundColor: (isOperandButton || isCalcButton || isCommaButton || isClearButton) ? Colors.green : isDelButton ? Colors.red : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))),
      onPressed: () {
        if (isCalcButton) {
          bloc.inputCalc.add(DoCalcEvent());
        } else if (isClearButton) {
          bloc.inputCalc.add(ClearEvent());
        } else if (isDelButton) {
          bloc.inputCalc.add(DelEvent());
        } else if (isCommaButton) {
          bloc.inputCalc.add(CommaEvent());
        } else {
          if (bloc.checkChar(char)) {
            bloc.inputCalc.add(AddNumEvent(num: char));
          } else {
            bloc.inputCalc.add(AddOperationEvent(operation: char));
          }
        }
      },
      child: Text(char, style: TextStyle(
        fontSize: 18, 
        color:  Colors.black
      )),
    );
  }
}
