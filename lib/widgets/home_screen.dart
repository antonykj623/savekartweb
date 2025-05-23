import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savekartweb/widgets/SettingsPage.dart';
import 'package:savekartweb/widgets/cart_screen.dart';
import 'package:savekartweb/widgets/product_details.dart';

import '../design/ResponsiveInfo.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  String cartcount="2";





  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
          _buildBanner(),
          _buildProductSection(),
          _buildProductSection(),
          _buildProductSection(),
          _buildProductSection(),
        ],
      ),
    )



    ),
    ],
    ),
    );
  }


  Widget getMenuWidget()
  {
    return Container(
      width: 200,
      color: const Color(0xFFD6EDF3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          _buildCategory('Ladies Wear', subCategories: ['inner wear', 'Churidar materials']),
          _buildCategory('Men\'s Wear'),
          _buildCategory('Men\'s Wear'),
          _buildCategory('Men\'s Wear'),
        ],
      ),
    );
  }

  Widget _buildCategory(String title, {List<String>? subCategories}) {
    return ExpansionTile(
      title: Text(title),
      children: subCategories?.map((sub) => ListTile(title: Text(sub),)).toList() ?? [],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.white,
      child:           (MediaQuery.of(context).size.width > 700 )? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child:  Row(children: const [
            Icon(Icons.account_balance_wallet_outlined),
            SizedBox(width: 8),
            Text('SaveKart Wallet : 500.00')
          ]),flex: 1,)

         ,
          Expanded(child:  Row(children: const [
            Icon(Icons.star,color: Colors.yellow,),
            SizedBox(width: 8),
            Text('Purchase Points : 500.00')
          ]),flex: 1,)
        ],
      ) :  Container(

        child: Column(
          children: [
            Text('SaveKart Wallet : 500.00'),
            Text('Purchase Points : 500.00')
          ],
        ),
        height: 70,

      )
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: (MediaQuery.sizeOf(context).width-260),
        height: ((MediaQuery.sizeOf(context).width-260)/4),


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage('assets/splash.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Antiseptics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 200, // Set height to show cards properly
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scroll like Row
              itemCount: 5,
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return _buildProductCard(); // You can also pass `index` if needed
              },
            ),
          )

        ],
      ),
    );
  }

  Widget _buildProductCard() {
    return  Padding(padding: EdgeInsets.all(10),

    child: GestureDetector(

      child: Container(
        width: 140,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dettol.jpg',
              height: 80,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            const Text('Dettol 50 ml', style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 15),

          ],
        ),
      ),
      onTap: () async {

        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailPage()),
        );

      },
    )




    )


      ;
  }
}
