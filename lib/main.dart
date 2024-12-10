import 'package:flutter/material.dart';
import 'package:objectv3/page/camera.dart'; // ตรวจสอบว่าไฟล์นี้มี HomePage หรือไม่

void main() {
  runApp(MaterialApp(
    home:MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Navigator Example",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          backgroundColor: Colors.grey[500],
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // นำทางไปหน้า HomePage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cameras(), // ตรวจสอบว่า HomePage อยู่ในไฟล์ camera.dart
                ),
              );
            },
            child: const Text('Camera'),
          ),
        ),
      ),
    );
  }
}
