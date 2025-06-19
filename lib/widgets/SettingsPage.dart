import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savekartweb/design/ResponsiveInfo.dart';
import 'package:savekartweb/widgets/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/profile_data_entity.dart';
import '../web/AppStorage.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';
import 'orders.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  ProfileDataData profileDataData=new ProfileDataData();
  Widget currentwidget=Container();


  final List<Map<String, dynamic>> settingsOptions = [
    {'title': 'Profile', 'icon': Icons.person},
    {'title': 'Orders', 'icon': Icons.shopping_bag},
    {'title': 'Wishlist', 'icon': Icons.favorite},
    {'title': 'My Address', 'icon': Icons.location_on},
    {'title': 'Return Requests', 'icon': Icons.assignment_return},
    {'title': 'SaveKart Wallet', 'icon': Icons.account_balance_wallet},
    {'title': 'Privacy Policy', 'icon': Icons.privacy_tip},
    {'title': 'Logout', 'icon': Icons.logout},
    {'title': 'Help Desk', 'icon': Icons.help_outline},
    {'title': 'Delete Account', 'icon': Icons.delete_forever},
  ];

  Future<void> _onOptionTap(String title,int index) async {

    setState(() {

      selectedoption=index;
    });


    if(title.compareTo("Profile")==0)
    {
      setState(() {
        currentwidget=ProfilePage(profileDataData);
      });
    }

   else if(title.compareTo("Orders")==0)
    {


      setState(() {
        currentwidget=Orders();
      });
    }

   else if(title.compareTo("Help Desk")==0)
    {
      ResponsiveInfo.showAlertDialog(context, "SaveKart", "Help Desk  No, : "+"9946109501");
    }


    else if(title.compareTo("Logout")==0)
      {
        bool? confirmed = await ResponsiveInfo.showConfirmDialog(
          context: context,
          title: "Logout",
          content: "Do you really want to logout?",
        );

        if (confirmed == true) {
          // User confirmed
          print("Logging out...");
        } else {
          // User cancelled
          print("Cancelled");
        }
      }
    else if(title.compareTo("Delete Account")==0)
    {
      bool? confirmed = await ResponsiveInfo.showConfirmDialog(
        context: context,
        title: "Delete Account",
        content: "Do you really want to delete your account ?",
      );

      if (confirmed == true) {
        // User confirmed
        print("Logging out...");
      } else {
        // User cancelled
        print("Cancelled");
      }
    }
    else if(title.compareTo("Privacy Policy")==0)
    {

      final Uri url = Uri.parse(
        'https://mysaving.in/IntegraAccount/privacypolicy.html?q=${DateTime.now().toIso8601String()}',
      );

      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Important for web!
      )) {
        throw 'Could not launch $url';
      }

    }


  }

  int _calculateCrossAxisCount(double width) {

    return 2;
  }

  String name="";
  int selectedoption=-1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);

    return Scaffold(
      appBar: AppBar(

        title: Text("",style: TextStyle(fontSize: 14),),


      ),
      body: Row(
        children: [
          Container(child:ListView.builder(
                itemCount: settingsOptions.length,


                itemBuilder: (BuildContext context, int index) {
                  final item = settingsOptions[index];
                  return Padding(padding: EdgeInsets.all(10),child: InkWell(
                    onTap: () => _onOptionTap(item['title'],index),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:(selectedoption==index)? Colors.cyan[50] : Colors.white54,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(item['icon'], size: 25, color: Color(0xff0B7D97)),
                          SizedBox(width: 20),
                          Text(
                            item['title'],
                            textAlign: TextAlign.center,
                            style:  TextStyle(fontSize:(screenWidth>700)? 14:12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ) );
                }),
            width: ResponsiveInfo.isMobile(context)?200:270,
            height: double.infinity,







          ),

          Expanded(child: Stack(

            children: [

              Align(
                child:currentwidget ,
                alignment: FractionalOffset.center,

              )





            ],


          ),)
        ],
      )


     ,
    );
  }





  getProfile()async{

    Map<String,String> m=new HashMap();

    String? userid=await AppStorage.getString(AppStorage.id);
    ApiHelper apihelper = new ApiHelper();
    m['userid']=userid.toString();

    var response= await  apihelper.post(Apimethodes.getUserDetails,formDataPayload: m);



    var js=jsonDecode(response) ;

    print(js);

    ProfileDataEntity entity=ProfileDataEntity.fromJson(js);

    if(entity.status==1)
    {

      setState(() {

        profileDataData=entity.data!;
        String cleanedText = entity.data!.fullName.toString().replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
        print(cleanedText);
        name=cleanedText.trim();
      });

    }



  }




}
