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
  final String? iconPath;

  Organ({
    required this.id,
    required this.name,
    required this.description,
    this.percentage = 0,
    this.iconPath,
  });
}

final List<Organ> ALL_ORGANS = [
  Organ(
    id: "esophagus",
    name: "المريء",
    description: "أنبوب عضلي يربط الحلق بالمعدة",
    iconPath: "assets/images/icons8-anatomy-48.png",
  ),
  Organ(
    id: "stomach",
    name: "المعدة",
    description: "تقوم بهضم الطعام ميكانيكياً وكيميائياً",
    iconPath: "assets/images/icons8-stomach-100.png",
  ),
  Organ(
    id: "liver",
    name: "الكبد",
    description: "أكبر غدة في الجسم، يفرز العصارة الصفراوية",
    iconPath: "assets/images/icons8-liver-64.png",
  ),
  Organ(
    id: "pancreas",
    name: "البنكرياس",
    description: "يفرز إنزيمات هاضمة وهرمونات مثل الإنسولين",
    iconPath: "assets/images/icons8-pancreas-64.png",
  ),
  Organ(
    id: "small_intestine",
    name: "الأمعاء الدقيقة",
    description: "يتم فيها امتصاص معظم العناصر الغذائية",
    iconPath: "assets/images/small_intestine.png",
  ),
  Organ(
    id: "colon",
    name: "القولون",
    description: "يمتص الماء ويشكل الفضلات (الأمعاء الغليظة)",
    iconPath: "assets/images/icons8-colon-100.png",
  ),
  Organ(
    id: "rectum",
    name: "الشرج",
    description: "الجزء الأخير لتخزين وطرح الفضلات",
    iconPath: "assets/images/rectum_icon.png",
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
              iconPath: organ.iconPath,
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
              // Organ Icons on the Skeleton
              ...activeOrgans.map((organ) {
                bool isHovered = hoveredOrgan?.id == organ.id;

                Widget iconWidget = AnimatedOpacity(
                  opacity: isHovered ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedScale(
                    scale: isHovered ? 1.5 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: organ.iconPath != null
                        ? Image.asset(organ.iconPath!, width: 50, height: 50)
                        : const SizedBox.shrink(),
                  ),
                );

                switch (organ.id) {
                  case 'esophagus':
                    return Positioned(
                      top: 480 * 0.05,
                      left: 180 * 0.5 - 12,
                      child: SizedBox(
                        width: 24,
                        height: 112,
                        child: Center(child: iconWidget),
                      ),
                    );
                  case 'liver':
                    return Positioned(
                      top: 480 * 0.25,
                      right: 180 * 0.15,
                      child: SizedBox(
                        width: 128,
                        height: 80,
                        child: Center(child: iconWidget),
                      ),
                    );
                  case 'stomach':
                    return Positioned(
                      top: 480 * 0.28,
                      left: 180 * 0.10,
                      child: SizedBox(
                        width: 96,
                        height: 64,
                        child: Center(child: iconWidget),
                      ),
                    );
                  case 'pancreas':
                    return Positioned(
                      top: 480 * 0.42,
                      left: 180 * 0.25,
                      child: SizedBox(
                        width: 80,
                        height: 24,
                        child: Center(child: iconWidget),
                      ),
                    );
                  case 'colon':
                    return Positioned(
                      top: 480 * 0.48,
                      left: 180 * 0.5 - 88,
                      child: SizedBox(
                        width: 176,
                        height: 144,
                        child: Center(child: iconWidget),
                      ),
                    );
                  case 'small_intestine':
                    return Positioned(
                      top: 480 * 0.55,
                      left: 180 * 0.5 - 56,
                      child: SizedBox(
                        width: 112,
                        height: 80,
                        child: Center(child: iconWidget),
                      ),
                    );
                  case 'rectum':
                    return Positioned(
                      bottom: 480 * 0.10,
                      left: 180 * 0.5 - 16,
                      child: SizedBox(
                        width: 32,
                        height: 48,
                        child: Center(child: iconWidget),
                      ),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              }),
            ],
          ),
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
        top = 0.27;
        right = 0.02;
        break;
      case 'colon':
        top = 0.52;
        right = 0.02;
        break;
      case 'rectum':
        top = 0.77;
        right = 0.02;
        break;
      case 'stomach':
        top = 0.20;
        left = 0.02;
        break;
      case 'pancreas':
        top = 0.46;
        left = 0.02;
        break;
      case 'small_intestine':
        top = 0.72;
        left = 0.02;
        break;
    }

    bool isHovered = hoveredOrgan?.id == organ.id;

    return Positioned(
      top: top != null ? 480 * top : null,
      left: left != null ? 360 * left : null,
      right: right != null ? 360 * right : null,
      child: GestureDetector(
        onTap: () {
          setState(() => hoveredOrgan = organ);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: isHovered
              ? (Matrix4.identity()..scale(1.10, 1.10, 1.10))
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 56,
                height: 56,
                child: organ.iconPath != null
                    ? Image.asset(organ.iconPath!, fit: BoxFit.contain)
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: isHovered
                      ? LinearGradient(
                          colors: [Colors.blue.shade600, Colors.blue.shade700],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isHovered ? null : Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isHovered
                        ? Colors.transparent
                        : Colors.blue.shade100,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.blue.withValues(alpha: 0.4),
                            blurRadius: 10,
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
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: isHovered
                            ? Colors.white.withValues(alpha: 0.9)
                            : Colors.blue.shade900.withValues(alpha: 0.9),
                      ),
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

    drawLineMap("esophagus", p(0.88, 0.10), p(0.50, 0.08));
    drawLineMap("liver", p(0.88, 0.35), p(0.64, 0.27));
    drawLineMap("colon", p(0.88, 0.60), p(0.62, 0.53));
    drawLineMap("rectum", p(0.88, 0.85), p(0.50, 0.85));

    drawLineMap("stomach", p(0.12, 0.28), p(0.36, 0.30));
    drawLineMap("pancreas", p(0.12, 0.54), p(0.41, 0.44));
    drawLineMap("small_intestine", p(0.12, 0.80), p(0.45, 0.60));
  }

  @override
  bool shouldRepaint(covariant OrganPainter oldDelegate) {
    return oldDelegate.hoveredOrgan != hoveredOrgan ||
        oldDelegate.activeOrgans != activeOrgans;
  }
}
