import 'package:farm_o_rent/Dashboard.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset("assets/images/app-logo-black.png",),
                        height: MediaQuery.of(context).size.height*.4,
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Icon(Icons.account_circle_outlined),
                          SizedBox(width: 8,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("SignUp", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          hintText: "First Middle Last"
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: "10 digit phone number",
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "OTP",
                                hintText: "4 digit number"
                              ),
                            ),
                          ),
                          SizedBox(width: 16,),
                          ElevatedButton(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              child: Text("Send OTP"),
                            ),
                            onPressed: () {

                            }, 
                          )
                        ],
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Pin",
                          hintText: "Enter 4 digit pin"
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Confirm Pin",
                          hintText: "Re-enter the 4 digit pin"
                        ),
                      ),
                      SizedBox(height: 32,), 
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text("Open My Account"),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Dashboard()), (route) => false);
                  }, 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}