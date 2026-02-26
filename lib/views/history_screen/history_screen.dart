import 'package:agri_sense_mobile_app/views/history_screen/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_2.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text.dart';
import 'package:agri_sense_mobile_app/models/history_model.dart';
import 'package:agri_sense_mobile_app/views/disease_detection_screen/scan_results_screen/scan_results_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan History"),
        backgroundColor: AppColors.darkGreenColor,
        foregroundColor: AppColors.whiteColor,
        actions: [
          Consumer<HistoryController>(
            builder: (context, controller, child) {
              if (controller.historyItems.isEmpty) {
                return const SizedBox.shrink();
              }
              return IconButton(
                icon: const Icon(Icons.delete_sweep),
                onPressed: () => _showClearAllDialog(context, controller),
                tooltip: 'Clear all history',
              );
            },
          ),
        ],
      ),
      body: Consumer<HistoryController>(
        builder: (context, controller, child) {
          if (controller.historyItems.isEmpty) {
            return _buildEmptyState();
          }
          return _buildHistoryList(controller);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 80,
            color: AppColors.shadowGreyColor.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Heading2(
            title: "No History Yet",
            titleColor: AppColors.greyColor,
          ),
          const SizedBox(height: 8),
          const Bodytext(
            text: "Your scanned images will appear here",
            textColor: AppColors.greyColor,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkGreenColor,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Bodytext(
              text: "Scan New Image",
              textColor: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList(HistoryController controller) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: controller.historyItems.length,
      itemBuilder: (context, index) {
        final item = controller.historyItems[index];
        return _buildHistoryCard(context, item, controller);
      },
    );
  }

  Widget _buildHistoryCard(BuildContext context, HistoryItem item, HistoryController controller) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          _navigateToDetail(context, item);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(item.imagePath),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: AppColors.shadowGreyColor,
                      child: const Icon(
                        Icons.broken_image,
                        color: AppColors.whiteColor,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.diseaseName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreenColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lightGreenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "${(item.confidence * 100).toStringAsFixed(1)}%",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkGreenColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _formatDate(item.dateTime),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share, size: 18),
                          color: AppColors.darkGreenColor,
                          onPressed: () => controller.shareHistoryItem(item),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 18),
                          color: AppColors.redColor,
                          onPressed: () => _showDeleteDialog(context, item, controller),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, HistoryItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanResultsScreen(
          image: File(item.imagePath),
          predictionData: item.predictionData,
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, HistoryItem item, HistoryController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Item"),
        content: const Text("Are you sure you want to delete this scan from history?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              controller.deleteHistoryItem(item.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Item deleted"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.redColor,
            ),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _showClearAllDialog(BuildContext context, HistoryController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Clear History"),
        content: const Text("Are you sure you want to clear all scan history? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              controller.clearAllHistory();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("All history cleared"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.redColor,
            ),
            child: const Text("Clear All"),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today, ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Yesterday, ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}