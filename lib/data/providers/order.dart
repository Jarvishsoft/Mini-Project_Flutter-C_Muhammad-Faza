import 'package:flutter/material.dart';

class Order with ChangeNotifier {
  final List<Map<String, String>> _orders = [];

  List<Map<String, String>> get orders => _orders;

  void addOrder(Map<String, String> order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeOrder(int index) {
    _orders.removeAt(index);
    notifyListeners();
  }
}
