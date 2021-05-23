class All_orders{
  All_orders({this.orders});
  List<order_admin>orders=[];
  factory All_orders.fromJson(Map<String, dynamic> json) => All_orders(
    orders:List<order_admin>.from(json["orders"].map((x) => order_admin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
  int getlen(){
    return orders.length;
  }


}
class order_admin {
  order_admin({
    this. orderStatusId,
    this. orderId,
    this. orderDate,
    this. userId,
    this. orderNote ,
    this. orderStatusName,
  });
  int orderStatusId;
  int  orderId;
  String orderDate;
  int userId;
  String orderNote ;
  String orderStatusName;


  factory order_admin.fromJson(Map<String, dynamic> json) => order_admin(
    orderStatusId:json["order_status_id"],
    orderId:json["order_id"],
    orderDate:json["order_date"],
    userId :json["user_id"],
    orderNote:json["order_note"],
    orderStatusName:json["order_status_name"],
  );

  Map <String, dynamic> toJson() => {
    "order_status_id": orderStatusId,
    "order_id": orderId,
    "order_date": orderDate,
    "user_id": userId,
    "order_note": orderNote,
    "order_status_name": orderStatusName,

  };
}
