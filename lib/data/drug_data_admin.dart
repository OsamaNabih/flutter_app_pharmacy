class All_Drugs{
  All_Drugs({this.drugs});
  List<Drug>drugs=[];
  factory All_Drugs.fromJson(Map<String, dynamic> json) => All_Drugs(
    drugs:List<Drug>.from(json["drugs"].map((x) => Drug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drugs": List<dynamic>.from(drugs.map((x) => x.toJson())),
  };
  int getLen() {
    return drugs.length;
  }


}
class Drug {
  Drug({
    this.drugId,
    this.drugName,
    this.drugCompany,
    this.drugPrice,
    this.drugQuantity ,
    this.category,
    this.type,
  });
  int drugId;
  String drugName;
  String drugCompany;
  int drugPrice;
  int drugQuantity ;
  String category;
  String type;

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
    drugId:json["drug_id"],
    drugName:json["drug_name"],
    drugCompany:json["drug_company"],
    drugPrice:json["drug_price"],
    drugQuantity:json["drug_quantity"],
    category:json["category"],
    type:json["type"],
  );

  Map <String, dynamic> toJson() => {
    "drug_id": drugId,
    "drug_name": drugName,
    "drug_company": drugCompany,
    "drug_price": drugPrice,
    "drug_quantity": drugQuantity,
    "category": category,
    "type": type,
  };
}
