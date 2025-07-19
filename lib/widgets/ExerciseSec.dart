import 'package:flutter/material.dart';

class ExerciseContainer extends StatelessWidget {
  // Example data
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
            child: Container(
              width: 280,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  // Exercise Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      exercises[index]['image']!,
                      height: 260,
                      width: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Overlay Text
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      exercises[index]['name']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
