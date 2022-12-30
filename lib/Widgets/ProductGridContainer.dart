import 'package:flutter/material.dart';
import 'package:sparrow_shop/Models/Product.dart';
import 'package:sparrow_shop/Screens/ProductDetails.dart';

class ProductGridContainer extends StatelessWidget{

  Product product;
  ProductGridContainer({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(product:product)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment:Alignment.topLeft,
              child: Container(
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
                        Text((product.rating?.rate ??0).toStringAsFixed(2),style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                      ])
              ),
            ),
            Image.network(product.image!,height: 145,width:145,),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top:6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(product.title!,maxLines: 2,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w500),),
                   Padding(
                     padding: const EdgeInsets.only(top:2.0),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text('MRP ',style: Theme.of(context).textTheme.caption,),
                         Text((product.price??0).toStringAsFixed(2),style: Theme.of(context).textTheme.bodyText2,),
                       ],
                     ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}