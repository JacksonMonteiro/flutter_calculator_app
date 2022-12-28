import 'package:calculator/app/blocs/calc/calc_bloc.dart';
import 'package:calculator/app/blocs/calc/calc_state.dart';
import 'package:flutter/material.dart';

class DisplayComponent extends StatelessWidget {
  final AsyncSnapshot<CalcState> snapshot;

  const DisplayComponent({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${snapshot.data?.calc.result ?? '0'}', style: TextStyle(fontSize: 24),)
        ],
      ),
    );
  }
}