import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam_app/Screens/add.dart';
import 'package:final_exam_app/Widgets/navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Add()),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('FinalUsers').snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('No Users');
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot user = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(user['username']),
                  subtitle: Text(user['useremail']),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete)),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNav(), // Add BottomNav here
    );
  }
}
