class productModel {
  String? sId;
  String? title;
  String? description;
  String? category;
  String? brand;
  String? expDate;
  String? mfdDate;
  String? size;
  double? price;
  String? stock;
  List<String>? images;

  productModel(
      {this.sId,
      this.title,
      this.description,
      this.category,
      this.brand,
      this.expDate,
      this.mfdDate,
      this.size,
      this.price,
      this.stock,
      this.images});

  productModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    brand = json['brand'];
    expDate = json['expDate'];
    mfdDate = json['mfdDate'];
    size = json['size'];
    price = json['price'];
    stock = json['stock'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['expDate'] = this.expDate;
    data['mfdDate'] = this.mfdDate;
    data['size'] = this.size;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['images'] = this.images;
    return data;
  }
}
