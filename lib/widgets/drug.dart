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

class DrugRow extends StatelessWidget {
  /*
  final String drugDesc;
  final Function showDialog;
  final int drug.drugId;
  final int drug.drugPrice;
  final int quantity = 0;
  final String drug.drugName;
  */
  final Drug drug;
  final Function showDialog;

  const DrugRow({
    @required this.drug,
    @required this.showDialog,
  });

  /*
  const DrugRow({
    @required this.drug.drugId, 
    @required this.drug.drugName, 
    @required this.drug.drugPrice, 
    @required this.drugDesc,
    @required this.showDialog});
    */

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      //width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600], width: 0.3),
        //border: Border(
        //bottom: BorderSide(width: 10.0, color: Colors.red[200]),)
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onTap: () {
                int r = 0;

                for (int y = 0; y < cart.drugs.length; y++) {
                  print("dd");
                  if (cart.drugs[y].drugId == this.drug.drugId) {
                    r = 1;
                    break;
                  }
                }
                if (r == 0) {
                  cart.addDrug(DrugItem(this.drug.drugId, this.drug.drugPrice,
                      this.drug.drugName));
                }
                print(cart.drugs.length);

                print(this.drug.drugPrice);
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
                            "${drug.drugName}",
                            style: TextStyle(color: Colors.black),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            //maxLines: 2,
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
                            "${drug.drugPrice} EGP",
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
              this.showDialog(drug.drugDescription);
            },
          )
        ],
      ),
    );
  }
}
