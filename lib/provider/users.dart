import 'dart:math';
import 'package:crud_flutter/data/dummy_users.dart';
import 'package:flutter/material.dart';
import 'package:crud_flutter/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      _items.putIfAbsent(user.id, () => user);
    }
    notifyListeners();
  }

  void remove(User user) {
    if(user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}