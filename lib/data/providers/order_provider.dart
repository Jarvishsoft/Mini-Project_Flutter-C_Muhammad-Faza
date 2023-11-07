import 'package:flutter/material.dart';
import 'package:hikeabis_app/data/models/order_model.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModels> _ordersModels = [];

  List<OrderModels> get orders => _ordersModels;

  void addOrderModels(OrderModels order) {
    _ordersModels.add(order);
    notifyListeners();
  }

  void removeOrderModels(int index, OrderModels order) {
    _ordersModels.remove(order);
    notifyListeners();
  }
}
