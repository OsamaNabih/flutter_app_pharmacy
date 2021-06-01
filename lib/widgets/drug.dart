import 'package:flutter/material.dart';
//import 'package:flutter_app_pharmacy/data/Add_to_Cart.dart';
import 'package:flutter_app_pharmacy/data/cart.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';
import 'package:flutter_app_pharmacy/data/drugs_by_cat.dart';
import 'package:path/path.dart';
import 'package:flutter_app_pharmacy/widgets/drug.dart';
import 'package:flutter_app_pharmacy/data/cart.dart';
import 'package:provider/provider.dart';
Widget drugTemplate(int id,String drug_name , int drug_price, String drug_desc, Function showDialog) {
  return DrugRow( id,drug_name ,  drug_price, drug_desc, showDialog);
}


class DrugRow extends StatelessWidget {
  Text txt_name;
  Text txt_price;
  String drug_desc;
  Function showDialog;
  int DrugId;
  int price;
  int quantity=0;
  String DrugName;

  DrugRow(int id ,String drug_name , int drug_price, String drug_desc, Function showDialog) {
    txt_name = Text(
      "Name: ${drug_name}",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
    txt_price = Text(
      "Price: ${drug_price}",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
    this.showDialog = showDialog;
    this.drug_desc = drug_desc;
    this.DrugId=id;
    this.price=drug_price;
    this.DrugName=drug_name;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                child: Consumer<cart>(
                    builder: (context, cart, child) {
                      return FloatingActionButton(
                          heroTag: '',
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10.0))),
                          child: Text(
                            "Add to list",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            int r = 0;



                            for (int y = 0; y < cart.drugs.length; y++) {
                        print("dd");
                        if (cart.drugs[y].Drug_id == this.DrugId) {
                          r = 1;

                          break;
                        }
                      }
                      if (r == 0) {
                        cart.add_drug(drug_item(
                            this.DrugId,this.price, this.DrugName));

                      }
                            print(cart.drugs.length);

                      print(this.price);
                          });

                    })),
              Container(
                width: 120,
                height: 30,
                child: FloatingActionButton(
                  heroTag: '',
                  backgroundColor: Colors.red,
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
                  onPressed: () { this.showDialog(drug_desc); },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

