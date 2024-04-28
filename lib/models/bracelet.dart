

class Bracelet {
  final int? id;
  final String? deviceId;
  final String? heartRate;
  final String? bodyTemperature;
  final String? bloodPressure;
  final String? bloodOxygen;
  final double? latitude;
  final double? longitude;
  final String? altitude;
  final int? userId;
  final String? createdAt;

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
      this.createdAt});

  factory Bracelet.fromJson(Map<String, dynamic> json) {
    return Bracelet(
      id: json['id'],
      deviceId: json['device_id'],
      heartRate: json['heart_rate'].toString(),
      bloodPressure: json['blood_pressure'].toString(),
      bodyTemperature: json['body_temperature'].toString(),
      bloodOxygen: json['blood_oxygen'].toString(),
      latitude: json['latitude'],
      longitude: json['longitude'],
      altitude: json['altitude'].toString(),
      userId: json['user_id'],
      createdAt: json['createdAt'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'device_id': deviceId,
        'user_id': userId,
      };
}
