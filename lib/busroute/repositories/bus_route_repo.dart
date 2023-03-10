import 'dart:convert';
import 'package:busrouteapp/busroute/models/bus_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BusRouteRepositoryException implements Exception {}

class BusRouteRepository {
  final http.Client _httpClient;
  final _baseUrl = 'data.etabus.gov.hk';

  BusRouteRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Data>> getBusRouteItems() async {
    var busRouteRequest = Uri.https(
      _baseUrl,
      'v1/transport/kmb/route/',
    );
    var busRouteResponse = await _httpClient.get(busRouteRequest);
    print(busRouteResponse);

    if (busRouteResponse.statusCode != 200) {
      throw BusRouteRepositoryException();
    }
    var busRouteJson = json.decode(busRouteResponse.body);
    final List<dynamic> results = busRouteJson['data'];
    print(results);
    return results.map((json) => Data.fromJson(json)).toList();
  }
}
