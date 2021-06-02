import 'package:flutter/cupertino.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';

import 'list_order.dart';

class orders extends ChangeNotifier{
  List<order>Accept=[];
  List<order>Reject=[];
  List<order>Not_Reply=[];


  void add__to_accept(order item){
    this.Accept.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void add__to_reject(order item){
    this.Reject.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void add__to_not_reply(order item){
    this.Not_Reply.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void Remove_on_accept(order item){
    this.Accept.remove(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void Remove_on_reject(order item){
    this.Reject.remove(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void Remove_on_not_reply(order item){
    this.Not_Reply.remove(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }

}