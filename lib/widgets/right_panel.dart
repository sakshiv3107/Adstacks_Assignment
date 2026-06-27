import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RightPanelWidget extends StatelessWidget {
  final bool isMobileAppended;

  const RightPanelWidget({super.key, this.isMobileAppended = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobileAppended ? double.infinity : 280,
      padding: EdgeInsets.all(isMobileAppended ? 20.0 : 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCalendarSection(context),
            const SizedBox(height: 12),
            _buildBirthdaySection(context),
            const SizedBox(height: 12),
            _buildAnniversarySection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'GENERAL 10:00 AM TO 7:00 PM',
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TableCalendar(
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.utc(2023, 10, 30),
              currentDay: DateTime.utc(2023, 10, 30),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Icon(Icons.chevron_left,
                    size: 16,
                    color: isDark ? Colors.white70 : Colors.black87),
                rightChevronIcon: Icon(Icons.chevron_right,
                    size: 16,
                    color: isDark ? Colors.white70 : Colors.black87),
                titleTextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87),
                headerPadding: EdgeInsets.zero,
                headerMargin: const EdgeInsets.only(bottom: 8),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                  color: Color(0xFF6C63FF),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(
                    color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                defaultTextStyle: TextStyle(
                    fontSize: 12, color: isDark ? Colors.white70 : Colors.black87),
                weekendTextStyle: TextStyle(
                    fontSize: 12, color: isDark ? Colors.white54 : Colors.grey),
                outsideDaysVisible: false,
                cellMargin: const EdgeInsets.all(2),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                    fontSize: 12, color: isDark ? Colors.white60 : Colors.black54),
                weekendStyle: TextStyle(
                    fontSize: 12, color: isDark ? Colors.white38 : Colors.grey),
              ),
              rowHeight: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBirthdaySection(BuildContext context) {
    final cardBorder = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF2A2A3E)
        : const Color(0xFFE5E7EB);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 8),
                Text('Today Birthday',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Icon(Icons.star, color: Colors.amber, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildAvatarStack([Colors.pink, Colors.blue], cardBorder),
                const Spacer(),
                const Text('Total | 2',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite, size: 16),
                label: const Text('Birthday Wishing'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF6C63FF)),
                  foregroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnniversarySection(BuildContext context) {
    final cardBorder = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF2A2A3E)
        : const Color(0xFFE5E7EB);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 8),
                Text('Anniversary',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Icon(Icons.star, color: Colors.amber, size: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildAvatarStack(
                    [Colors.green, Colors.orange, Colors.purple], cardBorder),
                const Spacer(),
                const Text('Total | 3',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite, size: 16),
                label: const Text('Anniversary Wishing'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF6C63FF)),
                  foregroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarStack(List<Color> colors, Color borderColor) {
    return SizedBox(
      width: 36.0 + (colors.length - 1) * 20.0,
      height: 36,
      child: Stack(
        children: List.generate(colors.length, (index) {
          return Positioned(
            left: index * 20.0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 2),
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: colors[index],
                child: const Icon(Icons.person, size: 20, color: Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}
