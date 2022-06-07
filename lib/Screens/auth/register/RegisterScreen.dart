import 'package:flutter/material.dart';
import '/Utils/color.dart';
import 'UserNameRScreen.dart';
import '/Utils/requests.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  Map<String, dynamic> userData = {}; //user personal info
  bool _isLoading = false;
  String email = '';
  String password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
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
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  color: Colors.orange, size: 20),
              tooltip: 'Back',
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
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
                      "Crear cuenta",
                      style: TextStyle(fontSize: 30),
                    ),
                    padding: EdgeInsets.only(left: 50, top: 120),
                  ),
                  Padding(
                    child: Text(
                      " | PASO 1 DE 4",
                      style: TextStyle(fontSize: 15),
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(220, 135, 0, 0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 23),
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      hintText: "Correo",
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
                    obscureText: _isObscure,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: const TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      hintText: "Contraseña",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
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
                                "CONTINUAR",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ))),
                          onTap: () {
                            setState(() {
                              _isLoading = true;
                            });
                            //signup(emailController.text, passwordController.text);
                            signup(emailController.text, passwordController.text);
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
                                "CONTINUAR",
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

  Future signup(String email, String password) async {
    var response = await userExists(email);
    if (!response) {
      setState(() {
        _isLoading = false;
        userData.addAll(
            {'email': email, 'password': password});
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserNameRScreen(userData)),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("The user already exists, try again or go to login")));
    }
  }


}
