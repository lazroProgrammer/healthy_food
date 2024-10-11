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
  static const dataSaverKey = 'dataSaverKey';
  static const allowNotificationKey = 'allowNotification';
  static const dailyReminderKey = 'dailyReminder';
  static const deadlineKey = 'deadline';

  // static final localDb = Localstore.instance;
  static final SettingsData _instance = SettingsData._internal();
  late bool darkmode;
  late int appStyle;
  late bool dataSaver;
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
    dataSaver = getdataSaver() ?? false;
    allowNotifications = getNotification() ?? false;
    dailyReminder = getDailyReminder() ?? false;
    deadlineReminder = getDeadlineReminder() ?? false;

    // localDb.collection("settings").doc(localId).get().then((json) {
    //   print("Settings json: $json");
    //   if (json != null) {
    //     darkmode = json["darkmode"] as bool;
    //     allowNotifications = json["notifications"] as bool;
    //     dailyReminder = json["dailyReminder"] as bool;
    //     deadlineReminder = json["deadlineReminder"] as bool;
    //     currency = json["currency"] as String;
    //   } else {
    //     darkmode = false;
    //     allowNotifications = true;
    //     dailyReminder = false;
    //     deadlineReminder = false;
    //     currency = "USD";
    //     update(
    //       darkTheme: false,
    //       notifications: true,
    //       dailyReminderP: false,
    //       deadlineReminderP: false,
    //       currencyP: "USD",
    //     );
    //   }
    // });
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

  static Future setdataSaver(bool b) async {
    await _preferences.setBool(dataSaverKey, b);
  }

  static bool? getdataSaver() => _preferences.getBool(dataSaverKey);

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
      bool? dataSaver,
      bool? notifications,
      bool? dailyReminderP,
      bool? deadlineReminderP}) {
    // localDb.collection("settings").doc(localId).set({
    //   "darkmode": darkTheme ?? darkmode,
    //   "notifications": notifications ?? allowNotifications,
    //   "dailyReminder": dailyReminderP ?? dailyReminder,
    //   "deadlineReminder": deadlineReminderP ?? deadlineReminder,
    //   "currency": currencyP ?? currency
    // });
    if (darkTheme != null) {
      setdark(darkTheme);
    }
    if (appStyle != null) {
      setStyle(appStyle);
    }
    if (dataSaver != null) {
      setdataSaver(dataSaver);
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
