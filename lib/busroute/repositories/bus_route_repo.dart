import 'dart:convert';
import 'package:busrouteapp/busroute/models/bus_route.dart';
import 'package:http/http.dart' as http;

class BusRouteRepositoryException implements Exception {}

class BusRouteRepository {
  final http.Client _httpClient;
  static const _baseUrl = 'data.etabus.gov.hk/v1/transport/kmb/route/';

  BusRouteRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Data>> getBusRouteItems() async {
    var busRouteRequest = Uri.https(
      _baseUrl,
    );
    var busRouteResponse = await _httpClient.get(busRouteRequest);

    if (busRouteResponse.statusCode != 200) {
      throw BusRouteRepositoryException();
    }
    var busRouteJson = json.decode(busRouteResponse.body);
    final List<dynamic> results = busRouteJson['data'];
    return results.map((json) => Data.fromJson(json)).toList();
  }
}
