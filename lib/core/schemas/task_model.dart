import 'package:get/get.dart';

class TaskModel {
  int id;
  String text;
  RxBool isChecked;
  String time;

  TaskModel({
    required this.id,
    required this.text,
    required bool isChecked,
    required this.time,
  }) : isChecked = isChecked.obs;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isChecked': isChecked.value,
      'time': time,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        text: json['text'],
        isChecked: json['isChecked'],
        time: json['time']);
  }
}
