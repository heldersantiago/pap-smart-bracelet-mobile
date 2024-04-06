class Bracelet {
  final int? id;
  final String? deviceId;
  final String? heartRate;
  final String? bodyTemperature;
  final String? bloodPressure;
  final String? bloodOxygen;
  final String? latitude;
  final String? longitude;
  final String? altitude;
  final int? userId;
  final DateTime? createAt;

  Bracelet(
      {this.id,
      this.deviceId,
      this.heartRate,
      this.bloodPressure,
      this.bodyTemperature,
      this.bloodOxygen,
      this.latitude,
      this.longitude,
      this.altitude,
      this.userId,
      this.createAt});

  factory Bracelet.fromJson(Map<String, dynamic> json) {
    return Bracelet(
      id: json['id'],
      deviceId: json['device_id'],
      heartRate: json['heart_rate'],
      bloodPressure: json['blood_pressure'],
      bodyTemperature: json['body_temperature'],
      bloodOxygen: json['blood_oxygen'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      altitude: json['altitude'],
      userId: json['user_id'],
      createAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'device_id': deviceId,
        'user_id': userId,
      };
}
