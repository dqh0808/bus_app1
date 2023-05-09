import 'package:bus_app/pages/map.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../widget/BottomAppBar.dart';
import '../widget/SwitchCustom.dart';

class DetailRouteDriverPage extends StatefulWidget {
  const DetailRouteDriverPage({Key? key}) : super(key: key);

  @override
  _DetailRouteDriverPageState createState() => _DetailRouteDriverPageState();
}
class _DetailRouteDriverPageState extends State<DetailRouteDriverPage> {
  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: AppBarBottom(),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: size.height * 0.35,

                child: const MapSample()
              ),
              SizedBox(

                height: size.height * 0.03,
              ),


              const StartTimeLineAdmin(title: "Điểm 1",color: Colors.black12,),
              const ItemTimeLineAdmin( title: "Điểm 2", color: Colors.white,),
              const ItemTimeLineAdmin( title: "Điểm 3", color: Colors.white,),
              const ItemTimeLineAdmin(title: "Điểm 4", color: Colors.white,),
              const ItemTimeLineAdmin( title: "Điểm 5", color: Colors.white,),
              const EndTimeLineAdmin( title: "Điểm 6", color: Colors.white,),

            ],
          ),
        ),
      ),
    );
  }
}

class StartTimeLineAdmin extends StatefulWidget {
  const StartTimeLineAdmin({
    super.key,
    required this.title,  this.color,
  });


  final String title;
  final Color? color;

  @override
  State<StartTimeLineAdmin> createState() => _StartTimeLineAdmin();
}

class _StartTimeLineAdmin extends State<StartTimeLineAdmin> {
  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: true,
        indicatorStyle:  IndicatorStyle(
          width: size.width * 0.05,
          color: Colors.black,
        ),
        endChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.title,
                style:  TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: SwitchCustom(
                ),
              ),
            ),
          ],
        ),

        beforeLineStyle: const LineStyle(
          color: Colors.black,
          thickness: 5,
        ),
      ),

    );
  }
}
class EndTimeLineAdmin extends StatefulWidget {
  const EndTimeLineAdmin({
    super.key,
    required this.title,  this.color,
  });


  final String title;
  final Color? color;

  @override
  State<EndTimeLineAdmin> createState() => _EndTimeLineAdmin();
}

class _EndTimeLineAdmin extends State<EndTimeLineAdmin> {
  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isLast: true,
        indicatorStyle:  IndicatorStyle(
          width: size.width * 0.05,
          color: Colors.black,
        ),
        endChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.title,
                style:  TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: SwitchCustom(
                ),
              ),
            ),
          ],
        ),

        beforeLineStyle: const LineStyle(
          color: Colors.black,
          thickness: 5,
        ),
      ),

    );
  }
}
class ItemTimeLineAdmin extends StatefulWidget {
  const ItemTimeLineAdmin({
    super.key,
    required this.title,  this.color,
  });


  final String title;
  final Color? color;


  @override
  State<ItemTimeLineAdmin> createState() => _ItemTimeLineState();
}

class _ItemTimeLineState extends State<ItemTimeLineAdmin> {
  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        indicatorStyle:  IndicatorStyle(
          width: size.width * 0.1,
          color: Colors.black,
          iconStyle: IconStyle(
            color: Colors.white,
            iconData:  Icons.radio_button_on,
          ),
        ),
        endChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style:  TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child:  SwitchCustom(),

              ),
            ),
          ],
        ),
        beforeLineStyle: const LineStyle(
          color: Colors.black,
          thickness: 5,
        ),
      ),
    );
  }
}


