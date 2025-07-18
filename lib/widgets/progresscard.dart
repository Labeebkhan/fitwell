import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatefulWidget {
  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  List<DateTime> weekDays = [];

  @override
  void initState() {
    super.initState();
    weekDays = _generateCurrentWeek();
  }

  List<DateTime> _generateCurrentWeek() {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday; // 1 = Monday, 7 = Sunday
    DateTime startOfWeek = now.subtract(Duration(days: currentWeekday - 1));

    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Progress',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              DropdownButton<String>(
                dropdownColor: Colors.grey[800],
                value: 'Weeks',
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                items:
                    ['Weeks', 'Months'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Week Days
          SizedBox(
            height: 40, // ✅ bounded height to avoid infinite height
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekDays.length,
              itemBuilder: (context, index) {
                final date = weekDays[index];
                bool isToday =
                    DateFormat('yyyy-MM-dd').format(date) ==
                    DateFormat('yyyy-MM-dd').format(today);

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: isToday ? Colors.orange : Colors.grey[800],
                    radius: 18,
                    child: Text(
                      '${date.day}',
                      style: TextStyle(
                        color: isToday ? Colors.white : Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Progress Summary
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ProgressStat(title: 'Workout', value: '16'),
                ProgressStat(title: 'KCAL', value: '10412'),
                ProgressStat(title: 'Minute', value: '03:21'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressStat extends StatelessWidget {
  final String title;
  final String value;
  const ProgressStat({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ],
    );
  }
}
