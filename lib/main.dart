import 'package:farm_o_rent/Dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                "https://img.freepik.com/free-vector/abstract-geometric-shape-connection-with-3d-cubes-background_42705-105.jpg?size=626&ext=jpg&ga=GA1.2.1851586735.1617408000",
              )
            ),
          ),
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle_rounded, size: 96, color: Colors.black),
              Container(
                height: 48,
              ),
              TextField(
                controller: emailC,
                decoration: InputDecoration(
                  labelText: "Enter Email",
                ),
              ),
              Container(
                height: 16,
              ),
              TextField(
                controller: passwordC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                  onPressed: () {
                    print("CLICKED");
                    // print(emailC.text);
                    // print(passwordC.text);
                    // emailC.text = "something@email.com";
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Dashboard()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

