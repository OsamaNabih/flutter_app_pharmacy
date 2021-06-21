import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/responses/user_login_response.dart';
import 'package:flutter_app_pharmacy/services/login.dart';
import 'package:flutter_app_pharmacy/widgets/category.dart';
import 'package:flutter_app_pharmacy/widgets/grid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:flutter_app_pharmacy/data/list_order.dart';
import 'package:vertical_navigation_bar/vertical_navigation_bar.dart';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_app_pharmacy/utils/user_preferences.dart';
import 'package:flutter_app_pharmacy/services/home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum Search_item { Category, Name, Price }

class _HomeState extends State<Home> {
  int userId;
  String _token;
  String userName;
  String userType;
  String groupValuefilters;
  String groupValuecategory;
  int catindex = 0;
  int catSelected = 0;
  List<CategoryDrug> drugsByCatList;
  DrugsByCat drugsByCat;
  int selected = 0;
  List<bool> isCatSelected = [];
  String c = "Category 1";
  Map args = {};
  List<Widget> categories = [];
  List<String> catNames;
  List<Drug> drugs = [];
  Widget app;
  Search_item _character = Search_item.Category;
  String dropdownValue = 'Category';
  RangeValues _currentRangeValues = const RangeValues(0, 500);
  bool isChecked = false;
  bool cat1 = false;
  bool cat2 = false;
  bool cat3 = false;
  bool cat4 = false;

  final pageController = PageController(initialPage: 0, keepPage: true);

  final List<SideNavigationItem> navItems = [];

  final initialTab = 0;

  void getlist_data() async {
    String token = UserPreferences.getString('user_token');
    print('Home SP token: $token');
    var response;
    print('getting list order data');
    var dataURI = Uri.http('10.0.2.2:3000', 'orders/user/$userId');
    print("Sending get order request");
    response = await http.get(dataURI);
    print("res_order");
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    final String responseString = response.body;
    list_order list = list_order.fromJson(json.decode(responseString));
    print("orders len == ${list.getlen()}");

    Navigator.pushReplacementNamed(context, '/list', arguments: {
      'user_name': this.userName,
      'user_type': userType,
      'user_token': _token,
      'user_id': userId,
      'order_object': list,
    });
  }

  void _onItemTapped(int index) {
    if (index == selected) return;
    setState(() {
      selected = index;
    });
    if (index == 2) {
      getlist_data();
    } else if (index == 1) {
      // Cart page
      Navigator.pushReplacementNamed(context, '/add_to_list_page', arguments: {
        'user_name': this.userName,
        'user_type': userType,
        'user_token': _token,
        'user_id': userId,
      });
    }
  }

  void _onCategoryTapped(String name) {
    setState(() {
      c = name;
    });
  }

  String _userName() {
    _token = UserPreferences.getString('user_token');
    return args == null ? 'Guest' : args['user_name'];
  }

  Future<DrugsByCat> getDrugs() async {
    var dataURI = Uri.http('10.0.2.2:3000', 'drugs/by_category');
    var response = await http.get(dataURI);
    if (response.statusCode != 200) {
      throw ("Server error: ${response.body}");
    }
    final String responseString = response.body;
    DrugsByCat drugsByCat = welcomeFromJson(responseString).drugsByCat;
    return drugsByCat;
  }

  List<String> getCatNames(DrugsByCat drugsByCat) {
    List<String> catNames = [];
    if (drugsByCat == null) {
      print('drugs are null');
    }
    drugsByCat.categoryDrugs.forEach((cat) {
      print(cat.categoryName);
      catNames.add(cat.categoryName);
    });
    return catNames;
  }

  void init_page() async {
    args = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> payload = Jwt.parseJwt(args['user_token']);

    this.userId = payload['user_id'];
    this.userName = _userName();
    this.userType = payload['user_type'];
    print('Name: $userName, id: $userId');

    this.drugsByCat = await getDrugs();
    this.catNames = getCatNames(this.drugsByCat);
    this.drugsByCatList = this.drugsByCat.getCatDrugs();
    this.drugs = drugsByCatList[catSelected].getDrugs();
    /*
    this.catNames =
        (args == null || args['cat_names'] == null) ? [] : args['cat_names'];
    this.drugsByCat = (args == null || args['drugs_by_cat'] == null)
        ? []
        : args['drugs_by_cat'];
    this.drugs = drugsByCat == null ? [] : drugsByCat[catSelected].getDrugs();
    */
    if (this.navItems.length == 0) {
      catNames.forEach((catName) {
        //print(catName);
        categories.add(category(catName, _onCategoryTapped));
        this.navItems.add(SideNavigationItem(title: catName));
      });
    }
  }

  @override
  void didChangeDependencies() {
    print('Before');
    super.didChangeDependencies();
    print('After');
    args = ModalRoute.of(context).settings.arguments;
    init_page();
  }

