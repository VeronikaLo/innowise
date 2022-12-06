import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/src/presentation/pages/detail_page/detail_page.dart';
import 'package:test_assesment/src/presentation/pages/home_page/home_page.dart';

import '../src/presentation/bloc/nav_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(
      builder: (context, id) {
        return Navigator(
          pages: [
            const MaterialPage(child: HomePage()),
            if( id != null)  const MaterialPage(child: DetailPage()),

          ],
          onPopPage: ((route, result) {
            BlocProvider.of<NavCubit>(context).clear();
            return route.didPop(result);
          }),
        );
      },
    ); 
  }
}
