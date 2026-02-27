import 'dart:io';
import 'package:agri_sense_mobile_app/config/widgets/custom_snackbar.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_2.dart';
import 'package:agri_sense_mobile_app/views/disease_detection_screen/wedgits/voice_note_button.dart';
import 'package:agri_sense_mobile_app/views/history_screen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/views/history_screen/controller/history_controller.dart';
import 'package:agri_sense_mobile_app/models/history_model.dart';
import 'package:path_provider/path_provider.dart';

class ScanResultsScreen extends StatefulWidget {
  final File image;
  final Map<String, dynamic>? predictionData;

  const ScanResultsScreen({
    super.key,
    required this.image,
    this.predictionData,
  });

  @override
  State<ScanResultsScreen> createState() => _ScanResultsScreenState();
}

class _ScanResultsScreenState extends State<ScanResultsScreen>
    with SingleTickerProviderStateMixin {
  bool _isSaving = false;
  bool _isSaved = false;
  late Map<String, dynamic> _predictionData;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    
    _predictionData = widget.predictionData ?? {
      "label": "unknown",
      "confidence": 0.0,
      "index": 0,
    };
    
    _tabController = TabController(length: 3, vsync: this);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<String> _saveImagePermanently() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = 'scan_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final newPath = '${directory.path}/$fileName';
      final newFile = await widget.image.copy(newPath);
      return newFile.path;
    } catch (e) {
      return widget.image.path;
    }
  }

  Future<void> _saveToHistory() async {
    if (_isSaved) return;

    setState(() => _isSaving = true);

    try {
      final savedImagePath = await _saveImagePermanently();

      final historyItem = HistoryItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        imagePath: savedImagePath,
        diseaseName: _predictionData['label']?.toString().toUpperCase() ?? 'Unknown',
        confidence: _predictionData['confidence'] ?? 0.0,
        dateTime: DateTime.now(),
        predictionData: _predictionData,
      );

      final historyController = Provider.of<HistoryController>(context, listen: false);
      await historyController.saveHistoryItem(historyItem);

      setState(() => _isSaved = true);

      if (mounted) {
        CustomSnackbar.show(context,
         text: "Result saved to history",
         backgroundColor: AppColors.darkGreenColor
         );
       
      }
    } catch (e) {
      print('Error saving: $e');
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Map<String, Map<String, String>> _getDiseaseInfo(String disease) {
    final diseaseInfo = {
      'peach bacterial spot': {
        'treatment': '• Apply copper-based bactericide in spring before bloom\n• Apply every 10-14 days during wet weather\n• Use streptomycin for severe infections\n• Remove and destroy infected fruits and leaves\n• Prune to improve air circulation',
        'symptoms': '• Small, water-soaked spots on leaves\n• Spots turn purple or brown with yellow halos\n• Lesions on fruit are sunken and cracked\n• Defoliation in severe cases\n• Twig lesions in late stages',
        'prevention': '• Plant resistant varieties (Redhaven, Clayton)\n• Avoid overhead irrigation\n• Prune for good air circulation\n• Apply dormant copper spray in winter\n• Remove mummy fruits and fallen leaves',
   
        'treatmentUrdu': '• تانبے پر مبنی جراثیم کش ادویات کا استعمال کریں\n• موسم بہار میں پھول آنے سے پہلے سپرے کریں\n• متاثرہ پتوں اور پھلوں کو ہٹا دیں',
        'symptomsUrdu': '• پتوں پر پانی کے دھبے\n• دھبے جامنی یا بھورے ہو جاتے ہیں\n• پھلوں پر نشانات بنتے ہیں',
        'preventionUrdu': '• مزاحم اقسام لگائیں\n• مناسب ہوا کی گردش یقینی بنائیں\n• گرے ہوئے پتے ہٹا دیں',
      },
      'apple scab': {
        'treatment': '• Apply fungicide (myclobutanil or copper) at green tip stage\n• Apply every 7-10 days until petal fall\n• Use sulfur or lime sulfur for organic control\n• Remove infected leaves in fall',
        'symptoms': '• Olive-green to brown spots on leaves\n• Velvety lesions on leaf undersides\n• Dark, scabby lesions on fruit\n• Premature leaf drop\n• Distorted fruit growth',
        'prevention': '• Plant resistant varieties\n• Rake and destroy fallen leaves\n• Prune to improve air circulation\n• Apply dormant oil in spring\n• Maintain proper tree spacing',

        'treatmentUrdu': '• سبز کلیوں پر فنگسائڈ کا سپرے کریں\n• ہر 7-10 دن بعد سپرے کریں\n• متاثرہ پتے خزاں میں ہٹا دیں',
        'symptomsUrdu': '• پتوں پر زیتونی سبز دھبے\n• پتوں کے نیچے مخملی نشانات\n• پھلوں پر سیاہ نشانات',
        'preventionUrdu': '• مزاحم اقسام کا انتخاب کریں\n• گرے ہوئے پتے جمع کر کے تلف کریں\n• مناسب ہوا کی گردش یقینی بنائیں',
      },
      'grape black rot': {
        'treatment': '• Apply fungicide from bloom through harvest\n• Use myclobutanil or copper-based products\n• Remove mummified berries and infected canes\n• Apply every 10-14 days in wet weather',
        'symptoms': '• Small yellow spots on leaves\n• Spots turn brown with dark borders\n• Black, wrinkled mummies on clusters\n• Tan lesions on shoots\n• Circular black spots on berries',
        'prevention': '• Remove infected plant material\n• Prune for good air circulation\n• Use resistant varieties\n• Apply dormant spray\n• Avoid overhead irrigation',
      
        'treatmentUrdu': '• پھول سے کٹائی تک فنگسائڈ کا استعمال\n• نمی والے موسم میں ہر 10-14 دن بعد سپرے\n• متاثرہ انگور ہٹا دیں',
        'symptomsUrdu': '• پتوں پر چھوٹے پیلے دھبے\n• دھبے سیاہ حاشیے کے ساتھ بھورے\n• انگور کے گچھوں پر سیاہ جھریاں',
        'preventionUrdu': '• متاثرہ پودوں کے حصے ہٹا دیں\n• ہوا کی گردش کے لیے چھانٹی کریں\n• اوپر سے پانی دینے سے گریز کریں',
      },
    };

    final lowerDisease = disease.toLowerCase();
    for (var key in diseaseInfo.keys) {
      if (lowerDisease.contains(key)) {
        return {key: diseaseInfo[key]!};
      }
    }
    
    return {
      'unknown': {
        'treatment': '• Consult with local agricultural extension office\n• Isolate affected plants\n• Remove infected plant parts\n• Apply broad-spectrum fungicide if fungal\n• Consider organic controls first',
        'symptoms': '• Unusual spots or discoloration on leaves\n• Wilting or stunted growth\n• Lesions on stems or fruit\n• Abnormal leaf drop\n• Visible fungal growth',
        'prevention': '• Maintain good garden hygiene\n• Rotate crops annually\n• Water at soil level\n• Space plants properly\n• Monitor regularly for issues',
     
        'treatmentUrdu': '• مقامی ماہرین سے مشورہ کریں\n• متاثرہ پودوں کو الگ کریں\n• عمومی فنگسائڈ استعمال کریں',
        'symptomsUrdu': '• پتوں پر غیر معمولی دھبے\n• پودے کا مرجھانا\n• تنوں پر زخم',
        'preventionUrdu': '• صفائی کا خیال رکھیں\n• فصلوں کی گردش کریں\n• پودوں کی باقاعدہ نگرانی کریں',
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final diseaseName = _predictionData['label']?.toString().toLowerCase() ?? 'unknown';
    final diseaseDisplayName = _predictionData['label']?.toString().toUpperCase() ?? 'PROCESSING';
    final confidence = (_predictionData['confidence'] as double?) ?? 0.0;
    final hasPrediction = _predictionData['label'] != 'unknown' && confidence > 0.3;
    
    final diseaseInfo = _getDiseaseInfo(diseaseName);
    final diseaseKey = diseaseInfo.keys.first;
    final info = diseaseInfo[diseaseKey]!;

    return Scaffold(
      appBar: AppBar(
        title: Heading2(title: "Scan Results",
        titleColor: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.darkGreenColor,
        foregroundColor: AppColors.whiteColor,
        actions: [
          if (hasPrediction && !_isSaved)
            IconButton(
              icon: _isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.bookmark_border),
              onPressed: _isSaving ? null : _saveToHistory,
              tooltip: 'Save to history',
            ),
          if (_isSaved)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.bookmark, color: AppColors.whiteColor),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
         
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.backgroundColor,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      widget.image,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.lightGreenColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.darkGreenColor),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.darkGreenColor,
                          size: 30,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Detection Complete",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.darkGreenColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "${(confidence * 100).toStringAsFixed(1)}%",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.darkGreenColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.darkGreenColor.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Detected Disease",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          diseaseDisplayName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
               
                  if (hasPrediction)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: VoiceNoteButton(
                        diseaseName: diseaseDisplayName,
                        diseaseInfo: info,
                      ),
                    ),
                  
                  const SizedBox(height: 16),
                  
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: AppColors.darkGreenColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        
           
            Container(
              color: AppColors.whiteColor,
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.greyColor,
                labelColor: AppColors.greyColor,
                unselectedLabelColor: AppColors.greyColor,
                tabs: const [
                  Tab(text: "Treatment", icon: Icon(Icons.medical_services)),
                  Tab(text: "Symptoms", icon: Icon(Icons.error)),
                  Tab(text: "Prevention", icon: Icon(Icons.shield)),
                ],
              ),
            ),
        
     
            Container(
              color: AppColors.backgroundColor,
              height: 250, 
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildInfoTab(info['treatment']!),
                  _buildInfoTab(info['symptoms']!),
                  _buildInfoTab(info['prevention']!),
                ],
              ),
            ),
        
    
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkGreenColor,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                      child: const Text(
                        "New Scan",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(color: AppColors.darkGreenColor, width: 1.5),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                       HistoryScreen()
                        ));
                      },
                      child: const Text(
                        "View History",
                        style: TextStyle(
                          color: AppColors.darkGreenColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTab(String content) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
