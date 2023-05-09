
import 'package:flutter/material.dart';

class AppBarBottom extends StatelessWidget {
  const AppBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    final size= MediaQuery.of(context).size;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        _currentIndex = index;
        if (index == 0) {
          Navigator.pushNamed(context, '/home_user');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/notification');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/profile');
        }
      },

      items: [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Thông báo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Tài khoản',
        ),
      ],




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
