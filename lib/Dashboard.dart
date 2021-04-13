import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Dashboard", style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: [
            menuItem("Rent Tools"),
            menuItem("Rent Vehicles"),
            menuItem("Rent Warehouses"),
            menuItem("Sell Tools"),
            menuItem("Sell Vehicles"),
          ],
        ),
      ),
    );
  }

  Widget menuItem(String str) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.add_shopping_cart_sharp),
            SizedBox(width: 16,),
            Text(str, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }

}