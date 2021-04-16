import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:farm_o_rent/Dashboard.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController otpC = TextEditingController();
  TextEditingController pinC = TextEditingController();
  TextEditingController confirmPinC = TextEditingController();

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
                        controller: nameC,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          hintText: "First Middle Last"
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: phoneC,
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
                              controller: otpC,
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
                              // sendOTP();
                            }, 
                          )
                        ],
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: pinC,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Pin",
                          hintText: "Enter 4 digit pin"
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: confirmPinC,
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
                    signUp();
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Dashboard()), (route) => false);
                  }, 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signUp() async {
    try {
      Map<String, String> userAttributes = {'phone_number': '+91'+phoneC.text.trim(), "name" : nameC.text.trim()};
      SignUpResult res = await Amplify.Auth.signUp(
        username: "+91"+phoneC.text.trim(),
        password: pinC.text.trim(),
        options: CognitoSignUpOptions(userAttributes: userAttributes)
      );
      print(res.isSignUpComplete);
    } on UserNotConfirmedException catch (e) {
      print("===UserNotConfirmedException===\n"+e.toString());
      print("RESENDING SIGNUP CODE");
      var res = await Amplify.Auth.resendSignUpCode(username: '+91'+phoneC.text.trim());
      print(res.codeDeliveryDetails.toString());
    } on AuthException catch (e) {
      print(e.message);
      print(e.underlyingException);
    }
  }

}