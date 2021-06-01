import 'package:flutter/cupertino.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';

class cart extends ChangeNotifier{
  List<drug_item>drugs=[];
  double total_price=0;

  void add_drug(drug_item item){
    this.drugs.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void remove_drug(drug_item item){
    drugs.remove(item);
    //total_price=total_price-(item.item_price*item.quantity);
    notifyListeners();
  }
  List<drug_item> get drug{
    return drugs;
  }
}