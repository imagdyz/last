import 'package:flutter/material.dart';

class Step5Details extends StatelessWidget {
  const Step5Details({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final condition =
        args?['condition'] as Map<String, dynamic>? ??
        {'name': 'الحالة المحددة'};

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFE),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text(
            'شرح تفصيلي',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Logic Card
              _buildCard(
                title: 'المنطق الطبي',
                titleColor: Colors.blue[900]!,
                icon: Icons.medical_services_outlined,
                iconColor: Colors.blue,
                iconBg: Colors.blue[50]!,
                borderColor: Colors.grey[200]!,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[100]!),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black87,
                        height: 1.8,
                        fontSize: 14,
                        fontFamily: 'sans-serif',
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'بناءً على التشابه بين الأعراض التي تعاني منها وقاعدة بياناتنا الطبية، فإن الحالة الأقرب تطابقاً هي ',
                        ),
                        TextSpan(
                          text: '${condition['name']}',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              '. يرجى ملاحظة أن وجود هذه الأعراض قد يكون ناتجاً عن عوامل أخرى أيضاً.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Treatment Plan Card
              if (condition['treatment'] != null)
                _buildCard(
                  title: 'الخطة الطبية المقترحة',
                  titleColor: Colors.green[900]!,
                  icon: Icons.assignment_outlined,
                  iconColor: Colors.green,
                  iconBg: Colors.green[100]!,
                  borderColor: Colors.green[100]!,
                  bgColor: Colors.green[50]!,
                  child: Column(
                    children: [
                      _buildTreatmentItem(
                        title: 'العلاج المتوقع',
                        desc: condition['treatment'],
                        icon: Icons.medication_outlined,
                        iconColor: Colors.green[600]!,
                        iconBg: Colors.green[50]!,
                      ),
                      const SizedBox(height: 12),
                      _buildTreatmentItem(
                        title: 'التحاليل والمنظار',
                        desc: condition['test'],
                        icon: Icons.science_outlined,
                        iconColor: Colors.blue[600]!,
                        iconBg: Colors.blue[50]!,
                      ),
                      const SizedBox(height: 12),
                      _buildTreatmentItem(
                        title: 'احتمالية الجراحة',
                        desc: condition['surgery'],
                        icon: Icons.monitor_heart_outlined,
                        iconColor: Colors.red[600]!,
                        iconBg: Colors.red[50]!,
                      ),
                    ],
                  ),
                ),
              if (condition['treatment'] != null) const SizedBox(height: 20),

              // Recommendations Card
              _buildCard(
                title: 'التوصيات',
                titleColor: Colors.red[900]!,
                icon: Icons.thumb_up_outlined,
                iconColor: Colors.red,
                iconBg: Colors.red[100]!,
                borderColor: Colors.red[100]!,
                bgColor: Colors.red[50]!,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.red[50]!),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black87,
                        height: 1.8,
                        fontSize: 14,
                        fontFamily: 'sans-serif',
                      ),
                      children: [
                        TextSpan(
                          text: 'خطوة يُنصح بها بشدة:\n',
                          style: TextStyle(
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'يُرجى تحديد موعد مع طبيب أمراض الجهاز الهضمي في أقرب وقت ممكن للحصول على تشخيص دقيق وبدء خطة العلاج المناسبة لتخفيف أعراض حالة ${condition['name']}.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Disclaimer Card
              _buildCard(
                title: 'إخلاء مسؤولية مهم',
                titleColor: Colors.orange[900]!,
                icon: Icons.warning_amber_outlined,
                iconColor: Colors.orange,
                iconBg: Colors.orange[100]!,
                borderColor: Colors.orange[100]!,
                bgColor: Colors.orange[50]!,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.orange[50]!),
                  ),
                  child: const Text(
                    'تم تصميم نظام دعم القرارات الهضمية هذا لتوفير مؤشرات محتملة بناءً على الأعراض المدخلة، ولكنه لا يعتبر تشخيصاً طبياً نهائياً بأي حال من الأحوال. يجب استشارة طبيب مختص للحصول على تشخيص دقيق وخطة علاجية مناسبة.',
                    style: TextStyle(
                      color: Colors.black87,
                      height: 1.8,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required Color titleColor,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required Color borderColor,
    Color bgColor = Colors.white,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildTreatmentItem({
    required String title,
    required String desc,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green[50]!),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