  void updateDrugs() {
    setState(() {
      this.drugs =
          drugsByCat == null ? [] : drugsByCatList[catSelected].getDrugs();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    //init_page();
    print("Nav items length: ${navItems.length}");
    // var widgets = this.init.then((value) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        //leadingWidth: 5,
        title: Row(children: [
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 30,
            ),
            onPressed: () {
              navigateToProfile(context, _token);
            },
          ),
          Text(
            '${this.userName}',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        //title: Text('Pharmacy App'),
        //centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          InkWell(
              child: Row(
                children: [
                  Icon(Icons.login_outlined),
                  SizedBox(width: 3),
                  Text(
                    "Logout",
                    style: Theme.of(context)
                        .appBarTheme
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 18),
                  ),
                  SizedBox(width: 12),
                ],
              ),
              onTap: () {
                logout(context);
              }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              // alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    width: 5.0,
                    color: Theme.of(context).primaryColor,
                  )),
                ),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return DropdownButton(
                    //dropdownColor: Theme.of(context).primaryColor,
                    iconEnabledColor: Theme.of(context).primaryColor,

                    items: [
                      DropdownMenuItem(
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              onChanged: (bool value) {
                                setState(() {
                                  cat1 = value;
                                });
                              },
                              value: cat1,
                            ),
                            Text(
                              'Headache',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              onChanged: (bool value) {
                                setState(() {
                                  cat2 = value;
                                });
                              },
                              value: cat2,
                            ),
                            Text(
                              'Stomach ache',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              onChanged: (bool value) {
                                setState(() {
                                  cat3 = value;
                                });
                              },
                              value: cat3,
                            ),
                            Text(
                              'Cough',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              onChanged: (bool value) {
                                setState(() {
                                  cat4 = value;
                                });
                              },
                              value: cat4,
                            ),
                            Text(
                              'Flu',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    hint: Text(
                      'Category',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  );
                }),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Price Range ",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 500,
                divisions: 500,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: GridView.builder(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 25,
                childAspectRatio: MediaQuery.of(context).size.height *
                    0.5 /
                    MediaQuery.of(context).size.width,
              ),
              // Generate 100 widgets that display their index in the List.
              //padding: EdgeInsets.all(15),
              //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),

              //shrinkWrap: true,
              itemCount: this.drugs.length,
              itemBuilder: (context, index) {
                //return gridTemplate(this.drugs, showDescriptionDialog)[index];
                return getDrug(drugs[index], showDescriptionDialog);
              },
            ),
          ),
        ],
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
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).primaryColor;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Filter'),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text('Category'),
                  leading: Radio(
                    value: Search_item.Category,
                    groupValue: _character,
                    activeColor: Colors.red,
                    onChanged: (Search_item value) {
                      print(value);
                      print("old value ${_character}");
                      setState(() {
                        _character = value;
                        this.groupValuefilters = _character.toString();
                        print(_character);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Name'),
                  leading: Radio(
                    value: Search_item.Name,
                    groupValue: _character,
                    activeColor: Colors.red,
                    onChanged: (Search_item value) {
                      print(value);
                      print("old value ${_character}");
                      setState(() {
                        _character = value;
                        this.groupValuefilters = _character.toString();
                        print(_character);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Price'),
                  leading: Radio(
                    value: Search_item.Price,
                    groupValue: _character,
                    activeColor: Colors.red,
                    onChanged: (Search_item value) {
                      print(value);
                      print("old value ${_character}");
                      setState(() {
                        _character = value;
                        this.groupValuefilters = _character.toString();
                        print(_character);
                      });
                    },
                  ),
                ),
              ],
            );
          }),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                print(this.groupValuefilters.toString());
                if (this.groupValuefilters.toString() ==
                    "Search_item.Category") {
                  _categotyDialog();
                }
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> Category_buttons(BuildContext context, StateSetter setState) {
    List<Widget> Category_items = [];
    String groupvalue = this.catNames[0];
    print(this.catNames.length);
    for (int e = 0; e < this.catNames.length; e++) {
      Category_items.add(
        ListTile(
            title: Text("${this.catNames[e]}"),
            leading: Radio(
              value: this.catNames[e],
              groupValue: groupvalue,
              onChanged: (String value) {
                setState(() {
                  groupvalue = value;
                  this.catindex = e;
                  this.groupValuecategory = this.catNames[e];
                  print("cat ${groupvalue}");
                });
              },
            )),
      );
    }
    return Category_items;
  }

  Future<void> _categotyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose category'),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: Category_buttons(context, setState),
            );
          }),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                this.catSelected = this.catindex;
                updateDrugs();
              },
            ),
          ],
        );
      },
    );
  }

  void showDescriptionDialog(String drug_desc) {
    print('Inside showDialog');
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Dialog(
          elevation: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    drug_desc,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0.25)).animate(anim),
          child: child,
        );
      },
    );
  }
}

/*
Dialog(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "The Drug Description",

                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          //color: Theme.of(context).primaryColor,
                        ),

                      ),


                    ),
                    Container(
                      height: 10,
                      color: Colors.white,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        //color: Colors.amber,
                          border: Border.all(
                            color: Colors.redAccent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                          drug_desc,
                          style: TextStyle(
                            fontSize: 20,
                            //color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        );
 */