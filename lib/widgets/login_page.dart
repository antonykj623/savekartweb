import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:savekartweb/widgets/home_screen.dart';
import 'package:savekartweb/widgets/signup_screen.dart';
import '../color/ColorsData.dart';
import '../design/ResponsiveInfo.dart';
import '../web/AppStorage.dart';
import 'package:http/http.dart' as http;
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';

class LoginPage extends StatefulWidget {
   LoginPage() ;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _obscureText = true;

  TextEditingController mobile=new TextEditingController();
  TextEditingController Password=new TextEditingController();

  String randomnum="";

  String urldata="https://mysaving.in/IntegraAccount/api/";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

        body: Container(

          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Container(
              width: screenWidth > 600 ? 500 : screenWidth * 0.9,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 20)],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Login', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                   TextField(
                    controller:mobile,
                    decoration: InputDecoration(labelText: 'Mobile Number', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 24),
                   TextField(
                    obscureText: _obscureText,
                    controller: Password,
                    decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(),

                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),

                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child:  Text("Forgot Password?",style: TextStyle(color: HexColor(ColrsData.maincolor)),),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      debugPrint('Login clicked');

                      if(mobile.text.trim().isNotEmpty) {

                        if(Password.text.trim().isNotEmpty) {
                          ResponsiveInfo.showLoaderDialog(
                              context);
                          Map<String,String> m=new HashMap();
                          m['uuid']="siuhdfid";
                          m['mobile']=mobile.text.toString();
                          m['password']=Password.text.toString();
                          m['timestamp']=ApiHelper.getTimeStamp();

                          ApiHelper apihelper = new ApiHelper();

                        var response=await
                        apihelper.post(Apimethodes.login+"?q="+ApiHelper.getTimeStamp(),formDataPayload: m);

                        print(response);

                          if(response!=null ) {

                              Navigator.pop(context);
                              var js = jsonDecode(response);

                              if (js['status'].toString().compareTo("0") != 0) {
                                AppStorage.SaveToken(
                                    AppStorage.token, js['token'].toString());

                                AppStorage.setString(AppStorage.id, js['userid'].toString());

                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder:
                                        (context) =>
                                        HomePage()
                                    )
                                );
                              }
                              else {
                                ResponsiveInfo.showAlertDialog(
                                    context, "", "Login failed");
                              }

                          }


                        }
                        else{

                          ResponsiveInfo.showAlertDialog(context, "", "Enter mobile number");
                        }

                      }
                      else{

                        ResponsiveInfo.showAlertDialog(context, "", "Enter mobile number");
                      }

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );

                    },
                    child:  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      child: Text('Login',style: TextStyle(color: HexColor(ColrsData.maincolor))),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(color: HexColor(ColrsData.maincolor))),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()),
                          );
                        },
                        child:  Text("Create Account",style: TextStyle(color: HexColor(ColrsData.maincolor))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons.png'), // or NetworkImage(...)
              fit: BoxFit.cover, // Options: cover, contain, fill, etc.
            ),
          ),
        )





    );
  }
}
