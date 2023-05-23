import 'package:flutter/material.dart';
import 'package:student_data_app/data/student_data.dart';
import 'package:student_data_app/view/student_detail_screen.dart';

import '../model/student_model.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Student> students = [];
  List<Student> examStudents = [];
  List<Student> quizStudents = [];
  List<Student> homeworkStudents = [];

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() {
    for (var data in studentList) {
      students.add(Student.fromMap(data));
    }
    debugPrint((students).toString());
    setState(() {});
    filterData();
  }

  filterData() {
    examStudents = students.where((student) => student.scores![0].score! >= 35).toList();
    quizStudents = students.where((student) => student.scores![1].score! >= 35).toList();
    homeworkStudents = students.where((student) => student.scores![2].score! >= 30).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Student List Screen"),
          centerTitle: true,
          backgroundColor: const Color(0xFFF08E42),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Exam",
              ),
              Tab(
                text: "Quiz",
              ),
              Tab(
                text: "Homework",
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            ListView.separated(
              itemCount: examStudents.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => ListTile(
                leading: ClipOval(child: Image.asset("assets/images/studentimages/${"00000".replaceRange(5 - "${examStudents[index].id}".length, 5, "${examStudents[index].id}")}.png")),
                title: Text(examStudents[index].name!),
                subtitle: Text(examStudents[index].scores![0].score!.toString()),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetailScreen(student: examStudents[index], image: "assets/images/studentimages/${"00000".replaceRange(5 - "${examStudents[index].id}".length, 5, "${examStudents[index].id}")}.png")));
                },
              ),
            ),
            ListView.separated(
              itemCount: quizStudents.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => ListTile(
                leading: ClipOval(child: Image.asset("assets/images/studentimages/${"00000".replaceRange(5 - "${quizStudents[index].id}".length, 5, "${quizStudents[index].id}")}.png")),
                title: Text(quizStudents[index].name!),
                subtitle: Text(quizStudents[index].scores![1].score!.toString()),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetailScreen(student: quizStudents[index], image: "assets/images/studentimages/${"00000".replaceRange(5 - "${quizStudents[index].id}".length, 5, "${quizStudents[index].id}")}.png")));
                },
              ),
            ),
            ListView.separated(
              itemCount: homeworkStudents.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => ListTile(
                leading: ClipOval(child: Image.asset("assets/images/studentimages/${"00000".replaceRange(5 - "${homeworkStudents[index].id}".length, 5, "${homeworkStudents[index].id}")}.png")),
                title: Text(homeworkStudents[index].name!),
                subtitle: Text(homeworkStudents[index].scores![2].score!.toString()),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetailScreen(student: homeworkStudents[index], image: "assets/images/studentimages/${"00000".replaceRange(5 - "${homeworkStudents[index].id}".length, 5, "${homeworkStudents[index].id}")}.png")));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
