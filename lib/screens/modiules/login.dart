import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 40,
            child: ClipOval(
              child: Container(
                  decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.bentbusinessmarketing.com/wp-content/uploads/2013/02/35844588650_3ebd4096b1_b-1024x683.jpg'),
                  fit: BoxFit.cover,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
