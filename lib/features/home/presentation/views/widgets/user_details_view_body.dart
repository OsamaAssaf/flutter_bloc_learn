import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/core/utils/functions/open_url.dart';
import 'package:flutter_bloc_learn/features/home/data/models/user_model/user_model.dart';

class UserDetailsViewBody extends StatelessWidget {
  const UserDetailsViewBody({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'User Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16.0),
            // Add your user details widgets here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Name: ${userModel.name}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Email: ${userModel.email}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Phone: ${userModel.phone}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Location: ${userModel.address?.street}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16.0),

            FilledButton.icon(
              onPressed: () {
                openUrl(context, 'tel:${userModel.phone?.split(' ').first}');
              },
              label: const Text('Call now'),
              icon: const Icon(Icons.phone),
            ),
          ],
        ),
      ),
    );
  }
}
