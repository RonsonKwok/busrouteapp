class BusRoute {
  BusRoute({
    required this.type,
    required this.version,
    required this.generatedTimestamp,
    required this.data,
  });
  late final String type;
  late final String version;
  late final String generatedTimestamp;
  late final List<Data> data;

  BusRoute.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
    generatedTimestamp = json['generated_timestamp'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['version'] = version;
    _data['generated_timestamp'] = generatedTimestamp;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.route,
    required this.bound,
    required this.serviceType,
    required this.origEn,
    required this.origTc,
    required this.origSc,
    required this.destEn,
    required this.destTc,
    required this.destSc,
  });
  late final String route;
  late final String bound;
  late final String serviceType;
  late final String origEn;
  late final String origTc;
  late final String origSc;
  late final String destEn;
  late final String destTc;
  late final String destSc;

  Data.fromJson(Map<String, dynamic> json) {
    route = json['route'];
    bound = json['bound'];
    serviceType = json['service_type'];
    origEn = json['orig_en'];
    origTc = json['orig_tc'];
    origSc = json['orig_sc'];
    destEn = json['dest_en'];
    destTc = json['dest_tc'];
    destSc = json['dest_sc'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['route'] = route;
    _data['bound'] = bound;
    _data['service_type'] = serviceType;
    _data['orig_en'] = origEn;
    _data['orig_tc'] = origTc;
    _data['orig_sc'] = origSc;
    _data['dest_en'] = destEn;
    _data['dest_tc'] = destTc;
    _data['dest_sc'] = destSc;
    return _data;
  }
}
