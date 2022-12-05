import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/src/presentation/bloc/bloc_list/test_bloc_bloc.dart';
import 'package:test_assesment/src/presentation/bloc/cubit/pokemon_cubit.dart';
import 'package:test_assesment/src/presentation/pages/home_page/home_page.dart';
import 'injection.dart' as di;
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<TestBlocBloc>()..add(GetListEvent()),
          ),
          BlocProvider(create: (context) => sl<PokemonCubit>()),
        ],
        child: const HomePage(),
      ),
    );
  }
}