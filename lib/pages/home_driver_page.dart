import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:bus_app/pages/map.dart';
import 'package:bus_app/widget/BottomAppBarDriver.dart';
import 'package:bus_app/widget/SwitchCustom.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../widget/BottomAppBar.dart';
import '../widget/ButtonDropDown.dart';

class HomeDriverPage extends StatefulWidget {
  const HomeDriverPage({Key? key}) : super(key: key);
  @override
  _HomeDriverPage createState() => _HomeDriverPage();
}

class _HomeDriverPage extends State<HomeDriverPage> {
  String? selectedValue;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: AppBarBottomDriver(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleCustom(title: "BIỂN SỐ XE"),
              const TextFieldCustom(
                hintText: "Biển số xe",
              ),
              const TitleCustom(title: "SỐ ĐIỆN THOẠI"),
              const TextFieldCustom(
                keyboardType: TextInputType.number,
                hintText: "Số điện thoại",
              ),
              const TitleCustom(title: "TUYẾN ĐƯỜNG"),
              Container(
                margin: const EdgeInsets.all(10),
                height: size.height * 0.055,
                width: size.width * 0.88,
                padding: const EdgeInsets.only(left: 30),
                child: CustomDropdownButton2(
                  hint: 'Chọn tuyến đường',
                  dropdownItems: items,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  padding: const EdgeInsets.all(10),
                  width: size.width * 0.38,
                  height: size.height * 0.074,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellowAccent[700],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/detail_route_driver');
                      },
                      child: const Text(
                        'BẮT ĐẦU',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.38, child: MapSample()),
            ],
          ),
        ),
      ),
    );
  }
}
class TitleCustom extends StatelessWidget {
  const TitleCustom({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 40, top: 20),
      alignment: Alignment.centerLeft,
      height: size.height * 0.02,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.hintText,
    this.keyboardType,
  });
  final String hintText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(left: 40, top: 10, right: 40),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
        color: Colors.yellow[100],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          suffixIcon: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.centerRight,
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              controller.clear();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black26,
            ),
            label: const Text(""),
          ),
        ),
      ),
    );
  }
}
