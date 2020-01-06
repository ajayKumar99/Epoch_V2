import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/api_handler.dart';
import '../API/api_request.dart';
import '../Widgets/gradient_background.dart';
import 'dashboard.dart';


class CourseMenuScreen extends StatefulWidget {
  final SharedPreferences pref;

  CourseMenuScreen({
    this.pref,
  });

  @override
  _CourseMenuScreenState createState() => _CourseMenuScreenState();
}

class _CourseMenuScreenState extends State<CourseMenuScreen> {
  List<String> enrolled_courses = <String>[];
  Map<String, String> _courses = {
    'ADVANCED DATA STRUCTURES AND APPLICATIONS': 'CI631',
    'ADVANCED RADIO ACCESS NETWORKS': 'EC311',
    'AGILE SOFTWARE DEVELOPMENT (B8)': 'CI634',
    'ANTIMICROBIAL RESISTANCE': 'BT632',
    'APPLICATIONAL ASPECTS OF DIFFERENTIAL EQUATIONS': '20B12MA311',
    'APPLIED MATHEMATICAL METHODS': 'MA612',
    'APPLIED MUSHROOM BIOLOGY': 'BT692',
    'BIOECONOMICS': 'BT631',
    'BLOCKCHAIN TECHNOLOGY': 'CS312',
    'CLOUD BASED ENTERPRISE APPLICATIONS': 'CI644',
    'COGNITIVE PSYCHOLOGY': 'HS632',
    'COMPARATIVE AND FUNCTIONAL GENOMICS': 'BT611',
    'COMPARATIVE AND FUNCTIONAL GENOMICS LAB': 'BT671',
    'COMPUTATIONAL INTELLIGENCE': 'CI643',
    'CONTROL SYSTEMS': 'EC613',
    'DATA AND WEB MINING': 'CI635',
    'DATA MINING AND WEB ALGORITHMS(LAB)': '15CI635',
    'DATA STRUCTURES AND ALGORITHMS': 'CI518',
    'DATA STRUCTURES AND ALGORITHMS LAB': 'CI578',
    'ECONOMETRIC ANALYSIS': '19HS611',
    'EFFECTIVE TOOL FOR CAREER MANAGEMENT AND DEVELOPMENT': 'HS612',
    'FRONT END PROGRAMMING': '20B16CS326',
    'GENETIC DISORDERS AND PERSONALIZED MEDICINE': 'BT634',
    'INFO RETRIEVAL AND SEMANTIC WEB': 'CI648',
    'INSTRUMENTATION TECHNIQUES IN BIOTECHNOLOGY': 'BT633',
    'INTRODUCTION TO MOBILE APPLICATION DEVELOPMENT': 'CI633',
    'IOT AND IOT SECURITY': 'CS311',
    'JAVA PROGRAMMING': '20B16CS322',
    'LIGHT EMITTING DIODES: BASICS & APPLICATIONS': 'PH692',
    'LITERATURE & ADAPTION': 'HS636',
    'MARKETING MANAGEMENT': '18HS611',
    'MEDICAL AND INDUSTRIAL APPLICATIONS OF \xa0NUCLEAR RADIATIONS': 'PH636',
    'MORALITIES OF EVERYDAY LIFE AND MORAL DECISION MAKING': '13HS611',
    'NANOSCIENCE IN FOOD TECHNOLOGY': 'BT311',
    'NON-LINEAR DATA STRUCTURES & PROBLEM SOLVING': '20B16CS324',
    'NUMERICAL APTITUDE': 'MA691',
    'OPERATIONS RESEARCH': 'MA611',
    'ORGANISATIONAL BEHAVIOR': 'HS635',
    'PHOTOVOLTAIC': 'PH633',
    'PROBLEM SOLVING USING C AND C++': '20B16CS323',
    'PROJECT MANAGEMENT(4 LECTURES)': 'HS631',
    'RENEWABLE ENERGY': 'EC691',
    'SOCIAL MEDIA AND SOCIETY': 'HS612',
    'SOLID STATE ELECTRONIC DEVICES': 'PH632',
    'STATISTICS': 'MA633',
    'TELECOMMUNICATION NETWORKS': 'EC611',
    'TELECOMMUNICATION NETWORKS LAB': 'EC671',
    'THEORY OF COMPUTATION AND COMPILER DESIGN': 'CI611',
    'THEORY OF PROGRAMMING LANGUAGES': 'CI612',
    'WIRELESS NETWORKS': 'CI642',
  };

