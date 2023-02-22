import 'package:busrouteapp/busroute/models/bus_route.dart';
import 'package:busrouteapp/busroute/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BusRouteViewModel busRouteViewModel = context.watch<BusRouteViewModel>();
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
        child: Column(children: [
          _ui(busRouteViewModel),
        ]),
      ),
    );
  }

  _ui(BusRouteViewModel busRouteViewModel) {
    if (busRouteViewModel.loading) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            Data data = busRouteViewModel.busRouteDataModel[index];
            return Container(
              child: Column(
                children: [
                  Text(data.route, style: TextStyle(color: Colors.black)),
                  Text(data.origTc, style: TextStyle(color: Colors.black)),
                  Text(data.destTc, style: TextStyle(color: Colors.black)),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: busRouteViewModel.busRouteDataModel.length),
    );
  }
}
