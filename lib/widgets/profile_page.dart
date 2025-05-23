import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage() ;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.blueGrey,
      ),
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
    return CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Doe',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          'Flutter Developer',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.email, color: Colors.grey),
            SizedBox(width: 8),
            Text('john.doe@example.com'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey),
            SizedBox(width: 8),
            Text('+91 98765 43210'),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'About Me',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Text(
          'Experienced Flutter developer with a passion for building beautiful and functional apps. Loves exploring new tech and solving real-world problems through code.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
