import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/models/my_model.dart';
import 'features/crazy/bloc/crazy_bloc.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/sweet/bloc/sweet_bloc.dart';

void main() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('mymodelbox');
  Hive.registerAdapter(MyModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CrazyBloc()),
        BlocProvider(create: (context) => SweetBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
