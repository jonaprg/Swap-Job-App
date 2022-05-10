import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:swapjob/Screens/infoOfferPage.dart';
import 'package:swapjob/Utils/color.dart';
import 'package:swapjob/Utils/requests.dart';

import '../Model/Offer.dart';
import '../Utils/icons.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  late CardController controller;

  late Future<List<Offer>?> itemsTemp;
  int itemLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = getOffers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Offer>>(
        future: getOffers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomSheet: getBottomSheet(),
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

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Offer> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].description);
      },
    );
  }
}
