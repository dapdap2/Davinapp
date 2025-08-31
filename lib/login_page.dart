import 'package:flutter/material.dart';
import 'services/google_auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "DAVBOT V3A+",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.account_circle, color: Colors.white),
                label: const Text("Login with Google"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  final user = await GoogleAuthService().signInWithGoogle();
                  if (user != null && context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(user: user),
                      ),
                    );
                  }
                },
              ),
              const Spacer(),
              const Divider(color: Colors.white24),
              const SizedBox(height: 10),
              Column(
                children: const [
                  Text("Powered by Davin Neural Core",
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                  Text("AI ASLI INDONESIA 🇮🇩",
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Text("© 2025 DavinTeam — Powerbead Licensed AI",
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Text("DAV ASISTENMU",
                      style: TextStyle(color: Colors.amber, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
