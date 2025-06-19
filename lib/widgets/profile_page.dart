import 'package:flutter/material.dart';

import '../domain/profile_data_entity.dart';

class ProfilePage extends StatelessWidget {
  ProfileDataData profileDataData;
   ProfilePage(this.profileDataData) ;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(

      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          constraints: BoxConstraints(maxWidth: 1000),
          child: isWide ? _buildWideLayout() : _buildMobileLayout(),
        ),
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfilePicture(),
        SizedBox(width: 40),
        Expanded(child: _buildDetails()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildProfilePicture(),
        SizedBox(height: 20),
        _buildDetails(),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return (profileDataData.profileImage.toString().isEmpty)? CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage(profileDataData.profileImage.toString()),
    ) :   GestureDetector(
      onTap: (){


      }, // Allow image change on tap
      child: CircleAvatar(
          radius: 50,
          backgroundImage:  AssetImage('assets/icons.png')
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profileDataData.fullName.toString(),
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          'User Name : '+ (profileDataData.username.toString().isEmpty?"No Data"  :  profileDataData.username.toString()),
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.email, color: Colors.grey),
            SizedBox(width: 8),
            Text( (profileDataData.emailId.toString().isEmpty?"No Data"  :  profileDataData.emailId.toString())),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey),
            SizedBox(width: 8),
            Text((profileDataData.mobile.toString().isEmpty?"No Data"  :  profileDataData.mobile.toString())),
          ],
        ),
        SizedBox(height: 20),

        SizedBox(height: 10),

      ],
    );
  }
}
