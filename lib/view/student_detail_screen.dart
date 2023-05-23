import 'package:flutter/material.dart';

import '../model/student_model.dart';

class StudentDetailScreen extends StatefulWidget {
  final Student student;
  final String? image;

  const StudentDetailScreen({Key? key, required this.student, required this.image}) : super(key: key);

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF08E42),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Text(
            "All Details Of Student",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
              child: Center(
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(widget.image!),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Text(
                  widget.student.name!.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Text(
                  " Exam Score : ${widget.student.scores![0].score!.toString()}",
                  style: const TextStyle(
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Text(
                  " quiz Score : ${widget.student.scores![1].score!.toString()}",
                  style: const TextStyle(
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                Text(
                  " homework Score : ${widget.student.scores![2].score!.toString()}",
                  style: const TextStyle(
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),

                // Text(student!.toMap().toString()),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
