import 'package:flutter/cupertino.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';

class cart extends ChangeNotifier{
  List<item_drug>drugs=[];
  double total_price=0;

  void add_drug(item_drug item){
    this.drugs.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void remove_drug(item_drug item){
    drugs.remove(item);
    //total_price=total_price-(item.item_price*item.quantity);
    notifyListeners();
  }
  List<item_drug> get drug{
    return drugs;
  }
}