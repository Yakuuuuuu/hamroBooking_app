import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Booking.com uses a clean white background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF003580), // Booking.com Primary Blue
        elevation: 0,
        title: const Text(
          'My Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: const BoxDecoration(
              color: Color(0xFF003580), // Booking.com Primary Blue
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Samrat Phuyal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for contrast
                      ),
                    ),
                    Text(
                      'samrat@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70, // Slightly dimmed white
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Account Options
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                accountOption(Icons.payment, 'Payment Methods'),
                accountOption(Icons.history, 'Booking History'),
                accountOption(Icons.favorite, 'Saved Hotels'),
                accountOption(Icons.settings, 'Settings'),
                accountOption(Icons.help, 'Help & Support'),
                accountOption(Icons.logout, 'Logout', isLogout: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget accountOption(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : const Color(0xFF0071c2), // Booking.com Accent Blue
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Add navigation logic here
      },
    );
  }
}
