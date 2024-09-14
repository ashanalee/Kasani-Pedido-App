import 'package:flutter/material.dart';

class QuantityController with ChangeNotifier {
  int quantity1 = 1;
  int quantity2 = 1;
  int quantity3 = 0;
  int quantity4 = 0;
  int quantity5 = 2;

  int get quantity_1 => quantity1;
  int get quantity_2 => quantity2;
  int get quantity_3 => quantity3;
  int get quantity_4 => quantity4;
  int get quantity_5 => quantity5;

  void incQuantity1() {
    quantity1++;
    notifyListeners();
  }

  void decQuantity1() {
    if (quantity1 > 0) {
      quantity1--;
      notifyListeners();
    }
  }

  void incQuantity2() {
    quantity2++;
    notifyListeners();
  }

  void decQuantity2() {
    if (quantity2 > 0) {
      quantity2--;
      notifyListeners();
    }
  }

  void incQuantity3() {
    quantity3++;
    notifyListeners();
  }

  void decQuantity3() {
    if (quantity3 > 0) {
      quantity3--;
      notifyListeners();
    }
  }

  void incQuantity4() {
    quantity4++;
    notifyListeners();
  }

  void decQuantity4() {
    if (quantity4 > 0) {
      quantity4--;
      notifyListeners();
    }
  }

  void incQuantity5() {
    quantity5++;
    notifyListeners();
  }

  void decQuantity5() {
    if (quantity5 > 0) {
      quantity5--;
      notifyListeners();
    }
  }
}
