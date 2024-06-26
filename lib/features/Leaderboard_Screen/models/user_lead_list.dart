// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserLeadList {
  final String uid;
  final String totalxp;
  final String name;

  UserLeadList({required this.uid, required this.totalxp,required this.name});

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'totalxp': totalxp,
      'name':name
    };
  }

  factory UserLeadList.fromMap(Map<String, dynamic> map) {
    return UserLeadList(
      uid: map['uid'] as String,
      totalxp: map['totalxp'] as String,
      name:map['name'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLeadList.fromJson(String source) => UserLeadList.fromMap(json.decode(source) as Map<String, dynamic>);
}

// List<UserLeadList> userList = [
//   UserLeadList(
//     userRank: "1",
//     userName: "Aarav Patel",
//     userXP: "500XP",
//   ),
//   UserLeadList(
//     userRank: "2",
//     userName: "Bhavya Shah",
//     userXP: "450XP",
//   ),
//   UserLeadList(
//     userRank: "3",
//     userName: "Chahna Reddy",
//     userXP: "400XP",
//   ),
//   UserLeadList(
//     userRank: "4",
//     userName: "Dhruv Kumar",
//     userXP: "250XP",
//   ),
//   UserLeadList(
//     userRank: "5",
//     userName: "Eshaan Singh",
//     userXP: "240XP",
//   ),
//   UserLeadList(
//     userRank: "6",
//     userName: "Farhan Sharma",
//     userXP: "230XP",
//   ),
//   UserLeadList(
//     userRank: "7",
//     userName: "Gauri Mishra",
//     userXP: "220XP",
//   ),
//   UserLeadList(
//     userRank: "8",
//     userName: "Hema Verma",
//     userXP: "210XP",
//   ),
//   UserLeadList(
//     userRank: "9",
//     userName: "Ishaan Yadav",
//     userXP: "200XP",
//   ),
//   UserLeadList(
//     userRank: "10",
//     userName: "Jiya Gupta",
//     userXP: "190XP",
//   ),
//   UserLeadList(
//     userRank: "11",
//     userName: "Kabir Singh",
//     userXP: "180XP",
//   ),
//   UserLeadList(
//     userRank: "12",
//     userName: "Lakshmi Tiwari",
//     userXP: "170XP",
//   ),
//   UserLeadList(
//     userRank: "13",
//     userName: "Manisha Choudhary",
//     userXP: "160XP",
//   ),
//   UserLeadList(
//     userRank: "14",
//     userName: "Neha Singh",
//     userXP: "150XP",
//   ),
//   UserLeadList(
//     userRank: "15",
//     userName: "Ojasvi Gupta",
//     userXP: "140XP",
//   ),
//   UserLeadList(
//     userRank: "16",
//     userName: "Pranav Sharma",
//     userXP: "130XP",
//   ),
//   UserLeadList(
//     userRank: "17",
//     userName: "Qamar Khan",
//     userXP: "120XP",
//   ),
//   UserLeadList(
//     userRank: "18",
//     userName: "Rajeev Kumar",
//     userXP: "110XP",
//   ),
//   UserLeadList(
//     userRank: "19",
//     userName: "Saanvi Mishra",
//     userXP: "100XP",
//   ),
//   UserLeadList(
//     userRank: "20",
//     userName: "Tanya Sharma",
//     userXP: "90XP",
//   ),
// ];
