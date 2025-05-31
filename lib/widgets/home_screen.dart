import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savekartweb/domain/banner_entity.dart';
import 'package:savekartweb/domain/category_list_entity.dart';
import 'package:savekartweb/widgets/SettingsPage.dart';
import 'package:savekartweb/widgets/cart_screen.dart';
import 'package:savekartweb/widgets/product_details.dart';
import 'package:http/http.dart' as http;
import 'package:savekartweb/widgets/slider_widget.dart';
import '../design/ResponsiveInfo.dart';
import '../domain/product_with_category_entity.dart';
import '../domain/wallet_balance_entity.dart';
import '../web/AppStorage.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int walletpoints=0;
  double walletbalance=0;

  String cartcount="2";

  final List<String> getToKnowUs = [
    "Privacy Policy",
    "Return and Exchange Policy",
    "Shipping and Cancellation policy",
    "Terms and Conditions",

  ];

  final List<String> connectWithUs = ["Century Gate Software Solutions Pvt Ltd\n Cosmopolitan Road,\n Aswini Junction,\n Thrissur, Kerala – 680020", " 04872 322006, +91 9846290789 ,+91 9778078739", ];




  final List<String> helpYou = [
    "Facebook",
    "Twitter",
    "Linked in",
    "Instagram",

  ];
  List<CategoryListData>? categorylistdata = [];
  List<ProductWithCategoryData>? productbycategorydata = [];
  List<BannerData> bannerdata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBanners();
    getCategories();
    getWalletPoints();
    getWalletBalanceAndPoints();
    getProductWithSubcategory();
    getCartCount();
  }

  getCartCount()async {
    // ResponsiveInfo.ShowProgressDialog(context);
    ApiHelper apihelper = new ApiHelper();
    String? userid=await AppStorage.getString(AppStorage.id);
    var t=ApiHelper.getTimeStamp();

    var response= await  apihelper.get(Apimethodes.getCartDataCount+"?q="+t.toString()+"&userid="+userid.toString());

    var js= jsonDecode( response) ;

    if(js['status']==1)
    {

      String c=js['data'].toString();

      setState(() {
        cartcount=c;

      });

    }

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    print(screenWidth);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xfff7f7f7),

        forceMaterialTransparency: true,
        title:Align(
          alignment: FractionalOffset.centerLeft,
          child: Image.asset("assets/appbaricon.jpeg",width: MediaQuery.of(context).size.width/6,height: (MediaQuery.of(context).size.width/6)/2,fit: BoxFit.fill,),

        ) ,
        centerTitle: false,


        actions: [

          (screenWidth > 600 )? Container(
            width:  MediaQuery.of(context).size.width/4  ,
            height: 60,
            child: Padding(padding: EdgeInsets.all(10),

              child:


              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search), // 👈 Search icon at the start
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                onChanged: (value) {
                  // Add your search filter logic here
                  print('Search query: $value');
                },
              )
              ,

            ),
          ) : IconButton(onPressed: () async {


        // final result = await Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ProductSearchScreen()),
        // );
        //
        // if (result != null||result==null) {
        //
        //   // getCartCount();
        //   // getWalletPoints();
        //   // getWalletBalanceAndPoints();
        //
        // }

      }, icon: Icon(Icons.search,color: Color(0xff0B7D97),)),



          IconButton(onPressed: ()  {


            final result =  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
            //
            // if (result != null||result==null) {
            //
            //   // getCartCount();
            //   // getWalletPoints();
            //   // getWalletBalanceAndPoints();
            //
            // }

          }, icon: Icon(Icons.person_outline_rounded,color: Color(0xff0B7D97),)),


          Stack(
            children: [

              Align(
                alignment: FractionalOffset.center,
                child:GestureDetector(

                  child: Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?10:15),

                    child: Icon(Icons.shopping_cart,color: Color(0xff0B7D97),size: ResponsiveInfo.isMobile(context)?20:25,),

                  ),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                    // final result = await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CartScreen()),
                    // );
                    //
                    // if (result != null||result==null) {
                    //
                    //   getCartCount();
                    //   getWalletPoints();
                    //   getWalletBalanceAndPoints();
                    //
                    // }
                  },
                ) ,
              ),
              (cartcount.compareTo("0")!=0)?  Align(alignment: FractionalOffset.topCenter,

                  child: GestureDetector(

                    child:

                    Padding(padding: EdgeInsets.fromLTRB(ResponsiveInfo.isMobile(context)?10:15,ResponsiveInfo.isMobile(context)?5:6,0,0),

                      child:CircleAvatar(
                        radius: ResponsiveInfo.isMobile(context)?8:10,
                        backgroundColor: Colors.red,
                        child: Text(cartcount,style: TextStyle(color: Colors.white,fontSize: ResponsiveInfo.isMobile(context)?12:14),),
                      )


                      ,) ,

                    onTap: () async {




                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                      //
                      // if (result != null||result==null) {
                      //
                      //   getCartCount();
                      //   getWalletPoints();
                      //   getWalletBalanceAndPoints();
                      //
                      // }



                    },

                  )

              ) : Container(),
            ],

          )



        ],

      ),
      drawer:     (screenWidth<700)? Drawer(
        child: getMenuWidget(),
      ):null,
      body: Row(
        children: [
        // Sidebar
          (screenWidth>700)?    getMenuWidget() :

Container(),

    // Main Content
    Expanded(
    child: SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBar(),
          (bannerdata.length>0)? Slidbar(bannerdata) : Container(
            width: double.infinity,
            height: ResponsiveInfo.isMobile(context)?150:200,
            child: Center(

              child: CircularProgressIndicator(),
            ),

          ),

          ListView.builder(
              itemCount: productbycategorydata?.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return _buildProductSection(productbycategorydata![index]);
              }),

          (screenWidth<700)
              ?  Container(
            height:screenWidth/0.8 ,
            width: screenWidth,

            color: const Color(0xFF232F3E),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildColumn("Quick Links", getToKnowUs),
                const SizedBox(height: 20),
                buildColumn("Connect with Us", connectWithUs),

                const SizedBox(height: 20),
                buildColumn("Follow us", helpYou),
              ],
            ) )
                :  Container(

         color: const Color(0xFF232F3E),
         padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
         child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildColumn("Quick Links", getToKnowUs),
                buildColumn("Connect with Us", connectWithUs),

                buildColumn("Follow us", helpYou),
              ],
            ),
          )


        ],
      ),
    )



    ),
    ],
    ),
    );
  }

  Widget buildColumn(String heading, List<String> items) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            heading,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          ...items.map(
                (item) {



                  return GestureDetector(

                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ) ,

                    onTap: (){
                      if(heading.compareTo("Quick Links")==0)
                      {

                      //   "Privacy Policy",
                      // "Return and Exchange Policy",
                      // "Shipping and Cancellation policy",
                      // "Terms and Conditions",

                      }
                    },
                  )


                    ;


                  },
          ),
        ],
      ),
    );
  }

  Widget getMenuWidget()
  {
    return Container(
      width: 200,
      color:  Color(0xFFD6EDF3),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),height: 60,)
             ,

        Expanded (child:  (categorylistdata!.length>0)?  ListView.builder(
            itemCount: categorylistdata!.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {

              List<CategoryListDataSubCategory>str=categorylistdata![index].subCategory!;



              return _buildCategory(categorylistdata![index].category!.categoryName!, subCategories: str);
            }) : Container(),)



          ],
        ),




    );
  }

  Widget _buildCategory(String title, {List<CategoryListDataSubCategory>? subCategories}) {
//List<CategoryListDataSubCategory>str=categorylistdata![index].subCategory!;

   return Card(
     child:ExpansionTile(
       title: Text(title),
       backgroundColor: Colors.grey[100], // Background color when expanded
       collapsedBackgroundColor: Colors.transparent, // Background color when collapsed
       children: subCategories?.map(
             (sub) => ListTile(
           title: Text(sub.subCategoryName!),
         ),
       ).toList() ?? [],
     ) ,

     elevation: 5,
   ) ;

  }

  getBanners()async{
    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    var response= await  apihelper.get(Apimethodes.getBanners+"?q="+t.toString());

    var js= jsonDecode(response) ;

    BannerEntity entity=BannerEntity.fromJson(js);

    if(entity.status==1)
      {
        setState(() {
          bannerdata.clear();
          bannerdata.addAll(entity.data!);
        });
      }



  }

  Widget _buildTopBar() {



    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.white,
      child:           (MediaQuery.of(context).size.width > 700 )? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child:  Row(children:  [
            Icon(Icons.account_balance_wallet_outlined),
            SizedBox(width: 8),
            Text('SaveKart Wallet : '+     walletpoints.toString()
            )
          ]),flex: 1,)

         ,
          Expanded(child:  Row(children:  [
            Icon(Icons.star,color: Colors.yellow,),
            SizedBox(width: 8),
            Text('Purchase Points : '+walletbalance.toString())
          ]),flex: 1,)
        ],
      ) :  Container(

        child: Column(
          children: [
            Text('SaveKart Wallet : '+walletbalance.toString()),
            Text('Purchase Points : '+walletpoints.toString())
          ],
        ),
        height: 70,

      )
    );
  }



  Widget _buildProductSection(ProductWithCategoryData productWithCategoryData) {


    List<List<ProductWithCategoryDataData>> chunkedList = [];
    int chunkSize = (MediaQuery.of(context).size.width>1500)? 6:4;

    if(productWithCategoryData!.data!.length>chunkSize) {
      for (int i = 0; i < productWithCategoryData!.data!.length; i += chunkSize) {
        int end = (i + chunkSize < productWithCategoryData!.data!.length) ? i + chunkSize : productWithCategoryData!.data!
            .length;
        chunkedList.add(productWithCategoryData!.data!.sublist(i, end));
      }
    }


    double screenwidth= (MediaQuery.of(context).size.width>1500)? ((MediaQuery.of(context).size.width/0.95)/ chunkSize) : (MediaQuery.of(context).size.width<1500&&MediaQuery.of(context).size.width>700)? ((MediaQuery.of(context).size.width/0.7)/chunkSize): ((MediaQuery.of(context).size.width/0.5)/chunkSize);


    print(chunkedList.length);


    return
      SizedBox(
          height: (chunkedList.length>0)? ((chunkedList.length)* screenwidth)-25 : screenwidth,
        // Set height to show cards properly
          child:Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(productWithCategoryData!.category!.categoryName!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          SizedBox(height: 6,),




          GridView.builder(
                itemCount: productWithCategoryData!.data!.length,

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Disable internal scroll if nested
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: chunkSize, // 2 on mobile, 3 on larger screens
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio:MediaQuery.of(context).size.width<700 ?0.6 :(MediaQuery.of(context).size.width>700 && MediaQuery.of(context).size.width<1500  )?0.65   : 1.1, // Adjust for card shape
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      // Handle onTap

                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) =>
                                  ProductDetailPage(productWithCategoryData!.data![index])
                          )
                      );
                    },
                    child: Card(
                        elevation: ResponsiveInfo.isMobile(context) ? 5 : 8,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: ResponsiveInfo.isMobile(context) ? 90 : 110,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: FractionalOffset.center,
                                      child:GestureDetector(

                                        onTap: (){

                                          Navigator.push(context,
                                              MaterialPageRoute(builder:
                                                  (context) =>
                                                  ProductDetailPage(productWithCategoryData!.data![index])
                                              )
                                          );

                                        },

                                        child: Image.network(
                                          ApiHelper.productimageurl + productWithCategoryData!.data![index].primeImage.toString(),
                                          width: ResponsiveInfo.isMobile(context) ? 90 : 110,
                                          height: ResponsiveInfo.isMobile(context) ? 90 : 110,
                                          fit: BoxFit.fill,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return Center(child: CircularProgressIndicator());
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.image, size: 50, color: Colors.black26);
                                          },
                                        ),
                                      )




                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                productWithCategoryData.data![index].productName.toString(),
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: ResponsiveInfo.isMobile(context) ? 13 : 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                  );
                },
              )







        ],
      ),
    ) );
  }



  getProductWithSubcategory()async {

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    var response= await  apihelper.get(Apimethodes.getProductWithCategories+"?q="+t.toString());
    print(response);

    var js= jsonDecode(response) ;

    ProductWithCategoryEntity brandEntity=ProductWithCategoryEntity.fromJson(js);

    if(brandEntity.data!.length>0)
    {
      setState(() {
        productbycategorydata!.clear();
        productbycategorydata!.addAll(brandEntity.data!);

      });
    }
  }

  getCategories()async
  {
    ApiHelper apihelper = new ApiHelper();

    String? userid=await AppStorage.getString(AppStorage.id);

    var response = await
    apihelper.get(
        Apimethodes.getCategoriesList + "?q=" + ApiHelper.getTimeStamp()+"&userid=");

    var js = jsonDecode(response);
    CategoryListEntity categoryListEntity = CategoryListEntity.fromJson(js);

    if (categoryListEntity.status == 1)
  {
    setState(() {
      categorylistdata!.addAll(categoryListEntity.data!);
    });

  }




  }


  getWalletBalanceAndPoints()
  async {
    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    String? userid=await AppStorage.getString(AppStorage.id);

    var response= await  apihelper.get(Apimethodes.calculateWalletBallence+"?q="+t.toString()+"&userid="+userid.toString());

    var js= jsonDecode( response) ;
    print(js);

    WalletBalanceEntity entity=WalletBalanceEntity.fromJson(js);

    if(entity!=null)
    {

      setState(() {

        walletbalance=double.parse(entity.data!.balance.toString());
      });


    }



  }

  getWalletPoints()
  async {
    ApiHelper apihelper = new ApiHelper();
    String? userid=await AppStorage.getString(AppStorage.id);
    var t=ApiHelper.getTimeStamp();
    var response1= await  apihelper.get(Apimethodes.getWalletPoints+"?q="+t.toString()+"&userid="+userid.toString());
    var js1= jsonDecode( response1) ;
    setState(()  {
      walletpoints=int.parse(js1['data'].toString());

      AppStorage.setString(AppStorage.walletpoint, walletpoints.toString());
      // String? currentWalletPoints=await AppStorage.getString(AppStorage.current_wallet_point);


      AppStorage.setString(
          AppStorage.current_wallet_point, walletpoints.toString());

    });



  }


}
