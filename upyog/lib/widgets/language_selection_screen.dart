import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedOption = 'en_IN';
  List<Map<String, String>> _languages = [];
  String? logoUrl;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final url = Uri.parse(
        'https://upyog.niua.org/egov-mdms-service/v1/_search?tenantId=pg');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "MdmsCriteria": {
        "tenantId": "pg",
        "moduleDetails": [
          {
            "moduleName": "common-masters",
            "masterDetails": [
              {"name": "Department"},
              {"name": "Designation"},
              {"name": "StateInfo"},
              {"name": "wfSlaConfig"},
              {"name": "uiHomePage"}
            ]
          },
          {
            "moduleName": "tenant",
            "masterDetails": [
              {"name": "tenants"},
              {"name": "citymodule"}
            ]
          },
          {
            "moduleName": "DIGIT-UI",
            "masterDetails": [
              {"name": "ApiCachingSettings"}
            ]
          }
        ]
      },
      "RequestInfo": {
        "apiId": "Rainmaker",
        "msgId": "1722101824836|en_IN",
        "plainAccessRequest": {}
      }
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // Handle the successful response here
        print('Data fetched successfully');
        print('Response body: ${response.body}');

        // Decode the response body
        final data = jsonDecode(utf8.decode(response.bodyBytes));

        // Extract the languages and logoUrl
        if (data['MdmsRes'] != null &&
            data['MdmsRes']['common-masters'] != null &&
            data['MdmsRes']['common-masters']['StateInfo'] != null) {
          List<Map<String, String>> languages = [];
          for (var stateInfo in data['MdmsRes']['common-masters']
              ['StateInfo']) {
            for (var lang in stateInfo['languages']) {
              languages.add({
                'label': lang['label'] as String,
                'value': lang['value'] as String,
              });
            }
            logoUrl = stateInfo['logoUrl'];
          }

          setState(() {
            _languages = languages;
          });

          // Debugging print statements
          print('Languages fetched: $_languages');
          print('Logo URL: $logoUrl');
        }
      } else {
        // Handle the error response here
        print('Failed to fetch data');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle the exception here
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: const Color(0xFF8D143F),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                logoUrl != null
                    ? Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.network(
                          logoUrl!,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(),
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 80, right: 50, bottom: 150, left: 30),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Choose your language',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _languages.map((language) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    language['label']!,
                                    style: const TextStyle(fontSize: 25),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 2,
                                  child: Radio<String>(
                                    activeColor: const Color(0xFF8D143F),
                                    value: language['value']!,
                                    groupValue: _selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedOption = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      //const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 30, right: 30),
                        child: InkWell(
                          onTap: () {
                            print('hello');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2.0),
                                color: const Color(0xFF8D143F)),
                            child: const Center(
                                child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
