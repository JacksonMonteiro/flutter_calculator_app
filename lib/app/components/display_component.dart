import 'package:calculator/app/blocs/calc/calc_state.dart';
import 'package:flutter/material.dart';

class DisplayComponent extends StatelessWidget {
  final AsyncSnapshot<CalcState> snapshot;

  const DisplayComponent({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(child: Text(
            snapshot.data?.calc.result ?? '0', 
            style: const TextStyle(fontSize: 24),
            overflow: TextOverflow.ellipsis,
            ))
        ],
      ),
    );
  }
}