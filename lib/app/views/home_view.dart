import 'package:calculator/app/blocs/calc/calc_bloc.dart';
import 'package:calculator/app/blocs/calc/calc_state.dart';
import 'package:calculator/app/components/display_component.dart';
import 'package:calculator/app/components/keyboard_component.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late CalcBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CalcBloc();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.inputCalc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF242424),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: StreamBuilder<CalcState>(
            stream: bloc.stream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  DisplayComponent(snapshot: snapshot,),
                  const  SizedBox(height: 32,),
                  KeyboardComponent(bloc: bloc,),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}