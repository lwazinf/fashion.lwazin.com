import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings with ChangeNotifier, DiagnosticableTreeMixin {
  bool _displayLock = false;
  bool _listLock = false;
  String _displayImage =
      "https://i1.wp.com/66.media.tumblr.com/1c7424517b47f2cc5ca63e8256b8e958/tumblr_pmx9zuliku1r5jwlho1_500.jpg";

  bool get displayLock => _displayLock;
  bool get listLock => _listLock;
  String get displayImage => _displayImage;

  void switchDisplayLock() {
    _displayLock = !_displayLock;
    notifyListeners();
  }

  void switchListLock() {
    _listLock = !_listLock;
    notifyListeners();
  }

  void switchDisplayImage(String value) {
    _displayImage = value;
    notifyListeners();
  }
}
