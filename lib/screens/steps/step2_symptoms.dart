import 'package:flutter/material.dart';

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

IconData getSymptomIcon(String symptom) {
  switch (symptom) {
    case "حموضة":
    case "حرقة مزمنة بالمريء":
      return Icons.local_fire_department_outlined;
    case "ألم أعلى البطن":
    case "ألم مزمن بالبطن":
      return Icons.monitor_heart_outlined;
    case "ألم بالصدر":
      return Icons.favorite_border;
    case "صعوبة بلع":
    case "سوء هضم":
      return Icons.sentiment_dissatisfied;
    case "فقدان وزن غير مبرر":
      return Icons.balance;
    case "ألم في المعدة":
    case "ألم بطن":
      return Icons.sick_outlined;
    case "ألم شديد في المعدة":
    case "ألم شديد أعلى البطن":
    case "ألم أثناء التبرز":
      return Icons.warning_amber_rounded;
    case "غثيان أو قيء":
      return Icons.cloud_outlined;
    case "إسهال متكرر":
    case "كثرة الغازات":
      return Icons.air;
    case "انتفاخ البطن":
    case "تورم البطن (استسقاء)":
      return Icons.radio_button_unchecked;
    case "نقص فيتامينات أو عناصر غذائية":
      return Icons.battery_alert_outlined;
    case "تقلصات بالبطن":
      return Icons.bolt;
    case "إسهال دموي":
    case "نزيف من الشرج أو مع البراز":
    case "إفرازات من الشرج":
      return Icons.water_drop_outlined;
    case "إسهال متكرر أو إمساك متكرر":
      return Icons.sync;
    case "شعور بعدم اكتمال حركة الأمعاء":
      return Icons.error_outline;
    case "تعب عام وإرهاق":
      return Icons.battery_0_bar;
    case "اصفرار الجلد أو العينين":
      return Icons.remove_red_eye_outlined;
    case "ألم بالبطن بعد الأكل الدسم":
      return Icons.restaurant_menu;
    default:
      return Icons.monitor_heart_outlined;
  }
}

class Step2Symptoms extends StatefulWidget {
  const Step2Symptoms({super.key});

  @override
  State<Step2Symptoms> createState() => _Step2SymptomsState();
}

class _Step2SymptomsState extends State<Step2Symptoms> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredSymptoms = [];
  final List<String> _selectedSymptoms = [];
  late final List<String> _allSymptomsList;

  @override
  void initState() {
    super.initState();
    Set<String> allSet = {};
    for (var list in ORGAN_SYMPTOMS.values) {
      allSet.addAll(list);
    }
    _allSymptomsList = allSet.toList();
    _filteredSymptoms = List.from(_allSymptomsList);
  }

  void _onSearch(String query) {
    setState(() {
      _filteredSymptoms = _allSymptomsList
          .where((symptom) => symptom.contains(query))
          .toList();
    });
  }

  void _toggleSymptom(String symptom) {
    setState(() {
      if (_selectedSymptoms.contains(symptom)) {
        _selectedSymptoms.remove(symptom);
      } else {
        _selectedSymptoms.add(symptom);
      }
    });
  }

  void _clearAll() {
    setState(() {
      _selectedSymptoms.clear();
    });
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
            'تقييم الأعراض',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            // Fixed Search Bar & Status
            Container(
              color: const Color(0xFFF8FAFE),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                children: [
                  // Search Input
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearch,
                      decoration: const InputDecoration(
                        hintText: 'ابحث عن الأعراض...',
                        prefixIcon: Icon(Icons.search, color: Colors.blue),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Selection Tracker Block
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_selectedSymptoms.isNotEmpty)
                          GestureDetector(
                            onTap: _clearAll,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'مسح الكل',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Icon(
                                    Icons.menu,
                                    color: Colors.red.shade400,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          const SizedBox(),
                        Row(
                          children: [
                            Text(
                              '${_selectedSymptoms.length} أعراض محددة',
                              style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Symptoms Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _filteredSymptoms.length,
                itemBuilder: (context, index) {
                  final symptom = _filteredSymptoms[index];
                  final isSelected = _selectedSymptoms.contains(symptom);

                  return GestureDetector(
                    onTap: () => _toggleSymptom(symptom),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF2F6FC)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF1C4DA1)
                              : Colors.grey.shade100,
                          width: 1.5,
                        ),
                        boxShadow: isSelected
                            ? []
                            : const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue.shade100
                                  : const Color(0xFFF8FAFE),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.blue.shade200
                                    : Colors.grey.shade100,
                              ),
                            ),
                            child: Icon(
                              getSymptomIcon(symptom),
                              color: isSelected
                                  ? Colors.blue.shade700
                                  : Colors.blue.shade500,
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            symptom,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: isSelected
                                  ? Colors.blue.shade900
                                  : const Color(0xFF101828),
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          color: const Color(0xFFF8FAFE),
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: _selectedSymptoms.isNotEmpty
                  ? const LinearGradient(colors: [Colors.teal, Colors.blue])
                  : null,
              color: _selectedSymptoms.isEmpty ? Colors.grey[300] : null,
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
              onPressed: _selectedSymptoms.isEmpty
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        '/step2_organ_symptoms', // now acts as skeleton map
                        arguments: {'symptoms': _selectedSymptoms},
                      );
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'عرض تأثير الأعراض',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _selectedSymptoms.isNotEmpty
                          ? Colors.white
                          : Colors.grey[500],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_back,
                    color: _selectedSymptoms.isNotEmpty
                        ? Colors.white
                        : Colors.grey[500],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
