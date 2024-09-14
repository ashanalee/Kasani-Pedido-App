import 'package:flutter/material.dart';

class DropdownController with ChangeNotifier {
  String _selectedLocation = 'Local Miraflores';
  final List<String> _locations = ['Local Miraflores', 'Local San Isidro', 'Local Barranco'];

  String get selectedLocation => _selectedLocation;
  List<String> get locations => _locations;

  void setSelectedLocation(String newLocation) {
    _selectedLocation = newLocation;
    notifyListeners();
  }
}
