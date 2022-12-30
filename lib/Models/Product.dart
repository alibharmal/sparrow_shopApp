
List<Product> productList(List<dynamic> list)=> List<Product>.from(list.map((x) => Product.fromJson(x)));

class Product{
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json){
    Product data = Product();
    data.id = json['id'];
    data.title = json['title'];
    data.price = double.parse((json['price']??0).toString());
    data.description = json['description'];
    data.category = json['category'];
    data.image = json['image'];
    data.rating = Rating.fromJson(json['rating']);
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count
  });

  factory Rating.fromJson(Map<String, dynamic> json){
    Rating data = Rating();
    data.rate = double.parse((json['rate']??0).toString());
    data.count = json['count'];
    return data;
  }
}