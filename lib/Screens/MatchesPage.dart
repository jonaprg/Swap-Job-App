import 'package:flutter/material.dart';
import 'package:swapjobapp/Screens/infoMatchPage.dart';
import '/Model/UserMatches.dart';
import '/Utils/requests.dart';
import 'infoOfferPage.dart';

class MatchesPage extends StatefulWidget {
  late Future<List<UserMatch>> itemsMatches;

  MatchesPage(this.itemsMatches);

  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>
    with TickerProviderStateMixin {
  late List<UserMatch> matches;

  int itemLength = 0;
  @override
  void initState() {
    setState(() {
      super.initState();
      widget.itemsMatches = getMatchesUser();
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<UserMatch>>(
        future: widget.itemsMatches,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return  Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            matches = snapshot.data!;
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(matches.length, (indexTwo) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text('Offer: ' +matches[indexTwo].offer.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black)),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.info_rounded),
                                  tooltip: 'Information about the offer',
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InfoMatchOffer(matches[indexTwo])),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {

                                    removeMatchOffer(matches[indexTwo].offer.id);
                                    setState(() {
                                      matches.removeAt(indexTwo);

                                    });
                                  },
                                  child: const Text('REMOVE',
                                      style: TextStyle(color: Colors.red)),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                        child: Text('Company: ' + matches[indexTwo].offer.companyName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black)),
                                      ),
                                      Text('Salary: ' + matches[indexTwo].offer.salary.toString() + ' €',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 20,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                        ],

                      );

                    }),
                  ),
                );
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
}