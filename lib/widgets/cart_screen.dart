import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:weipl_checkout_flutter/weipl_checkout_flutter.dart';
import '../color/ColorsData.dart';
import '../design/ResponsiveInfo.dart';
import '../domain/cart_data_entity.dart';
import '../domain/profile_data_entity.dart';
import '../domain/user_address_entity.dart';
import '../domain/wallet_balance_entity.dart';
import '../web/AppStorage.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';
import 'address_list.dart';
import 'home_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class CartPage extends StatefulWidget {
   CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final int walletAmount = 500;
  final int walletPoints = 500;
  final int itemPrice = 120;
  String _selectedOption = "0";

  double fulltotal = 0;
  int walletpoints = 0;

  // List<int> quantities = List.generate(4, (index) => 2);
  //
  // int get totalAmount => quantities.fold(0, (sum, qty) => sum + qty * itemPrice);
  WeiplCheckoutFlutter wlCheckoutFlutter = WeiplCheckoutFlutter();
  TextEditingController walletamountcontroller = new TextEditingController();

  List<CartDataData>cartdata = [];
  List<UserAddressData> _addresses = [];

  String selected = "0",
      selected_addressid = "",
      _selectedAddress = "";

  double walletbalance = 0,
      usedwalletamount = 0,
      _totalAmount = 0,
      totalamount_to_paid = 0;
  bool iswalletused = false;
  String orderid = "0",cartcount="0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWalletPoints();
    getWalletBalanceAndPoints();
    getAllAddress();
    getCartItems();
    getCartCount();
    wlCheckoutFlutter.on(WeiplCheckoutFlutter.wlResponse, handleResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xffb3d7e0),

        forceMaterialTransparency: true,
        title: Align(
          alignment: FractionalOffset.centerLeft,
          child: Text('My Cart',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        centerTitle: false,


      ),
      body: Row(
        children: [
          // Sidebar Section
          Container(
            width: 250,
            color: Colors.blue[100],
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                (_addresses.length > 0) ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

                  child: Text(_selectedAddress.toString(),
                    style: TextStyle(color: Colors.black),),

                ) :
                Container(width: double.infinity,
                    color: Colors.white54,

                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Align(

                          alignment: FractionalOffset.center,
                          child: Text('No Delivery Address Found',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                        ),

                        TextButton(onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            barrierDismissible: true, // Tap outside to dismiss
                            builder: (BuildContext context) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 16,
                                  child: SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 2.5,
                                      // Set your desired width
                                      height: double.infinity,
                                      // Set your desired height
                                      child: AddressList())
                              );
                            },
                          );


                          if (result != null) {
                            String added = result['added'] ?? '';
                            String id = result['id'] ?? '';
                            if (added.compareTo("1") == 0) {
                              print("Selected address${id}");
                              setState(() {
                                selected = id;
                                selected_addressid = id;
                              });

                              getAllAddress();
                            }
                          }
                        },
                            child: Text('Click here to create new',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight
                                    .normal)))


                      ],
                    )


                ),
                SizedBox(height: 10),
                (_addresses.length > 0) ? ElevatedButton(onPressed: () async {
                  final result = await showDialog(
                    context: context,
                    barrierDismissible: true, // Tap outside to dismiss
                    builder: (BuildContext context) {
                      return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 16,
                          child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.5,
                              // Set your desired width
                              height: double.infinity,
                              // Set your desired height
                              child: AddressList())
                      );
                    },
                  );


                  if (result != null) {
                    String added = result['added'] ?? '';
                    String id = result['id'] ?? '';
                    if (added.compareTo("1") == 0) {
                      print("Selected address${id}");
                      setState(() {
                        selected = id;
                        selected_addressid = id;
                      });

                      getAllAddress();
                    }
                  }
                }, child: Text('Change')) : Container(),
                SizedBox(height: 20),
                Text('Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                TextField(
                  controller: walletamountcontroller,
                  keyboardType: TextInputType.number,
                  onChanged: (txt) {
                    if (txt
                        .toString()
                        .isNotEmpty) {
                      iswalletused = false;
                      double d = double.parse(txt.toString());
                      usedwalletamount = d;



                      if (d <= walletbalance) {

                        if(d<=ApiHelper.totalamount) {
                          setState(() {
                            _totalAmount = ApiHelper.totalamount;
                            _totalAmount = _totalAmount - d;
                            iswalletused = true;
                          });
                        }
                        else{
                          usedwalletamount = 0;

                          setState(() {
                            walletamountcontroller.text = "";
                            iswalletused = false;
                            _totalAmount = ApiHelper.totalamount;
                            ResponsiveInfo.showAlertDialog(context, "SaveKart",
                                "Entered amount is greater than total price");
                          });


                        }
                      }
                      else {
                        usedwalletamount = 0;

                        setState(() {
                          walletamountcontroller.text = "";
                          iswalletused = false;
                          _totalAmount = ApiHelper.totalamount;
                          ResponsiveInfo.showAlertDialog(context, "SaveKart",
                              "Entered amount is greater than wallet amount");
                        });



                      }
                    }
                    else {
                      setState(() {
                        usedwalletamount = 0;
                        iswalletused = false;
                        _totalAmount = ApiHelper.totalamount;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Wallet Amount',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text('Total Amount',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  '${_totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                (cartcount.compareTo("0")!=0)?  ElevatedButton(
                  onPressed: () {
                    if (selected_addressid?.compareTo("0") != 0) {
                      if (_totalAmount == 0) {
                        // PlaceOrder(totalamount_to_paid.toString(), iswalletused,
                        //     _totalAmount.toString(), 3,
                        //     usedwalletamount.toString());


                      }
                      else {
                        showSingleSelectionDialog();
                      }
                    }
                    else {
                      ResponsiveInfo.showAlertDialog(
                          context, "Savekart", "Please Select Your Address");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50)),
                  child: Text('Pay Now'),
                ) : Container()
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
                    padding: EdgeInsets.all(10),
                    child: (MediaQuery
                        .of(context)
                        .size
                        .width > 700) ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.wallet, color: HexColor(
                                ColrsData.maincolor),),
                            SizedBox(width: 4),
                            Text('SaveKart Wallet : ' + walletbalance
                                .toString()),
                          ],
                        ),

                        SizedBox(width: 16),

                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow,),
                            SizedBox(width: 4),
                            Text('Wallet Points : ' + walletpoints.toString()),

                          ],
                        )


                      ],
                    ) : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.wallet, color: HexColor(
                                ColrsData.maincolor),),
                            SizedBox(width: 4),
                            Text('SaveKart Wallet : ' + walletbalance
                                .toString()),
                          ],
                        ),

                        SizedBox(width: 16),

                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow,),
                            SizedBox(width: 4),
                            Text('Wallet Points : ' + walletpoints.toString()),

                          ],
                        )


                      ],
                    )
                ),

                // Products Grid
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: LayoutBuilder(
                        builder: (context, raints) {
                          double screenWidth = raints.maxWidth;

                          // Decide crossAxisCount based on screen width
                          int crossAxisCount = (screenWidth / 300).floor();

                          // You can adjust 300 to your desired card width


                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: (crossAxisCount > 0)
                                  ? crossAxisCount
                                  : 1,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: (crossAxisCount > 0) ? 1.5 : 1,
                            ),
                            itemCount: cartdata.length,
                            itemBuilder: (context, index) {
                              double t = 0;

                              if (cartdata[index].pointsRedeemed.toString()
                                  .compareTo("1") == 0) {
                                t = t + (double.parse(
                                    cartdata[index].price.toString()) *
                                    double.parse(
                                        cartdata[index].quantity.toString()));
                              }
                              else {
                                t = t + (double.parse(
                                    cartdata[index].savekartprice.toString()) *
                                    double.parse(
                                        cartdata[index].quantity.toString()));
                              }


                              return Card(
                                elevation: 4,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        ApiHelper.productimageurl +
                                            cartdata[index].primeImage
                                                .toString(),
                                        width: 80,
                                        height: 80,
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              cartdata[index].productName
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text((cartdata[index].pointsRedeemed
                                                .toString().compareTo("1") == 0)
                                                ? cartdata[index].price
                                                .toString()
                                                : cartdata[index].savekartprice
                                                .toString() + "\n"
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.remove),
                                                  onPressed: () {
                                                    int qty = int.parse(
                                                        cartdata[index].quantity
                                                            .toString());

                                                    setState(() {
                                                      if (qty > 1) {
                                                        qty = qty - 1;
                                                        cartdata[index]
                                                            .quantity =
                                                            qty.toString();
                                                      }
                                                    });
                                                    updateCartQuantity(
                                                        cartdata[index].cartid
                                                            .toString(),
                                                        cartdata[index].quantity
                                                            .toString(), index);
                                                  },
                                                ),
                                                Text(cartdata[index].quantity
                                                    .toString()),
                                                IconButton(
                                                  icon: Icon(Icons.add),
                                                  onPressed: () {
                                                    int currentstock = int
                                                        .parse(cartdata[index]
                                                        .currentQty.toString());
                                                    int qty = int.parse(
                                                        cartdata[index].quantity
                                                            .toString());
                                                    // setState(() {
                                                    //   quantities[index]++;
                                                    // });


                                                    if (currentstock >= qty) {
                                                      qty = qty + 1;
                                                      setState(() {
                                                        cartdata[index]
                                                            .quantity =
                                                            qty.toString();
                                                      });

                                                      updateCartQuantity(
                                                          cartdata[index].cartid
                                                              .toString(),
                                                          cartdata[index]
                                                              .quantity
                                                              .toString(),
                                                          index);
                                                    }
                                                    else {
                                                      ResponsiveInfo
                                                          .showAlertDialog(
                                                          context, "SaveKart",
                                                          "Out of stock");
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            Text('Total Price : ${t
                                                .toStringAsFixed(2)}'),
                                            TextButton(
                                              onPressed: () {
                                                Widget okButton = TextButton(
                                                  child: Text("Yes"),
                                                  onPressed: () {
                                                    Navigator.pop(context);

                                                    deleteFromCart(
                                                        cartdata[index].cartid
                                                            .toString(), index);
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
                                                  content: Text(
                                                      "Do you want to delete this product from cart ?"),
                                                  actions: [
                                                    okButton,
                                                    noButton
                                                  ],
                                                );

                                                // show the dialog
                                                showDialog(
                                                  context: context,
                                                  builder: (
                                                      BuildContext context) {
                                                    return alert;
                                                  },
                                                );
                                              },
                                              child: Text('Delete',
                                                  style: TextStyle(
                                                      color: Colors.red)),
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



  void showSingleSelectionDialog() async {
    _selectedOption = "0";
    final List<String> _options = ["Cash on Delivery", "Online Payment"];
    final selectedOption = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select an Option"),
          content: SingleChildScrollView(
            child: Column(
              children: _options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: (value) async {
                    if (value.toString().compareTo("Cash on Delivery") == 0) {
                      Navigator.pop(context);

                      ResponsiveInfo.showAlertDialog(context, "",
                          "Sorry , this option is not applicable right now ");
                    }
                    else {
                      Navigator.pop(context);

                        // PlaceOrder(totalamount_to_paid.toString(),iswalletused,_totalAmount.toString(),2,usedwalletamount.toString());
                      PlaceOrder(totalamount_to_paid.toString(),iswalletused,"1".toString(),2,usedwalletamount.toString());


                    }

                    // Navigator.pop(context, value); // Close dialog with selection
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog without selection
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );

    if (selectedOption != null) {
      setState(() {
        _selectedOption = selectedOption;
      });
    }
  }

  getWalletBalanceAndPoints() async {
    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();
    String? userid = await AppStorage.getString(AppStorage.id);

    var response = await apihelper.get(
        Apimethodes.calculateWalletBallence + "?q=" + t.toString() +
            "&userid=" + userid.toString());

    var js = jsonDecode(response);
    print(js);

    WalletBalanceEntity entity = WalletBalanceEntity.fromJson(js);

    if (entity != null) {
      setState(() {
        walletbalance = double.parse(entity.data!.balance.toString());
      });
    }
  }


  getWalletPoints() async {
    ApiHelper apihelper = new ApiHelper();
    String? userid = await AppStorage.getString(AppStorage.id);
    var t = ApiHelper.getTimeStamp();
    var response1 = await apihelper.get(
        Apimethodes.getWalletPoints + "?q=" + t.toString() + "&userid=" +
            userid.toString());
    var js1 = jsonDecode(response1);
    setState(() {
      walletpoints = int.parse(js1['data'].toString());

      AppStorage.setString(AppStorage.walletpoint, walletpoints.toString());
      // String? currentWalletPoints=await AppStorage.getString(AppStorage.current_wallet_point);


      AppStorage.setString(
          AppStorage.current_wallet_point, walletpoints.toString());
    });
  }


  getAllAddress() async
  {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ResponsiveInfo.showLoaderDialog(context);
    });


    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();
    String? userid = await AppStorage.getString(AppStorage.id);
    var response = await apihelper.get(
        Apimethodes.getAddressList + "?q=" + t.toString() + "&userid=" +
            userid.toString());

    var js = jsonDecode(response);

    UserAddressEntity entity = UserAddressEntity.fromJson(js);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
    if (entity.status == 1) {
      setState(() {
        _addresses.clear();
        if (entity.data!.length > 0) {
          _addresses.addAll(entity.data!);

          if (selected.toString().compareTo("0") == 0) {
            selected_addressid = _addresses[0].id.toString();
            _selectedAddress = _addresses[0].name.toString() + "," +
                _addresses[0].housename.toString() + "\n" +
                _addresses[0].landmark.toString() + "," +
                _addresses[0].district.toString() + "\n" +
                "Phone : " + _addresses[0].phone.toString() + ",\nPin code : " +
                _addresses[0].pincode.toString();
          }
          else {
            for (int i = 0; i < _addresses.length; i++) {
              if (_addresses[i].id.toString().compareTo(selected.toString()) ==
                  0) {
                setState(() {
                  selected_addressid = _addresses[i].id.toString();
                  _selectedAddress = _addresses[i].name.toString() + "," +
                      _addresses[i].housename.toString() + "\n" +
                      _addresses[i].landmark.toString() + "," +
                      _addresses[i].district.toString() + "\n" +
                      "Phone : " + _addresses[i].phone.toString() +
                      ",\nPin Code : " + _addresses[0].pincode.toString();
                });
              }
            }
          }
        }
      });
    }
  }


  deleteFromCart(String id, int index) async
  {
    String? userid = await AppStorage.getString(AppStorage.id);

    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();

    Map<String, String> mp = new HashMap();
    mp['id'] = id;
    mp['userid'] = userid.toString();


    var response = await apihelper.post(
        Apimethodes.deleteFromCart + "?q=" + t.toString(), formDataPayload: mp);


    var js = jsonDecode(response);

    if (js['status'] == 1) {
      setState(() {
        cartdata.removeAt(index);
      });
      _calculateSubtotal();
      getCartItems();
    }
    else {
      ResponsiveInfo.showAlertDialog(context, "SaveKart", "Failed to delete");
    }
  }


  updateCartQuantity(String id, String quantity, int index) async {
    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();

    Map<String, String> mp = new HashMap();
    mp['id'] = id;
    mp['quantity'] = quantity;


    var response = await apihelper.post(
        Apimethodes.updateQuantity + "?q=" + t.toString(), formDataPayload: mp);

    print(response);

    var js = jsonDecode(response);

    if (js['status'] == 1) {
      _calculateSubtotal();
    }
    else {
      setState(() {
        cartdata[index].quantity = (int.parse(quantity) - 1).toString();
      });

      ResponsiveInfo.showAlertDialog(context, "SaveKart", js['message']);
    }
    _calculateSubtotal();
  }

  _calculateSubtotal() {
    double t = 0;
    fulltotal = 0;

    for (int i = 0; i < cartdata.length; i++) {
      if (cartdata[i].pointsRedeemed.toString().compareTo("1") == 0) {
        t = t + (double.parse(cartdata[i].price.toString()) *
            double.parse(cartdata[i].quantity.toString()));
      }
      else {
        t = t + (double.parse(cartdata[i].savekartprice.toString()) *
            double.parse(cartdata[i].quantity.toString()));
      }
    }
    print(t);

    setState(() {
      fulltotal = t;
      _totalAmount = t;
      ApiHelper.totalamount = fulltotal;
      totalamount_to_paid = _totalAmount;
    });
  }


  getCartItems() async
  {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ResponsiveInfo.showLoaderDialog(context);
    });


    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();
    String? userid = await AppStorage.getString(AppStorage.id);

    var response = await apihelper.get(
        Apimethodes.getCartData + "?q=" + t.toString() + "&userid=" +
            userid.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Navigator.pop(context);
    });
    var js = jsonDecode(response);
    CartDataEntity entity = CartDataEntity.fromJson(js);
    if (entity!.status == 1) {
      setState(() {
        cartdata.clear();
        cartdata.addAll(entity!.data!);
      });


      _calculateSubtotal();
    }
  }

  updateWalletBalance() async
  {
    if (iswalletused) {
      // ResponsiveInfo.ShowProgressDialog(context);
      ApiHelper apihelper = new ApiHelper();
      String? userid=await   AppStorage.getString(AppStorage.id);
      var t = ApiHelper.getTimeStamp();
      Map<String, String> mp = new HashMap();
      mp['amount'] = usedwalletamount.toString();
      mp['description'] = "Amount used for placing order";
      mp['userid']=userid.toString();


      var response = await apihelper.post(
          Apimethodes.updateWalletBalance + "?q=" + t.toString(),
          formDataPayload: mp);

      var js = jsonDecode(response);
      print(js);
      // Navigator.pop(context);
    }
  }

  updateWalletPoints(String orderid) async
  {
    ApiHelper apihelper = new ApiHelper();
  String? userid=await   AppStorage.getString(AppStorage.id);

    var t = ApiHelper.getTimeStamp();

    var response = await apihelper.get(
        Apimethodes.updateWalletPoints + "?q=" + t.toString() + "&orderid=" +
            orderid+"&user_id="+userid.toString());

    var js = jsonDecode(response);
    print(js);
  }

  PlaceOrder(String total, bool iswalletsused, String paidamount,
      int paymenttype, String walletamountused) async {
    String email = "",
        phone = "";
    String? userid = await AppStorage.getString(AppStorage.id);
    ResponsiveInfo.ShowProgressDialog(context);
    Map<String, String> m = new HashMap();
    m["userid"] = userid.toString();
    ApiHelper apihelper1 = new ApiHelper();

    var response2 = await apihelper1.post(
        Apimethodes.getUserDetails, formDataPayload: m);
    // var js = jsonDecode(jsonDecode(response2));
    var js = jsonDecode(response2);
    ProfileDataEntity entity = ProfileDataEntity.fromJson(js);
    email = entity.data!.emailId.toString();
    phone = entity.data!.mobile.toString();

    Navigator.pop(context);

    ResponsiveInfo.ShowProgressDialog(context);


    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();

    Map<String, String> mp = new HashMap();
    mp['address_id'] = selected_addressid.toString();
    mp['totalprice'] = total;
    mp['isWalletUsed'] = (iswalletsused ? 1 : 0).toString();
    mp['paid_amount'] = paidamount;
    mp['user_id'] = userid.toString();

    mp['payment_type'] = paymenttype.toString();
    mp['wallet_amount_used'] = walletamountused;


    var response4 = await apihelper.post(
        Apimethodes.createOrder + "?q=" + t.toString(), formDataPayload: mp);
    Navigator.pop(context);

    print(response4);
//
//

    if (_totalAmount == 0 && paymenttype == 3) {
//String d = jsonDecode(response4);

      Map<String, dynamic> data = jsonDecode(response4);

      if (data['status'] == 1) {
        String idTransaction = data['data'].toString();
        orderid = idTransaction.toString();

        updateWalletPoints(idTransaction.toString());
        updateWalletBalance();


        showOrderDialog(context, true, "Your order placed successfully!");
      }
      else {
        //  ResponsiveInfo.showAlertDialog(context, "Savekart", "Something went wrong");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
              (Route<
              dynamic> route) => false, // Remove all previous routes
        );
      }
//
    }
    else{

   //   String d = jsonDecode(response4);

      Map<String, dynamic> data=  jsonDecode(response4)  ;

      if(data['status']==1) {
      //  String d = jsonDecode(response4);

        Map<String, dynamic> data = jsonDecode(response4);
        Uri uri = Uri.parse(data['data']);

        String? idTransaction = uri.queryParameters["id_transaction"];
        orderid = idTransaction.toString();



        //fetching transaction credentials

        ResponsiveInfo.ShowProgressDialog(context);


        ApiHelper apihelper = new ApiHelper();

        var t = ApiHelper.getTimeStamp();

        var response = await apihelper.get(
            Apimethodes.getPaymentCredentials + "?q=" + t.toString());

        print(response);

        Navigator.pop(context);

        var data1 = jsonDecode(response);


        String customerid = data1['customerid'];
        String merchantcode = data1['merchantcode'];
        String salt = data1['saltkey'];
        String txnid = idTransaction.toString();

        String a = merchantcode + "|" + txnid + "|" + paidamount + "||" +
            customerid + "|" + phone + "|" + email + "||||||||||" + salt;

        // String a=    merchantId+"|"+randomNumber+"|1||"+consumerId+"|"+consumerMobileNo+"|"+consumerEmailId+"||||||||||1178920237UGKJGI";


        //fetching hash methode

        ResponsiveInfo.ShowProgressDialog(context);

        Map<String, String> mp = new HashMap();
        mp['data'] = a;

        ApiHelper apihelper1 = new ApiHelper();

        var t1 = ApiHelper.getTimeStamp();

        var response1 = await apihelper1.post(
            Apimethodes.generateHash + "?q=" + t1.toString(),
            formDataPayload: mp);

        print(response1);

        Navigator.pop(context);

       // String d1 = jsonDecode(response1);

        Map<String, dynamic> data2 = jsonDecode(response1);

        String value = data2["value"];
        print(value);

      String? userid=await  AppStorage.getString(AppStorage.id);


        String urldata=ApiHelper.baseUrl+Apimethodes.processPayment+"?token="+value+"&merchantcode="+merchantcode+"&customerid="+customerid+
    "&phone="+phone+"&email="+email+"&txnid="+txnid+"&paidamount="+paidamount+"&userid="+userid.toString();

        final Uri url = Uri.parse(urldata);
        if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
          throw 'Could not launch $url';
        }



        Navigator.pop(context);
        Navigator.pop(context);



      }


    }







    //real one
    // if(data['status']==1) {
    //   if (_totalAmount == 0 && paymenttype==3 ) {
    //
    //     updateWalletBalance();
    //     updateWalletPoints(data['data']);
    //
    //     showOrderDialog(context, true, "Your order placed successfully!");
    //   }
    //   else{
    //
    //     String urldata=data['data'];
    //
    //     Completer c=Completer();
    //
    //
    //     NativeBridge().redirectToNative(urldata,c);
    //    var result= await c.future;
    //    if(result!=null&&result.toString().isNotEmpty && result.toString().contains("https://mysaveapp.com/ecommercepayment/paymentgateway/result.php")) {
    //      showPaymentStatus(result);
    //    }
    //    else{
    //      ResponsiveInfo.showAlertDialog(context, "Savekart", "Cannot fetch your payment details");
    //      Navigator.of(context).pushAndRemoveUntil(
    //        MaterialPageRoute(builder: (context) => HomeScreen()),
    //            (Route<
    //            dynamic> route) => false, // Remove all previous routes
    //      );
    //    }
    //
    //   }
    // }
    // else{
    //   ResponsiveInfo.showAlertDialog(context, "Savekart", "Something went wrong");
    //   Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => HomeScreen()),
    //         (Route<
    //         dynamic> route) => false, // Remove all previous routes
    //   );
    // }





  }


  void handleResponse(dynamic response) {
    //  ResponsiveInfo.showAlertDialog(context, "Response", response.toString());
    print(response);
    List<String> parts = response['msg']!.split('|');
    String statusCode = parts[0]; // 0300
    String statusMessage = parts[1]; // SUCCESS
    String description = parts[2]; // Verification SUCCESS Transaction
    String transactionId = parts[3]; // 1234567
    String orderId = parts[4]; // 33570
    String customerId = parts[5]; // 669013977
    String amount = parts[6]; // 1.00
    String txnDateTime = parts[8]; // 27-06-2025 12:50:34
    String uuid = parts[14]; // 607369e3-68fe-4f9b-b3a4-fe0a2e7fd5a3
    String hashValue = parts[15]; // Long hash string

    String merchantCode = response['merchant_code'] ?? '';

    String transactiondetails = "Transaction ID : " +
        transactionId + "\n" + "Order ID : " + orderId + "\nCustomer ID : " +
        customerId + "\n" +
        "Transaction Date : " + txnDateTime + "\nmessage : " + statusMessage;

    String paymentstatus = "0";

    if (statusCode.compareTo("0300") == 0) {
      if (statusMessage.compareTo("SUCCESS") == 0) {
        updateWalletBalance();
        updateWalletPoints(orderid);
        paymentstatus = "1";


        updatePaymentStatus(transactiondetails, transactionId, paymentstatus);


        // For success
        // showOrderDialog(context, true, "Your order  placed successfully!");
      }
      else {
        paymentstatus = "0";

        updatePaymentStatus(transactiondetails, transactionId, paymentstatus);

        // ResponsiveInfo.showAlertDialog(context, "Savekart", "Payment failed");
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(builder: (context) => HomeScreen()),
        //       (Route<
        //       dynamic> route) => false, // Remove all previous routes
        // );
      }
    }
    else {
      paymentstatus = "0";
      updatePaymentStatus(transactiondetails, transactionId, paymentstatus);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<
            dynamic> route) => false, // Remove all previous routes
      );
    }
  }

  updatePaymentStatus(String transactiondetails, String transactionid,
      String paymentstatus) async {
    String? userid = await AppStorage.getString(AppStorage.id);
    ApiHelper apihelper = new ApiHelper();

    var t = ApiHelper.getTimeStamp();
    Map<String, String> mp = new HashMap();
    mp['orderid'] = orderid;
    mp['transactiondetails'] = transactiondetails;
    mp['transactionid'] = transactionid;
    mp['payment_status'] = paymentstatus;
    mp['user_id']=userid.toString();

    if (paymentstatus.compareTo("1") == 0) {
      mp['description'] = "Transaction completed successfully";
    }
    else {
      mp['description'] = "Transaction failed";
    }


    var response = await apihelper.post(
        Apimethodes.updateOrderStaus + "?q=" + t.toString(),
        formDataPayload: mp);
    print(response);
    var js = jsonDecode(response);



    if(paymentstatus.compareTo("1")==0)
    {
      showOrderDialog(context, true, "Your order  placed successfully!");
    }
    else{
      //  ResponsiveInfo.showAlertDialog(context, "Savekart", "Payment failed");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<
            dynamic> route) => false, // Remove all previous routes
      );

    }
  }


  showPaymentStatus(String url) {
    Uri uri = Uri.parse(url);

    // Extract query parameters
    Map<String, String> queryParams = uri.queryParameters;

    // Print all parameters
    queryParams.forEach((key, value) {
      print("$key: $value");
    });

    // Access individual parameters
    String? message = queryParams['message'];
    String? transactionid = queryParams['transactionid'];
    String? order_id = queryParams['order_id'];


    if (message != null) {
      String a = message;
      String orderid = order_id!;

      if (a.contains("Your transaction is successful")) {
        updateWalletBalance();
        updateWalletPoints(orderid);

        // For success
        showOrderDialog(context, true, "Your order  placed successfully!");
      }
      else {
// For failure
        showOrderDialog(context, false, "Payment failed. Please try again.");
      }
    }
  }


  void showOrderDialog(BuildContext context, bool isSuccess, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 40,
              ),
              SizedBox(width: 8),
              Text(isSuccess ? 'Order Successful' : 'Order Failed'),
            ],
          ),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<
                      dynamic> route) => false, // Remove all previous routes
                );
              },
            ),
          ],
        );
      },
    );
  }


}