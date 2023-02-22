import 'package:busrouteapp/busroute/models/bus_route.dart';
import 'package:busrouteapp/busroute/repositories/bus_route_repo.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Data> _busRouteDataModel = [];

  bool get loading => _loading;
  List<Data> get userListModel => _busRouteDataModel;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setBusRouteListModel(List<Data> busRouteDataModel) {
    _busRouteDataModel = busRouteDataModel;
  }

  getBusRoute() async {
    setLoading(true);
    var response = await BusRouteRepository.getBusRouteItems();
    setBusRouteListModel(response as List<Data>);
  }
}
