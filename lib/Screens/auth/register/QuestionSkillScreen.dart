import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:swapjobapp/Model/Skill.dart';
import 'package:swapjobapp/Screens/auth/register/QuestionPreferenceScreen.dart';
import 'package:swapjobapp/Utils/color.dart';
import 'package:swapjobapp/Utils/requests.dart';

class QuestionSkillScreen extends StatefulWidget {
  const QuestionSkillScreen(this.userData);
  final Map<String, dynamic> userData;
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<QuestionSkillScreen>
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
    setState(() => {_tagsFutureToSelect = getSkills()});
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
      setState(() {
        _tags.add(tagModel);
      });
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
            return Center(
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
        padding: const EdgeInsets.all(8.0), child: _buildSuggestionWidget());
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
                ))
            .toList(),
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
                  color: thirdBlueColor,
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
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
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
              '¿Que habilidades te desarollas mejor?',
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
          Column(children: [
            Padding(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionPreferenceScreen(
                                widget.userData, _tags)),
                      );
                    });
                  },
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
