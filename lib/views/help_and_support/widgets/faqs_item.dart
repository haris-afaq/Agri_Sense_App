import 'package:agri_sense_mobile_app/config/constants/app_colors.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/body_text_1.dart';
import 'package:agri_sense_mobile_app/config/widgets/test_styles/heading_3.dart';
import 'package:flutter/material.dart';

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final IconData questionIcon;
  final IconData answerIcon;

  const FaqItem({
    Key? key,
    required this.question,
    required this.answer,
    this.questionIcon = Icons.arrow_drop_down,
    this.answerIcon = Icons.arrow_upward,
  }) : super(key: key);

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.shadowGreyColor),
        borderRadius: BorderRadius.circular(5)
      ),
      
      margin: const EdgeInsets.symmetric(vertical: 3,),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Heading3(title: _showAnswer ? widget.question : widget.question,)
                ),
                IconButton(
                  icon: Icon(
                    _showAnswer
                        ? widget.answerIcon
                        : widget.questionIcon,
                  ),
                  onPressed: () {
                    setState(() {
                      _showAnswer = !_showAnswer;
                    });
                  },
                ),
              ],
            ),


            if (_showAnswer) ...[
              // const SizedBox(height: 8),
              Bodytext1(text: widget.answer,)
            ],
          ],
        ),
      ),
    );
  }
}
