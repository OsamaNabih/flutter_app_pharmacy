import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/widgets/Order_req.dart';

class order_nav extends StatefulWidget {
  List<Widget> not_reply = [];
  List<Widget> Accept = [];
  List<Widget> Reject = [];

  order_nav(List<Widget> not_reply, List<Widget> accept, List<Widget> reject) {
    this.not_reply = not_reply;
    this.Reject = reject;
    this.Accept = accept;
  }
  @override
  _order_navState createState() => _order_navState(not_reply, Accept, Reject);
}

class _order_navState extends State<order_nav> with TickerProviderStateMixin {
  List<Widget> not_reply = [];
  List<Widget> Accept = [];
  List<Widget> Reject = [];
  _order_navState(
      List<Widget> not_reply, List<Widget> accept, List<Widget> reject) {
    this.not_reply = not_reply;
    this.Reject = reject;
    this.Accept = accept;
  }

  TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Accepted Orders",
            ),
            Tab(
              text: "Rejected Orders",
            ),
            Tab(
              text: "Not Reply Orders",
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.70,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: [
              ListView(
                children: Accept,
              ),
              ListView(
                children: Reject,
              ),
              ListView(
                children: not_reply,
              ),
            ],
          ),
        )
      ],
    );
  }

  List<TableRow> getrowdata(Map<dynamic, dynamic> map) {
    List<TableRow> row = [];

    for (int p = 0; p < map.length; p++) {
      row.add(TableRow(children: [
        Column(children: [Text("index 1")]),
        Column(children: [Text('index 2')]),
        Column(children: [Text('index 3')]),
      ]));
    }
    return row;
  }
}
