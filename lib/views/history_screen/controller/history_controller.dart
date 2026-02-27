import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:agri_sense_mobile_app/models/history_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HistoryController extends ChangeNotifier {
  List<HistoryItem> _historyItems = [];
  
  List<HistoryItem> get historyItems => _historyItems;

  HistoryController() {
    loadHistory();
  }

  Future<void> saveHistoryItem(HistoryItem item) async {
    _historyItems.insert(0, item);
    notifyListeners();
    await _saveToFile();
  }

  Future<void> loadHistory() async {
    try {
      final file = await _getHistoryFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<dynamic> jsonList = json.decode(contents);
        _historyItems = jsonList
            .map((json) => HistoryItem.fromJson(json))
            .toList()
          ..sort((a, b) => b.dateTime.compareTo(a.dateTime)); 
      }
    } catch (e) {
      print('Error loading history: $e');
    }
    notifyListeners();
  }

  Future<void> deleteHistoryItem(String id) async {
    _historyItems.removeWhere((item) => item.id == id);
    notifyListeners();
    await _saveToFile();
  }
  Future<void> clearAllHistory() async {
    _historyItems.clear();
    notifyListeners();
    await _saveToFile();
  }

  Future<void> shareHistoryItem(HistoryItem item) async {
    final String shareText = '''
AgriSense Detection Result
Date: ${_formatDate(item.dateTime)}
Disease: ${item.diseaseName}
Confidence: ${(item.confidence * 100).toStringAsFixed(1)}%
━━━━━━━━━━━━━━━━━━━━━
Download AgriSense for more plant disease detection!
    ''';
    
    await Share.share(shareText);
  }

  Future<File> _getHistoryFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/history.json');
  }

  Future<void> _saveToFile() async {
    try {
      final file = await _getHistoryFile();
      final jsonList = _historyItems.map((item) => item.toJson()).toList();
      await file.writeAsString(json.encode(jsonList));
    } catch (e) {
      print('Error saving history: $e');
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}