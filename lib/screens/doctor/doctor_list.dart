import 'package:flutter/material.dart';
import '../../components/doctor_top_nav.dart';
import '../../data/doctors.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final condition = args?['condition'] as Map<String, dynamic>?;

    List<Map<String, dynamic>> displayDoctors = List.from(DOCTORS);

    if (condition != null) {
      String conditionName = condition['name'] ?? '';
      String prioritySpec = "";

      if (conditionName.contains("معدة") || conditionName.contains("قولون")) {
        prioritySpec = "Gastroenterology";
      } else if (conditionName.contains("قلب")) {
        prioritySpec = "Cardiology";
      } else if (conditionName.contains("نفسي") ||
          conditionName.contains("اكتئاب")) {
        prioritySpec = "Psychiatry";
      } else if (conditionName.contains("أعصاب")) {
        prioritySpec = "Neurology";
      } else if (conditionName.contains("أطفال")) {
        prioritySpec = "Pediatrics";
      } else if (conditionName.contains("عظام")) {
        prioritySpec = "Orthopedics";
      }

      if (prioritySpec.isNotEmpty) {
        final matched = DOCTORS
            .where((d) => d['spec'] == prioritySpec)
            .toList();
        final others = DOCTORS.where((d) => d['spec'] != prioritySpec).toList();
        displayDoctors = [...matched, ...others];
      }
    }

    final title = condition != null ? "الأطباء المقترحون" : "Available Doctors";

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFE),
        body: Column(
          children: [
            const DoctorTopNav(),

            // Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              // border bottom equivalent
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textDirection: condition != null
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 16),
                      Icon(Icons.favorite_border, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 1, color: Colors.grey[100]),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: displayDoctors.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Results',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }

                  final doc = displayDoctors[index - 1];
                  final isEven = (index - 1) % 2 == 0;

                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/doctor/profile',
                      arguments: {'doctor': doc},
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey[100]!),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundImage: AssetImage(
                                        'assets/images/doc_${doc['img']}.jpg',
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            doc['name'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            doc['role'],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isEven ? Icons.favorite : Icons.favorite_border,
                                color: isEven
                                    ? Colors.red[400]
                                    : Colors.grey[400],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.only(left: 68),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${doc['rating']}',
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${doc['time']}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                '/doctor/book',
                                arguments: {'doctor': doc},
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFE8F1FC),
                                foregroundColor: Colors.blue[600],
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Book Appointment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
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
      ),
    );
  }
}
