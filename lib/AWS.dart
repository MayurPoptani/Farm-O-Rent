import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:farm_o_rent/amplifyconfiguration.dart';

bool isAWSConfigured = false;

configureAWS() async {
  print("Configuring AWS");
  Amplify.addPlugin(AmplifyAuthCognito());
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException catch(e) {
    print(e.message + " = " + e.recoverySuggestion + " = " + e.underlyingException);
  }
  isAWSConfigured = true;
  print("AWS Configured");
}