import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

import '../Model/Skill.dart';
import '../Utils/color.dart';
import '../Utils/requests.dart';


class SkillScreen extends StatefulWidget {
  const SkillScreen();

  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen>
    with SingleTickerProviderStateMixin {
  final List<Skill> _tags = [];
  final TextEditingController _tagTextEditingController =
  TextEditingController();

  String get _tagText => _tagTextEditingController.text.trim();

  late Future<List<Skill>> _tagsFutureToSelect;
  late List<Skill> _tagsToSelect;

  refreshState(VoidCallback fn) {
    if (mounted) setState(fn);
  }

  @override
  void initState() {
    super.initState();
    setState(() => {
      _tagsFutureToSelect = getSkills()
    });
  }

  List<Skill> _filterResultList() {

    List<Skill> _tempList = [];
    for (int index = 0; index < _tagsToSelect.length; index++) {
      Skill tagModel = _tagsToSelect[index];
      if (tagModel.title
          .toLowerCase()
          .trim()
          .contains(_tagText.toLowerCase())) {
        _tempList.add(tagModel);
      }
    }

    return _tempList;
  }

  _addTags(tagModel) async {
    if (!_tags.contains(tagModel)) {
      setState(() { _tags.add(tagModel);});

    }
  }

  _removeTag(tagModel) async {
    if (_tags.contains(tagModel)) {
      setState(() {
        _tags.remove(tagModel);
      });
    }
  }

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
                  return _tagIcon();
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

  Widget _tagIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.local_offer_outlined,
          color: thirdBlueColor,
          size: 25.0,
        ),
        _tagsWidget(),
      ],
    );
  }

  _displayTagWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _buildSuggestionWidget()
    );
  }

  Widget _buildSuggestionWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Skills seleccionables'),
      Wrap(
        alignment: WrapAlignment.start,
        children: _filterResultList()
            .where((tagModel) => !_tags.contains(tagModel))
            .map((tagModel) => tagChip(
          tagModel: tagModel,
          onTap: () => _addTags(tagModel),
          action: 'Add',
        )).toList(),
      ),
    ]);

  }

  Widget tagChip({
    tagModel,
    onTap,
    action,
  }) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                  '${tagModel.title}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.orange.shade600,
                radius: 8.0,
                child: Icon(
                  Icons.clear,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  Widget _tagsWidget() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF090F13),
                      size: 30,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tags',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          _tags.length > 0
              ? Column(children: [
            Wrap(
              alignment: WrapAlignment.start,
              children: _tags
                  .map((tagModel) => tagChip(
                tagModel: tagModel,
                onTap: () => _removeTag(tagModel),
                action: 'Remove',
              ))
                  .toSet()
                  .toList(),
            ),
          ])
              : Container(),
          _displayTagWidget(),
        ],
      ),
    );
  }
}