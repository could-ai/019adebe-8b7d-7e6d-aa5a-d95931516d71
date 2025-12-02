import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE, d MMMM');

    return Scaffold(
      appBar: AppBar(
        title: const Text('School Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundColor: Colors.white24,
            child: Text('JD'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('Student • Grade 10'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('JD', style: TextStyle(fontSize: 24, color: Color(0xFF1E88E5))),
              ),
              decoration: BoxDecoration(color: Color(0xFF1E88E5)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Schedule'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/schedule');
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Assignments'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/assignments');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grade),
              title: const Text('Grades'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dateFormat.format(now),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hello, John!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            
            // Quick Stats
            Row(
              children: [
                _buildStatCard(context, 'Attendance', '95%', Icons.check_circle_outline, Colors.green),
                const SizedBox(width: 16),
                _buildStatCard(context, 'Assignments', '3 Pending', Icons.assignment_late_outlined, Colors.orange),
              ],
            ),
            
            const SizedBox(height: 24),
            Text(
              'Today\'s Classes',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildClassCard(context, 'Mathematics', '08:00 - 09:30', 'Room 101', 'Mr. Smith', Colors.blue),
            _buildClassCard(context, 'Physics', '09:45 - 11:15', 'Lab 2', 'Ms. Johnson', Colors.purple),
            _buildClassCard(context, 'History', '11:30 - 13:00', 'Room 204', 'Mrs. Davis', Colors.amber),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassCard(BuildContext context, String subject, String time, String room, String teacher, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      room,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  teacher,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
