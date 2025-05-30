import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:savekartweb/widgets/zoomimage.dart';

import '../design/ResponsiveInfo.dart';
import '../domain/cart_data_exist_entity.dart';
import '../domain/check_wish_list_entity.dart';
import '../domain/product_count_entity.dart';
import '../domain/product_stock_entity.dart';
import '../domain/product_with_category_entity.dart';
import '../domain/return_policy_entity.dart';
import '../domain/wallet_balance_entity.dart';
import '../web/AppStorage.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';
import 'SettingsPage.dart';
import 'cart_screen.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ProductDetailPage extends StatefulWidget {


  ProductWithCategoryDataData productWithCategoryDataData;
  ProductDetailPage(this.productWithCategoryDataData);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState(this.productWithCategoryDataData);
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  ProductWithCategoryDataData productByCategoryDataData;
  List<ProductWithCategoryDataData>pcdata=[];

  int selectedImageIndex = 0;
  int count=0;

  int walletpoints=0;
  double walletbalance=0;
  int selectedindex=0;

  String description = "",price_details="",returnpolicies="No Data Found",      product_stockid = "0",cartcount="0";


  String selectedSize = 'XXL';



  late ProductStockEntity  productStockEntity;
  bool ispointredeemeed=false;

  List<String>images=[];
  List<Widget>Adsimages=[];

 String  wishlist_id="0";

 bool iswishlist=false;
 int AdsCurrentIndex=0;


  _ProductDetailPageState(this.productByCategoryDataData);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductCount();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

leading:GestureDetector(

  child:Padding(

    padding: EdgeInsets.all(10),
    child: Icon(Icons.arrow_back,color: Colors.black54,),
  ) ,
  onTap: (){

    Navigator.pop(context);

  },
)


