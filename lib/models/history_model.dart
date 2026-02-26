import 'dart:io';

class HistoryItem {
  final String id;
  final String imagePath;
  final String diseaseName;
  final double confidence;
  final DateTime dateTime;
  final Map<String, dynamic> predictionData;

  HistoryItem({
    required this.id,
    required this.imagePath,
    required this.diseaseName,
    required this.confidence,
    required this.dateTime,
    required this.predictionData,
  });

  // Convert to JSON for storage
  Map<String, dynamic> toJson() => {
    'id': id,
    'imagePath': imagePath,
    'diseaseName': diseaseName,
    'confidence': confidence,
    'dateTime': dateTime.toIso8601String(),
    'predictionData': predictionData,
  };

  // Create from JSON
  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
    id: json['id'],
    imagePath: json['imagePath'],
    diseaseName: json['diseaseName'],
    confidence: json['confidence'],
    dateTime: DateTime.parse(json['dateTime']),
    predictionData: Map<String, dynamic>.from(json['predictionData']),
  );
}