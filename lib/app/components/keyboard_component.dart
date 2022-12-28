import 'package:calculator/app/blocs/calc/calc_bloc.dart';
import 'package:calculator/app/components/key_component.dart';
import 'package:flutter/material.dart';

class KeyboardComponent extends StatelessWidget {
  final CalcBloc bloc;

  const KeyboardComponent({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyComponent(char: 'C', bloc: bloc, isClearButton: true,),
            KeyComponent(char: 'DEL', bloc: bloc, isDelButton: true,),
          ],
        ),
        const SizedBox(height: 32,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyComponent(char: '7', bloc: bloc,),
            KeyComponent(char: '8', bloc: bloc,),
            KeyComponent(char: '9', bloc: bloc,),
            KeyComponent(char: '/', bloc: bloc,),
          ],
        ),
        const SizedBox(height: 32,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyComponent(char: '4', bloc: bloc),
            KeyComponent(char: '5', bloc: bloc),
            KeyComponent(char: '6', bloc: bloc),
            KeyComponent(char: 'X', bloc: bloc),
          ],
        ),
        const SizedBox(height: 32,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyComponent(char: '1', bloc: bloc),
            KeyComponent(char: '2', bloc: bloc),
            KeyComponent(char: '3', bloc: bloc),
            KeyComponent(char: '-', bloc: bloc),
          ],
        ),
        const SizedBox(height: 32,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyComponent(char: '.', bloc: bloc, isCommaButton: true),
            KeyComponent(char: '0', bloc: bloc),
            KeyComponent(char: '=', bloc: bloc, isCalcButton: true,),
            KeyComponent(char: '+', bloc: bloc),
          ],
        ),
      ],
    );
  }
}