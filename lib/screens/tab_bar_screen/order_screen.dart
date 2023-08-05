import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/search_filter/search_filter_bloc.dart';
import 'package:movie_app/bloc/search_filter/search_filter_event.dart';
import 'package:movie_app/bloc/search_filter/search_filter_state.dart';
import 'package:movie_app/widgets/anime_container.dart';

import '../../widgets/search_filter_container_builder.dart';

class OrderFilterScreen extends StatefulWidget {
  OrderFilterScreen(this.rank, {super.key});
  String rank;
  @override
  State<OrderFilterScreen> createState() => _OrderFilterScreenState();
}

class _OrderFilterScreenState extends State<OrderFilterScreen> {
  @override
  void initState() {
    BlocProvider.of<SearchFilterBloc>(context)
        .add(SearchFilterString(order: widget.rank));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFilterBloc, SearchFilterState>(
        builder: (context, state) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff1F2722),
              Color(0xff131312),
            ],
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: [
                if (state is SearchFilterLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  )
                } else ...{
                  if (state is ResponseSearchFilterState) ...{
                    state.getSearchFilter.fold(
                      (l) => const SliverToBoxAdapter(
                          child: Text('sth wnt wrong')),
                      (response) => SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return SearchfilterContainerBuilder(
                                  response.data![index]);
                            },
                            childCount: response.data!.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 2,
                            childAspectRatio: 0.6,
                          ),
                        ),
                      ),
                    )
                  }
                }
              ],
            ),
          ),
        ),
      );
    });
  }
}
