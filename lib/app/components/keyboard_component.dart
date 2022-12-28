import 'package:calculator/app/blocs/calc/calc_bloc.dart';
import 'package:calculator/app/components/key_component.dart';
import 'package:flutter/material.dart';

class KeyboardComponent extends StatelessWidget {
  final CalcBloc bloc;

  const KeyboardComponent({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeyComponent(char: '1', bloc: bloc,),
              KeyComponent(char: '2', bloc: bloc,),
              KeyComponent(char: '3', bloc: bloc,),
              KeyComponent(char: 'X', bloc: bloc,),
            ],
          ),
          const SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeyComponent(char: '=', bloc: bloc, isCalcButton: true,),
            ],
          ),
        ],
      ),
    );
  }
}