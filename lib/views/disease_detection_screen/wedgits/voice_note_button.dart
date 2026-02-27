import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/custom_snackbar.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceNoteButton extends StatefulWidget {
  final String diseaseName;
  final Map<String, String> diseaseInfo;

  const VoiceNoteButton({
    super.key,
    required this.diseaseName,
    required this.diseaseInfo,
  });

  @override
  State<VoiceNoteButton> createState() => _VoiceNoteButtonState();
}

class _VoiceNoteButtonState extends State<VoiceNoteButton> {
  late FlutterTts _flutterTts;
  bool _isSpeaking = false;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    _flutterTts = FlutterTts();

    await _flutterTts.setLanguage("ur-PK");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
    
    try {
      final voices = await _flutterTts.getVoices;
      if (voices.isNotEmpty) {
        final urduVoice = voices.firstWhere(
          (voice) => voice['name'].toString().contains('urdu') || 
                     voice['locale'].toString().contains('ur'),
          orElse: () => voices.first,
        );
        await _flutterTts.setVoice(urduVoice);
      }
    } catch (e) {
      print('Error setting voice: $e');
    }

    _flutterTts.setStartHandler(() {
      setState(() => _isSpeaking = true);
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
        _isPaused = false;
      });
    });

    _flutterTts.setCancelHandler(() {
      setState(() {
        _isSpeaking = false;
        _isPaused = false;
      });
    });

    _flutterTts.setPauseHandler(() {
      setState(() => _isPaused = true);
    });

    _flutterTts.setContinueHandler(() {
      setState(() => _isPaused = false);
    });

    _flutterTts.setErrorHandler((msg) {
      setState(() {
        _isSpeaking = false;
        _isPaused = false;
      });
      CustomSnackbar.show(context, text: "Error: $msg",
      backgroundColor: AppColors.redColor
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('')),
      // );
    });
  }

  String _buildUrduScript() {
    return '''
${widget.diseaseName} کا بیان

بیماری کا نام: ${widget.diseaseName}

علاج:
${widget.diseaseInfo['treatmentUrdu'] ?? widget.diseaseInfo['treatment'] ?? 'علاج دستیاب نہیں'}

علامات:
${widget.diseaseInfo['symptomsUrdu'] ?? widget.diseaseInfo['symptoms'] ?? 'علامات دستیاب نہیں'}

احتیاطی تدابیر:
${widget.diseaseInfo['preventionUrdu'] ?? widget.diseaseInfo['prevention'] ?? 'احتیاطی تدابیر دستیاب نہیں'}
''';
  }

  Future<void> _toggleSpeech() async {
    if (_isSpeaking) {
      if (_isPaused) {
   
        await _flutterTts.speak(_buildUrduScript()); 
        setState(() => _isPaused = false);
      } else {
      
        await _flutterTts.pause();
        setState(() => _isPaused = true);
      }
    } else {
     
      await _flutterTts.speak(_buildUrduScript());
    }
  }

  Future<void> _stop() async {
    await _flutterTts.stop();
    setState(() {
      _isSpeaking = false;
      _isPaused = false;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
        
          if (_isSpeaking)
            AvatarGlow(
              glowColor: AppColors.darkGreenColor,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              child: FloatingActionButton(
                onPressed: _toggleSpeech,
                backgroundColor: _isPaused ? Colors.orange : Colors.red,
                child: Icon(
                  _isPaused ? Icons.play_arrow : Icons.pause,
                  color: Colors.white,
                ),
              ),
            )
          else
            FloatingActionButton(
              onPressed: _toggleSpeech,
              backgroundColor: AppColors.darkGreenColor,
              child: const Icon(Icons.volume_up, color: Colors.white),
            ),
          const SizedBox(height: 8),
         
          if (_isSpeaking)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _stop,
                  icon: const Icon(Icons.stop, color: Colors.red),
                ),
              ],
            ),
         
          Text(
            'اردو میں سنیں',
            style: TextStyle(
              color: AppColors.darkGreenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}