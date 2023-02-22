import 'package:busrouteapp/busroute/view_models/users_view_model.dart';
import 'package:busrouteapp/busroute/widgets/bus_route_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
      ],
      child: MaterialApp(
        title: 'Bus Route App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: BusRoutePage(),
      ),
    );
  }
}
