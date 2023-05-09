import 'package:bus_app/pages/map.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../widget/BottomAppBar.dart';

class DetailRoutePage extends StatelessWidget {
  const DetailRoutePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: const AppBarBottom(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: size.height * 0.35,
                  child: MapSample()),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, top: 10, right: 10, bottom: 10),
                    padding: const EdgeInsets.only(
                        left: 5, top: 10, right: 10, bottom: 10),
                    width: size.width * 0.62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.car_repair,
                          color: Colors.white,
                          size: size.width * 0.1,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 8, right: 0, bottom: 8),
                          child: Align(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "64H1-123-456 ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "0123456***",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width * 0.035),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const StartTimeLine(
                time: "10 phút",
                title: "Điểm 1",
                color: Colors.black12,
              ),
              const ItemTimeLine(
                time: "22 phút",
                title: "Điểm 2",
                color: Colors.white,
              ),
              const ItemTimeLine(
                time: "32 phút",
                title: "Điểm 3",
                color: Colors.white,
              ),
              const ItemTimeLine(
                time: "42 phút",
                title: "Điểm 4",
                color: Colors.white,
              ),
              const ItemTimeLine(
                time: "52 phút",
                title: "Điểm 5",
                color: Colors.white,
              ),
              EndTimeLine(
                time: "60 phút",
                title: "Điểm 6",
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StartTimeLine extends StatelessWidget {
  const StartTimeLine({
    super.key,
    required this.time,
    required this.title,
    this.color,
  });

  final String time;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          width: size.width * 0.05,
          color: Colors.black,
        ),
        endChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  time!,
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.05),
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

class EndTimeLine extends StatelessWidget {
  const EndTimeLine({
    super.key,
    required this.time,
    required this.title,
    this.color,
  });

  final String time;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isLast: true,
        indicatorStyle: IndicatorStyle(
          width: size.width * 0.05,
          color: Colors.black,
        ),
        endChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  time,
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.05),
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

class ItemTimeLine extends StatelessWidget {
  const ItemTimeLine({
    super.key,
    required this.time,
    required this.title,
    this.color,
  });

  final String time;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        indicatorStyle: IndicatorStyle(
          width: size.width * 0.08,
          color: Colors.black,
          iconStyle: IconStyle(
            color: Colors.white,
            iconData: Icons.radio_button_on,
          ),
        ),
        endChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  time,
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.05),
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
