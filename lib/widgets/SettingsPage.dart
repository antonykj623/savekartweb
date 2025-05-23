import 'package:flutter/material.dart';
import 'package:savekartweb/design/ResponsiveInfo.dart';
import 'package:savekartweb/widgets/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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

  Future<void> _onOptionTap(String title) async {


    if(title.compareTo("Profile")==0)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);

    return Scaffold(
      appBar: AppBar(

        title: Text("Kumar Udith"),


      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: settingsOptions.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, index) {
            final item = settingsOptions[index];
            return InkWell(
              onTap: () => _onOptionTap(item['title']),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.cyan[50],
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
                    Icon(item['icon'], size: (screenWidth>700)? 40:25, color: Color(0xff0B7D97)),
                     SizedBox(width: 20),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style:  TextStyle(fontSize:(screenWidth>700)? 14:12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
