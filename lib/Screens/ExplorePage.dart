import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:swapjob/Screens/infoOfferPage.dart';
import 'package:swapjob/Utils/color.dart';

import '../Utils/explore_json.dart';
import '../Utils/icons.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  late CardController controller;

  List itemsTemp = [];
  int itemLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = offer_json;
      itemLength = offer_json.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      bottomSheet: getBottomSheet(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: SizedBox(
        height: size.height,
        child: TinderSwapCard(
          totalNum: itemLength,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          minWidth: MediaQuery.of(context).size.width * 0.75,
          minHeight: MediaQuery.of(context).size.height * 0.75,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                color: secondaryDarkBlueColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white, blurRadius: 5, spreadRadius: 2),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/df3hg_',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Empresa',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),

                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.info_rounded),
                          tooltip: 'Information about the offer',
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InfoOffer()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E2429),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                      child: Text(
                                        'Empleo',

                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                      child: Text(
                                        'Localidad',

                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                    ),
                                    Text(
                                      'Presencialidad',

                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(8, 0, 0, 12),
                                        child: Text(
                                          'BAKCEND',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsetsDirectional.fromSTEB(8, 0, 0, 12),
                                        child: Text(
                                          'Barcelona',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                        child: Text(
                                          '\$50,000 - \$80,000',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E2429),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                  child: Text(
                                    'Requisitos',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 4),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E2429),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E2429),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          cardController: controller = CardController(),
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping
            }
            // print(itemsTemp.length);
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            /// Get orientation & index of swiped card!
            if (index == (itemsTemp.length - 1)) {
              setState(() {
                itemLength = itemsTemp.length - 1;
              });
            }
          },
        ),
      ),
    );
  }

  Widget getBottomSheet() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(item_icons.length, (index) {
            return Container(
              width: item_icons[index]['size'],
              height: item_icons[index]['size'],
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: SvgPicture.asset(
                  item_icons[index]['icon'],
                  width: item_icons[index]['icon_size'],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
