import 'package:busrouteapp/busroute/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Bus Route',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: _ui(usersViewModel),
      ),

      // Column(children: [
      //   // SizedBox(width: double.infinity, child: MusicSearchBar()),
      //   // Expanded(child: MusicListView())
      // ]
    );
  }

  ui(UsersViewModel usersViewModel) {}
}
