import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/src/domain/entities/pokemon_list_entity.dart';
import 'package:test_assesment/src/presentation/bloc/bloc_list/test_bloc_bloc.dart';
import 'package:test_assesment/src/presentation/pages/home_page/widgets/error_message.dart';

import 'list_item.dart';

class PokemonList extends StatelessWidget {
  PokemonList({super.key});
  final int page = 0;
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<TestBlocBloc>(context).add(GetListEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<TestBlocBloc, TestBlocState>(
      builder: (context, listState) {
        List<PokemonListEntity> newList = [];
        bool isLoading = false;

        if (listState is TestBlocLoading && listState.isFirstCall) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.pink,
            ),
          );
        } else if (listState is TestBlocLoading) {
          newList = listState.oldList;
          isLoading = true;
        } else if (listState is TestBlocLoaded) {
          newList = listState.list;
        } else if (listState is TestBlocError) {
          return ErrorMessage(
            message: listState.message,
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return ListItem(
                name: newList[index].name,
                id: newList[index].id,
              );
            }),
            itemCount: newList.length,
          ),
        );
      },
    );
  }
}
