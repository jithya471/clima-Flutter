// ignore_for_file: unused_local_variable

import 'dart:io';

void main() {
  performTask();
}

void performTask() async{
  task1();
  String task2Result =await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('task 1 completed');
}

Future task2() async{
  Duration threeseconds = Duration(seconds: 3);
  String? result;
 await Future.delayed(threeseconds, () {
    String result = 'task 2 data';
    print('task 2 completed');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('task 3 completed with $task2Data');
}
