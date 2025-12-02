import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weekly Schedule'),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Mon'),
              Tab(text: 'Tue'),
              Tab(text: 'Wed'),
              Tab(text: 'Thu'),
              Tab(text: 'Fri'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDaySchedule('Monday'),
            _buildDaySchedule('Tuesday'),
            _buildDaySchedule('Wednesday'),
            _buildDaySchedule('Thursday'),
            _buildDaySchedule('Friday'),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySchedule(String day) {
    // Mock data generator
    final List<Map<String, dynamic>> classes = [
      {'subject': 'Mathematics', 'time': '08:00 - 09:30', 'room': '101', 'color': Colors.blue},
      {'subject': 'English', 'time': '09:45 - 11:15', 'room': '203', 'color': Colors.green},
      {'subject': 'Lunch Break', 'time': '11:15 - 12:00', 'room': 'Cafeteria', 'color': Colors.grey},
      {'subject': 'Science', 'time': '12:00 - 13:30', 'room': 'Lab 1', 'color': Colors.purple},
      {'subject': 'Physical Ed', 'time': '13:45 - 15:15', 'room': 'Gym', 'color': Colors.orange},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        final cls = classes[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: (cls['color'] as Color).withOpacity(0.2),
              child: Icon(Icons.class_, color: cls['color'] as Color),
            ),
            title: Text(
              cls['subject'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(cls['time'] as String),
                Text('Room: ${cls['room']}'),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }
}
