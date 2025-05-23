import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../color/ColorsData.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final int walletAmount = 500;
  final int walletPoints = 500;
  final int itemPrice = 120;
  List<int> quantities = List.generate(4, (index) => 2);

  int get totalAmount => quantities.fold(0, (sum, qty) => sum + qty * itemPrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xffb3d7e0),

        forceMaterialTransparency: true,
        title:Align(
          alignment: FractionalOffset.centerLeft,
          child:   Text('My Cart', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ) ,
        centerTitle: false,




      ),
      body: Row(
        children: [
          // Sidebar Section
          Container(
            width: 250,
            color: Colors.blue[100],
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text(
                  'Address: G6P8+HGC, Cosmopolitan Road,\nAswini Junction, Cherumukku,\nThrissur, Kerala 680008',
                ),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: () {}, child: const Text('Change')),
                const SizedBox(height: 20),
                const Text('Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Wallet Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                  '₹${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  child: const Text('Pay Now'),
                )
              ],
            ),
          ),

          // Main Content Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(10),
                  child: (MediaQuery.of(context).size.width>700)? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wallet,color: HexColor(ColrsData.maincolor),),
                          SizedBox(width: 4),
                          Text('SaveKart Wallet : 500.00'),
                        ],
                      ),

                      SizedBox(width: 16),

                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,),
                          SizedBox(width: 4),
                          Text('Wallet Points : 500.00'),

                        ],
                      )


                    ],
                  ) : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wallet,color: HexColor(ColrsData.maincolor),),
                          SizedBox(width: 4),
                          Text('SaveKart Wallet : 500.00'),
                        ],
                      ),

                      SizedBox(width: 16),

                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,),
                          SizedBox(width: 4),
                          Text('Wallet Points : 500.00'),

                        ],
                      )


                    ],
                  )
                ),

                // Products Grid
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;

                        // Decide crossAxisCount based on screen width
                        int crossAxisCount = (screenWidth / 300).floor(); // You can adjust 300 to your desired card width

                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (crossAxisCount>0)? crossAxisCount : 1,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: (crossAxisCount>0)? 1.6:1,
                          ),
                          itemCount: quantities.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Image.network(
                                      'https://www.netmeds.com/images/product-v1/600x600/984284/dettol_effective_protection_disinfectant_liquid_lavender_blossom_1_litre_0_0.jpg',
                                      width: 80,
                                      height: 80,
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Men Navy Check Slim Fit Formal Blazer',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text('₹ $itemPrice'),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                  setState(() {
                                                    if (quantities[index] > 1) quantities[index]--;
                                                  });
                                                },
                                              ),
                                              Text(quantities[index].toString()),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                  setState(() {
                                                    quantities[index]++;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Text('Total Price : ₹${quantities[index] * itemPrice}'),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                quantities.removeAt(index);
                                              });
                                            },
                                            child: const Text('Delete', style: TextStyle(color: Colors.red)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )

                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}