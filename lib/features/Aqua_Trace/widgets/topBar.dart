import 'package:aqua_trace/models/list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TopBar extends StatefulWidget {
  const TopBar(this._getTotalByDate, {super.key});

  final void Function(List<IncomingList> lists, double _total) _getTotalByDate;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String xp = '0';

  Future<List<IncomingList>> getList() async {
    List<IncomingList> lists = [];
    final dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final response = await dio.get('${dotenv.env["URL"]}/user/date/${uid}',
        data: {"date": _selectedDate.toString().substring(0, 10)});
    print(response.data);
    if (response.statusCode == 200) {
      final data = response.data["result"];
      List dataList = data;
      for (int i = 0; i < dataList.length; i++) {
        IncomingList list =
            IncomingList.fromMap(dataList[i] as Map<String, dynamic>);
        lists.add(list);
      }
      return lists;
    }
    if (response.statusCode == 204) {
      return [];
    } else {
      return [];
    }
  }

  Future<double> getTotal() async {
    final dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final response = await dio.get('${dotenv.env["URL"]}/user/date/${uid}',
        data: {"date": _selectedDate.toString().substring(0, 10)});
    print(response.data);
    if (response.statusCode == 200) {
      return double.parse(response.data["total"]);
    }
    if (response.statusCode == 204) {
      return 0;
    } else {
      return 0;
    }
  }

  void getxp() async {
    final dio = Dio();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final response = await dio.get('${dotenv.env["URL"]}/xp/${uid}');
    setState(() {
      xp = response.data["xp"].toString();
    });
  }

  DateTime _selectedDate = DateTime.now(); // Track selected date

  @override
  void initState() {
    getxp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String buttonText = DateFormat('dd MMM, yyyy')
        .format(_selectedDate); // Format the selected date as "17 Nov, 2024"

    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(
                  'assets/medal.png',
                  height: 33,
                ),
                Text(
                  xp,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 18),
            ),
          ),
          InkWell(
            onTap: () {
              _showDatePicker(context);
            },
            child: CircleAvatar(
              child: Icon(Icons.calendar_month_outlined),
            ),
          )
        ],
      ),
    );
  }

  // Function to show the date picker
  Future<void> _showDatePicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      List<IncomingList> cLists = await getList();
      double _dtotal = await getTotal();

      widget._getTotalByDate(cLists, _dtotal);
    }
  }
}
