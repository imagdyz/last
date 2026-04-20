import 'package:flutter/material.dart';

final Map<String, Map<String, List<String>>> diseaseFoodsMapping = {
  "ارتجاع المريء": {
    "harmful": ["الأكل الدسم", "القهوة", "الشوكولاتة", "الأطعمة الحارة"],
    "beneficial": ["الشوفان", "الموز", "الخضار المسلوق"],
  },
  "مريء باريت": {
    "harmful": ["الدهون", "المقليات", "الكحول"],
    "beneficial": ["الخضروات", "الفواكه", "الأطعمة قليلة الدهون"],
  },
  "سرطان المريء": {
    "harmful": ["الكحول", "التدخين", "الأطعمة الحارة"],
    "beneficial": ["أطعمة غنية بالبروتين", "خضروات", "شوربة"],
  },
  "تقلصات المريء": {
    "harmful": ["الكافيين", "الأطعمة القاسية"],
    "beneficial": ["أطعمة خفيفة", "زبادي", "خضار"],
  },
  // أمراض المعدة
  "جرثومة المعدة": {
    "harmful": ["الأكل الحار", "المقليات", "القهوة"],
    "beneficial": ["الزبادي", "العسل", "البروكلي"],
  },
  "التهاب المعدة": {
    "harmful": ["الكحول", "التوابل", "المقليات"],
    "beneficial": ["الأرز", "الموز", "البطاطس المسلوقة"],
  },
  "قرحة المعدة": {
    "harmful": ["القهوة", "الأكل الحار", "التدخين"],
    "beneficial": ["الشوفان", "العسل", "اللبن"],
  },
  "سرطان المعدة": {
    "harmful": ["اللحوم المصنعة", "الأطعمة المدخنة"],
    "beneficial": ["بروتينات خفيفة", "خضروات"],
  },
  // أمراض الأمعاء
  "السيلياك": {
    "harmful": ["القمح", "الشعير", "الجلوتين"],
    "beneficial": ["الأرز", "الذرة", "البطاطس"],
  },
  "نمو بكتيري زائد": {
    "harmful": ["السكريات", "الأطعمة المصنيعة"],
    "beneficial": ["الزبادي", "الأطعمة قليلة السكر"],
  },
  "داء كرون": {
    "harmful": ["الأطعمة الدسمة", "الأطعمة الحارة"],
    "beneficial": ["الأرز", "الدجاج", "الموز"],
  },
  "سوء الامتصاص": {
    "harmful": ["الأطعمة المصنعة"],
    "beneficial": ["أطعمة غنية بالفيتامينات"],
  },
  // أمراض القولون
  "القولون العصبي": {
    "harmful": ["الفاصوليا", "الكافيين", "الأطعمة الحارة"],
    "beneficial": ["الشوفان", "الزبادي", "النعناع"],
  },
  "القولون التقرحي": {
    "harmful": ["المقليات", "الأطعمة الحارة"],
    "beneficial": ["الأرز", "البطاطس", "البروتين الخفيف"],
  },
  "زوائد قولونية": {
    "harmful": ["اللحوم المصنعة"],
    "beneficial": ["الخضروات", "الألياف"],
  },
  "سرطان القولون": {
    "harmful": ["اللحوم المصنعة", "الدهون"],
    "beneficial": ["الخضروات", "الفواكه", "الألياف"],
  },
  // أمراض الشرج
  "البواسير": {
    "harmful": ["الإمساك", "الأطعمة الحارة"],
    "beneficial": ["الألياف", "الماء", "الخضروات"],
  },
  "الشق الشرجي": {
    "harmful": ["الأطعمة التي تسبب الإمساك"],
    "beneficial": ["الألياف", "الفواكه"],
  },
  "الناسور الشرجي": {
    "harmful": ["الأطعمة الملوثة"],
    "beneficial": ["غذاء صحي متوازن"],
  },
  "سرطان المستقيم": {
    "harmful": ["اللحوم المصنعة"],
    "beneficial": ["ألياف", "خضروات"],
  },
  // أمراض الكبد
  "الكبد الدهني": {
    "harmful": ["الدهون", "السكريات"],
    "beneficial": ["الخضروات", "السمك", "زيت الزيتون"],
  },
  "تليف الكبد": {
    "harmful": ["الكحول", "الدهون"],
    "beneficial": ["البروتين الخفيف", "الخضار"],
  },
  "فيروس سي": {
    "harmful": ["الكحول", "الدهون"],
    "beneficial": ["غذاء صحي", "فواكه"],
  },
  "سرطان الكبد": {
    "harmful": ["الكحول", "الأطعمة الملوثة"],
    "beneficial": ["أطعمة مغذية", "بروتين"],
  },
  // أمراض المرارة
  "حصوات المرارة": {
    "harmful": ["الدهون", "المقليات"],
    "beneficial": ["خضروات", "فواكه", "ألياف"],
  },
  "التهاب المرارة": {
    "harmful": ["الدهون"],
    "beneficial": ["أطعمة خفيفة"],
  },
  "انسداد القناة المرارية": {
    "harmful": ["الدهون الثقيلة"],
    "beneficial": ["أطعمة قليلة الدهون"],
  },
  "سرطان المرارة": {
    "harmful": ["الدهون والمقليات"],
    "beneficial": ["غذاء صحي"],
  },
  // أمراض البنكرياس
  "التهاب البنكرياس الحاد": {
    "harmful": ["الكحول", "الدهون"],
    "beneficial": ["أطعمة خفيفة", "سوائل"],
  },
  "التهاب البنكرياس المزمن": {
    "harmful": ["الكحول", "المقليات"],
    "beneficial": ["أطعمة قليلة الدهون"],
  },
  "سرطان البنكرياس": {
    "harmful": ["الدهون الثقيلة"],
    "beneficial": ["بروتين خفيف", "خضروات"],
  },
  "قصور البنكرياس": {
    "harmful": ["الأطعمة الدسمة"],
    "beneficial": ["أطعمة سهلة الهضم"],
  },
};

