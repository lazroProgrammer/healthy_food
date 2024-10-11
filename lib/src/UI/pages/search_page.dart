import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/looks/search_field_expanded.dart';
import 'package:healthy_food/src/UI/looks/search_page_exclusives/result_list.dart';

//TODO:the search system needs to be improved
//TODO!: do the focus thing
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: Text(AppLocalizations.of(context)!.search),
          backgroundColor: AppBarTheme.of(context).backgroundColor,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          // margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
            child: SearchFieldExpanded(),
          ),
          const ResultList(),
        ]))
      ],
    ));
  }
}
