import 'package:busrouteapp/busroute/models/bus_route.dart';
import 'package:busrouteapp/busroute/repositories/bus_route_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusRouteViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Data> _busRouteDataModel = [];

  bool get loading => _loading;
  List<Data> get busRouteDataModel => _busRouteDataModel;

  BusRouteViewModel() {
    getBusRoute();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setBusRouteListModel(List<Data> busRouteDataModel) {
    _busRouteDataModel = busRouteDataModel;
  }

  getBusRoute() async {
    setLoading(true);
    final busRouteRepo = BusRouteRepository();
    var response = await busRouteRepo.getBusRouteItems();
    setBusRouteListModel(response);
    notifyListeners();
  }
}
