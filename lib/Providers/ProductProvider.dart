
import 'package:flutter/material.dart';
import 'package:sparrow_shop/Models/Product.dart';
import 'package:sparrow_shop/Respository/ProductRepository.dart';

class ProductProvider extends ChangeNotifier{
  List<Product>_products = [];
  List<Product> _displayProducts = [];
  List<Product> _searchedProduct =[];
  List<String> _categories = [];
  String _selectedCategory='All';

  List<Product> get products => _displayProducts;
  List<String> get categories => _categories;
  List<Product> get searchedProduct => _searchedProduct;
  String get selectedCategory => _selectedCategory;
  ProductRepository productRepository = ProductRepository();

  fetchProducts(){
    _products =[];
    _displayProducts =[];
    _categories = [];
    _searchedProduct = [];
    _selectedCategory = "All";
    productRepository.fetchProducts().then((value){
     _products = value;
     _displayProducts = _products;
     _categories.add("All");
     _categories.addAll(List<String>.from(Set.from(_products.map((e) => e.category))));
     notifyListeners();
    }).catchError((onError){
      
    });
  }

  changeCategory(String category){
    _selectedCategory = category;
    if(category == "All"){
      _displayProducts = _products;
    }
    else {
      _displayProducts =
          _products.where((element) => element.category == category).toList();
    }
    notifyListeners();
  }

  searchProduct(String value){
    Set products ={};
    products.addAll(Set<Product>.from(_products.where((e) => e.title!.toLowerCase().replaceAll(RegExp("[^A-Za-z0-9 ]"),'').contains(value.toLowerCase()))));
    products.addAll(Set<Product>.from(_products.where((e) => e.category!.toLowerCase().replaceAll(RegExp("[^A-Za-z0-9 ]"),'').contains(value.toLowerCase()))));
    _searchedProduct =  List<Product>.from(products);
    notifyListeners();
  }

  void emptySearchProducts() {
    _searchedProduct = [];
    notifyListeners();
  }
}