import 'package:final_exam_app/crudfile.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            // Name TextFormField
            SizedBox(
              width: 420,
              child: TextFormField(
                onChanged: (String name) {
                  getUserName(name);
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.person, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Email TextFormField
            SizedBox(
              width: 420,
              child: TextFormField(
                onChanged: (String email) {
                  getUserEmail(email);
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.email, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Number TextFormField
            SizedBox(
              width: 420,
              child: TextFormField(
                onChanged: (String phone) {
                  getUserNumber(phone);
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.phone, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Enter your number',
                  labelText: 'Number',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 420,
        child: FloatingActionButton(
          onPressed: () {
            create();
          },
          backgroundColor: Colors.blue,
          child: const Text("Submit", style: TextStyle(color: Colors.white)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
