
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/pages/list.dart';
import 'package:flutter_app_pharmacy/widgets/category.dart';
import 'package:flutter_app_pharmacy/widgets/grid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/widgets/drug.dart';

import 'add_to-list_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;
  List<bool> isCatSelected = [];
  String c = "Category 1";
  Map user_data = {};
  DrugsByCat _drugs_by_cat;
  List<Widget> catNames = [];
  List<Drug> drugs = [];
  Widget app;
  var init;

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
    if(index==2){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => List_order()));
    }
    if(index==1){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add_to_list()));
    }
    if(index==0){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
    }
  }

  void _onCategoryTapped(String name) {
    setState(() {
      c = name;
    });
  }

  Future init_page() async {
    await _getData();
    _catNames();
    _drugsInfo();
    return Future(() => print('init done'));
  }

  Future _getData() async {
    print('getting data');
    var dataURI = Uri.http('10.0.2.2:3000', 'drugs/by_category');
    print("Sending get request");
    final response = await http.get(dataURI);
    print(response.statusCode);
    final String responseString = response.body;
    DrugsByCat drugsByCat =  welcomeFromJson(responseString).drugsByCat;
    //print(drugsByCat.toString());
    if (response.statusCode == 200) {
      print('success');
      this._drugs_by_cat = drugsByCat;
      //All is well

      print(_drugs_by_cat.getLength());
      for(int i = 0; i < drugsByCat.getLength(); i++) {
        isCatSelected.add(true);
      }


      //await _drugsInfo();
      //await _catNames();

      /*
      setState(() {
        this._drugs_by_cat = drugsByCat;
      });

       */
      return Future(() => print('get req done'));
    }
  }

  String _userName() {
    print(user_data.runtimeType);
    print(user_data['user_name'].runtimeType);
    return user_data == null ? 'Not logged in': user_data['user_name'];
  }

  void _catNames() {

    print('catnames');
    print(_drugs_by_cat.categoryDrugs);
    //print(_drugs_by_cat.categories[0].categoryName);
    List<Widget> catNames = [];
    if (_drugs_by_cat == null) {
      print('drugs are null');

    }
    _drugs_by_cat.categoryDrugs.forEach((cat) {
      print(cat.categoryName);
      catNames.add(category(cat.categoryName, _onCategoryTapped));
    });
    this.catNames = catNames;
  }

  void _drugsInfo() {
    print('drugsinfo');
    int selected = isCatSelected.where((item) => item == true).length;
    print('selected $selected');
    List<Drug> drugs= [];
    if (isCatSelected.length == 0)
      print('Empty');

    print(_drugs_by_cat.categoryDrugs);
    _drugs_by_cat.categoryDrugs.asMap().forEach((idx, cat_drugs) {
      print(cat_drugs.getDrugs()[0].drugName);
      if (isCatSelected[idx])
        drugs.addAll(cat_drugs.getDrugs());
    });
    this.drugs = drugs;
    //return drugs;
  }


  _HomeState() {
    print('Inside constructor');
    this.init = init_page();
    print('Finished constructor');
  }


  @override
  Widget build(BuildContext context) {
    print('build');
    user_data = ModalRoute.of(context).settings.arguments;
    var widgets = this.init.then((value) {
      return MaterialApp(
        title:"app",
        home: Scaffold(
          appBar: AppBar(
            title:  Text('Pharmacy App'),
            backgroundColor:Colors.red,
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 60,
                  child: Center(
                      child:Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_box,
                              color: Colors.red,
                              size: 30,
                            ),
                            Text(
                              _userName(),
                              style: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold),
                            ),
                          ]
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: this.catNames,
                ),
                gridTemplate(this.drugs),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart),
                label: 'Selected drugs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'History',
              ),
            ],
            currentIndex: selected,
            selectedItemColor: Colors.red,
            onTap: _onItemTapped,
          ),
        ),
    );
  });
    widgets.then((value) => this.app = value);
    return this.app;
  }
}


