import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names

const Map<String, List<String>> ORGAN_SYMPTOMS = {
  "esophagus": [
    "حموضة",
    "ألم أعلى البطن",
    "ألم بالصدر",
    "صعوبة بلع",
    "حرقة مزمنة بالمريء",
    "فقدان وزن غير مبرر",
  ],
  "stomach": [
    "ألم في المعدة",
    "ألم شديد في المعدة",
    "غثيان أو قيء",
    "حموضة",
    "سوء هضم",
    "فقدان وزن غير مبرر",
  ],
  "liver": [
    "تعب عام وإرهاق",
    "تورم البطن (استسقاء)",
    "اصفرار الجلد أو العينين",
    "ألم بطن",
    "فقدان وزن غير مبرر",
  ],
  "pancreas": [
    "ألم شديد أعلى البطن",
    "ألم بالبطن بعد الأكل الدسم",
    "ألم مزمن بالبطن",
    "سوء هضم",
    "اصفرار الجلد أو العينين",
    "ألم بطن",
    "فقدان وزن غير مبرر",
    "نقص فيتامينات أو عناصر غذائية",
  ],
  "small_intestine": [
    "إسهال متكرر",
    "فقدان وزن غير مبرر",
    "انتفاخ البطن",
    "كثرة الغازات",
    "ألم بطن",
    "نقص فيتامينات أو عناصر غذائية",
  ],
  "colon": [
    "ألم بطن",
    "تقلصات بالبطن",
    "إسهال دموي",
    "إسهال متكرر أو إمساك متكرر",
    "شعور بعدم اكتمال حركة الأمعاء",
    "نزيف من الشرج أو مع البراز",
    "فقدان وزن غير مبرر",
    "انتفاخ البطن",
    "كثرة الغازات",
  ],
  "rectum": [
    "نزيف من الشرج أو مع البراز",
    "ألم أثناء التبرز",
    "ألم شديد أعلى البطن",
    "إفرازات من الشرج",
  ],
};

class Organ {
  final String id;
  final String name;
  final String description;
  final int percentage;

  Organ({
    required this.id,
    required this.name,
    required this.description,
    this.percentage = 0,
  });
}

final List<Organ> ALL_ORGANS = [
  Organ(
    id: "esophagus",
    name: "المريء",
    description: "أنبوب عضلي يربط الحلق بالمعدة",
  ),
  Organ(
    id: "stomach",
    name: "المعدة",
    description: "تقوم بهضم الطعام ميكانيكياً وكيميائياً",
  ),
  Organ(
    id: "liver",
    name: "الكبد",
    description: "أكبر غدة في الجسم، يفرز العصارة الصفراوية",
  ),
  Organ(
    id: "pancreas",
    name: "البنكرياس",
    description: "يفرز إنزيمات هاضمة وهرمونات مثل الإنسولين",
  ),
  Organ(
    id: "small_intestine",
    name: "الأمعاء الدقيقة",
    description: "يتم فيها امتصاص معظم العناصر الغذائية",
  ),
  Organ(
    id: "colon",
    name: "القولون",
    description: "يمتص الماء ويشكل الفضلات (الأمعاء الغليظة)",
  ),
  Organ(
    id: "rectum",
    name: "الشرج",
    description: "الجزء الأخير لتخزين وطرح الفضلات",
  ),
];

class Step2OrganSymptoms extends StatefulWidget {
  final Map<String, dynamic>? arguments;

  const Step2OrganSymptoms({super.key, this.arguments});

  @override
  State<Step2OrganSymptoms> createState() => _Step2OrganSymptomsState();
}

class _Step2OrganSymptomsState extends State<Step2OrganSymptoms> {
  Organ? hoveredOrgan;
  List<String> selectedSymptoms = [];
  List<Organ> activeOrgans = [];

  @override
  void initState() {
    super.initState();
    selectedSymptoms = widget.arguments?['symptoms'] as List<String>? ?? [];
    _calculatePercentages();
  }

