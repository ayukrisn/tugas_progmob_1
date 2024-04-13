import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuddiesPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: "John Doe",
        phoneNumber: "123-456-7890",
        avatar: 'assets/avatar1.jpeg'),
    Contact(
        name: "Jane Smith",
        phoneNumber: "987-654-3210",
        avatar: 'assets/avatar2.jpeg'),
    Contact(
        name: "Alice Johnson",
        phoneNumber: "555-123-4567",
        avatar: 'assets/avatar3.jpeg'),
    Contact(
        name: "Bob Brown",
        phoneNumber: "444-555-6666",
        avatar: 'assets/avatar4.jpeg'),
    Contact(
        name: "Emma Davis",
        phoneNumber: "777-888-9999",
        avatar: 'assets/avatar5.jpeg'),
    Contact(
        name: "John Doe",
        phoneNumber: "123-456-7890",
        avatar: 'assets/avatar1.jpeg'),
    Contact(
        name: "Jane Smith",
        phoneNumber: "987-654-3210",
        avatar: 'assets/avatar2.jpeg'),
    Contact(
        name: "Alice Johnson",
        phoneNumber: "555-123-4567",
        avatar: 'assets/avatar3.jpeg'),
    Contact(
        name: "Bob Brown",
        phoneNumber: "444-555-6666",
        avatar: 'assets/avatar4.jpeg'),
    Contact(
        name: "Emma Davis",
        phoneNumber: "777-888-9999",
        avatar: 'assets/avatar5.jpeg'),
    Contact(
        name: "John Doe",
        phoneNumber: "123-456-7890",
        avatar: 'assets/avatar1.jpeg'),
    Contact(
        name: "Jane Smith",
        phoneNumber: "987-654-3210",
        avatar: 'assets/avatar2.jpeg'),
    Contact(
        name: "Alice Johnson",
        phoneNumber: "555-123-4567",
        avatar: 'assets/avatar3.jpeg'),
    Contact(
        name: "Bob Brown",
        phoneNumber: "444-555-6666",
        avatar: 'assets/avatar4.jpeg'),
    Contact(
        name: "Emma Davis",
        phoneNumber: "777-888-9999",
        avatar: 'assets/avatar5.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Task Buddies',
            style: GoogleFonts.baloo2(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.more_vert),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index].name),
              subtitle: Row(
                children: [
                  Icon(Icons.phone, size: 14),
                  SizedBox(width: 6),
                  Text(contacts[index].phoneNumber),
                ],
              ),
              trailing: Icon(Icons.more_vert),
              leading: CircleAvatar(
                backgroundImage: AssetImage(contacts[index].avatar),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'You clicked ' + contacts[index].name + ' contact!'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Contact {
  String name;
  String phoneNumber;
  String avatar;

  Contact(
      {required this.name, required this.phoneNumber, required this.avatar});
}
