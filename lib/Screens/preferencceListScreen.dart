import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:swapjobapp/Model/Preference.dart';

import '../Model/Skill.dart';
import '../Utils/color.dart';
import '../Utils/requests.dart';


class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen();

  @override
  _PrefrenceScreenState createState() => _PrefrenceScreenState();
}

class _PrefrenceScreenState extends State<PreferenceScreen>
    with SingleTickerProviderStateMixin {

  final List<Preference> _prefrence = [];



  @override
  void initState() {
    super.initState();
    setState(() => {
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  /*
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<List<Skill>>(
          future: _tagsFutureToSelect,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return  Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              _tagsToSelect = snapshot.data!;
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return
                },
              );


            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
    }
*/

}