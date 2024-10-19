import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:healthy_food/src/Notifiers/design_index_notifier.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:healthy_food/src/UI/looks/search_field.dart';
import 'package:healthy_food/src/UI/looks/settings_page_exclusives/legend.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});
  static const themes = ["simple", "bubbles1", "curves1"];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme =
        useState<String?>(themes[ref.watch(appStyleNotifier)]);
    bool darkmode = ref.watch(darkmodeNotifier);
    bool dataSaver = ref.watch(dataSaverNotifier);

    bool dailyreminder = ref.watch(dailyReminderNotifier);
    // bool deadlinereminder = ref.watch(deadlineReminderNotifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
        body: Container(
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(children: [
            SettingGroup(
              icon: Icons.style_rounded,
              label: "preferences",
            ),
            Divider(),
            SwitchListTile(
              value: darkmode,
              title: Text(AppLocalizations.of(context)!.darkmode),
              onChanged: (bool value) {
                ref.read(darkmodeNotifier.notifier).toggleDarkmode(value);
              },
              secondary: const Icon(Icons.dark_mode),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.app_ui),
              leading: const Icon(Icons.phone_android),
              trailing: DropdownButton<String>(
                value: selectedTheme.value,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    //! intential -1 there
                    ref
                        .read(designStyleIndexNotifier.notifier)
                        .setIndex(themes.indexOf(newValue) - 1);
                    ref
                        .read(appStyleNotifier.notifier)
                        .setAppStyle(themes.indexOf(newValue));
                  }
                  selectedTheme.value = newValue;
                },
                items: themes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SwitchListTile(
              value: dataSaver,
              title: const Text("DataSaver"),
              onChanged: (bool value) {
                ref.read(dataSaverNotifier.notifier).toggleDataSaver(value);
              },
              secondary:
                  // AnimatedIcon(icon: , progress: progress)
                  const Icon(Icons.data_saver_off),
            ),
            SizedBox(
              height: 10,
            ),
            SettingGroup(
              icon: Icons.manage_search_rounded,
              label: "Search preferences",
            ),
            Divider(),
            SwitchListTile(
              value: dailyreminder,
              title: const Text("show additional infos"),
              onChanged: (bool value) {
                ref
                    .read(dailyReminderNotifier.notifier)
                    .toggleDailyReminder(value);
              },
              secondary:
                  // AnimatedIcon(icon: , progress: progress)
                  const Icon(Icons.data_saver_off),
            ),
            // SwitchListTile(
            //   value: dataSaver,
            //   title: const Text("show allergents"),
            //   onChanged: (bool value) {
            //     ref.read(dataSaverNotifier.notifier).toggleDataSaver(value);
            //   },
            //   secondary:
            //       // AnimatedIcon(icon: , progress: progress)
            //       const Icon(Icons.data_saver_off),
            // ),
            ListTile(
              title: Text("Preffered Region"),
              leading: const Icon(Icons.location_searching),
              trailing: DropdownButton<String>(
                value: selectedTheme.value,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    //! intential -1 there
                    ref
                        .read(designStyleIndexNotifier.notifier)
                        .setIndex(themes.indexOf(newValue) - 1);
                    ref
                        .read(appStyleNotifier.notifier)
                        .setAppStyle(themes.indexOf(newValue));
                  }
                  selectedTheme.value = newValue;
                },
                items: themes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            SettingGroup(
              icon: Icons.computer_rounded,
              label: "technical",
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              // title: Text(AppLocalizations.of(context)!.solve_common_issues),
              title: Text("solve common issues"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bug_report),
              title: Text(AppLocalizations.of(context)!.bug_report),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.text_snippet),
              title: Text(AppLocalizations.of(context)!.terms_of_use),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: "Yes")));
              },
            ),
            // ExpansionTile(
            //   title: const Text('Notifications'),
            //   leading: const Icon(Icons.notifications),
            //   children: <Widget>[
            //     SwitchListTile(
            //       value: dailyreminder,
            //       title: const Text('daily reminder'),
            //       onChanged: (bool value) {
            //         ref
            //             .read(dailyReminderNotifier.notifier)
            //             .toggleDailyReminder(value);
            //       },
            //       secondary: const Icon(Icons.calendar_month),
            //     ),
            //     SwitchListTile(
            //       value: deadlinereminder,
            //       title: const Text('deadline reminder'),
            //       onChanged: (bool value) {
            //         ref
            //             .read(deadlineReminderNotifier.notifier)
            //             .toggleDeadlineReminder(value);
            //       },
            //       secondary: const Icon(Icons.calendar_month),
            //     ),
            //   ],
            // ),
          ]),
        ),
      ),
    );
  }
}
