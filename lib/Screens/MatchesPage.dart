import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swapjobapp/Screens/InfoMatchPage.dart';
import '/Model/UserMatches.dart';
import '/Utils/requests.dart';

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
  FutureOr onGoBack(dynamic value) {
    widget.itemsMatches = getMatchesUser();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<UserMatch>>(
        future: widget.itemsMatches,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
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
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 8),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x411D2429),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 4, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      matches[indexTwo]
                                                          .offer
                                                          .title,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 8, 0),
                                                      child: Text(
                                                        matches[indexTwo]
                                                            .offer
                                                            .companyName,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 8, 0),
                                                      child: Text(
                                                        matches[indexTwo]
                                                                .offer
                                                                .salary
                                                                .toString() +
                                                            "€",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0, 0, 0, 0),
                                                              child: IconButton(
                                                                icon: const Icon(
                                                                    Icons.info_outline_rounded),
                                                                tooltip:
                                                                'Información sobre la oferta',
                                                                onPressed: () async {
                                                                  Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            InfoMatchOffer(
                                                                                matches[
                                                                                indexTwo])),
                                                                  );
                                                                },
                                                              )),

                                                        ],
                                                      ),
                                                      matches[indexTwo].isFinalized == true &&
                                                          matches[indexTwo].isContracted == true ?
                                                      Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(0, 0, 0, 0),
                                                        child: IconButton(
                                                            icon: const Icon(
                                                                Icons.delete_forever_sharp,
                                                            color: Colors.redAccent),
                                                            onPressed: () {
                                                              _showMyDialogRemove(indexTwo);
                                                            }
                                                        ),
                                                      ) : SizedBox(width: 0),
                                                    ],
                                                  ),
                                                ),











                                                matches[indexTwo].isFinalized == false ?
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      _showMyDialogRemove(indexTwo);
                                                    },
                                                    child: const Text('NO ME GUSTA',
                                                        style: TextStyle(
                                                            color: Colors.red)),
                                                  ),
                                                ) : const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text('FINALIZADO',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                matches[indexTwo].isFinalized == true
                                                && matches[indexTwo].isContracted == false ?
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),

                                                  child: OutlinedButton(
                                                    onPressed: ()  { _showMyDialogContracted(indexTwo, true);

                                                    setState(() {
                                                    });
                                                    },
                                                    child: const Text('HE SIDO CONTRACTADO',
                                                        style: TextStyle(
                                                            color: Colors.blueAccent)),
                                                  ),
                                                ): SizedBox(width: 0),
                                                matches[indexTwo].isContracted == true ?
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),

                                                  child: Text('CONTRACTADO',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                        fontSize: 13 ),
                                                  ),
                                                ) : SizedBox(width: 0)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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

  Future<void> _showMyDialogRemove(int indexTwo) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Quieres eliminar la oferta?'),
          actions: <Widget>[
            TextButton(
              child: Text('Confirmar'),
              onPressed: () {
                removeMatchOffer(
                    matches[indexTwo]
                        .offer
                        .id);
                setState(() {
                  matches
                      .removeAt(indexTwo);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _showMyDialogContracted(int indexTwo, bool contracted) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Has sido contractado para esta oferta? Si es así confirma, porfavor'),
          actions: <Widget>[
            TextButton(
              child: Text('Confirmar'),
              onPressed: () {
                contractedMatchOffer(
                    matches[indexTwo].id, contracted);
                setState(() {

                });
                Navigator.of(context).pop();

                },
            ),
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



}
