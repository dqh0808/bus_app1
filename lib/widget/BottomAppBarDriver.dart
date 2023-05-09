
import 'package:flutter/material.dart';

class AppBarBottomDriver extends StatelessWidget {
  const AppBarBottomDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return BottomAppBar(
      notchMargin: 10,
      child: Container(
        height: size.height * 0.07,
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemNavigationBar(title: "Trang chủ", icon: Icons.home, onTap: () {
              Navigator.pushNamed(context, '/home_driver');
            },),
            ItemNavigationBar(title: "Thông báo", icon: Icons.notifications, onTap: () {
              Navigator.pushNamed(context, '/notification');
            },),
            ItemNavigationBar(title: "Tài khoản", icon: Icons.account_circle, onTap: () {
              Navigator.pushNamed(context, '/profile');
            },),

          ],
        ),
      ),
    );
  }
}

class ItemNavigationBar extends StatelessWidget {
  const ItemNavigationBar({
    super.key, required this.title, required this.icon, required this.onTap,
  });
  final String title;
  final IconData icon;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon:  Icon(icon),

        ),
        Text(title, style: const TextStyle(fontSize: 10),),
      ],
    );
  }
}
