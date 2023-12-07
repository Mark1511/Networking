import 'package:flutter/material.dart';
import 'user.dart';
import 'posts_screen.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Details'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(widget.user.name),
            subtitle: Text(
              widget.user.email,
              style: const TextStyle(
                color: Colors.red, // Здесь укажите цвет для subtitle
              ),
            ),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostsScreen(userId: widget.user.id),
                ),
              );
            },
            child: const Text('View Posts'),
          ),
        ],
      ),
    );
  }
}
