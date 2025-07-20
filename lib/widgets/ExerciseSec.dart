import 'package:flutter/material.dart';

class ExerciseContainer extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {'name': 'Push Ups', 'image': 'assets/images/pushup.jpg'},
    {'name': 'Squats', 'image': 'assets/images/squat.jpg'},
    {'name': 'Lunges', 'image': 'assets/images/lunges.jpg'},
    {'name': 'Plank', 'image': 'assets/images/plank.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ExerciseDetailPage(
                          name: exercises[index]['name']!,
                          image: exercises[index]['image']!,
                        ),
                  ),
                );
              },
              child: Container(
                width: 290,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        exercises[index]['image']!,
                        height: 260,
                        width: 290,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        exercises[index]['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExerciseDetailPage extends StatelessWidget {
  final String name;
  final String image;

  ExerciseDetailPage({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.orange),
        title: Text(
          '$name Videos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            'Videos for $name',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          // TODO: You can replace this with your video list or player widgets
        ],
      ),
    );
  }
}
