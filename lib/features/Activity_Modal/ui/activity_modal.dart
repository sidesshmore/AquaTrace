import 'dart:io';

import 'package:aqua_trace/features/Aqua_Trace/ui/aqua_trace.dart';
import 'package:aqua_trace/models/addItem.dart';
import 'package:aqua_trace/models/list.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../bloc/activity_bloc.dart';

class ActivityModal extends StatefulWidget {
  const ActivityModal({super.key});

  @override
  State<ActivityModal> createState() => _ActivityModalState();
}

class _ActivityModalState extends State<ActivityModal> {
  final ActivityBloc activitybloc = ActivityBloc();
  final _activityitemController = TextEditingController();
  final _timeController = TextEditingController();

   String? userName = '';
    final FirebaseAuth auth = FirebaseAuth.instance;

  void setName() async {
    var user = await auth.currentUser;
    setState(() {
      userName = user!.displayName;
    });
  }

  static List<String> _kOptions = [];

  void getAllActivity() async {
    List<String> lists = [];
    final dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final response = await dio
        .get('${dotenv.env["URL"]}/getallactivity');
    if (response.statusCode == 200) {
      final data = response.data["result"];
      List dataList = data;
      for (int i = 0; i < dataList.length; i++) {
        AllActivity list =
            AllActivity.fromMap(dataList[i] as Map<String, dynamic>);
        lists.add(list.activity);
      }
      setState(() {
        _kOptions = lists;
      });
    } else {
      setState(() {
        _kOptions = [];
      });
      ;
    }
  }

  @override
  void initState() {
    setName();
    getAllActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivityBloc, ActivityState>(
      bloc: activitybloc,
      listenWhen: (previous, current) => current is! ActivityActionState,
      buildWhen: (previous, current) => current is ActivityActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          default:
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
                child: Column(
                  children: [
                    Autocomplete<String>(
                      fieldViewBuilder: ((context, textEditingController,
                              focusNode, onFieldSubmitted) =>
                          TextFormField(
                            focusNode: focusNode,
                            onEditingComplete: onFieldSubmitted,
                            controller: textEditingController,
                            decoration: const InputDecoration(
                                hintText:
                                    'Enter a Activity'), 
                          )),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return _kOptions.where((String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        setState(() {
                          _activityitemController.text = selection;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _timeController,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: const InputDecoration(
                              label: Text('Time'),
                              suffixText: 'mins',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final AddActivity item = AddActivity(
                                activityName: _activityitemController.text,
                                time: double.parse(_timeController.text));
                            final dio = Dio();
                            final response = await dio.post(
                                '${dotenv.env["URL"]}/add',
                                data: {
                                  "uid": prefs.getString('uid'),
                                  "item": item.activityName,
                                  "measure": 'mins',
                                  "quantity": item.time,
                                  "name":userName
                                });
                            if (response.statusCode == 200) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'aqua_trace', (route) => false);
                            }
                            //  activitybloc.add(AddActivityItemButtonClicked(item: item));
                          },
                          child: const Text('Save'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
