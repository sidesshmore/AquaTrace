import 'package:aqua_trace/features/Charts/ui/chat_interface.dart';
import 'package:aqua_trace/features/Charts/ui/line_chart.dart';
import 'package:aqua_trace/features/Charts/ui/water_card.dart';
import 'package:aqua_trace/models/foodCardData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    foodList;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Text(
            '7 day Waterfootprint',
            style: TextStyle(
                fontSize: height * 0.045, fontWeight: FontWeight.bold),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: height * 0.50,
                child: LineChartWidget(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue.shade600,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return ChatInterface();
              });
        },
        child: Icon(
          Icons.smart_toy,
          color: Colors.white,
          size: height * 0.033,
        ),
      ),
    );
  }
}
