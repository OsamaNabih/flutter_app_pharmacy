import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/list_order.dart';
import 'package:flutter_app_pharmacy/data/order.dart';
import 'package:flutter_app_pharmacy/data/orders.dart';
import 'package:flutter_app_pharmacy/data/order.dart';
import 'package:flutter_app_pharmacy/widgets/card_info.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:provider/provider.dart';

class order_request extends StatefulWidget {
  final int id;
  final String name;
  final String datetime;
  final int price;
  final String status;
  String date;
  String year;
  String month;
  String day;
  bool vis = true;
  bool vis1 = false;
  bool vis2 = false;
  Color color;
  order_request({this.id, this.name, this.datetime, this.price, this.status}) {
    List<String> splitDateTime = datetime.split('T');
    date = splitDateTime[0];
    String time = splitDateTime[1];
    List<String> splitDate = date.split('-');
    year = splitDate[0];
    month = splitDate[1];
    day = splitDate[2];
    if (status == "Approved") {
      vis = false;
      vis1 = true;
      vis2 = false;
      color = Colors.green;
    } else {
      if (status == "Rejected") {
        vis = false;
        vis2 = true;
        vis1 = false;
        color = Colors.red;
      } else {
        vis = true;
        vis1 = false;
        vis2 = false;
      }
    }
  }

  @override
  _order_requestState createState() => _order_requestState();
}

class _order_requestState extends State<order_request> {
  Color col = Colors.grey[800];
  //bool vis=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 10.0, color: Colors.red[200]),
      )),
      child: Card(
        //color: Colors.white,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Container(
                width: 170,
                child: InkWell(
                  child: Text(
                    '${widget.name}',
                    //overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: col, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ),
              title: Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    //color: Colors.white,
                  ),
                  Container(width: 6),
                  Text(
                    "${widget.date}",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.money_off_outlined,
                    color: Colors.green[600],
                  ),
                  Container(width: 6),
                  Text(
                    "${widget.price}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
              onTap: () async {
                //here
                Item drug_list = await GetDrugsData(widget.id);
                Navigator.pushNamed(context, '/order_details', arguments: {
                  'DrugObject': drug_list.drugs,
                  'user_name': widget.name,
                });
              },
            ),
            Visibility(
              visible: widget.vis1,
              child: Container(),
            ),
            Visibility(
              visible: widget.vis2,
              child: Container(),
            ),
            Container(
              width: (MediaQuery.of(context).size.width / 20) * 100,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(
                  bottom: 12.0, left: 8, right: 8, top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    child: Container(
                        width: 100,
                        height: 25,
                        child: InkWell(
                            child: Container(
                          width: 100,
                          height: 90,
                          child: Icon(
                            Icons.done_rounded,
                            color: Colors.green[700],
                            size: 30,
                          ),
                        )) /*FloatingActionButton(
                              heroTag: '',
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                "Accept Order",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              onPressed: () {
                                widget.vis = false;
                                widget.vis1 = true;
                                widget.vis2 = false;
                                widget.color = Colors.green;
                              }),*/
                        ),
                    visible: widget.vis,
                  ),
                  Visibility(
                    child: Container(
                        width: 100,
                        height: 25,
                        child: InkWell(
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ) /*FloatingActionButton(
                              heroTag: '',
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                "Reject Order",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              onPressed: ()  {
                              }),*/
                        ),
                    visible: widget.vis,
                  ),
                  /*
                      Container(
                        width: 100,
                        height: 25,
                        child: FloatingActionButton(
                            heroTag: '',
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            child: Icon(
                              Icons.info_outline_rounded,
                              color: Colors.orange,
                            ),
                            onPressed: () async {
                              //here
                              Item drug_list = await GetDrugsData(widget.id);
                              Navigator.pushNamed(context, '/order_details', arguments: {
                                'DrugObject': drug_list.drugs,
                                'user_name': widget.name,
                              });
                            }),
                      ),

                       */
                ],
              ),
            ),
          ],
        ),
      ),
    ); /*;*/
  }
}

Widget orderInfoTemplate(
    {@required int id,
    @required String name,
    @required String datetime,
    @required int price,
    @required String status}) {
  return order_request(
      id: id, name: name, datetime: datetime, price: price, status: status);
}
