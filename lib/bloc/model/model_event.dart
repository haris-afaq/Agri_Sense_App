import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class ModelEvent extends Equatable {
  const ModelEvent();

  @override
  List<Object?> get props => [];
}

class PickImageEvent extends ModelEvent {}

class PickCameraEvent extends ModelEvent {}

class PredictImageEvent extends ModelEvent {
  final String filePath;

  const PredictImageEvent(this.filePath);

  @override
  List<Object?> get props => [filePath];
}