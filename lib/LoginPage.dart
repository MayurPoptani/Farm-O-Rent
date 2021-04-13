import 'package:farm_o_rent/Signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.asset("assets/images/app-logo-black.png",)),
              SizedBox(height: 16,),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.account_circle_outlined),
                    SizedBox(width: 8,),
                    Text("Login to your account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "10 Digit Pin Number",
                ),
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Pin Number",
                        hintText: "4 Digit Pin Number",
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Text("Login", style: TextStyle(color: Colors.white,),),
                    ),
                    onPressed: () {
                      
                    },
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Forgot Pin? Click Here", style: TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Signup()));
                          },
                          child: Text("Signup", style: TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}