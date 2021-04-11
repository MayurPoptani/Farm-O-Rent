import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Text("Dashboard Page"),
      ),
    );
  }

  Widget myDrawer() => Drawer(
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          menuItem("Rent Items"),
          menuItem("Rent Vehicles"),
          menuItem("Sell Items/Vehicles"),
          Spacer(),
          menuItem("Logout", onClick: () {
            Navigator.of(context).pop();
          }),
        ],
      ),
    ),
  );

  Widget menuItem(String text, {Function onClick}) {
    return TextButton(
      child: Container(
        margin: EdgeInsets.only(left: 16),
        width: double.maxFinite,
        child: Text(text)
      ),
      onPressed: onClick,
    );
  }
}