import 'package:flutter/material.dart';

class SidebarWidget extends StatefulWidget {
  final bool isCollapsed;

  const SidebarWidget({super.key, this.isCollapsed = false});

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  int _selectedIndex = 0;

  static const _accent = Color(0xFF6C63FF);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF13132A) : Colors.white;
    final borderColor = isDark ? const Color(0xFF2A2A3E) : const Color(0xFFE5E7EB);
    final logoText = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final userCardBg = isDark ? const Color(0xFF1A1A2E) : const Color(0xFFF5F6FA);
    final userCardBorder = isDark ? const Color(0xFF2A2A3E) : const Color(0xFFE5E7EB);
    final selectedBg = isDark ? _accent.withOpacity(0.18) : const Color(0xFFEEECFF);
    final selectedText = _accent;
    final unselectedText = isDark ? Colors.white54 : const Color(0xFF6B7280);
    final sectionLabel = isDark ? Colors.white30 : const Color(0xFF9CA3AF);
    final workspaceText = isDark ? Colors.white54 : const Color(0xFF6B7280);
    final avatarBg = isDark ? const Color(0xFF2A2A3E) : const Color(0xFFE5E7EB);
    final avatarIcon = isDark ? Colors.white38 : unselectedText;
    final nameColor = isDark ? Colors.white : const Color(0xFF1A1A2E);

    return Container(
      width: widget.isCollapsed ? 70 : 220,
      decoration: BoxDecoration(
        color: bg,
        border: Border(right: BorderSide(color: borderColor)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          _buildLogo(logoText),
          const SizedBox(height: 20),
          _buildUserSection(
            isDark: isDark,
            userCardBg: userCardBg,
            userCardBorder: userCardBorder,
            avatarBg: avatarBg,
            avatarIcon: avatarIcon,
            nameColor: nameColor,
          ),
          const SizedBox(height: 16),
          Divider(color: borderColor, height: 1),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(0, Icons.home, 'Home',
                      selectedBg: selectedBg,
                      selectedText: selectedText,
                      unselectedText: unselectedText),
                  _buildNavItem(1, Icons.people, 'Employees',
                      selectedBg: selectedBg,
                      selectedText: selectedText,
                      unselectedText: unselectedText),
                  _buildNavItem(2, Icons.calendar_today, 'Attendance',
                      selectedBg: selectedBg,
                      selectedText: selectedText,
                      unselectedText: unselectedText),
                  _buildNavItem(3, Icons.summarize, 'Summary',
                      selectedBg: selectedBg,
                      selectedText: selectedText,
                      unselectedText: unselectedText),
                  _buildNavItem(4, Icons.info_outline, 'Information',
                      selectedBg: selectedBg,
                      selectedText: selectedText,
                      unselectedText: unselectedText),
                  const SizedBox(height: 16),
                  if (!widget.isCollapsed)
                    _buildWorkspacesHeader(sectionLabel),
                  if (!widget.isCollapsed)
                    _buildWorkspaceItem('Adstacks', workspaceText, sectionLabel),
                  if (!widget.isCollapsed)
                    _buildWorkspaceItem('Finance', workspaceText, sectionLabel),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Divider(color: borderColor, height: 1),
          const SizedBox(height: 8),
          _buildNavItem(5, Icons.settings, 'Settings',
              selectedBg: selectedBg,
              selectedText: selectedText,
              unselectedText: unselectedText),
          _buildNavItem(6, Icons.logout, 'Logout',
              selectedBg: selectedBg,
              selectedText: selectedText,
              unselectedText: unselectedText),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLogo(Color textColor) {
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
          Text(
            'Adstacks',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }

  Widget _buildUserSection({
    required bool isDark,
    required Color userCardBg,
    required Color userCardBorder,
    required Color avatarBg,
    required Color avatarIcon,
    required Color nameColor,
  }) {
    if (widget.isCollapsed) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: avatarBg,
        child: Icon(Icons.person, color: avatarIcon),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: userCardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: userCardBorder),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: avatarBg,
              child: Icon(Icons.person, color: avatarIcon, size: 30),
            ),
            const SizedBox(height: 8),
            Text(
              'Pooja Mishra',
              style: TextStyle(
                color: nameColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _accent.withOpacity(isDark ? 0.25 : 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Admin',
                style: TextStyle(
                  color: isDark ? _accent : Colors.white,
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

  Widget _buildNavItem(
    int index,
    IconData icon,
    String title, {
    required Color selectedBg,
    required Color selectedText,
    required Color unselectedText,
  }) {
    final isSelected = _selectedIndex == index;
    final iconColor = isSelected ? selectedText : unselectedText;
    final textColor = isSelected ? selectedText : unselectedText;
    final bgColor = isSelected ? selectedBg : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: InkWell(
        onTap: () => setState(() => _selectedIndex = index),
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 11,
            horizontal: widget.isCollapsed ? 0 : 12,
          ),
          alignment:
              widget.isCollapsed ? Alignment.center : Alignment.centerLeft,
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
                        width: 5,
                        height: 5,
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

  Widget _buildWorkspacesHeader(Color labelColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'WORKSPACES',
            style: TextStyle(
              color: labelColor,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(4),
            child: Icon(Icons.add, color: labelColor, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkspaceItem(
      String title, Color textColor, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        children: [
          Icon(Icons.keyboard_arrow_down, color: iconColor, size: 18),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
