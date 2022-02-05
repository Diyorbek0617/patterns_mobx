// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateStore on _UpdateStore, Store {
  final _$isLoadingAtom = Atom(name: '_UpdateStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$titleTextEditingControllerAtom =
  Atom(name: '_UpdateStore.titleTextEditingController');

  @override
  TextEditingController get titleTextEditingController {
    _$titleTextEditingControllerAtom.reportRead();
    return super.titleTextEditingController;
  }

  @override
  set titleTextEditingController(TextEditingController value) {
    _$titleTextEditingControllerAtom
        .reportWrite(value, super.titleTextEditingController, () {
      super.titleTextEditingController = value;
    });
  }

  final _$bodyTextEditingControllerAtom =
  Atom(name: '_UpdateStore.bodyTextEditingController');

  @override
  TextEditingController get bodyTextEditingController {
    _$bodyTextEditingControllerAtom.reportRead();
    return super.bodyTextEditingController;
  }

  @override
  set bodyTextEditingController(TextEditingController value) {
    _$bodyTextEditingControllerAtom
        .reportWrite(value, super.bodyTextEditingController, () {
      super.bodyTextEditingController = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
titleTextEditingController: ${titleTextEditingController},
bodyTextEditingController: ${bodyTextEditingController}
    ''';
  }
}
