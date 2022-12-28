import 'package:calculator/app/blocs/calc/calc_state.dart';
import 'package:flutter/material.dart';

class DisplayComponent extends StatelessWidget {
  final AsyncSnapshot<CalcState> snapshot;

  const DisplayComponent({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text( snapshot.data?.calc.firstNum ?? '',  style: const TextStyle(fontSize: 14, color: Colors.white), ),
              const SizedBox(width: 4,),
              Text( snapshot.data?.calc.operation ?? '',  style: const TextStyle(fontSize: 14, color: Colors.green), ),
              const SizedBox(width: 4,),
              Text( snapshot.data?.calc.secondNum ?? '',  style: const TextStyle(fontSize: 14, color: Colors.white),),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(child: Text(
                snapshot.data?.calc.result ?? '0', 
                style: const TextStyle(fontSize: 28, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                ))
            ],
          ),
        ],
      ),
    );
  }
}