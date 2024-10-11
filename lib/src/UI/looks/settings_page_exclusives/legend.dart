import 'package:flutter/material.dart';
import 'package:healthy_food/src/Notifiers/settings_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingGroup extends ConsumerWidget {
  const SettingGroup({super.key, required this.icon, required this.label});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkmode = ref.watch(darkmodeNotifier);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(4, 4, 4, 0),
          height: 32,
          child: FittedBox(
            child: Icon(
              icon,
              color: (darkmode) ? Colors.white : Colors.blue,
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
