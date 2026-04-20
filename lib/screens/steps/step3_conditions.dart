import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names

const List<Map<String, dynamic>> CONDITIONS_DATA = [
  // أمراض المريء
  {
    "id": 1,
    "name": "ارتجاع المريء",
    "symptoms": ["حموضة", "ألم بالصدر", "ألم أعلى البطن", "صعوبة بلع"],
    "description":
        "ضعف في صمام المعدة يؤدي إلى ارتجاع الحمض إلى المريء مسببًا حموضة وألمًا في الصدر أو أعلى البطن.",
    "surgery": "نادر",
    "test": "أحيانا منظار",
    "treatment": "أدوية تقليل الحمض",
  },
  {
    "id": 2,
    "name": "مريء باريت",
    "symptoms": ["حرقة مزمنة بالمريء", "حموضة"],
    "description":
        "تغيّر مزمن في بطانة المريء نتيجة ارتجاع مزمن للحمض، يحتاج إلى متابعة دورية بالمنظار.",
    "surgery": "أحيانا",
    "test": "منظار وخزعة",
    "treatment": "متابعة وعلاج الارتجاع",
  },
  {
    "id": 3,
    "name": "سرطان المريء",
    "symptoms": ["صعوبة بلع", "فقدان وزن غير مبرر"],
    "description":
        "ورم خبيث في المريء يرتبط بالتدخين والارتجاع المزمن، يظهر غالبًا بصعوبة في البلع ونقص في الوزن.",
    "surgery": "غالبا",
    "test": "خزعة منظار",
    "treatment": "علاج أورام",
  },
  {
    "id": 4,
    "name": "تقلصات المريء",
    "symptoms": ["ألم بالصدر", "صعوبة بلع"],
    "description":
        "اضطراب في حركة المريء يسبب ألمًا يشبه ألم القلب وصعوبة في بلع الطعام.",
    "surgery": "نادر",
    "test": "اختبار حركة المريء",
    "treatment": "أدوية",
  },
  // أمراض المعدة
  {
    "id": 5,
    "name": "جرثومة المعدة",
    "symptoms": ["ألم في المعدة", "حموضة", "غثيان أو قيء"],
    "description":
        "عدوى بكتيرية في جدار المعدة تسبب ألمًا وحموضة وغثيانًا، وتحتاج إلى علاج بالمضادات الحيوية.",
    "surgery": "لا",
    "test": "تحليل براز أو تنفس",
    "treatment": "مضادات حيوية",
  },
  {
    "id": 6,
    "name": "التهاب المعدة",
    "symptoms": ["ألم في المعدة", "غثيان أو قيء", "سوء هضم"],
    "description":
        "التهاب في بطانة المعدة قد يكون بسبب الجرثومة أو المسكنات، يسبب ألمًا وغثيانًا واضطرابًا في الهضم.",
    "surgery": "لا",
    "test": "منظار أحيانا",
    "treatment": "أدوية",
  },
  {
    "id": 7,
    "name": "قرحة المعدة",
    "symptoms": ["ألم شديد في المعدة", "غثيان أو قيء"],
    "description":
        "قرحة عميقة في جدار المعدة تسبب ألمًا شديدًا وقد يصاحبها قيء أو نزيف.",
    "surgery": "نادر",
    "test": "منظار",
    "treatment": "أدوية",
  },
  {
    "id": 8,
    "name": "سرطان المعدة",
    "symptoms": ["فقدان وزن غير مبرر", "ألم في المعدة"],
    "description":
        "التهاب مزمن بالمعدة قد يتطور إلى ورم خبيث يظهر غالبًا بألم في المعدة ونقص في الوزن.",
    "surgery": "غالبا",
    "test": "منظار + خزعة",
    "treatment": "علاج أورام",
  },
  // أمراض الأمعاء
  {
    "id": 9,
    "name": "مرض السيلياك",
    "symptoms": ["إسهال متكرر", "فقدان وزن غير مبرر"],
    "description":
        "حساسية من الجلوتين تؤدي إلى إسهال مزمن ونقص في الوزن وسوء امتصاص للعناصر الغذائية.",
    "surgery": "لا",
    "test": "تحليل دم",
    "treatment": "نظام غذائي",
  },
  {
    "id": 10,
    "name": "نمو بكتيري زائد في الأمعاء",
    "symptoms": ["انتفاخ البطن", "كثرة الغازات"],
    "description":
        "زيادة غير طبيعية في البكتيريا داخل الأمعاء الدقيقة تسبب انتفاخًا وغازات وعدم ارتياح.",
    "surgery": "لا",
    "test": "اختبار تنفس",
    "treatment": "مضادات حيوية",
  },
  {
    "id": 11,
    "name": "داء كرون",
    "symptoms": ["إسهال متكرر", "ألم بطن"],
    "description":
        "مرض مناعي مزمن يصيب القناة الهضمية ويسبب إسهالًا وألمًا بالبطن مع نوبات متكررة.",
    "surgery": "أحيانا",
    "test": "منظار",
    "treatment": "تحليل + أدوية",
  },
  {
    "id": 12,
    "name": "سوء الامتصاص",
    "symptoms": ["إسهال متكرر", "نقص فيتامينات أو عناصر غذائية"],
    "description":
        "حالات مختلفة تؤدي لعدم امتصاص الغذاء بشكل كاف، فتظهر بنقص في الفيتامينات وإسهال مزمن.",
    "surgery": "نادر",
    "test": "تحليل دم",
    "treatment": "علاج السبب",
  },
  // أمراض القولون
  {
    "id": 13,
    "name": "القولون العصبي",
    "symptoms": [
      "ألم بطن",
      "انتفاخ البطن",
      "كثرة الغازات",
      "تقلصات بالبطن",
      "إسهال متكرر",
      "إمساك متكرر",
      "شعور بعدم اكتمال حركة الأمعاء",
    ],
    "description":
        "اضطراب وظيفي شائع للقولون يرتبط بالتوتر ويظهر بألم وانتفاخ وإسهال أو إمساك متكرر.",
    "surgery": "لا يحتاج",
    "test": "لا غالبا",
    "treatment": "تنظيم الغذاء",
  },
  {
    "id": 14,
    "name": "القولون التقرحي",
    "symptoms": ["إسهال دموي", "ألم بطن"],
    "description":
        "مرض مناعي في القولون يسبب التهابات وتقرحات مع إسهال دموي وآلام في البطن.",
    "surgery": "أحيانا",
    "test": "منظار",
    "treatment": "أدوية",
  },
  {
    "id": 15,
    "name": "زوائد قولونية",
    "symptoms": [],
    "description":
        "زوائد في جدار القولون غالبًا بدون أعراض، لكنها قد تتحول إلى أورام لاحقًا وتحتاج للمتابعة بالمنظار.",
    "surgery": "أحيانا",
    "test": "منظار",
    "treatment": "إزالة بالمنظار",
  },
  {
    "id": 16,
    "name": "سرطان القولون",
    "symptoms": ["نزيف من الشرج أو مع البراز", "فقدان وزن غير مبرر"],
    "description":
        "ورم خبيث في القولون يظهر غالبًا بنزيف في البراز ونقص في الوزن، خاصة فوق سن الأربعين.",
    "surgery": "غالبا",
    "test": "منظار",
    "treatment": "علاج أورام",
  },
  // أمراض الشرج والمستقيم
  {
    "id": 17,
    "name": "البواسير",
    "symptoms": ["نزيف من الشرج أو مع البراز", "ألم أثناء التبرز"],
    "description":
        "تضخم في أوردة الشرج بسبب الإمساك، يسبب نزيفًا وألمًا عند التبرز.",
    "surgery": "أحيانا",
    "test": "فحص طبي",
    "treatment": "أدوية",
  },
  {
    "id": 18,
    "name": "الشق الشرجي",
    "symptoms": ["ألم أثناء التبرز", "ألم شديد أعلى البطن"],
    "description":
        "جرح صغير في فتحة الشرج يسبب ألمًا شديدًا أثناء وبعد التبرز.",
    "surgery": "أحيانا",
    "test": "فحص",
    "treatment": "مراهم",
  },
  {
    "id": 19,
    "name": "الناسور الشرجي",
    "symptoms": ["إفرازات من الشرج"],
    "description":
        "قناة غير طبيعية بين الشرج والجلد المحيط، تظهر بإفرازات متكررة وألم موضعي.",
    "surgery": "نعم",
    "test": "فحص",
    "treatment": "خراج أو جراحة",
  },
  {
    "id": 20,
    "name": "سرطان المستقيم",
    "symptoms": ["نزيف من الشرج أو مع البراز", "ألم أثناء التبرز"],
    "description":
        "ورم خبيث في نهاية القولون/المستقيم، يظهر عادة بنزيف وألم في منطقة الشرج.",
    "surgery": "نعم",
    "test": "منظار",
    "treatment": "علاج أورام",
  },
  // أمراض الكبد
  {
    "id": 21,
    "name": "الكبد الدهني",
    "symptoms": ["تعب عام وإرهاق", "ألم بطن"],
    "description":
        "تراكم الدهون على الكبد غالبًا مع السمنة، يسبب تعبًا وألمًا خفيفًا في الجزء الأيمن العلوي من البطن.",
    "surgery": "لا",
    "test": "تحليل وظائف كبد",
    "treatment": "نظام غذائي",
  },
  {
    "id": 22,
    "name": "تليف الكبد",
    "symptoms": ["تورم البطن (استسقاء)", "تعب عام وإرهاق"],
    "description":
        "مرحلة متقدمة من أمراض الكبد المزمنة، يظهر معها تورم البطن وقد يحدث تجمع للسوائل.",
    "surgery": "نادر",
    "test": "تحليل + أشعة",
    "treatment": "علاج دوائي ومتابعة",
  },
  {
    "id": 23,
    "name": "فيروس سي",
    "symptoms": ["تعب عام وإرهاق", "اصفرار الجلد أو العينين"],
    "description":
        "عدوى فيروسية مزمنة في الكبد، قد تسبب تعبًا مزمنًا واصفرارًا في الجلد والعينين.",
    "surgery": "لا",
    "test": "تحليل دم",
    "treatment": "علاج دوائي",
  },
  {
    "id": 24,
    "name": "سرطان الكبد",
    "symptoms": ["ألم بطن", "فقدان وزن غير مبرر"],
    "description":
        "ورم خبيث في الكبد غالبًا على خلفية تليف، يظهر بألم في أعلى البطن ونقص في الوزن.",
    "surgery": "أحيانا",
    "test": "أشعة + تحليل",
    "treatment": "علاج أورام",
  },
  // أمراض المرارة
  {
    "id": 25,
    "name": "حصوات المرارة",
    "symptoms": ["ألم بالبطن بعد الأكل الدسم"],
    "description":
        "حصوات داخل المرارة تسبب ألمًا في أعلى البطن خاصة بعد تناول الوجبات الدسمة.",
    "surgery": "غالبا",
    "test": "أشعة",
    "treatment": "مسكنات أو استئصال",
  },
  {
    "id": 26,
    "name": "التهاب المرارة",
    "symptoms": ["ألم شديد أعلى البطن", "ألم بالبطن بعد الأكل الدسم"],
    "description":
        "التهاب حاد في المرارة غالبًا بسبب الحصوات، يسبب ألمًا شديدًا وحمى أحيانًا.",
    "surgery": "نعم",
    "test": "أشعة",
    "treatment": "مضادات حيوية أو استئصال",
  },
  {
    "id": 27,
    "name": "انسداد القناة المرارية",
    "symptoms": ["اصفرار الجلد أو العينين", "ألم شديد أعلى البطن"],
    "description":
        "انسداد في القناة المرارية يؤدي إلى ركود العصارة الصفراوية وظهور اصفرار وألم شديد.",
    "surgery": "نعم",
    "test": "أشعة أو منظار",
    "treatment": "علاج لفتح القناة",
  },
  {
    "id": 28,
    "name": "سرطان المرارة",
    "symptoms": ["ألم بطن", "فقدان وزن غير مبرر"],
    "description":
        "ورم خبيث نادر في المرارة، يظهر عادة بألم في أعلى البطن ونقص في الوزن.",
    "surgery": "نعم",
    "test": "أشعة",
    "treatment": "علاج أورام",
  },
  // أمراض البنكرياس
  {
    "id": 29,
    "name": "التهاب البنكرياس الحاد",
    "symptoms": ["ألم شديد أعلى البطن"],
    "description":
        "التهاب حاد في البنكرياس غالبًا مرتبط بحصوات المرارة، يسبب ألمًا شديدًا في أعلى البطن يحتاج إلى دخول المستشفى.",
    "surgery": "أحيانا",
    "test": "تحليل إنزيمات",
    "treatment": "علاج بالمستشفى",
  },
  {
    "id": 30,
    "name": "التهاب البنكرياس المزمن",
    "symptoms": ["ألم مزمن بالبطن", "سوء هضم"],
    "description":
        "التهاب مزمن في البنكرياس يؤدي إلى ألم مستمر وضعف في إفراز الإنزيمات الهاضمة.",
    "surgery": "أحيانا",
    "test": "أشعة",
    "treatment": "علاج دوائي ومتابعة",
  },
  {
    "id": 31,
    "name": "سرطان البنكرياس",
    "symptoms": ["فقدان وزن غير مبرر", "ألم بطن"],
    "description":
        "ورم خبيث في البنكرياس غالبًا ما يظهر بألم مبهم في البطن ونقص ملحوظ في الوزن.",
    "surgery": "أحيانا",
    "test": "أشعة",
    "treatment": "علاج أورام",
  },
  {
    "id": 32,
    "name": "قصور البنكرياس",
    "symptoms": ["سوء هضم", "نقص فيتامينات أو عناصر غذائية"],
    "description":
        "نقص في إفراز إنزيمات البنكرياس يسبب سوء هضم ونقصًا في امتصاص الدهون والفيتامينات.",
    "surgery": "لا",
    "test": "تحليل براز إنزيمات",
    "treatment": "إنزيمات هاضمة تعويضية",
  },
];

