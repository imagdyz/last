import 'package:flutter/material.dart';

class DoctorTopNav extends StatelessWidget {
  const DoctorTopNav({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 8,
        left: 24,
        right: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Area
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              if (MediaQuery.of(context).size.width > 360)
                Text(
                  'MediCare',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
            ],
          ),

          // Action Buttons
          Row(
            children: [
              _buildNavButton(
                context: context,
                icon: Icons.arrow_back,
                label: 'Back',
                onTap: () => Navigator.maybePop(context),
                isActive: false,
              ),
              _buildNavButton(
                context: context,
                icon: Icons.home_outlined,
                label: 'Home',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/doctor',
                  (route) => false,
                ), // simple reset to doctor home
                isActive: currentRoute == '/doctor',
              ),
              // _buildNavButton(
              //   context: context,
              //   icon: Icons.chat_bubble_outline,
              //   label: 'Chats',
              //   onTap: () => Navigator.pushNamed(context, '/doctor/chat_list'),
              //   isActive: currentRoute == '/doctor/chat_list',
              // ),
              _buildNavButton(
                context: context,
                icon: Icons.logout,
                label: 'Exit',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/step1',
                  (route) => false,
                ),
                isActive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isActive,
  }) {
    final showLabel =
        MediaQuery.of(context).size.width > 400; // Simplified responsive logic

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue[50] : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: isActive ? 24 : 22,
              color: isActive ? Colors.blue[600] : Colors.grey[400],
            ),
            if (showLabel && isActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[600],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
