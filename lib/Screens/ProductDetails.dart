import 'package:flutter/material.dart';
import 'package:sparrow_shop/Models/Product.dart';

class ProductDetails extends StatelessWidget{

  Product product;
  ProductDetails({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_sharp,size: 24,color:  Theme.of(context).primaryColor,),
    onPressed: (){
    Navigator.pop(context);
    },),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(product.image!,height: 270,width:270,),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top:6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(product.title!,style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w500),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('MRP ',style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w700),),
                              Text((product.price??0).toStringAsFixed(2),style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w600),),
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.only(bottom:4),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              width: 60,
                              height: 20,
                              child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:[
                                    const Icon(Icons.star_border,size: 16,),
                                    Text((product.rating?.rate ??0).toStringAsFixed(2),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)
                                  ])
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Text(product.category!,style: Theme.of(context).textTheme.subtitle2?.copyWith(fontWeight: FontWeight.w600),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(product.description!,style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}