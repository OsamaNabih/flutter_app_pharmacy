class All_Drugs{
  All_Drugs({this.drugs});
  List<drug>drugs=[];
  factory All_Drugs.fromJson(Map<String, dynamic> json) => All_Drugs(
    drugs:List<drug>.from(json["drugs"].map((x) => drug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drugs": List<dynamic>.from(drugs.map((x) => x.toJson())),
  };
  int getLen() {
    return drugs.length;
  }


}
class drug {
  drug({
    this.drugId,
    this.drugName,
    this.drugCompanyName,
    this.drugPrice,
    this.drugQuantity ,
    this.categoryName,
    this.typeName,
  });
  int drugId;
  String drugName;
  String drugCompanyName;
  int drugPrice;
  int drugQuantity ;
  String categoryName;
  String typeName;

  factory drug.fromJson(Map<String, dynamic> json) => drug(
    drugId:json["drug_id"],
    drugName:json["drug_name"],
    drugCompanyName:json["drug_company_name"],
    drugPrice:json["drug_price"],
    drugQuantity:json["drug_quantity"],
    categoryName:json["category_name"],
    typeName:json["type_name"],
  );

  Map <String, dynamic> toJson() => {
    "drug_id": drugId,
    "drug_name": drugName,
    "drug_company_name": drugCompanyName,
    "drug_price": drugPrice,
    "drug_quantity": drugQuantity,
    "category_name": categoryName,
    "type_name": typeName,
  };
}
