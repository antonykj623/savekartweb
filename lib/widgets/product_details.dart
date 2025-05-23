import 'package:flutter/material.dart';

import '../design/ResponsiveInfo.dart';
import 'SettingsPage.dart';
import 'cart_screen.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedImageIndex = 0;
  String selectedSize = 'XXL';
  String cartcount="2";
  final List<String> imageUrls = List.generate(
    5,
        (index) => 'assets/dettol.jpg',
  );

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
      body: Row(
        children: [
          // Sidebar for thumbnails
          Container(
            width: 80,
            color: Colors.white,
            child: ListView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedImageIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedImageIndex == index ? Colors.red : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(imageUrls[index], height: 60, width: 60, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),

          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(

                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header (can be replaced with a custom AppBar)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('SaveKart Wallet : 500.00'),
                        Row(
                          children: [
                            Icon(Icons.sunny, color: Colors.orange),
                            SizedBox(width: 4),
                            Text('Wallet Points : 500.00'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Product section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main Image
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Image.asset(
                                imageUrls[selectedImageIndex],
                                height: 300,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  4,
                                      (index) => Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedImageIndex == index ? Colors.red : Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              )
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
                              Text('Dettol 50 ml', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text('Your Price : 225.00\n'),
                              Text('SaveKart Price : 210.00\n'),
                              Text('Your Savings : 15.00\n'),
                              Text('Free Delivery'),
                              SizedBox(height: 16),

                              // Size Buttons
                              (screenWidth>700)?  Row(
                                children: ['XXL', 'XL', 'Large'].map((size) {
                                  bool isSelected = selectedSize == size;
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
                                          selectedSize = size;
                                        });
                                      },
                                      child: Text(size),
                                    ),
                                  );
                                }).toList(),
                              ) :
                              Column(
                                children: ['XXL', 'XL', 'Large'].map((size) {
                                  bool isSelected = selectedSize == size;
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
                                          selectedSize = size;
                                        });
                                      },
                                      child: Text(size),
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
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              )



            ),
          )
        ],
      ),
    );
  }
}