class Step4Result extends StatelessWidget {
  const Step4Result({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final List<String> symptoms = List<String>.from(args?['symptoms'] ?? []);
    final condition =
        args?['condition'] as Map<String, dynamic>? ??
        {'name': 'غير محدد', 'match': 0, 'symptoms': []};

    final percentage = condition['match'] as int? ?? 0;
    final score = (percentage * 0.207).toStringAsFixed(1);

    final conditionSymptoms = List<String>.from(condition['symptoms'] ?? []);
    final matchedSymptoms = conditionSymptoms
        .where((s) => symptoms.contains(s))
        .toList();

    String severityLabel = "منخفضة";
    Color severityColor = Colors.green;
    Color strokeColor = Colors.green;
    Color textColor = Colors.green;

    if (percentage >= 75) {
      severityLabel = "عالية";
      severityColor = const Color(0xFFF05349);
      strokeColor = const Color(0xFFF05349);
      textColor = const Color(0xFFF05349);
    } else if (percentage >= 40) {
      severityLabel = "متوسطة";
      severityColor = Colors.orange;
      strokeColor = Colors.orange;
      textColor = Colors.orange;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text(
            'نتيجة التشخيص',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40, bottom: 64),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFCE4E4), Color(0xFFFCF0F0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      condition['name'],
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Circular Progress
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            value: percentage / 100,
                            strokeWidth: 18,
                            backgroundColor: Colors.grey[200],
                            color: strokeColor,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$percentage%',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            Text(
                              'النتيجة: $score',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: severityColor,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: severityColor.withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        severityLabel,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Transform.translate(
                offset: const Offset(0, -30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // Matched Symptoms
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.teal[100]!),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.teal[50],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.teal[600],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'الأعراض التي تناسب هذا المرض من التي اخترتها',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: matchedSymptoms.isNotEmpty
                                  ? matchedSymptoms
                                        .map(
                                          (s) => Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.teal[50],
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              s,
                                              style: TextStyle(
                                                color: Colors.teal[800],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList()
                                  : [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey[200]!,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                        child: const Text(
                                          'لم تُسجَّل أي أعراض من النموذج الخاص بهذا المرض ضمن الأعراض التي اخترتها.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Foods Table
                      if (diseaseFoodsMapping.containsKey(condition['name']))
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.grey[200]!),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.green,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'الأطعمة المفيدة',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.red,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.highlight_off,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'الأطعمة الضارة',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.green[50]?.withValues(
                                            alpha: 0.5,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: diseaseFoodsMapping[condition['name']]!['beneficial']!
                                                .map(
                                                  (f) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          bottom: 12,
                                                        ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 8,
                                                          height: 8,
                                                          decoration:
                                                              const BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            f,
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .green[800],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.red[50]?.withValues(
                                            alpha: 0.5,
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: diseaseFoodsMapping[condition['name']]!['harmful']!
                                                .map(
                                                  (f) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          bottom: 12,
                                                        ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 8,
                                                          height: 8,
                                                          decoration:
                                                              const BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            f,
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .red[800],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      const SizedBox(height: 24),

                      // Actions
                      OutlinedButton.icon(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/doctor',
                          arguments: {'condition': condition},
                        ),
                        icon: const Icon(
                          Icons.playlist_add_check,
                          color: Colors.teal,
                        ),
                        label: const Text(
                          'زيارات طبية',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 56),
                          side: BorderSide(color: Colors.teal[100]!, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/step5',
                          arguments: {'condition': condition},
                        ),
                        icon: const Icon(
                          Icons.insert_drive_file_outlined,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'عرض الشرح التفصيلي',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 56),
                          backgroundColor: Colors.blue,
                          shadowColor: Colors.blue.withValues(alpha: 0.3),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      OutlinedButton.icon(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/step1'),
                        icon: const Icon(
                          Icons.home_outlined,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          'بدء تشخيص جديد',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 56),
                          side: BorderSide(color: Colors.blue[100]!, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
