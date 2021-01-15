import 'package:mobx/mobx.dart';

// Cf
import 'package:cinephile_flutter/services/storage.dart';
import 'package:cinephile_flutter/enums/storage-keys.dart';

part 'configuration.g.dart';

class ConfigurationStore = ConfigurationStoreBase with _$ConfigurationStore;

abstract class ConfigurationStoreBase with Store {
  @observable
  bool hasAdultContent = false;

  @action
  Future<void> initializeConfigurationStore() async {
    await _setPropsFromPersistance();
    await _persistStore();
  }

  @action
  void setConfiguration({bool adultContent}) {
    hasAdultContent = adultContent;

    _persistStore();
  }

  Future<void> _persistStore() async {
    await StorageService().setBool(
      key: StorageKeys.hasAdultContent,
      value: hasAdultContent
    );
  }

  Future<void> _setPropsFromPersistance() async {
    bool persistedData = await StorageService().getBool(
      key: StorageKeys.hasAdultContent,
    );

    hasAdultContent = persistedData != null ? persistedData : false;
  }
}
