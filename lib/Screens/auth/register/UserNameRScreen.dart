import 'package:flutter/material.dart';
import '/Utils/color.dart';
import 'QuestionSkillScreen.dart';

class UserNameRScreen extends StatefulWidget {
  Map<String, dynamic> userData;

  UserNameRScreen(this.userData);

  @override
  _UserNameRScreenState createState() => _UserNameRScreenState();
}

class _UserNameRScreenState extends State<UserNameRScreen> {
  DateTime currentDate = DateTime.now();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
                      " | PASO 2 DE 4",
                      style: TextStyle(fontSize: 15),
                    ),
                    padding: EdgeInsetsDirectional.fromSTEB(220, 135, 0, 0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(children: <Widget>[

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                      controller: firstNameController,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        labelStyle: const TextStyle(
                          fontFamily: 'Maven',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        hintStyle: const TextStyle(
                          fontFamily: 'Maven',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Maven',
                        color: Color(0xFF0F1113),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      onChanged: (value) {
                        setState(() {
                          value = firstNameController.text;
                        });
                      }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                        controller: lastNameController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Apellido/s',
                          labelStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          hintStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Maven',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (value) {
                          setState(() {
                            value = lastNameController.text;
                          });
                        }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                        controller: postalCodeController,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'C??digo postal',
                          labelStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          hintText: 'Only 5 digits',
                          hintStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Maven',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (value) {
                          setState(() {
                            value = postalCodeController.text;
                          });
                        }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                        controller: phoneController,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'M??vil',
                          labelStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          hintText: 'Only 9 digits.',
                          hintStyle: TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Maven',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (value) {
                          setState(() {
                            value = phoneController.text;
                          });
                        }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                        controller: birthDateController,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Fecha de nacimiento | YYYY-MM-DD',
                          labelStyle: TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          hintStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Maven',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (value) {
                          setState(() {
                            value = birthDateController.text;
                          });
                        }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: TextFormField(
                        controller: descriptionController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Descripci??n',
                          labelStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          hintStyle: const TextStyle(
                            fontFamily: 'Maven',
                            color: Color(0xFF0F1113),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF1F4F8),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Maven',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        onChanged: (value) {
                          setState(() {
                            value = descriptionController.text;
                          });
                        }
                    ),
                  ),
                ]),
              ),
              firstNameController.text.isNotEmpty &&
                      lastNameController.text.isNotEmpty && phoneController.text.isNotEmpty
              && postalCodeController.text.isNotEmpty && descriptionController.text.isNotEmpty
              && birthDateController.text.isNotEmpty
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
                                        primaryOrangeColor.withOpacity(.5),
                                        primaryOrangeColor.withOpacity(.8),
                                        primaryOrangeColor,
                                        primaryOrangeColor
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
                            widget.userData.addAll({
                              "firstName": firstNameController.text,
                              "lastName": lastNameController.text,
                              "postalCode":
                                  int.parse(postalCodeController.text),
                              "phone": phoneController.text,
                              "birthDate": birthDateController.text,
                              "description": descriptionController.text,
                              "companyUser": false
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QuestionSkillScreen(widget.userData)),
                            );
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
                              ),
                              height: MediaQuery.of(context).size.height * .065,
                              width: MediaQuery.of(context).size.width * .75,
                              child: Center(
                                  child: Text(
                                "CONTINUAR",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: secondaryDarkBlueColor,
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
}
