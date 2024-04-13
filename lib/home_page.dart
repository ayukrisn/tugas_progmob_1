import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [
    Task('Progmob Task', '3 Days Ago', 'Done'),
    Task('Pancasila Task', '1 Day Ago', 'Done'),
    Task('Integrasi Sistem Task', '1 Day Ago', 'Done'),
    Task('ADSI Task', '3 Days Left', 'On Going'),
    Task('Bahasa Indonesia Task', '4 Days Left', 'On Going'),
    Task('English Task', '4 Days Left', 'On Going'),
    Task('Intern Task', '4 Days Left', 'On Going'),
    Task('Keamanan Informasi Task', '8 Days Left', 'Coming Soon'),
    Task('UI/UX Design Task', '8 Days Left', 'Coming Soon'),
    Task('Praktikum Task', '8 Days Left', 'Coming Soon'),
  ];

  int tasksLeft = 0;

  @override
  Widget build(BuildContext context) {
    tasksLeft = tasks.length;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello, Ayu Krisna!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'You have $tasksLeft tasks left',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 48,
                          color: Color(0xFFF5B95B),
                        )),
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/avatar5.jpeg'),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 28),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 28),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Done",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildCategoryList('Done'),
            const SizedBox(height: 28),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "On Going",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildCategoryList('On Going'),
            const SizedBox(height: 28),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Coming Soon",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildCategoryList('Coming Soon'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategoryList(String category) {
    List<Task> categoryTasks =
        tasks.where((task) => task.category == category).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoryTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categoryTasks[index].title),
            subtitle: Row(
              children: [
                Icon(Icons.schedule, size: 14),
                SizedBox(width: 6),
                Text(categoryTasks[index].dueDate),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  tasks.remove(categoryTasks[index]);
                });
              },
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'You clicked ' + categoryTasks[index].title + ' task!',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Task {
  String title;
  String category;
  String dueDate;

  Task(this.title, this.dueDate, this.category);
}
