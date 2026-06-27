import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../providers/theme_provider.dart';

class TopNavbar extends StatefulWidget {
  const TopNavbar({super.key});

  @override
  State<TopNavbar> createState() => _TopNavbarState();
}

class _TopNavbarState extends State<TopNavbar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDark;
    final cardColor = Theme.of(context).cardColor;
    final dividerColor = Theme.of(context).dividerColor;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isNarrow = constraints.maxWidth < 500;

        return Container(
          height: 64,
          decoration: BoxDecoration(
            color: cardColor,
            border: Border(
              bottom: BorderSide(color: dividerColor),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const Spacer(),
              if (!isNarrow)
                SizedBox(
                  width: 220,
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      context.read<SearchProvider>().updateQuery(value);
                    },
                    style: TextStyle(color: textColor, fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Search projects & employees...',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 18),
                      suffixIcon: searchProvider.hasQuery
                          ? IconButton(
                              icon: const Icon(Icons.close, size: 16, color: Colors.grey),
                              onPressed: () {
                                _controller.clear();
                                context.read<SearchProvider>().clearQuery();
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: isDark
                          ? Colors.white.withOpacity(0.06)
                          : Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              if (isNarrow)
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.grey),
                  onPressed: () {},
                ),
              IconButton(
                icon: const Icon(Icons.bookmark_border, color: Colors.grey),
                onPressed: () {},
                iconSize: 20,
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.grey),
                onPressed: () {},
                iconSize: 20,
              ),
              // ── Theme Toggle ──────────────────────────────────────────
              IconButton(
                onPressed: () => context.read<ThemeProvider>().toggle(),
                tooltip: isDark ? 'Switch to Light' : 'Switch to Dark',
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: anim,
                    child: FadeTransition(opacity: anim, child: child),
                  ),
                  child: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    key: ValueKey(isDark),
                    color: isDark ? Colors.amber : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              if (!isNarrow)
                IconButton(
                  icon: const Icon(Icons.power_settings_new, color: Colors.grey),
                  onPressed: () {},
                  iconSize: 20,
                ),
              const SizedBox(width: 4),
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 18),
              ),
            ],
          ),
        );
      },
    );
  }
}
