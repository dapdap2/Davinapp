import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/google_auth_service.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DAVBOT V3A+"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await GoogleAuthService().signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL ?? ""),
            ),
            const SizedBox(height: 20),
            Text("Halo, ${user.displayName ?? "User"} 👋",
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 10),
            Text(user.email ?? "",
                style: const TextStyle(fontSize: 14, color: Colors.white54)),
            const SizedBox(height: 40),
            const Text(
              "AI ASLI INDONESIA 🇮🇩 | DAV ASISTENMU\n© 2025 DavinTeam — Powerbead Licensed AI",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.amber, fontSize: 12),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
