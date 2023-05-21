import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline/module/counter_app/counter_cubit/counter_cubit.dart';
import 'package:offline/module/counter_app/counter_cubit/counter_states.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 int value = 0;



    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){
          if(state is IncrementCounterState) {
            print('hello');
          }

          if( state is DecrementCounterState) {
            print('good day');
          }
        },
        builder: (context,state) {
          CounterCubit cubit = CounterCubit.get(context);
          return SizedBox(
            height: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                IconButton(onPressed: (){
                  //incrementValue();
                  cubit.incrementValue();

                }, icon: const Icon(Icons.add)),
                const SizedBox(
                  width: 10,
                ),

            Text('${cubit.value}',style: const TextStyle(fontSize: 34.0,fontWeight: FontWeight.bold),),

                const SizedBox(
                  width: 10,
                ),

                IconButton(onPressed: (){
                 //decrementValue();
                  cubit.decrementValue();

                }, icon: const Icon(Icons.minimize)),




              ],
            ),
          );
        }
      ),
    );
  }
}
