import 'package:flutter/material.dart';

class CreateNewTask extends StatelessWidget {
  const CreateNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 70,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Row(
              children: const [
                Icon(
                  Icons.check,
                  size: 28,
                  color: Colors.black,
                ),
                Text(
                  'save',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios,
                size: 28,
                color: Colors.grey,
              ),
              Text(
                'Lists',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 20,
            ),
            Text(
              'Create new task',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Here you can add a brief description for your task, with about 15 words',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
