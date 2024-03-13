import 'package:aqua_trace/models/addItem.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Food_Repo{
  static Future<bool> addActivity(AddFood items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final category=items.category.toString().substring(9);
      final dio = Dio();
      final response = await dio
          .post('https://long-pink-swallow-belt.cyclic.app/add', data: {
        "uid": prefs.getString('uid'),
        "item": items.itemName,
        "waterfootprint": "80",
        "measure": category,
        "quantity": items.quantity
      });
      print(response);
      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}