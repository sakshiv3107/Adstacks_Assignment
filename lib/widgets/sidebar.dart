import 'package:flutter/material.dart';

class SidebarWidget extends StatefulWidget {
  final bool isCollapsed;

  const SidebarWidget({super.key, this.isCollapsed = false});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  int _selectedIndex = 0;

  // Light theme colors
  static const _bg = Color(0xFFFFFFFF);
  static const _accent = Color(0xFF6C63FF);
  static const _selectedBg = Color(0xFFEEECFF);
  static const _selectedText = Color(0xFF6C63FF);
  static const _unselectedText = Color(0xFF6B7280);
  static const _divider = Color(0xFFE5E7EB);
  static const _sectionLabel = Color(0xFF9CA3AF);
  static const _userCardBg = Color(0xFFF5F6FA);
  static const _logoText = Color(0xFF1A1A2E);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isCollapsed ? 70 : 220,
      decoration: BoxDecoration(
        color: _bg,
        border: Border(
          right: BorderSide(color: _divider),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          _buildLogo(),
          const SizedBox(height: 20),
          _buildUserSection(),
          const SizedBox(height: 16),
          const Divider(color: _divider, height: 1),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(0, Icons.home, 'Home'),
                  _buildNavItem(1, Icons.people, 'Employees'),
                  _buildNavItem(2, Icons.calendar_today, 'Attendance'),
                  _buildNavItem(3, Icons.summarize, 'Summary'),
                  _buildNavItem(4, Icons.info_outline, 'Information'),
                  const SizedBox(height: 16),
                  if (!widget.isCollapsed) _buildWorkspacesHeader(),
                  if (!widget.isCollapsed) _buildWorkspaceItem('Adstacks'),
                  if (!widget.isCollapsed) _buildWorkspaceItem('Finance'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const Divider(color: _divider, height: 1),
          const SizedBox(height: 8),
          _buildNavItem(5, Icons.settings, 'Settings'),
          _buildNavItem(6, Icons.logout, 'Logout'),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment:
          widget.isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (!widget.isCollapsed) const SizedBox(width: 20),
        const CircleAvatar(
          backgroundColor: _accent,
          radius: 16,
          child: Text(
            'AS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (!widget.isCollapsed) const SizedBox(width: 12),
        if (!widget.isCollapsed)
          const Text(
            'Adstacks',
            style: TextStyle(
              color: _logoText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }

  Widget _buildUserSection() {
    if (widget.isCollapsed) {
      return const CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xFFE5E7EB),
        child: Icon(Icons.person, color: _unselectedText),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _userCardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _divider),
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFFE5E7EB),
              child: Icon(Icons.person, color: _unselectedText, size: 30),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pooja Mishra',
              style: TextStyle(
                color: _logoText,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _selectedBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Admin',
                style: TextStyle(
                  color: _accent,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    final isSelected = _selectedIndex == index;
    final iconColor = isSelected ? _selectedText : _unselectedText;
    final textColor = isSelected ? _selectedText : _unselectedText;
    final bgColor = isSelected ? _selectedBg : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 11,
            horizontal: widget.isCollapsed ? 0 : 12,
          ),
          alignment: widget.isCollapsed ? Alignment.center : Alignment.centerLeft,
          child: widget.isCollapsed
              ? Icon(icon, color: iconColor, size: 22)
              : Row(
                  children: [
                    Icon(icon, color: iconColor, size: 20),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                    if (isSelected) ...[
                      const Spacer(),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: _accent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildWorkspacesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'WORKSPACES',
            style: TextStyle(
              color: _sectionLabel,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(4),
            child: const Icon(Icons.add, color: _sectionLabel, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkspaceItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.keyboard_arrow_down, color: _sectionLabel, size: 18),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: _unselectedText,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
