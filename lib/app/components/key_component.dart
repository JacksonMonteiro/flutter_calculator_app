import 'package:calculator/app/blocs/calc/calc_bloc.dart';
import 'package:calculator/app/blocs/calc/calc_events.dart';
import 'package:flutter/material.dart';

class KeyComponent extends StatelessWidget {
  final String char;
  final CalcBloc bloc;
  final bool isCalcButton;

  const KeyComponent(
      {super.key,
      required this.char,
      required this.bloc,
      this.isCalcButton = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(64.0, 64.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
      onPressed: () {
        if (!isCalcButton) {
          if (bloc.checkChar(char)) {
            bloc.inputCalc.add(AddNumEvent(num: char));
          } else {
            bloc.inputCalc.add(AddOperationEvent(operation: char));
          }
        } else {
          bloc.inputCalc.add(DoCalcEvent());
        }
      },
      child: Text(char),
    );
  }
}
