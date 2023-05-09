import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({Key? key}) : super(key: key);
  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? _router;
    return Scaffold(
        appBar: AppBar(
          title: Text(_router ?? 'Home Admin Page'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,

              ),
              Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/map.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                width: size.width,
                height: size.height * 0.05,
                color: Colors.yellow,
                child: const Text(
                  "INFORMATION",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: size.width,
                color: Colors.grey[400],
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 0, bottom: 10),
                child: Column(
                  children: const [
                    ItemInformation(
                      icon: Icon(Icons.location_on),
                      title: "Location",
                    ),
                    ItemInformation(
                      icon: Icon(Icons.location_on),
                      title: "Location",
                    ),
                    ItemInformation(
                      icon: Icon(Icons.location_on),
                      title: "Location",
                    ),
                    ItemInformation(
                      icon: Icon(Icons.location_on),
                      title: "Location",
                    ),
                    ItemInformation(
                      title: "Location",
                      text: "Location",
                    ),
                    StartTimeLineAdmin(child: ItemTimeLine(id: "ID 00001", title:"Location"),),
                    ItemTimeLineAdmin(child: ItemTimeLine(id: "2", title:"Location"),),
                    ItemTimeLineAdmin(child: ItemTimeLine(id: "3", title:"Location"),),
                    ItemTimeLineAdmin(child: ItemTimeLine(id: "4", title:"Location"),),
                    ItemTimeLineAdmin(child: ItemTimeLine(id: "5", title:"Location"),),
                    EndTimeLineAdmin(child: ItemTimeLine(id: "6", title:"Location"),),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class ItemInformation extends StatefulWidget {
  const ItemInformation({
    super.key,
    this.icon,
    required this.title,
    this.text,
  });

  final Icon? icon;
  final String title;
  final String? text;

  @override
  State<ItemInformation> createState() => _ItemInformationState();
}

class _ItemInformationState extends State<ItemInformation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
          height: size.height * 0.05,
          width: size.width * 0.265,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: widget.icon ?? Text(widget.text ?? ""),
        ),
        Expanded(
          child: Align(
            child: Container(
              height: size.height * 0.045,
              width: size.width * 0.8,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                height: size.height * 0.05,
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StartTimeLineAdmin extends StatefulWidget {
  const StartTimeLineAdmin({
    super.key,
    this.title,
    this.color,
    required this.child,
  });

  final String? title;
  final Color? color;
  final Widget child;

  @override
  State<StartTimeLineAdmin> createState() => _StartTimeLineAdmin();
}

class _StartTimeLineAdmin extends State<StartTimeLineAdmin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.0525,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          width: size.width * 0.05,
          color: Colors.green,
        ),
        endChild: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.title ?? '',
                style:
                TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            widget.child,
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
    required this.id, required this.title,
  });
  final String title;

  final String id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: size.height * 0.05,
          width: size.width * 0.15,
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Text(id, style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
        ),
        Container(
          alignment: Alignment.center,
          height: size.height * 0.05,
          margin: const EdgeInsets.only(left: 10),
          width: size.width * 0.66,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Text(title, style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

class EndTimeLineAdmin extends StatefulWidget {
  const EndTimeLineAdmin({
    super.key,
    this.title,
    this.color,
    required this.child,
  });

  final String? title;
  final Color? color;
  final Widget child;

  @override
  State<EndTimeLineAdmin> createState() => _EndTimeLineAdmin();
}

class _EndTimeLineAdmin extends State<EndTimeLineAdmin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,

        lineXY: 0.0525,
        isLast: true,
        indicatorStyle: IndicatorStyle(
          width: size.width * 0.05,
          color: Colors.red,
        ),
        endChild: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.title ?? '',
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            widget.child,
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
    this.title,
    this.color,
    required this.child,
  });

  final String? title;
  final Color? color;
  final Widget child;

  @override
  State<ItemTimeLineAdmin> createState() => _ItemTimeLineState();
}

class _ItemTimeLineState extends State<ItemTimeLineAdmin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.01,
        indicatorStyle: IndicatorStyle(
          width: size.width * 0.1,
          color: Colors.black,
          iconStyle: IconStyle(
            color: Colors.white,
            iconData: Icons.radio_button_on,
          ),
        ),
        endChild: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                widget.title ?? "",
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
            widget.child,
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
