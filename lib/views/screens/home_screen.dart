import 'package:algoriza_internship_task1/data_source/static/user_data.dart';
import 'package:algoriza_internship_task1/resources/color_manager.dart';
import 'package:algoriza_internship_task1/resources/routes_manager.dart';
import 'package:algoriza_internship_task1/views/widgets/build_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: ColorManager.teal, statusBarIconBrightness: Brightness.light),
        backgroundColor: ColorManager.teal,
        elevation: 0,
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hi Algoriza Team...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text("I'm the trainee Mohamed Ahmed and my id is [199]"),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Your email is:'),
                Text(usersData.last.email, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Your password is:'),
                Text(usersData.last.password, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Your country code is:'),
                Text(usersData.last.countryCode, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Your phone number is:'),
                Text(usersData.last.phoneNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            BuildButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (route) => false),
              text: 'Logout',
              icon: Icons.logout,
            )
          ],
        ),
      ),
    );
  }
}