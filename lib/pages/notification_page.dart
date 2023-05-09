import 'package:flutter/material.dart';

import '../widget/BottomAppBar.dart';

class NotificatonPage extends StatefulWidget {
  const NotificatonPage({Key? key}) : super(key: key);
  @override
  _NotificatonPageState createState() => _NotificatonPageState();
}
class _NotificatonPageState extends State<NotificatonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaton Page'),
      ),
      bottomNavigationBar: AppBarBottom(),
      body: Center(
        child: Text('Notificaton Page'),
      ),
    );
  }
}
