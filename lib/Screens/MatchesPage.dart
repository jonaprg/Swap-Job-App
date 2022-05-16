import 'package:flutter/material.dart';
import 'package:swapjob/Model/Matches.dart';
import 'package:swapjob/Utils/requests.dart';

class MatchesPage extends StatefulWidget {
  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>
    with TickerProviderStateMixin {
  late Future<List<MatchUser>> itemsTemp;
  int itemLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemsTemp = getMatchesUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<MatchUser>>(
        future: itemsTemp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return  Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return MatchList(matches: snapshot.data!);
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

class MatchList extends StatelessWidget {
  const MatchList({Key? key, required this.matches}) : super(key: key);

  final List<MatchUser> matches;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(matches.length, (index) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text('Offer: ' +matches[index].offer.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 24,
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
                            removeMatchOffer(matches[index].offer.id);
                            setState(() {
                              matches.removeAt(index);
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
                                child: Text('Company: ' + matches[index].offer.companyName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              ),
                              Text('Salary: ' + matches[index].offer.salary.toString() + ' €',
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
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
