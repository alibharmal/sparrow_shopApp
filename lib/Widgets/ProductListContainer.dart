import 'package:flutter/material.dart';
import 'package:sparrow_shop/Models/Product.dart';
import 'package:sparrow_shop/Screens/ProductDetails.dart';

class ProductListContainer extends StatelessWidget{
  Product product;
  ProductListContainer({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(product:product)));
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
          ),
          width: MediaQuery.of(context).size.width - 32,
          margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          padding: const EdgeInsets.all(12),
          child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Image.network("${product.image}",height: 65,width: 65,),
                Container(
                  height: 65,
                  padding: const EdgeInsets.only(top:6,left: 8,bottom: 4),
                  width: MediaQuery.of(context).size.width - 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.title}",maxLines: 2,),
                      Padding(
                        padding: const EdgeInsets.only(top:2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${product.category}",style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w600)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('MRP ',style: Theme.of(context).textTheme.caption,),
                                Text((product.price??0).toStringAsFixed(2),style: Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],),
                )
              ])
      ),
    );
  }

}