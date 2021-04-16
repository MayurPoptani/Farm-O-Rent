import 'package:amplify_flutter/amplify.dart';
import 'package:farm_o_rent/Dashboard.dart';
import 'package:farm_o_rent/Signup.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController phoneC = TextEditingController(text: "+919876543210");
  TextEditingController pinC = TextEditingController(text: "123456");

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
                controller: phoneC,
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
                      controller: pinC,
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
                      signIn();
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

  signIn() async {
    try {
      await Amplify.Auth.signOut();
      SignInResult result =  await Amplify.Auth.signIn(
        username: phoneC.text.trim(), 
        password: pinC.text.trim(),
      );
      if(result.isSignedIn) {
        print("SIGN IN SUCCESS");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Dashboard()), (route) => false);
      } else {
        // TODO: Promt user that id pass are wrong, check input
        print("SING IN FAILURE");
        print(result.nextStep.signInStep + " = " + result.nextStep.additionalInfo.toString());
      }
      
    } on UserNotConfirmedException catch (e) {
      print("===UserNotConfirmedException===\n"+e.toString());
      print("RESENDING SIGNUP CODE");
      Amplify.Auth.resendSignUpCode(username: phoneC.text.trim());
      // print(res.codeDeliveryDetails.toString());
    } on UserNotFoundException catch (e) {
      print("=== USER NOT FOUND EXCEPTION");
      print(e.message + " = " + e.recoverySuggestion + " = " + e.underlyingException);
    } on AuthException catch (e) {
      print("=== AUTH EXCEPTION");
      print(e.message + " = " + e.recoverySuggestion + " = " + e.underlyingException);
    }
  }

}