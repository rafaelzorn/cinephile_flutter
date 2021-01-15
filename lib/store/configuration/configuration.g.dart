// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigurationStore on ConfigurationStoreBase, Store {
  final _$hasAdultContentAtom =
      Atom(name: 'ConfigurationStoreBase.hasAdultContent');

  @override
  bool get hasAdultContent {
    _$hasAdultContentAtom.reportRead();
    return super.hasAdultContent;
  }

  @override
  set hasAdultContent(bool value) {
    _$hasAdultContentAtom.reportWrite(value, super.hasAdultContent, () {
      super.hasAdultContent = value;
    });
  }

  final _$initializeConfigurationStoreAsyncAction =
      AsyncAction('ConfigurationStoreBase.initializeConfigurationStore');

  @override
  Future<void> initializeConfigurationStore() {
    return _$initializeConfigurationStoreAsyncAction
        .run(() => super.initializeConfigurationStore());
  }

  final _$ConfigurationStoreBaseActionController =
      ActionController(name: 'ConfigurationStoreBase');

  @override
  void setConfiguration({bool adultContent}) {
    final _$actionInfo = _$ConfigurationStoreBaseActionController.startAction(
        name: 'ConfigurationStoreBase.setConfiguration');
    try {
      return super.setConfiguration(adultContent: adultContent);
    } finally {
      _$ConfigurationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasAdultContent: ${hasAdultContent}
    ''';
  }
}
