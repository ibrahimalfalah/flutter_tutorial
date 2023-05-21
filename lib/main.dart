import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline/module/cart/cart_view.dart';
import 'package:offline/module/counter_app/counter_cubit/counter_cubit.dart';
import 'package:offline/shared/network/local/cache_helper.dart';
import 'package:offline/shared/network/local/local_database.dart';

import 'module/counter_app/counter_view.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DatabaseHelper.createDatabase();
  await DioHelper.init();
  runApp(const OfflineApp());
}

class OfflineApp extends StatelessWidget {
  const OfflineApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CounterView(),
      ),
    );
  }
}


