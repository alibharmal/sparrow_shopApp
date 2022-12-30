
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparrow_shop/Providers/ProductProvider.dart';
import 'package:sparrow_shop/Widgets/ProductListContainer.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  bool scrollToTop = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,size: 24,color:  Theme.of(context).primaryColor,),
          onPressed: (){
            Provider.of<ProductProvider>(context, listen: false).emptySearchProducts();
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        elevation: 0,
        title:  Padding(
          padding: const EdgeInsets.only(right: 12,top:4,bottom: 4),
          child: TextField(
            autofocus: true,
            cursorColor: Theme.of(context).primaryColor,
            cursorWidth: 1,
            style: Theme.of(context).textTheme.subtitle1,
            controller: textEditingController,
            expands: false,
            decoration: const InputDecoration(
              isDense: false,
              filled: true,
              fillColor: Colors.white,
              hintText: "Search",
              contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Colors.white,width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Colors.white,width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(color: Colors.white,width: 1),
              ),
            ),
            onChanged: (value){
              if(value.isNotEmpty) {
                Provider.of<ProductProvider>(context, listen: false).searchProduct(value);
              }
              else {
                Provider.of<ProductProvider>(context, listen: false).emptySearchProducts();
              }
              },
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<ProductProvider>(
            builder: (context,provider,child) {
              return ListView.builder(
                  itemCount: provider.searchedProduct.length,
                  itemBuilder: (context, index){
                   return  ProductListContainer(product:provider.searchedProduct[index]);

            });
            }
        ),
      ),
    );
  }
}
