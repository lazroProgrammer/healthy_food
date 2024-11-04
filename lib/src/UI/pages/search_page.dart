import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/looks/search_field2.dart';
import 'package:healthy_food/src/UI/looks/search_page_exclusives/result_list_v2.dart';

//TODO:the search system needs to be improved, suggestions can be added from openFoodFacts
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
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
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20),
                child: SearchWidget(),
              ),
              const ResultListV2(),
            ]))
          ],
        )),
      ),
    );
  }
}
