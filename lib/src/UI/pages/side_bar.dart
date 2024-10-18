import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/profile_page.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/settings_page.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/tutorial_slides.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                // color: Theme.of(context).primaryColor,
                color: Colors.deepOrange[500]),
            child: Text(
              "Weclome!!",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[100]),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_rounded),
            title: Text(AppLocalizations.of(context)!.profile),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(AppLocalizations.of(context)!.settings),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_rounded),
            // title: Text(AppLocalizations.of(context)!.rate_us),
            title: Text(AppLocalizations.of(context)!.app_tutorial),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TutorialSliders()));
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.text_snippet_rounded),
            // title: Text(AppLocalizations.of(context)!.rate_us),
            title: Text(AppLocalizations.of(context)!.about_us),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.star),
            // title: Text(AppLocalizations.of(context)!.rate_us),
            title: Text(AppLocalizations.of(context)!.rate_us),
            onTap: () {},
          ),
          Divider(),
          //Todo: define your business model, maybe you will not use donation at all
          // ListTile(
          //   leading: const Icon(Icons.cake),
          //   title: Text(AppLocalizations.of(context)!.donate),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => (designIndex >= 0)
          //             ? FormalBubblesSearchPage(
          //                 designIndex: (dark)
          //                     ? (2 * designIndex + 1)
          //                     : (2 * designIndex))
          //             : SearchPage()));
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: Text(AppLocalizations.of(context)!.logout),
            onTap: () {},
          ),
        ],
      )),
    );
  }
}
