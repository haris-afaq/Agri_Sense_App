import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class ModelState extends Equatable {
  const ModelState();

  @override
  List<Object?> get props => [];
}

class ModelInitial extends ModelState {}

class ModelLoading extends ModelState {}

class ModelPredictionSuccess extends ModelState {
  final String label;
  final double confidence;
  final Map<String, dynamic> data;
  final File image;

  const ModelPredictionSuccess({
    required this.label,
    required this.confidence,
    required this.data,
    required this.image,
  });

  @override
  List<Object?> get props => [label, confidence, data, image];
}

class ModelPredictionFailure extends ModelState {
  final String message;

  const ModelPredictionFailure(this.message);

  @override
  List<Object?> get props => [message];
}