import 'package:flutter/material.dart';

class UIScreen extends StatefulWidget {
  const UIScreen({super.key});

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Recommended for your devices",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            Card(
              color: Colors.grey[900],
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 335.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.blue,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Image.asset('assets/images/1.png'),
                  const Center(
                    child: Text("Free Engraving",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "AirPods Max - Silver",
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "A\$899.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 10.0,
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 10.0,
                              backgroundColor: Colors.redAccent,
                            ),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 10.0,
                              backgroundColor: Colors.greenAccent,
                            ),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 10.0,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "+1 more",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox.square(
                          dimension: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