  Map<String, bool> _boolcoursemap = {
    'ADVANCED DATA STRUCTURES AND APPLICATIONS': false,
    'ADVANCED RADIO ACCESS NETWORKS': false,
    'AGILE SOFTWARE DEVELOPMENT (B8)': false,
    'ANTIMICROBIAL RESISTANCE': false,
    'APPLICATIONAL ASPECTS OF DIFFERENTIAL EQUATIONS': false,
    'APPLIED MATHEMATICAL METHODS': false,
    'APPLIED MUSHROOM BIOLOGY': false,
    'BIOECONOMICS': false,
    'BLOCKCHAIN TECHNOLOGY': false,
    'CLOUD BASED ENTERPRISE APPLICATIONS': false,
    'COGNITIVE PSYCHOLOGY': false,
    'COMPARATIVE AND FUNCTIONAL GENOMICS': false,
    'COMPARATIVE AND FUNCTIONAL GENOMICS LAB': false,
    'COMPUTATIONAL INTELLIGENCE': false,
    'CONTROL SYSTEMS': false,
    'DATA AND WEB MINING': false,
    'DATA MINING AND WEB ALGORITHMS(LAB)': false,
    'DATA STRUCTURES AND ALGORITHMS': false,
    'DATA STRUCTURES AND ALGORITHMS LAB': false,
    'ECONOMETRIC ANALYSIS': false,
    'EFFECTIVE TOOL FOR CAREER MANAGEMENT AND DEVELOPMENT': false,
    'FRONT END PROGRAMMING': false,
    'GENETIC DISORDERS AND PERSONALIZED MEDICINE': false,
    'INFO RETRIEVAL AND SEMANTIC WEB': false,
    'INSTRUMENTATION TECHNIQUES IN BIOTECHNOLOGY': false,
    'INTRODUCTION TO MOBILE APPLICATION DEVELOPMENT': false,
    'IOT AND IOT SECURITY': false,
    'JAVA PROGRAMMING': false,
    'LIGHT EMITTING DIODES: BASICS & APPLICATIONS': false,
    'LITERATURE & ADAPTION': false,
    'MARKETING MANAGEMENT': false,
    'MEDICAL AND INDUSTRIAL APPLICATIONS OF \xa0NUCLEAR RADIATIONS': false,
    'MORALITIES OF EVERYDAY LIFE AND MORAL DECISION MAKING': false,
    'NANOSCIENCE IN FOOD TECHNOLOGY': false,
    'NON-LINEAR DATA STRUCTURES & PROBLEM SOLVING': false,
    'NUMERICAL APTITUDE': false,
    'OPERATIONS RESEARCH': false,
    'ORGANISATIONAL BEHAVIOR': false,
    'PHOTOVOLTAIC': false,
    'PROBLEM SOLVING USING C AND C++': false,
    'PROJECT MANAGEMENT(4 LECTURES)': false,
    'RENEWABLE ENERGY': false,
    'SOCIAL MEDIA AND SOCIETY': false,
    'SOLID STATE ELECTRONIC DEVICES': false,
    'STATISTICS': false,
    'TELECOMMUNICATION NETWORKS': false,
    'TELECOMMUNICATION NETWORKS LAB': false,
    'THEORY OF COMPUTATION AND COMPILER DESIGN': false,
    'THEORY OF PROGRAMMING LANGUAGES': false,
    'WIRELESS NETWORKS': false,
  };

  Widget checkbox(String title, bool boolValue) {
    return Checkbox(
      value: boolValue,
      onChanged: (bool value) {
        setState(() {
          _boolcoursemap[title] = value;
          value
              ? enrolled_courses.add(_courses[title])
              : enrolled_courses.remove(_courses[title]);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _snackbar = SnackBar(
      content: Text('You are enrolled to only 8 subjects.'),
      backgroundColor: Colors.deepPurple,
    );
    print(enrolled_courses);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBackground(),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: ListTile(
                  title: Text(
                    "Select your subjects",
                    style: TextStyle(
                      fontFamily: 'Amatic SC',
                      fontSize: 48.0,
                    ),
                  ),
                  trailing: Builder(
                    builder: (context) => InkWell(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          int counter = 0;
                          _boolcoursemap.forEach((String sub, bool issel) {
                            if (issel) {
                              counter++;
                            }
                          });
                          if (counter <= 8) {
                            ApiRequest _user = ApiRequest(
                              widget.pref.getString('batch'),
                              enrolled_courses,
                            );
                            print(_user.toJson());
                            ApiHandler _apiHandler = ApiHandler(req: _user);
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => FutureBuilder(
                                future: _apiHandler.requestServer(),
                                builder: (context, response) {
                                  if (response.hasData) {
                                    widget.pref.setString(
                                        'result', jsonEncode(response.data));
                                    
                                    return Dashboard(
                                      pref: widget.pref,
                                    );
                                  }
                                  return Center(child: CircularProgressIndicator());
                                },
                              ),
                            );
                          } else {
                            Scaffold.of(context).showSnackBar(_snackbar);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: _boolcoursemap.keys.toList().length,
                    itemBuilder: (context, index) {
                      String course = _boolcoursemap.keys.toList()[index];
                      return ListTile(
                        leading: Icon(Icons.book),
                        title: Text(
                          course,
                          style: TextStyle(
                            fontFamily: 'Amatic SC',
                            color: Colors.white,
                            fontSize: 23.0,
                          ),
                        ),
                        trailing: checkbox(course, _boolcoursemap[course]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}