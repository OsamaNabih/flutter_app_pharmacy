import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/data/cart.dart';
import 'package:flutter_app_pharmacy/data/drug_item.dart';
import 'package:path/path.dart';
import 'package:flutter_app_pharmacy/widgets/drug.dart';
Widget drugTemplate(String name,String price, Function showDialog){
  Text txt_name=Text("Name :${name}" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),);
  Text txt_price=Text("Price :$price" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),);

  return Card(
    color: Colors.amber,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ListTile(
          leading:
             CircleAvatar(
                //child: Image.asset('images/image1.jpg'),
                radius: 30,
             ),
          title: txt_name ,
          subtitle: txt_price,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              width: 120,
              height: 30,
              child: FloatingActionButton(
                  heroTag: '',
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    "Add to list",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    int r=0;
                    cart p;
                    for(int y=0 ; y<p.drugs.length; y++){
                      print("dd");
                      if(p.drugs[y].item_name== txt_name.data){
                        r=1;
                        p.remove_drug(p.drugs[y]);
                        p.add_drug(item_drug(txt_name.data, p.drugs[y].quantity+1));
                        print(p.drugs.length);
                        break;
                      }
                    }
                    if(r==0){
                      p.add_drug(item_drug(txt_name.data, 1));
                      print(item_drug(txt_name.data, 1));
                      print(p.drugs);
                    }
                  }
              ),
            ),
            Container(
              width: 120,
              height: 30,
              child: FloatingActionButton(
                  heroTag: '',
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    "drug description",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog();
                  }
              ),
            ),

          ],
        ),

      ],
    ),
  );
}
