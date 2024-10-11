import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/profile_page.dart';
import 'package:healthy_food/src/UI/pages/sideBar%20pages/settings_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(darkmodeNotifier);
    //! intential (- 1)
    final designIndex = ref.watch(appStyleNotifier) - 1;
    return SafeArea(
      child: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
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
            leading: const Icon(Icons.bug_report),
            title: Text(AppLocalizations.of(context)!.bug_report),
            onTap: () {},
          ),
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
