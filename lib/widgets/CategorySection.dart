import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/categoryprovider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selectedCategory = 'All';

  final List<String> allExercises = [
    'Push Up',
    'Pull Up',
    'Bench Press',
    'Deadlift',
    'Squats',
    'Bicep Curl',
    'Tricep Dips',
  ];

  void showExerciseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Consumer<CategoryProvider>(
          builder: (context, provider, _) {
            return Dialog(
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: allExercises.length,
                        itemBuilder: (context, index) {
                          final exercise = allExercises[index];
                          final isSelected = provider.isSelected(exercise);

                          return ListTile(
                            title: Text(
                              exercise,
                              style: TextStyle(
                                color:
                                    isSelected ? Colors.orange : Colors.white70,
                              ),
                            ),
                            trailing:
                                isSelected
                                    ? const Icon(
                                      Icons.check,
                                      color: Colors.orange,
                                    )
                                    : null,
                            onTap: () {
                              provider.toggleExercise(exercise);
                            },
                          );
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    final categories = provider.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Category',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextButton(
              onPressed: () => showExerciseDialog(context),
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category == selectedCategory;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange : Colors.grey[850],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Center(
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
