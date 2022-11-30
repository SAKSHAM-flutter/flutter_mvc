import 'package:shared_preferences/shared_preferences.dart';

///Singleton class for accessing shared prefs, it contains all the key value fields to be saved in the app
class Prefs {
  Prefs._();

  static late SharedPreferences prefs;

  ///must call this function before performing any shared prefs related operations
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static final localData = SharedPrefValue<String>('local_data', prefs);
  static final email = SharedPrefValue<String>('_email', prefs);
  static final password = SharedPrefValue<String>('_password', prefs);
  static final remember = SharedPrefValue<bool>('_is_remember', prefs);

  static void clear() {
    prefs.clear();
  }
}

///Encapsulates getting and setting of Shared pref values.
class SharedPrefValue<T> {
  final String key;
  final SharedPreferences prefs;

  SharedPrefValue(this.key, this.prefs);

  ///Sets a value to the key provided in constructor
  void set(T value) {
    switch (T) {
      case int:
        prefs.setInt(key, value as int);
        break;
      case String:
        prefs.setString(key, value as String);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
    }
  }

  ///Returns the value from Shared Preferences if present,
  ///and returns null otherwise
  T? getSafe() {
    return prefs.get(key) as T?;
  }

  ///Returns the value from Shared Preferences if present,
  ///and returns a default provided in arguments otherwise
  T getOrDefault(T def) {
    return getSafe() ?? def;
  }

  ///Returns value from Shared Preferences if present,
  ///and returns a default value otherwise.
  ///Default values for different data types:
  ///int -> -1,
  ///String -> "",
  ///bool -> false,
  T get() {
    return getSafe() ?? _getDefaultValues();
  }

  T _getDefaultValues() {
    switch (T) {
      case int:
        return -1 as T;
      case String:
        return "" as T;
      case bool:
        return false as T;
      default:
        throw Exception('Unrecognized Type T');
    }
  }

  ///Removes value from Shared Preferences
  void clear() {
    prefs.remove(key);
  }
}
