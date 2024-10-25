// import 'package:localstore/localstore.dart';
import 'package:shared_preferences/shared_preferences.dart';

//! steps to add settings values:
//!? 1: add here the variable, key, setter and getter,
//?     and add to the internal and update function.
//!? 2: add code in settings_notifier.dart.
//!? 3: link in settings page.
// //
class SettingsData {
  static late SharedPreferences _preferences;
  static const isLoggedKey = 'login';
  static const darkmodeKey = 'darkmode';
  static const appStyleKey = 'appStyleKey';
  static const countryKey = 'countryKey';
  static const dataSaverKey = 'dataSaverKey';
  static const detailedSearchKey = "detailedSearchKey";
  static const allowNotificationKey = 'allowNotification';
  static const dailyReminderKey = 'dailyReminder';
  static const deadlineKey = 'deadline';

  // static final localDb = Localstore.instance;
  static final SettingsData _instance = SettingsData._internal();
  late bool darkmode;
  late int appStyle;
  late int country;
  late bool dataSaver;
  late bool detailedSearch;
  late bool allowNotifications;
  late bool dailyReminder;
  late bool deadlineReminder;
  final String localId = "setting";

  factory SettingsData() {
    return _instance;
  }

  SettingsData._internal() {
    darkmode = getdark() ?? false;
    appStyle = getStyle() ?? 0;
    country = getCountry() ?? 0;
    dataSaver = getdataSaver() ?? false;
    detailedSearch = getDetailedSearch() ?? false;
    allowNotifications = getNotification() ?? false;
    dailyReminder = getDailyReminder() ?? false;
    deadlineReminder = getDeadlineReminder() ?? false;
  }

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLogin(bool logged) async {
    await _preferences.setBool(isLoggedKey, logged);
  }

  static bool? getLogin() => _preferences.getBool(isLoggedKey);

  static Future setdark(bool b) async {
    await _preferences.setBool(darkmodeKey, b);
  }

  static bool? getdark() => _preferences.getBool(darkmodeKey);

  static Future setStyle(int b) async {
    await _preferences.setInt(appStyleKey, b);
  }

  static int? getStyle() => _preferences.getInt(appStyleKey);

  static Future setCountry(int b) async {
    await _preferences.setInt(countryKey, b);
  }

  static int? getCountry() => _preferences.getInt(countryKey);

  static Future setdataSaver(bool b) async {
    await _preferences.setBool(dataSaverKey, b);
  }

  static bool? getdataSaver() => _preferences.getBool(dataSaverKey);

  static Future setDetailedSearch(bool b) async {
    await _preferences.setBool(detailedSearchKey, b);
  }

  static bool? getDetailedSearch() => _preferences.getBool(detailedSearchKey);

  static Future setNotification(bool b) async {
    await _preferences.setBool(allowNotificationKey, b);
  }

  static bool? getNotification() => _preferences.getBool(allowNotificationKey);

  static Future setDailyReminder(bool b) async {
    await _preferences.setBool(dailyReminderKey, b);
  }

  static bool? getDailyReminder() => _preferences.getBool(dailyReminderKey);

  static Future setDeadlineReminder(bool b) async {
    await _preferences.setBool(deadlineKey, b);
  }

  static bool? getDeadlineReminder() => _preferences.getBool(deadlineKey);

  void update(
      {bool? darkTheme,
      int? appStyle,
      int? countryP,
      bool? dataSaver,
      bool? detailedSearch,
      bool? notifications,
      bool? dailyReminderP,
      bool? deadlineReminderP}) {
    if (darkTheme != null) {
      setdark(darkTheme);
    }
    if (appStyle != null) {
      setStyle(appStyle);
    }
    if (countryP != null) {
      setStyle(countryP);
    }
    if (dataSaver != null) {
      setdataSaver(dataSaver);
    }
    if (detailedSearch != null) {
      setdataSaver(detailedSearch);
    }
    if (notifications != null) {
      setNotification(notifications);
    }
    if (dailyReminderP != null) {
      setDailyReminder(dailyReminderP);
    }
    if (deadlineReminderP != null) {
      setDeadlineReminder(deadlineReminderP);
    }
    darkmode = darkTheme ?? darkmode;
    allowNotifications = notifications ?? allowNotifications;
    dailyReminder = dailyReminderP ?? dailyReminder;
    deadlineReminder = deadlineReminderP ?? deadlineReminder;
  }
}
