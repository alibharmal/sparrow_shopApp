import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sparrow_shop/Providers/ProductProvider.dart';
import 'package:sparrow_shop/Respository/Firebase_AuthRepository.dart';
import 'package:sparrow_shop/Screens/Search.dart';
import 'package:sparrow_shop/Widgets/ProductGridContainer.dart';

class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = AuthService();
  ScrollController? scrollController;
  bool scrollToTop = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context,listen:false).fetchProducts();
    scrollController = ScrollController()..addListener((){
      if(scrollController!.position.extentBefore > MediaQuery.of(context).size.height*0.1){
        setState(() {
          scrollToTop = true;
        });
         }else{
        setState(() {
          scrollToTop = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{
          Provider.of<ProductProvider>(context,listen:false).fetchProducts();
        },
        child: SafeArea(
          child: Consumer<ProductProvider>(
            builder: (context,provider,child) {
              return CustomScrollView(
                controller: scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                        elevation: 0,
                        toolbarHeight: 60,
                        centerTitle: true,
                        leading: IconButton(icon: Icon(Icons.exit_to_app_rounded,color: Theme.of(context).primaryColor,size: 22,), onPressed: () { authService.logout(context); },),
                        title: Text("Sparrow",style: GoogleFonts.getFont("Italianno",fontSize: 28,color: Colors.black,fontWeight: FontWeight.w600,letterSpacing: 2),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: IconButton(
                              icon: const Icon(Icons.search_sharp,color: Colors.black,),iconSize: 24,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                              },),
                          ),
                        ],
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin:const EdgeInsets.symmetric(vertical: 12),
                        padding: const EdgeInsets.symmetric(horizontal:8),
                        color:Theme.of(context).backgroundColor ,
                        child: ListView.builder(
                            scrollDirection:Axis.horizontal,
                            itemCount: provider.categories.length,
                            itemBuilder:(BuildContext context,int index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ChoiceChip(
                              selectedColor: Theme.of(context).primaryColor,
                                label: Text(provider.categories[index],style: Theme.of(context).textTheme.button?.copyWith(color:  provider.selectedCategory == provider.categories[index]?Colors.white:Colors.black),),
                              onSelected: (value){
                                  Provider.of<ProductProvider>(context,listen: false).changeCategory(provider.categories[index]);
                            }, selected: provider.selectedCategory == provider.categories[index],),
                          );
                        }),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          itemCount: provider.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220,crossAxisSpacing: 12,mainAxisSpacing: 12,childAspectRatio: 1/1.5), itemBuilder: (BuildContext context, int index) {
                         return ProductGridContainer(product: provider.products[index],);
                        },),
                      ),
                    ),
                ]);
            }
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeOutCirc,
        child: scrollToTop?FloatingActionButton(
          child: const Icon(Icons.arrow_upward_sharp,size: 18,color: Colors.black,),
            mini:true,
          backgroundColor: Colors.white,
          shape:  CircleBorder(side: BorderSide(color: Theme.of(context).primaryColor)),
          onPressed: () {
            scrollController?.animateTo(0, duration: const Duration(milliseconds: 250), curve: Curves.easeInBack);
          },

    ):Container(),
      ),
    );
  }
}
