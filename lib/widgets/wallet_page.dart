import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:savekartweb/web/AppStorage.dart';

import '../design/ResponsiveInfo.dart';
import '../domain/wallet_balance_entity.dart';
import '../domain/wallet_list_entity.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';

class WalletPage extends StatefulWidget {
   WalletPage() ;

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {


  double walletbalance=0.0;
  List<WalletListData>? data = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWalletBalanceAndPoints();
    getWalletTransactions();
  }

  getWalletTransactions()
  async {
   String? user_id=await AppStorage.getString(AppStorage.id);

    WidgetsBinding.instance.addPostFrameCallback((_) async {

      ResponsiveInfo.showLoaderDialog(context);
    });
   ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();

    var response= await  apihelper.get(Apimethodes.getwalletTransactions+"?q="+t.toString()+"&user_id="+user_id.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      Navigator.pop(context);
    });
    var js= jsonDecode( response) ;

   WalletListEntity walletListEntity=WalletListEntity.fromJson(js);
   if(walletListEntity.status==1)
     {

       setState(() {

         data!.clear();
         data!.addAll(walletListEntity.data!);
       });
     }





  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: MediaQuery.of(context).size.width/2.2,

        child:     Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Expanded(child: Padding(padding: EdgeInsets.all(ResponsiveInfo.isMobile(context)?5:10),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Icon(Icons.wallet,color: Color(0xff0B7D97),size: ResponsiveInfo.isMobile(context)?45:55,),
                    SizedBox(height: 5,),
                    Text("Wallet Balance : "+walletbalance.toString(),style: TextStyle(fontSize: ResponsiveInfo.isMobile(context)?15:17,color: Colors.black),),



                  ],
                )




            ),flex: 1,),

            Expanded(child: (data!.length>0)? ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {

                  // List<String> date=data![index]!.transactionDate.toString().split(" ");
                  // String d=date[0];
                  final dateTime = DateTime.parse(data![index]!.transactionDate.toString());

                  return Card(

                    child:ListTile(
                      leading:  Icon(Icons.wallet,color: Colors.black54,size: ResponsiveInfo.isMobile(context)?25:30,),
                      trailing: (data![index].debit.toString().compareTo("0")==0 && data![index].credit.toString().compareTo("0")!=0) ?
                      Text(
                        "+"+data![index].credit.toString(),
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ) : Text(
                        "-"+data![index].debit.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      title: Text(data![index]!.description.toString()),
                      subtitle: Text(dateTime.day.toString()+"-"+dateTime.month.toString()+"-"+dateTime.year.toString()),

                    ) ,
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                  )


                  ;
                }) : Stack(
              children: [

                Align(
                  alignment: FractionalOffset.center,
                  child: Text("No data found"),
                )
              ],
            ),flex: 5,)







          ],
        )
      )






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
}
