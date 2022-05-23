import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Utils/color.dart';
import '../Home.dart';
import '../../../Utils/requests.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  late LocalAuthentication _localAth;

  bool _isBiometricAvailable = false;
  bool _userWantsBiometrics = true;

  bool _isLoading = false;
  String email = '';
  String password = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _localAth = LocalAuthentication();
    _localAth.canCheckBiometrics.then((result) {
      setState(() {
        _isBiometricAvailable = result;
        checkFingerPrint();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 50),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: FloatingActionButton(
            elevation: 10,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: primaryOrangeColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: const <Widget>[
                  Padding(
                    child: Text(
                      "LOG IN",
                      style: TextStyle(fontSize: 40),
                    ),
                    padding: EdgeInsets.only(left: 50, top: 120),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Email",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                      helperStyle: TextStyle(
                          color: secondaryDarkBlueColor, fontSize: 15),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Password",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryOrangeColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  )
                ]),
              ),
              email.isNotEmpty && password.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        thirdBlueColor.withOpacity(.5),
                                        thirdBlueColor.withOpacity(.8),
                                        thirdBlueColor,
                                        thirdBlueColor
                                      ])),
                              height: MediaQuery.of(context).size.height * .065,
                              width: MediaQuery.of(context).size.width * .75,
                              child: Center(
                                  child: Text(
                                "CONTINUE",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ))),
                          onTap: () {
                            setState(() {
                              _isLoading = true;
                            });
                            if (_isBiometricAvailable && _userWantsBiometrics) {
                              showAlertDialog(context);
                            }
                          },
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(25),
                                  color: primaryOrangeColor),
                              height: MediaQuery.of(context).size.height * .065,
                              width: MediaQuery.of(context).size.width * .75,
                              child: Center(
                                  child: Text(
                                "CONTINUE",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ))),
                          onTap: () {},
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  login(String email, String password) async {
    bool success = await performLogin(email, "P@ssw0rd");
    //bool success = await performLogin("pako@astapor.com", "P@ssw0rd");
    if (success) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (Route<dynamic> route) => false);
    } else {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The user not exists, bad credentials")));
      });
    }
  }

  void checkFingerPrint() {
    SharedPreferences.getInstance().then((prefs) async {
      _userWantsBiometrics = prefs.getBool("userWantsBiometrics") ?? true;
      if (_userWantsBiometrics) {
        if (prefs.getString('email') != null &&
            prefs.getString('password') != null &&
            prefs.getString('email') != '' &&
            prefs.getString('password') != '') {
          bool didAuthenticate = await _localAth.authenticate(
              localizedReason: "Iniciar sesion con huella");
          if (didAuthenticate) {
            login(prefs.getString('email')!, prefs.getString('password')!);
          }
        }
      }
    });
  }

  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("NO"),
      onPressed: () {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool("userWantsBiometrics", false);
        });
        _userWantsBiometrics = false;
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("YES"),
      onPressed: () {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool("userWantsBiometrics", true);
          prefs.setString('email', emailController.text);
          prefs.setString('password', passwordController.text);
        });
        _userWantsBiometrics = true;
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Biometrics detected"),
      content: Text("Would you like to use the biomethrics sensor?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) => login(emailController.text, passwordController.text));
  }
}
