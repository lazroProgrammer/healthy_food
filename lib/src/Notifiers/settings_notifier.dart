import 'package:healthy_food/src/data%20classes/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final darkmodeNotifier =
    StateNotifierProvider<DarkmodeNotifier, bool>((ref) => DarkmodeNotifier());

final appStyleNotifier =
    StateNotifierProvider<AppStyleNotifier, int>((ref) => AppStyleNotifier());
final countryNotifier =
    StateNotifierProvider<CountryNotifier, int>((ref) => CountryNotifier());

final dataSaverNotifier = StateNotifierProvider<DataSaverNotifier, bool>(
    (ref) => DataSaverNotifier());
final detailedSearchNotifier =
    StateNotifierProvider<DetailedSearchNotifier, bool>(
        (ref) => DetailedSearchNotifier());

final allowNotificationsNotifier =
    StateNotifierProvider<AllowNotificationNotifier, bool>(
        (ref) => AllowNotificationNotifier());

final dailyReminderNotifier =
    StateNotifierProvider<DailyReminderNotifier, bool>(
        (ref) => DailyReminderNotifier());

final deadlineReminderNotifier =
    StateNotifierProvider<DeadlineNotifier, bool>((ref) => DeadlineNotifier());

class DarkmodeNotifier extends StateNotifier<bool> {
  DarkmodeNotifier() : super(SettingsData().darkmode);
  void toggleDarkmode(bool v) {
    SettingsData().update(darkTheme: v);
    state = v;
  }
}

class AppStyleNotifier extends StateNotifier<int> {
  AppStyleNotifier() : super(SettingsData().appStyle);
  void setAppStyle(int v) {
    SettingsData().update(appStyle: v);
    state = v;
  }
}

class CountryNotifier extends StateNotifier<int> {
  CountryNotifier() : super(SettingsData().country);
  void setCountry(int v) {
    SettingsData().update(countryP: v);
    state = v;
  }
}

class DataSaverNotifier extends StateNotifier<bool> {
  DataSaverNotifier() : super(SettingsData().dataSaver);
  void toggleDataSaver(bool v) {
    SettingsData().update(dataSaver: v);
    state = v;
  }
}

class DetailedSearchNotifier extends StateNotifier<bool> {
  DetailedSearchNotifier() : super(SettingsData().detailedSearch);
  void toggleDetailedSearch(bool v) {
    SettingsData().update(detailedSearch: v);
    state = v;
  }
}

class AllowNotificationNotifier extends StateNotifier<bool> {
  AllowNotificationNotifier() : super(SettingsData().allowNotifications);
  void toggleNotification(bool v) {
    SettingsData().update(notifications: v);
    state = v;
  }
}

class DailyReminderNotifier extends StateNotifier<bool> {
  DailyReminderNotifier() : super(SettingsData().dailyReminder);
  void toggleDailyReminder(bool v) {
    SettingsData().update(dailyReminderP: v);
    state = v;
  }
}

class DeadlineNotifier extends StateNotifier<bool> {
  DeadlineNotifier() : super(SettingsData().deadlineReminder);
  void toggleDeadlineReminder(bool v) {
    SettingsData().update(deadlineReminderP: v);
    state = v;
  }
}
