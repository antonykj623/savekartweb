import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../color/ColorsData.dart';
import '../design/ResponsiveInfo.dart';
import '../domain/cart_data_entity.dart';
import '../domain/user_address_entity.dart';
import '../domain/wallet_balance_entity.dart';
import '../web/AppStorage.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';
import 'address_list.dart';

class CartPage extends StatefulWidget {
   CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final int walletAmount = 500;
  final int walletPoints = 500;
  final int itemPrice = 120;

  double fulltotal=0;
  int walletpoints=0;
  // List<int> quantities = List.generate(4, (index) => 2);
  //
  // int get totalAmount => quantities.fold(0, (sum, qty) => sum + qty * itemPrice);

  List<CartDataData>cartdata=[];
  List<UserAddressData> _addresses = [];

  String selected="0",selected_addressid="",_selectedAddress="";

  double walletbalance=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
getWalletPoints();
getWalletBalanceAndPoints();
    getAllAddress();
    getCartItems();
  }

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
            padding:  EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold)),
                 SizedBox(height: 8),
                (_addresses.length>0)?  Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

                  child:  Text(_selectedAddress.toString(),style: TextStyle(color: Colors.black),),

                ) :
                Container(width: double.infinity,
                    color: Colors.white54,

                    height: 200,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Align(

                          alignment: FractionalOffset.center,
                          child: Text('No Delivery Address Found', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        ),

                        TextButton(onPressed: () async {


                          final result = await  showDialog(
                            context: context,
                            barrierDismissible: true, // Tap outside to dismiss
                            builder: (BuildContext context) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 16,
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width/2.5,  // Set your desired width
                                      height: double.infinity, // Set your desired height
                                      child: AddressList() )
                              );
                            },
                          );


                          if (result != null) {
                            String   added = result['added'] ?? '';
                            String id=result['id']??'';
                            if(added.compareTo("1")==0)
                            {
                              print("Selected address${id}");
                              setState(() {
                                selected=id;
                                selected_addressid=id;
                              });

                              getAllAddress();



                            }


                          }

                        }, child: Text('Click here to create new', style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal)))


                      ],
                    )





                ),
                 SizedBox(height: 10),
                (_addresses.length>0)?   ElevatedButton(onPressed: () async {



                  final result = await  showDialog(
                      context: context,
                      barrierDismissible: true, // Tap outside to dismiss
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 16,
                          child: SizedBox(
                        width: MediaQuery.of(context).size.width/2.5,  // Set your desired width
                        height: double.infinity, // Set your desired height
                        child: AddressList() )
                        );
                      },
                    );


                  if (result != null) {
                    String   added = result['added'] ?? '';
                    String id=result['id']??'';
                    if(added.compareTo("1")==0)
                    {
                      print("Selected address${id}");
                      setState(() {
                        selected=id;
                        selected_addressid=id;
                      });

                      getAllAddress();



                    }


                  }

                }, child:  Text('Change')) : Container(),
                 SizedBox(height: 20),
                 Text('Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
                 SizedBox(height: 10),
                 TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Wallet Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                 SizedBox(height: 20),
                 Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                 SizedBox(height: 10),
                Text(
                  '${fulltotal.toStringAsFixed(2)}',
                  style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                 SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(minimumSize:  Size(double.infinity, 50)),
                  child:  Text('Pay Now'),
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
                  padding:  EdgeInsets.all(10),
                  child: (MediaQuery.of(context).size.width>700)? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wallet,color: HexColor(ColrsData.maincolor),),
                          SizedBox(width: 4),
                          Text('SaveKart Wallet : '+walletbalance.toString()),
                        ],
                      ),

                      SizedBox(width: 16),

                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,),
                          SizedBox(width: 4),
                          Text('Wallet Points : '+walletpoints.toString()),

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
                          Text('SaveKart Wallet : '+walletbalance.toString()),
                        ],
                      ),

                      SizedBox(width: 16),

                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow,),
                          SizedBox(width: 4),
                          Text('Wallet Points : '+walletpoints.toString()),

                        ],
                      )


                    ],
                  )
                ),

                // Products Grid
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(16),
                    child: LayoutBuilder(
                      builder: (context, raints) {
                        double screenWidth = raints.maxWidth;

                        // Decide crossAxisCount based on screen width
                        int crossAxisCount = (screenWidth / 300).floor(); 
                        
                        // You can adjust 300 to your desired card width
                        
                   
                        
                        
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (crossAxisCount>0)? crossAxisCount : 1,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: (crossAxisCount>0)? 1.5:1,
                          ),
                          itemCount: cartdata.length,
                          itemBuilder: (context, index) {


                            double t=0;

                            if(cartdata[index].pointsRedeemed.toString().compareTo("1")==0)
                            {
                              t=t+(double.parse(cartdata[index].price.toString()) * double.parse(cartdata[index].quantity.toString())   );
                            }
                            else{
                              t=t+(double.parse(cartdata[index].savekartprice.toString()) * double.parse(cartdata[index].quantity.toString()));
                            }



                            return Card(
                              elevation: 4,
                              child: Padding(
                                padding:  EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Image.network(
                                      ApiHelper.productimageurl + cartdata[index].primeImage.toString(),
                                      width: 80,
                                      height: 80,
                                    ),
                                     SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                           Text(
                                            cartdata[index].productName.toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text((cartdata[index].pointsRedeemed.toString().compareTo("1")==0) ? cartdata[index].price.toString()   :   cartdata[index].savekartprice.toString()+"\n"
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon:  Icon(Icons.remove),
                                                onPressed: () {

                                                  int qty=int.parse(cartdata[index].quantity.toString());

                                                  setState(() {
                                                    if (qty > 1) {
                                                   qty=qty-1;
                                                   cartdata[index].quantity=qty.toString();
                                                    }
                                                  });
                                                  updateCartQuantity(cartdata[index].cartid.toString(), cartdata[index].quantity.toString(), index);

                                                },
                                              ),
                                              Text(  cartdata[index].quantity.toString()),
                                              IconButton(
                                                icon:  Icon(Icons.add),
                                                onPressed: () {
                                                  int currentstock=int.parse(cartdata[index].currentQty.toString());
                                                  int qty=int.parse(cartdata[index].quantity.toString());
                                                  // setState(() {
                                                  //   quantities[index]++;
                                                  // });


                                                  if(currentstock>=qty) {

                                                    qty= qty+1;
                                                    setState(() {
                                                      cartdata[index].quantity=qty.toString();
                                                    });

                                                    updateCartQuantity(cartdata[index].cartid.toString(), cartdata[index].quantity.toString(), index);

                                                  }
                                                  else{

                                                    ResponsiveInfo.showAlertDialog(context, "SaveKart", "Out of stock");
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          Text('Total Price : ${t.toStringAsFixed(2)}'),
                                          TextButton(
                                            onPressed: () {

                                              Widget okButton = TextButton(
                                                child: Text("Yes"),
                                                onPressed: () {

                                                  Navigator.pop(context);

                                                  deleteFromCart(cartdata[index].cartid.toString(), index);

                                                },
                                              );

                                              Widget noButton = TextButton(
                                                child: Text("No"),
                                                onPressed: () {

                                                  Navigator.pop(context);

                                                },
                                              );

                                              // set up the AlertDialog
                                              AlertDialog alert = AlertDialog(
                                                title: Text("Savekart"),
                                                content: Text("Do you want to delete this product from cart ?"),
                                                actions: [
                                                  okButton,
                                                  noButton
                                                ],
                                              );

                                              // show the dialog
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return alert;
                                                },
                                              );
                                            },
                                            child:  Text('Delete', style: TextStyle(color: Colors.red)),
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



  getAllAddress()async
  {

    WidgetsBinding.instance.addPostFrameCallback((_) {

      ResponsiveInfo.showLoaderDialog(context);


    });


    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    String? userid=await AppStorage.getString(AppStorage.id);
    var response= await  apihelper.get(Apimethodes.getAddressList+"?q="+t.toString()+"&userid="+userid.toString());

    var js= jsonDecode( response) ;

    UserAddressEntity entity=UserAddressEntity.fromJson(js);
    WidgetsBinding.instance.addPostFrameCallback((_) {

      Navigator.pop(context);


    });
    if(entity.status==1)
    {

      setState(() {

        _addresses.clear();
        if(entity.data!.length>0) {
          _addresses.addAll(entity.data!);

          if(selected.toString().compareTo("0")==0) {
            selected_addressid = _addresses[0].id.toString();
            _selectedAddress = _addresses[0].name.toString() + "," +
                _addresses[0].housename.toString() + "\n" +
                _addresses[0].landmark.toString()+","+
                _addresses[0].district.toString()+"\n"+
                "Phone : "+ _addresses[0].phone.toString()+",\nPin code : "+_addresses[0].pincode.toString();
          }
          else{
            for(int i=0;i<_addresses.length;i++)
            {

              if(_addresses[i].id.toString().compareTo(selected.toString())==0)
              {

                setState(() {
                  selected_addressid = _addresses[i].id.toString();
                  _selectedAddress = _addresses[i].name.toString() + "," +
                      _addresses[i].housename.toString() + "\n" +
                      _addresses[i].landmark.toString()+","+
                      _addresses[i].district.toString()+"\n"+
                      "Phone : "+_addresses[i].phone.toString()+",\nPin Code : "+_addresses[0].pincode.toString();

                });

              }


            }


          }
        }
      });
    }



  }



  deleteFromCart(String id,int index)async
  {
    String? userid=await AppStorage.getString(AppStorage.id);

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    Map<String,String> mp=new HashMap();
    mp['id']=id;
    mp['userid']=userid.toString();



    var response= await  apihelper.post(Apimethodes.deleteFromCart+"?q="+t.toString(),formDataPayload: mp);


    var js=  jsonDecode(response)  ;

    if(js['status']==1)
      {
        setState(() {
          cartdata.removeAt(index);
        });
        _calculateSubtotal();
        getCartItems();
      }
    else{

      ResponsiveInfo.showAlertDialog(context, "SaveKart", "Failed to delete");
    }






  }




  updateCartQuantity(String id,String quantity,int index)async{




    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    Map<String,String> mp=new HashMap();
    mp['id']=id;
    mp['quantity']=quantity;


    var response= await  apihelper.post(Apimethodes.updateQuantity+"?q="+t.toString(),formDataPayload: mp);

    print(response);

    var js= jsonDecode( response ) ;

    if(js['status']==1) {
      _calculateSubtotal();
    }
    else{

      setState(() {
        cartdata[index].quantity=(int.parse(quantity)-1).toString();
      });

      ResponsiveInfo.showAlertDialog(context, "SaveKart", js['message']);
    }
    _calculateSubtotal();

  }

  _calculateSubtotal() {

    double t=0;
    fulltotal=0;

    for(int i=0;i<cartdata.length;i++)
    {
      if(cartdata[i].pointsRedeemed.toString().compareTo("1")==0)
      {
        t=t+(double.parse(cartdata[i].price.toString()) * double.parse(cartdata[i].quantity.toString())   );
      }
      else{
        t=t+(double.parse(cartdata[i].savekartprice.toString()) * double.parse(cartdata[i].quantity.toString()));
      }
    }
    print(t);

    setState(() {
      fulltotal=t;
    });




  }



  getCartItems()async
  {

    WidgetsBinding.instance.addPostFrameCallback((_) async {

      ResponsiveInfo.showLoaderDialog(context);
    });


    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    String? userid=await AppStorage.getString(AppStorage.id);

    var response= await  apihelper.get(Apimethodes.getCartData+"?q="+t.toString()+"&userid="+userid.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      Navigator.pop(context);
    });
    var js= jsonDecode( response) ;
    CartDataEntity entity=CartDataEntity.fromJson(js);
    if(entity!.status==1)
    {

      setState(() {
        cartdata.clear();
        cartdata.addAll(entity!.data!);

      });


      _calculateSubtotal();

    }


  }
}