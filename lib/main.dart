import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:savekartweb/web/AppStorage.dart';
import 'package:savekartweb/widgets/home_screen.dart';
import 'package:savekartweb/widgets/login_page.dart';
import 'color/ColorsData.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Savekart Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor(ColrsData.maincolor) ),
        useMaterial3: true,

      ),
      home:  MySplashPage(title: 'SaveKart',),
    );
  }


}

class MySplashPage extends StatefulWidget {
   MySplashPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MySplashPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MySplashPage> {




  redirecToNextPage()async
  {
    Future.delayed(Duration(seconds: 3), ()  async {
      // code to be executed after 2 seconds

      String? token =await AppStorage.getString(AppStorage.token);

      if(token!=null)
      {

        if(token.toString().isNotEmpty)
        {

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                      HomePage()
              )
          );
        }
        else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  LoginPage()
              )
          );
        }



      }
      else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginPage()
            )
        );

      }



    });
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirecToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xffffffff),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        child:Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            CircularProgressIndicator()

          ],
        ) ,
      )




      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