  void _calculatePercentages() {
    activeOrgans = [];
    for (var organ in ALL_ORGANS) {
      final symptomsList = ORGAN_SYMPTOMS[organ.id] ?? [];
      if (symptomsList.isNotEmpty && selectedSymptoms.isNotEmpty) {
        int matchCount = symptomsList
            .where((s) => selectedSymptoms.contains(s))
            .length;
        if (matchCount > 0) {
          int percentage = ((matchCount / symptomsList.length) * 100).round();
          activeOrgans.add(
            Organ(
              id: organ.id,
              name: organ.name,
              description: organ.description,
              percentage: percentage,
            ),
          );
        }
      }
    }
  }

  void handleContinue() {
    Navigator.pushNamed(
      context,
      '/step3',
      arguments: {'symptoms': selectedSymptoms},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFE),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text(
            'خريطة الجهاز الهضمي',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Info Banner
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade100),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade500),
                    const SizedBox(width: 8),
                    const Flexible(
                      child: Text(
                        "نسبة احتمال وجود مرض في كل جهاز بناءً على الأعراض",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 3D Interactive Map
              Center(
                child: SizedBox(
                  width: 360,
                  height: 480,
                  child: Stack(
                    children: [
                      // Map Background image and glowing organs
                      _buildImageContainer(),

                      // SVG Lines
                      Positioned.fill(
                        child: IgnorePointer(
                          child: CustomPaint(
                            painter: OrganPainter(
                              hoveredOrgan: hoveredOrgan,
                              activeOrgans: activeOrgans,
                            ),
                          ),
                        ),
                      ),

                      // Floating Buttons
                      ...activeOrgans.map((o) => _buildOrganBtn(o)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Bottom Info Card
              if (hoveredOrgan != null) _buildDetailsCard(),
              const SizedBox(height: 80), // Padding for the bottom sheet
            ],
          ),
        ),
        bottomSheet: Container(
          color: const Color(0xFFF8FAFE),
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.teal, Colors.blue],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: handleContinue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'المتابعة إلى الحالات المرضية',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_back, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: (360 - 180) / 2, // horizontally centered in 360px container
      width: 180,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: hoveredOrgan != null
            ? (Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(0.03)
                ..rotateY(-0.03)
                ..scale(1.02, 1.02, 1.02))
            : Matrix4.identity(),
        transformAlignment: FractionalOffset.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.blue.shade900.withValues(alpha: 0.4),
          border: Border.all(color: Colors.white24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Stack(
            children: [
              // Glow background
              Positioned(
                top: 48,
                bottom: 48,
                left: 32,
                right: 32,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade500.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade500.withValues(alpha: 0.2),
                        blurRadius: 80,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              // Image
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: hoveredOrgan != null ? 0.3 : 0.9,
                  child: Transform.scale(
                    scale: 1.1,
                    child: Image.asset(
                      'assets/images/digestive_3d.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Organ Spots (only for active organs)
              if (hoveredOrgan?.id == 'esophagus' &&
                  activeOrgans.any((o) => o.id == 'esophagus'))
                Positioned(
                  top: 480 * 0.05,
                  left: 180 * 0.5 - 12,
                  child: _glow(24, 112, Colors.pink),
                ),
              if (hoveredOrgan?.id == 'liver' &&
                  activeOrgans.any((o) => o.id == 'liver'))
                Positioned(
                  top: 480 * 0.25,
                  right: 180 * 0.15,
                  child: _glow(128, 80, Colors.orange),
                ),
              if (hoveredOrgan?.id == 'stomach' &&
                  activeOrgans.any((o) => o.id == 'stomach'))
                Positioned(
                  top: 480 * 0.28,
                  left: 180 * 0.10,
                  child: _glow(96, 64, Colors.red),
                ),
              if (hoveredOrgan?.id == 'pancreas' &&
                  activeOrgans.any((o) => o.id == 'pancreas'))
                Positioned(
                  top: 480 * 0.42,
                  left: 180 * 0.25,
                  child: _glow(80, 24, Colors.yellow),
                ),
              if (hoveredOrgan?.id == 'colon' &&
                  activeOrgans.any((o) => o.id == 'colon'))
                Positioned(
                  top: 480 * 0.48,
                  left: 180 * 0.5 - 88,
                  child: _glow(176, 144, Colors.green),
                ),
              if (hoveredOrgan?.id == 'small_intestine' &&
                  activeOrgans.any((o) => o.id == 'small_intestine'))
                Positioned(
                  top: 480 * 0.55,
                  left: 180 * 0.5 - 56,
                  child: _glow(112, 80, Colors.cyan),
                ),
              if (hoveredOrgan?.id == 'rectum' &&
                  activeOrgans.any((o) => o.id == 'rectum'))
                Positioned(
                  bottom: 480 * 0.10,
                  left: 180 * 0.5 - 16,
                  child: _glow(32, 48, Colors.purple),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glow(double w, double h, Color c) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: c.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(w > h ? h / 2 : w / 2),
          boxShadow: [
            BoxShadow(
              color: c.withValues(alpha: 0.6),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrganBtn(Organ organ) {
    double? top, left, right;
    switch (organ.id) {
      case 'esophagus':
        top = 0.02;
        right = 0.02;
        break;
      case 'liver':
        top = 0.22;
        right = 0.02;
        break;
      case 'colon':
        top = 0.48;
        right = 0.02;
        break;
      case 'rectum':
        top = 0.78;
        right = 0.02;
        break;
      case 'stomach':
        top = 0.26;
        left = 0.02;
        break;
      case 'pancreas':
        top = 0.41;
        left = 0.02;
        break;
      case 'small_intestine':
        top = 0.58;
        left = 0.02;
        break;
    }

    bool isHovered = hoveredOrgan?.id == organ.id;

    return Positioned(
      top: top != null ? 480 * top : null,
      left: left != null ? 360 * left : null,
      right: right != null ? 360 * right : null,
      child: InkWell(
        onTap: () {
          setState(() => hoveredOrgan = organ);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isHovered
                ? Colors.blue.withValues(alpha: 0.9)
                : Colors.white.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered ? Colors.blue.shade200 : Colors.white70,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                organ.name,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? Colors.white : Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${organ.percentage}% تأثر',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: isHovered ? Colors.white70 : Colors.blue.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.blue.shade50),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            hoveredOrgan!.name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            hoveredOrgan!.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade100),
            ),
            child: Text(
              'نسبة التأثر بالأعراض: %${hoveredOrgan!.percentage}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrganPainter extends CustomPainter {
  final Organ? hoveredOrgan;
  final List<Organ> activeOrgans;

  OrganPainter({this.hoveredOrgan, required this.activeOrgans});

  @override
  void paint(Canvas canvas, Size size) {
    void drawLineMap(String organId, Offset start, Offset end) {
      if (!activeOrgans.any((o) => o.id == organId)) return;

      bool isHovered = hoveredOrgan?.id == organId;
      Paint linePaint = Paint()
        ..color = isHovered
            ? Colors.blue
            : Colors.blueGrey.withValues(alpha: 0.4)
        ..strokeWidth = isHovered ? 2.5 : 1.5
        ..style = PaintingStyle.stroke;

      canvas.drawLine(start, end, linePaint);

      Paint circlePaint = Paint()
        ..color = isHovered
            ? Colors.blue
            : Colors.blueGrey.withValues(alpha: 0.4)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(end, isHovered ? 5 : 3, circlePaint);
      canvas.drawCircle(start, isHovered ? 3 : 2, circlePaint);
    }

    Offset p(double x, double y) => Offset(size.width * x, size.height * y);

    drawLineMap("esophagus", p(0.88, 0.05), p(0.50, 0.08));
    drawLineMap("liver", p(0.88, 0.25), p(0.64, 0.27));
    drawLineMap("colon", p(0.88, 0.51), p(0.62, 0.53));
    drawLineMap("rectum", p(0.88, 0.81), p(0.50, 0.85));

    drawLineMap("stomach", p(0.12, 0.30), p(0.36, 0.30));
    drawLineMap("pancreas", p(0.12, 0.45), p(0.41, 0.44));
    drawLineMap("small_intestine", p(0.12, 0.62), p(0.45, 0.60));
  }

  @override
  bool shouldRepaint(covariant OrganPainter oldDelegate) {
    return oldDelegate.hoveredOrgan != hoveredOrgan ||
        oldDelegate.activeOrgans != activeOrgans;
  }
}