class Step3Conditions extends StatelessWidget {
  const Step3Conditions({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments safely
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final List<String> selectedSymptoms = List<String>.from(
      args?['symptoms'] ?? [],
    );

    // Calculate match percentages
    List<Map<String, dynamic>> calculatedConditions = [];

    for (var condition in CONDITIONS_DATA) {
      List<String> sim = List<String>.from(condition['symptoms']);
      int matchCount = sim.where((s) => selectedSymptoms.contains(s)).length;

      int matchPercentage = 0;
      if (selectedSymptoms.isNotEmpty && sim.isNotEmpty) {
        matchPercentage = ((matchCount / sim.length) * 100).round();
      }

      if (matchPercentage > 0) {
        Color color = Colors.grey;
        Color bgLight = Colors.grey[100]!;
        Color textDark = Colors.grey[700]!;

        if (matchPercentage >= 75) {
          color = Colors.red;
          bgLight = Colors.red[100]!;
          textDark = Colors.red[700]!;
        } else if (matchPercentage >= 40) {
          color = Colors.orange;
          bgLight = Colors.orange[100]!;
          textDark = Colors.orange[700]!;
        } else {
          color = Colors.yellow[700]!;
          bgLight = Colors.yellow[100]!;
          textDark = Colors.yellow[800]!;
        }

        calculatedConditions.add({
          ...condition,
          'match': matchPercentage,
          'matchCount': matchCount,
          'symptomsCount': '$matchCount/${sim.length} أعراض مطابقة',
          'color': color,
          'bgLight': bgLight,
          'textDark': textDark,
        });
      }
    }

    calculatedConditions.sort(
      (a, b) => (b['match'] as int).compareTo(a['match'] as int),
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFE),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text(
            'اختر الحالة',
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
              // Info Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue[50]!),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.info_outline, color: Colors.blue),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'بناءً على الأعراض المحددة، اختر حالة للتقييم:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Conditions List
              ...calculatedConditions.map((condition) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/step4',
                      arguments: {
                        'symptoms': selectedSymptoms,
                        'condition': condition,
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    condition['name'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: condition['bgLight'],
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          '${condition['match']}% مطابقة',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: condition['textDark'],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        condition['symptomsCount'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.medical_services_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          condition['description'],
                          style: const TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Progress Bar
                        Container(
                          height: 10,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerRight,
                            widthFactor: condition['match'] / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                color: condition['color'],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              if (calculatedConditions.isEmpty)
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: const Center(
                    child: Text(
                      'لا توجد حالات أو أمراض مطابقة للأعراض المحددة.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
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
