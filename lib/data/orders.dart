import 'package:flutter/cupertino.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';
import 'package:flutter_app_pharmacy/data/order.dart';

import 'list_order.dart';

class orders extends ChangeNotifier{
  List<Clientorder> Accept = [];
  List<Clientorder> Reject = [];
  List<Clientorder> Not_Reply = [];

  void add__to_accept(Clientorder item){
    this.Accept.add(item);
    notifyListeners();
  }

  void add__to_reject(Clientorder item){
    this.Reject.add(item);
    notifyListeners();
  }

  void add__to_not_reply(Clientorder item){
    this.Not_Reply.add(item);
    notifyListeners();
  }

  void Remove_on_accept(Clientorder item){
    this.Accept.remove(item);
    notifyListeners();
  }

  void Remove_on_reject(Clientorder item){
    this.Reject.remove(item);
    notifyListeners();
  }

  void Remove_on_not_reply(Clientorder item){
    this.Not_Reply.remove(item);
    notifyListeners();
  }
  
}