,



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
      body:  Padding(
    padding: const EdgeInsets.only(left: 24.0),
    child: SingleChildScrollView(

    child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Header (can be replaced with a custom AppBar)

    SizedBox(height: 12),

    // Product section
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Main Image
    Expanded(
    flex: 3,
    child: Column(
    children: [
    Padding(
    padding: EdgeInsets.all(ResponsiveInfo.isMobile(context) ? 10 : 15),

    child: Column(
    children: [

    Stack(
    children: [

    Align(
    alignment: FractionalOffset.topRight,
    child: GestureDetector(

    child: (!iswishlist) ? Padding(padding: EdgeInsets
        .all(5),
    child: Icon(
    Icons.favorite_border, color: Colors.black,
    size: ResponsiveInfo.isMobile(context)
    ? 20
        : 25,),
    ) : Padding(padding: EdgeInsets.all(5),
    child: Icon(Icons.favorite, color: Colors.redAccent,
    size: ResponsiveInfo.isMobile(context)
    ? 20
        : 25,),
    ),
    onTap: () {
    if (!iswishlist) {
    addProductToWishlist();
    }
    else {
    deleteProductFromWishlist();
    }
    },
    )


    )
    ],
    ),
    CarouselSlider(options: CarouselOptions(
    autoPlayCurve: Curves.fastOutSlowIn,
    autoPlayAnimationDuration: Duration(microseconds: 800),
    autoPlayInterval: Duration(seconds: 2),
    autoPlay: true,
    height: MediaQuery.of(context).size.height/4,
    enlargeCenterPage: true,
    aspectRatio: 2.6,
    onPageChanged: (index, reason) {
    setState(() {
    AdsCurrentIndex = index;
    });
    },
    ),
    items: Adsimages,
    ),
    Padding(padding: EdgeInsets.all(5),

    child: AnimatedSmoothIndicator(activeIndex: AdsCurrentIndex,
    count: Adsimages.length,
    effect:
    WormEffect(
    dotWidth: 12,
    dotHeight: 12,
    dotColor: Colors.grey,
    // spacing: 2,
    activeDotColor: Colors.black,
    paintStyle: PaintingStyle.fill
    ),
    ),
    ),





    ],
    ),
    ),
    SizedBox(height: 8),

    ],
    ),
    ),
    SizedBox(width: 32),

    // Product Details
    Expanded(
    flex: 4,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(''+productByCategoryDataData.productName.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    SizedBox(height: 8),
    Text(price_details),

    SizedBox(height: 16),

    // Size Buttons
    (screenWidth>700)?  Row(
    children: pcdata.map((size) {
    bool isSelected = selectedSize == size.size.toString();
    return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: isSelected ? Colors.teal : Colors.white,
    foregroundColor: isSelected ? Colors.white : Colors.black,
    side: BorderSide(color: Colors.teal),
    ),
    onPressed: () {
    setState(() {
    selectedSize = size.size.toString();
    productByCategoryDataData=size;
    setupProductImages();
    getReturnPolicies(productByCategoryDataData.id.toString());
    getProductStock();
    getCartCount();

    });
    },
    child: Text(size.size.toString()),
    ),
    );
    }).toList(),
    ) :
    Column(
    children: pcdata.map((size) {
    bool isSelected = selectedSize == size.size.toString();
    return Padding(
    padding: const EdgeInsets.all( 8.0),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: isSelected ? Colors.teal : Colors.white,
    foregroundColor: isSelected ? Colors.white : Colors.black,
    side: BorderSide(color: Colors.teal),
    ),
    onPressed: () {
    setState(() {
    selectedSize = size.size.toString();
    productByCategoryDataData=size;
    setupProductImages();
    getReturnPolicies(productByCategoryDataData.id.toString());
    getProductStock();
    getCartCount();
    });
    },
    child: Text(size.size.toString()),
    ),
    );
    }).toList(),
    ),

    SizedBox(height: 16),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    ),
    onPressed: () {},
    child: Text('Add to Cart'),
    ),
    ],
    ),
    )
    ],
    ),

    SizedBox(height: 32),

    // Features Section
    Text('Features', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    SizedBox(height: 8),
    Text(
    description,
    style: TextStyle(fontSize: 14),
    ),
    SizedBox(height: 8,),
    Text('Return Policy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    SizedBox(height: 8),
    Text(returnpolicies,  style: TextStyle(fontSize: 14),)
    ],
    ),
    )



    ),





    );
  }
  getProductCount()async{
    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();

    var response = await apihelper.get(
        Apimethodes.getProductCountByName + "?id=" +
            productByCategoryDataData.id.toString()+"&name="+productByCategoryDataData.productName.toString() + "&q=" + t.toString());

    var js =         jsonDecode(response);
    ProductCountEntity entity=ProductCountEntity.fromJson(js);

    if(entity.status==1)
    {

      if(entity.data!.length>0)
      {

        setState(() {
          count=entity.data!.length;
          if(count==1)
          {
            setupProductImages();
            getReturnPolicies(productByCategoryDataData.id.toString());
            getProductStock();
            getCartCount();
          }
          else if(count>1)
          {
            for(int i=0;i<entity.data!.length;i++)
            {
              ProductCountData pb=entity.data![i];
              ProductWithCategoryDataData pbc=new ProductWithCategoryDataData();
              pbc.id=pb.id;
              pbc.primeImage=pb.primeImage;
              pbc.productName=pb.productName;
              pbc.status=pb.status;
              pbc.productSpec=pb.productSpec;
              pbc.productDescription=pb.productDescription;
              pbc.sideImage4=pb.sideImage4;
              pbc.sideImage3=pb.sideImage3;
              pbc.sideImage2=pb.sideImage2;
              pbc.sideImage1=pb.sideImage1;
              pbc.categoryId=pb.categoryId;
              pbc.color=pb.color;
              pbc.colorEnabled=pb.colorEnabled;
              pbc.size=pb.size;
              pbc.sizeEnabled=pb.sizeEnabled;
              pbc.subCategoryId=pb.subCategoryId;
              pbc.unitId=pb.unitId;
              pbc.vendorId=pb.vendorId;
              pbc.returnDays=pb.returnDays;
              pbc.productCode=pb.productCode;
              pcdata.add(pbc);
            }

            productByCategoryDataData=pcdata[0];
            setupProductImages();
            getReturnPolicies(productByCategoryDataData.id.toString());
            getProductStock();
            getCartCount();

          }


        });

      }

    }
    else{

      setState(() {

        if(entity.message.toString().contains("values less than one")) {
          count = 1;
          setupProductImages();
          getReturnPolicies(productByCategoryDataData.id.toString());
          getProductStock();
          getCartCount();
        }
      });


    }



    print(js);
  }


  getProductStock() async {

    setState(() {
      productStockEntity=new ProductStockEntity();
    });


    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();

    var response = await apihelper.get(
        Apimethodes.getProductStock + "?product_id=" +
            productByCategoryDataData.id.toString() + "&q=" + t.toString());

    var js = jsonDecode(response);

    productStockEntity = ProductStockEntity.fromJson(js);
    getProductExistsinWishlist();
    if (productStockEntity.data!=null&&productStockEntity.data!.currentQty.toString().compareTo("0") != 0) {
      product_stockid = productStockEntity.data!.id.toString();
      setState(() {
        price_details="";
        description="";
        if(productStockEntity.status==1&&productStockEntity.data!=null&&productStockEntity.data!.id!.isNotEmpty)
        {
          if (productStockEntity.status.toString().compareTo("0") != 0) {


            if (productStockEntity.data!.mrp != null && productStockEntity.data!
                .mrp
                .toString()
                .isNotEmpty) {
              price_details = "\n" + price_details +
                  "Product Code : " + productByCategoryDataData.productCode.toString() + "\n\n";
            }

            if (productStockEntity.data!.mrp != null && productStockEntity.data!
                .mrp
                .toString()
                .isNotEmpty) {
              price_details = "\n" + price_details +
                  "MRP : " + productStockEntity.data!.mrp.toString() + "\n\n";
            }
            if (productStockEntity.data!.savecartPrice != null &&
                productStockEntity.data!
                    .savecartPrice
                    .toString()
                    .isNotEmpty) {
              price_details = price_details +
                  "Save Kart Price : " +
                  productStockEntity.data!.savecartPrice.toString() + "\n\n";
            }

            if (productStockEntity.data!.ppRedemption != null &&
                productStockEntity.data!
                    .ppRedemption
                    .toString()
                    .isNotEmpty) {
              price_details = price_details +
                  "PP Redeem  : " +
                  productStockEntity.data!.ppRedemption.toString() + "\n\n";
            }
            if (productStockEntity.data!.priceSales != null &&
                productStockEntity.data!
                    .priceSales
                    .toString()
                    .isNotEmpty) {
              price_details = price_details + "Your Price : " +
                  productStockEntity.data!.priceSales.toString() + " (GST included)\n\n";
            }
            // if(productStockEntity.data!.margin!=null && productStockEntity.data!.margin.toString().isNotEmpty)
            // {
            //   description = description +
            //       "SV : "+productStockEntity.data!.margin.toString()+"\n";
            //
            // }

            if (productStockEntity.data!.savecartPrice != null &&
                productStockEntity.data!
                    .savecartPrice
                    .toString()
                    .isNotEmpty) {
              if (productStockEntity.data!.mrp != null &&
                  productStockEntity.data!
                      .mrp
                      .toString()
                      .isNotEmpty) {
                double mrp = double.parse(
                    productStockEntity.data!.mrp.toString());
                double savecartprice = double.parse(
                    productStockEntity.data!.priceSales.toString());
                double savedprice = mrp - savecartprice;
                price_details = price_details +
                    "You saved : " + savedprice.toString() + "  \n";
              }
            }
            else {
              price_details = price_details +
                  "You saved : 0.0  \n";
            }


            price_details = price_details +"\nFree Delivery\n";
          }


          if (productByCategoryDataData.sizeEnabled.toString().compareTo("1") !=
              0 && productByCategoryDataData.size != null &&
              productByCategoryDataData.size
                  .toString()
                  .isNotEmpty) {
            description = "\n" + description +
                "Size : " + productByCategoryDataData.size.toString() + " \n";
          }

          if (productByCategoryDataData.colorEnabled.toString().compareTo(
              "1") != 0 && productByCategoryDataData.color != null &&
              productByCategoryDataData.color
                  .toString()
                  .isNotEmpty) {
            description = description +
                "Colour : " + productByCategoryDataData.color.toString() +
                " \n\n";
          }

          if (productByCategoryDataData.productDescription != null &&
              productByCategoryDataData.productDescription
                  .toString()
                  .isNotEmpty) {
            description = description +
                productByCategoryDataData.productDescription.toString();
          }

          if (productByCategoryDataData.productSpec != null &&
              productByCategoryDataData.productSpec
                  .toString()
                  .isNotEmpty) {
            description = description + "\n\n Specifications : \n\n" +
                productByCategoryDataData.productSpec.toString();
          }
        }
        else{
          price_details="\n\n\n No Data Found \n\n\n";
        }
      });
    }

    else {
      ResponsiveInfo.showAlertDialog(
          context, "", "Product is out of stock");
      setState(() {
        productStockEntity = ProductStockEntity();
        productStockEntity.status=1;
        productStockEntity.data!.currentQty="0";
      });

    }
  }

  getReturnPolicies(String product_id) async {

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    var response= await  apihelper.get(Apimethodes.getReturnPolicyData+"?q="+t.toString()+"&product_id="+product_id);




    var js= jsonDecode( response) ;
    ReturnPolicyEntity entity=ReturnPolicyEntity.fromJson(js);

    if(entity.status==1)
    {

      setState(() {
        returnpolicies=entity.data!.policy.toString().trim()+"\n Return Period : "+productByCategoryDataData.returnDays.toString()+" Days";
      });


    }
    else{

      setState(() {

        if(productByCategoryDataData.returnDays!=null&&productByCategoryDataData.returnDays.toString().isNotEmpty)
        {
          returnpolicies = " Return Period : "+productByCategoryDataData.returnDays.toString()+" Days";
        }
        else {
          returnpolicies = " Non Returnable Product";
        }
      });

      // ResponsiveInfo.showAlertDialog(context, "", "Error while fetching Return Policy of this product");
    }




  }

  setupProductImages() async {
    if (productByCategoryDataData.primeImage != null &&
        productByCategoryDataData.primeImage
            .toString()
            .isNotEmpty) {
      setState(() {
        Adsimages.clear();
        images.clear();
        images.add(ApiHelper.productimageurl +
            productByCategoryDataData.primeImage.toString());
        Adsimages.add( GestureDetector(

          child:Image.network(ApiHelper.productimageurl +
              productByCategoryDataData.primeImage.toString(),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child; // Image loaded successfully
              return Center(child: CircularProgressIndicator()); // Show loader while loading
            },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
            },

          ) ,

          onTap: (){

            Navigator.push(context,
                MaterialPageRoute(builder:
                    (context) =>
                    ZoomableImageScreen(ApiHelper.productimageurl +
                        productByCategoryDataData.primeImage.toString(),images)
                )
            );
          },
        )



        );
      });
    }

    if (productByCategoryDataData.sideImage1 != null &&
        productByCategoryDataData.sideImage1
            .toString()
            .isNotEmpty) {


      setState(() {
        images.add(ApiHelper.productimageurl +
            productByCategoryDataData.sideImage1.toString());
        Adsimages.add(GestureDetector(



          child:  Image.network(ApiHelper.productimageurl +
              productByCategoryDataData.sideImage1.toString(), loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child; // Image loaded successfully
            return Center(child: CircularProgressIndicator()); // Show loader while loading
          },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
            },),

          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder:
                    (context) =>
                    ZoomableImageScreen(ApiHelper.productimageurl +
                        productByCategoryDataData.sideImage1.toString(),images)
                )
            );
          },

        ));
      });
    }

    if (productByCategoryDataData.sideImage2 != null &&
        productByCategoryDataData.sideImage2
            .toString()
            .isNotEmpty) {
      setState(() {
        images.add(ApiHelper.productimageurl +
            productByCategoryDataData.sideImage2.toString());
        Adsimages.add(
            GestureDetector(

              child:  Image.network(ApiHelper.productimageurl +
                  productByCategoryDataData.sideImage2.toString(), loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child; // Image loaded successfully
                return Center(child: CircularProgressIndicator()); // Show loader while loading
              },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
                },),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) =>
                        ZoomableImageScreen(ApiHelper.productimageurl +
                            productByCategoryDataData.sideImage2.toString(),images)
                    )
                );
              },

            ));
      });
    }

    if (productByCategoryDataData.sideImage3 != null &&
        productByCategoryDataData.sideImage3
            .toString()
            .isNotEmpty) {
      setState(() {
        images.add(ApiHelper.productimageurl +
            productByCategoryDataData.sideImage3.toString());
        Adsimages.add( GestureDetector(



          child:  Image.network(ApiHelper.productimageurl +
              productByCategoryDataData.sideImage3.toString(), loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child; // Image loaded successfully
            return Center(child: CircularProgressIndicator()); // Show loader while loading
          },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
            },),

          onTap: (){

            Navigator.push(context,
                MaterialPageRoute(builder:
                    (context) =>
                    ZoomableImageScreen(ApiHelper.productimageurl +
                        productByCategoryDataData.sideImage3.toString(),images)
                )
            );
          },

        ));
      });
    }

    if (productByCategoryDataData.sideImage4 != null &&
        productByCategoryDataData.sideImage4
            .toString()
            .isNotEmpty) {
      setState(() {
        images.add(ApiHelper.productimageurl +
            productByCategoryDataData.sideImage4.toString());
        Adsimages.add( GestureDetector(

          child: Image.network(ApiHelper.productimageurl +
              productByCategoryDataData.sideImage4.toString(), loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child; // Image loaded successfully
            return Center(child: CircularProgressIndicator()); // Show loader while loading
          },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
            },),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder:
                    (context) =>
                    ZoomableImageScreen(ApiHelper.productimageurl +
                        productByCategoryDataData.sideImage4.toString(),images)
                )
            );

          },

        ));
      });
    }
  }

  Future<double> calculateWalletPoints() async {
    ResponsiveInfo.showLoaderDialog(context);
    double walletpoints = 0;
    ApiHelper apihelper = new ApiHelper();
    var t=ApiHelper.getTimeStamp();
    var response1= await  apihelper.get(Apimethodes.getWalletPoints+"?q="+t.toString());

    Navigator.pop(context);
    var js1= jsonDecode( response1) ;
    walletpoints=double.parse(js1['data'].toString());

    return walletpoints;
  }

  addToCart()async {

    ResponsiveInfo.ShowProgressDialog(context);


    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    Map<String,String> mp=new HashMap();
    mp['product_id']=productByCategoryDataData.id.toString();
    mp['quantity']="1";
    mp['stockid']=product_stockid;
    if(ispointredeemeed)
    {
      mp['points_redeemed']="1";
    }
    else{

      mp['points_redeemed']="0";
    }


    var response= await  apihelper.post(Apimethodes.addProductToCart+"?q="+t.toString(),formDataPayload: mp);

    var js= jsonDecode( jsonEncode(response) ) ;

    Navigator.pop(context);

    // if(js['status']==1)
    //   {

    getCartCount();

    ResponsiveInfo.showAlertDialog(context, "SaveKart", "Product added to cart successfully");




  }

  getProductExistsinCart() async{

    ResponsiveInfo.ShowProgressDialog(context);

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    String? userid=await AppStorage.getString(AppStorage.id);
    var response= await  apihelper.get(Apimethodes.checkProductExistsCart+"?q="+t.toString()+"&product_id="+productByCategoryDataData.id.toString()+"&userid="+userid.toString());

    var js= jsonDecode( response) ;

    Navigator.pop(context);

    CartDataExistEntity exist=CartDataExistEntity.fromJson(js);
    if(exist.data!.length>0)
    {

      ResponsiveInfo.showAlertDialog(context, "", "Already added to cart");
    }
    else{

      addToCart();
    }



  }

  addProductToWishlist()async {
    ResponsiveInfo.ShowProgressDialog(context);

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    Map<String,String>mp=new HashMap();
    mp['product_id']=productStockEntity.data!.productId.toString();
    mp['stock_id']=productStockEntity.data!.id.toString();

    var response= await  apihelper.post(Apimethodes.addProductToWishlist+"?q="+t.toString(),formDataPayload: mp);

    String fullString=response.toString();
    if (fullString.startsWith("\"") && fullString.endsWith("\"")) {
      fullString = fullString.substring(1, fullString.length - 1)
          .replaceAll("\\\"", "\"");
    }
    var js= jsonDecode( fullString) ;
    Navigator.pop(context);

    if(js['status']==1)
    {

      setState(() {
        iswishlist=true;
      });
    }
    else{
      ResponsiveInfo.showAlertDialog(context, "", "Something went wrong");
    }




  }
  deleteProductFromWishlist()async {
    ResponsiveInfo.ShowProgressDialog(context);

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    Map<String,String>mp=new HashMap();
    mp['id']=wishlist_id;


    var response= await  apihelper.post(Apimethodes.deleteFromWishlist+"?q="+t.toString(),formDataPayload: mp);

    String fullString=response.toString();
    if (fullString.startsWith("\"") && fullString.endsWith("\"")) {
      fullString = fullString.substring(1, fullString.length - 1)
          .replaceAll("\\\"", "\"");
    }
    var js= jsonDecode( fullString) ;
    Navigator.pop(context);

    if(js['status']==1)
    {

      setState(() {
        iswishlist=false;
      });
    }
    else{
      ResponsiveInfo.showAlertDialog(context, "", "Something went wrong");
    }




  }

  getProductExistsinWishlist() async{

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    String? userid=await AppStorage.getString(AppStorage.id);

    var response= await  apihelper.get(Apimethodes.checkProductExistsWishlist+"?q="+t.toString()+"&userid="+userid.toString()+"&product_id="+productStockEntity.data!.productId.toString()+"&stock_id="+productStockEntity.data!.id.toString());

    var js= jsonDecode( response) ;
    print(js);
    CheckWishListEntity entity=CheckWishListEntity.fromJson(js);


    if(entity.status==1)
    {
      if(entity.data!.length>0)
      {
        setState(() {

          wishlist_id=entity.data![0]!.id.toString();

          iswishlist=true;
        });
      }

    }





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


}
