import 'package:flutter/material.dart';

import '../widget/BottomAppBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
      ),
      bottomNavigationBar: AppBarBottom(),
      body: Center(
        child: Text('Account Page'),
      ),
    );
  }
}