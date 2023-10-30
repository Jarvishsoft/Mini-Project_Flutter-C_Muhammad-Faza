import 'package:flutter/material.dart';

class Booking with ChangeNotifier {
  final List<Map<String, String>> _bookings = [];

  List<Map<String, String>> get bookings => _bookings;

  void addBooking(Map<String, String> booking) {
    _bookings.add(booking);
    notifyListeners();
  }
}
