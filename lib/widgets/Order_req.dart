import 'package:flutter/material.dart';

class order_request extends StatefulWidget {
  final String date;
  final String price;
  final String name;
  final String status;
  bool vis = true;
  bool vis1 = false;
  bool vis2 = false;
  Color color;
  order_request({this.name, this.date, this.price, this.status}) {
    if (status == "Approved") {
      vis = false;
      vis1 = true;
      vis2 = false;
      color = Colors.green;
    } else {
      if (status == "rej") {
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
  Color col = Colors.black;
  //bool vis=true;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 25,
            child: ListTile(
              leading: InkWell(
                child: new Text(
                  "${widget.name}",
                  style: TextStyle(
                      color: col, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                onHover: (value) {
                  setState(() {
                    col = Colors.red;
                  });
                },
                onTap: () {
                  Navigator.pushNamed(context, '/profile_page');
                },
              ),
              title: Text(
                "Date : ${widget.date}",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
              ),
              subtitle: Text(
                "Price :${widget.price}",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
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
            height: 120,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  child: Container(
                    width: 120,
                    height: 30,
                    child: FloatingActionButton(
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
                        }),
                  ),
                  visible: widget.vis,
                ),
                Visibility(
                  child: Container(
                    width: 120,
                    height: 30,
                    child: FloatingActionButton(
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
                        onPressed: () {
                          //Navigator.pushNamed(context, '/order_details');
                          //MaterialPageRoute(builder: (context) => orderTemplate()),
                        }),
                  ),
                  visible: widget.vis,
                ),
                Container(
                  width: 120,
                  height: 30,
                  child: FloatingActionButton(
                      heroTag: '',
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        "View Order Details",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                      onPressed: () {
                        //Navigator.pushNamed(context, '/order_details');
                        //MaterialPageRoute(builder: (context) => orderTemplate()),
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget orderInfoTemplate(
    String name, String date, String price, String status) {
  return order_request(name: name, date: date, price: price, status: status);
}
