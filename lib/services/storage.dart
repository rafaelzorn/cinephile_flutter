import 'package:shared_preferences/shared_preferences.dart';

// Cf
import 'package:cinephile_flutter/enums/storage-keys.dart';

class StorageService {
  Future<SharedPreferences> _sharedStorage() {
    return SharedPreferences.getInstance();
  }

  Future setBool({StorageKeys key, bool value}) async {
    SharedPreferences sharedStorage = await _sharedStorage();

    return sharedStorage.setBool(key.toString(), value);
  }

  Future<bool> getBool({StorageKeys key}) async {
    SharedPreferences sharedStorage = await _sharedStorage();

    return sharedStorage.getBool(key.toString());
  }
}
