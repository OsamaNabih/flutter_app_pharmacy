// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.message,
    this.drugsByCat,
  });

  String message;
  DrugsByCat drugsByCat;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    message: json["message"],
    drugsByCat: DrugsByCat.fromJson(json["drugs_by_cat"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "drugs_by_cat": drugsByCat.toJson(),
  };
}

class DrugsByCat {
  DrugsByCat({
    this.categoryDrugs,
  });

  List<CategoryDrug> categoryDrugs;

  factory DrugsByCat.fromJson(Map<String, dynamic> json) => DrugsByCat(
    categoryDrugs: List<CategoryDrug>.from(json["category_drugs"].map((x) => CategoryDrug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_drugs": List<dynamic>.from(categoryDrugs.map((x) => x.toJson())),
  };

  int getLength() {
    return this.categoryDrugs.length;
  }

  List<CategoryDrug> getCatDrugs() {
    return this.categoryDrugs;
  }
}

class Category {
  Category({
    this.categoryId,
    this.categoryName,
  });

  int categoryId;
  String categoryName;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };
}

class CategoryDrug {
  CategoryDrug({
    this.categoryId,
    this.categoryName,
    this.drugs,
  });

  int categoryId;
  String categoryName;
  List<Drug> drugs;

  factory CategoryDrug.fromJson(Map<String, dynamic> json) => CategoryDrug(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    drugs: List<Drug>.from(json["drugs"].map((x) => Drug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "drugs": List<dynamic>.from(drugs.map((x) => x.toJson())),
  };

  List<Drug> getDrugs() {
    return this.drugs;
  }
}

class Item{
  Item({this.drugs});
  List<Drug> drugs=[];

  factory Item.fromJson(Map<String, dynamic> json) => Item(


    drugs: List<Drug>.from(json["order"].map((x) => Drug.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {

    "order": List<dynamic>.from(drugs.map((x) => x.toJson())),
  };



}



class Drug {
  Drug({
    this.drugId,
    this.drugName,
    this.drugPrice,
    this.drugQuantity,
    this.drugDescription,
    this.drugCategoryId,
    this.drugTypeId,
    this.drugCompanyId,
  });

  int drugId;
  String drugName;
  int drugPrice;
  int drugQuantity;
  String drugDescription;
  int drugCategoryId;
  int drugTypeId;
  int drugCompanyId;

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
    drugId: json["drug_id"],
    drugName: json["drug_name"],
    drugPrice: json["drug_price"],
    drugQuantity: json["drug_quantity"] == null ? json["order_drug_quantity"] : json["drug_quantity"],
    drugDescription: json["drug_description"],
    drugCategoryId: json["drug_category_id"],
    drugTypeId: json["drug_type_id"],
    drugCompanyId: json["drug_company_id"],
  );

  Map<String, dynamic> toJson() => {
    "drug_id": drugId,
    "drug_name": drugName,
    "drug_price": drugPrice,
    "drug_quantity": drugQuantity,
    "drug_description": drugDescription,
    "drug_category_id": drugCategoryId,
    "drug_type_id": drugTypeId,
    "drug_company_id": drugCompanyId,
  };
}
