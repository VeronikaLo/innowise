
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/src/presentation/bloc/bloc_list/test_bloc_bloc.dart';
import 'package:test_assesment/src/presentation/bloc/cubit/pokemon_cubit.dart';
import 'package:test_assesment/src/presentation/bloc/nav_cubit.dart';
import 'package:test_assesment/utils/app_navigator.dart';
import 'package:test_assesment/utils/app_theme.dart';
import 'injection.dart' as di;
import 'injection.dart';
//import 'src/presentation/pages/detail_page/detail_page.dart';

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
      theme: AppTheme.theme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<TestBlocBloc>()..add(GetListEvent()),
          ),
          BlocProvider(create: (context) => sl<PokemonCubit>()),
          BlocProvider(create: (context) => sl<NavCubit>()),
        ],
        child: //const DetailPage(),
        const AppNavigator(),
      ),
    );
  }
}
