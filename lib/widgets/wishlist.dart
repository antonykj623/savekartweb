import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:savekartweb/domain/wishlist_entity.dart';
import 'package:savekartweb/web/AppStorage.dart';

import '../design/ResponsiveInfo.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';

class Wishlist extends StatefulWidget {
   Wishlist() ;

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {

  List<WishlistData> wishlistItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishList();
  }

  void removeItem(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }


  deleteProductFromWishlist(String wishlist_id,int index)async
  {
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

      removeItem(index);
    }
    else{
      ResponsiveInfo.showAlertDialog(context, "", "Something went wrong");
    }




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: wishlistItems.isEmpty
            ? Center(child: Text('Your wishlist is empty!'))
            : ListView.builder(
          itemCount: wishlistItems.length,
          itemBuilder: (context, index) {
            final item = wishlistItems[index];

            return GestureDetector(

              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 3,
                child: ListTile(
                  leading: Image.network(ApiHelper.productimageurl+item.primeImage.toString(), width:ResponsiveInfo.isMobile(context)? 60:75, height: ResponsiveInfo.isMobile(context)? 60:75, fit: BoxFit.cover),
                  title: Text(item.productName.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(item.price.toString(), style: TextStyle(color: Colors.green)),
                  trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: (){
                        deleteProductFromWishlist(item.wishlistid.toString(), index);
                      }
                  ),
                ),
              ) ,
              onTap: (){




              },
            )


             ;
          },
        ),



    );
  }



  getWishList()async{

    String? userid=await AppStorage.getString(AppStorage.id);

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    var response= await  apihelper.get(Apimethodes.getWishlistdata+"?q="+t.toString()+"&userid="+userid.toString());

    var js= jsonDecode( response) ;
    WishlistEntity entity=WishlistEntity.fromJson(js);

    if(entity.status==1)
    {

      setState(() {
        wishlistItems.addAll(entity.data!);
      });


    }


  }
}
