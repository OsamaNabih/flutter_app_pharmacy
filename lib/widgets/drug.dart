import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app_pharmacy/data/Add_to_Cart.dart';
import 'package:flutter_app_pharmacy/data/cart.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:path/path.dart';
import 'package:flutter_app_pharmacy/widgets/drug.dart';
import 'package:flutter_app_pharmacy/data/cart.dart';
import 'package:provider/provider.dart';

Widget drugTemplate(int id, String drug_name, int drug_price, String drug_desc,
    Function showDialog) {
  return DrugRow(id, drug_name, drug_price, drug_desc, showDialog);
}

class DrugRow extends StatelessWidget {
  Text txt_name;
  Text txt_price;
  String drug_desc;
  Function showDialog;
  int DrugId;
  int drugPrice;
  int quantity = 0;
  String DrugName;

  DrugRow(int id, String drug_name, int drug_price, String drug_desc,
      Function showDialog) {
    txt_name = Text(
      "${drug_name}",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //oftWrap: true,
      //overflow: TextOverflow.clip,
      //maxLines: 2,
    );
    txt_price = Text(
      "${drug_price}",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
    this.showDialog = showDialog;
    this.drug_desc = drug_desc;
    this.DrugId = id;
    this.drugPrice = drug_price;
    this.DrugName = drug_name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(7.0, 7.0, 0.0, 0.0),
      //width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600], width: 0.3),
          //border: Border(
        //bottom: BorderSide(width: 10.0, color: Colors.red[200]),)
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<Cart>(builder: (context, cart, child) {
            return InkWell(
              radius: 25,
              child: Container(
                //width: 60,
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                int r = 0;

                for (int y = 0; y < cart.drugs.length; y++) {
                  print("dd");
                  if (cart.drugs[y].drugId == this.DrugId) {
                    r = 1;
                    break;
                  }
                }
                if (r == 0) {
                  cart.addDrug(
                      DrugItem(this.DrugId, this.drugPrice, this.DrugName));
                }
                print(cart.drugs.length);

                print(this.drugPrice);
              },
            );
          }),
          InkWell(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  //child: Image.asset('images/image1.jpg'),
                  //radius: 25,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    color: Theme.of(context).primaryColor,
                  ),
                    child: Center(
                      child: Text(
                        "Drug",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                
                Container(
                  height: 5,
                ),
                Container(
                  //height: 60,
                  child: Row(
                    children: [
                      //Flexible(child: Text("Name :", style: TextStyle(color: Colors.red))),
                      //FittedBox(
                      Flexible(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${DrugName}",
                              style: TextStyle(
                                  color: Colors.black),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        //),
                      ),
                      //),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                ),
                Row(
                  children: [
                    //Text("Price :", style: TextStyle(color: Colors.red)),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "${drugPrice} EGP",
                            style: TextStyle(
                                color: Colors.orange[800],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //),
                    ),
                  ],
                )
              ],
            ),
            onTap: () {
              this.showDialog(drug_desc);
            },
          )
        ],
      ),
    );
    /*Card(
      color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              //child: Image.asset('images/image1.jpg'),
              radius: 30,
            ),
            title: txt_name,
            subtitle: txt_price,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*Consumer<CartModel>(
    builder: (context, cart, child) {
    return Text("Total price: ${cart.totalPrice}");
    },
    );*/
              Container(
                  width: 120,
                  height: 30,
                  child: Consumer<Cart>(builder: (context, cart, child) {
                    return FloatingActionButton(
                        heroTag: '',
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "Add to list",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {

                        });
                  })),
              Container(
                width: 120,
                height: 30,
                child: FloatingActionButton(
                  heroTag: '',
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Icon(Icons.info_outline),
                  /*
                  child: Text(
                    "drug description",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  */
                  onPressed: () {
                    this.showDialog(drug_desc);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );*/
  }
}
