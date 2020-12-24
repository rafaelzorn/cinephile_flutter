// Cf
import 'package:cinephile_flutter/store/configuration/configuration.dart';

class AsMobx {
  static final AsMobx _mobxStore = AsMobx._internal();

  ConfigurationStore configurationStore = ConfigurationStore();

  factory AsMobx() {
    return _mobxStore;
  }

  AsMobx._internal();
}