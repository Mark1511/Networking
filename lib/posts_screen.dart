import 'package:flutter/material.dart';
import 'api_service.dart';
import 'user.dart';

class PostsScreen extends StatefulWidget {
  final int userId;

  const PostsScreen({super.key, required this.userId});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = ApiService.getPostsByUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index].title,
                    style: TextStyle(
                      color: Colors.redAccent.shade700,
                    ),
                  ),
                  subtitle: Text(
                    snapshot.data![index].body,
                    style: TextStyle(
                      color:
                          Colors.grey.shade300,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
