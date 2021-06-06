import 'package:flutter/cupertino.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';

class Cart extends ChangeNotifier {

  List<DrugItem> drugs = [];
  double totalPrice = 0;

  void addDrug(DrugItem item) {
    this.drugs.add(item);
    notifyListeners();
  }

  void removeDrug(DrugItem item) {
    drugs.remove(item);
    notifyListeners();
  }

  List<DrugItem> get drug {
    return drugs;
  }

  int totalCost() {
    int counter = 0;
    for (int i = 0; i < drugs.length; i++) {
      counter = counter + (drugs[i].price * drugs[i].quantity);
    }
    return counter;
  }
}
