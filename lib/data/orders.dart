import 'package:flutter/cupertino.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';
import 'package:flutter_app_pharmacy/data/order.dart';

import 'list_order.dart';

class orders extends ChangeNotifier{
  List<client_order>Accept=[];
  List<client_order>Reject=[];
  List<client_order>Not_Reply=[];

  void add__to_accept(client_order item){
    this.Accept.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void add__to_reject(client_order item){
    this.Reject.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void add__to_not_reply(client_order item){
    this.Not_Reply.add(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void Remove_on_accept(client_order item){
    this.Accept.remove(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void Remove_on_reject(client_order item){
    this.Reject.remove(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }
  void Remove_on_not_reply(client_order item){
    this.Not_Reply.remove(item);
    //total_price=total_price+(item.item_price*item.quantity);
    notifyListeners();
  }

}