import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/right_panel.dart';
import '../widgets/top_navbar.dart';
import '../widgets/hero_banner.dart';
import '../widgets/all_projects_card.dart';
import '../widgets/top_creators_table.dart';
import '../widgets/performance_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final bool isMobile = width < 768;
        final bool isTablet = width >= 768 && width < 1100;
        final bool isDesktop = width >= 1100;

        return Scaffold(
          appBar: isMobile
              ? AppBar(
                  title: const Text('Dashboard'),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                )
              : null,
          drawer: isMobile ? const Drawer(child: SidebarWidget()) : null,
          bottomNavigationBar: isMobile
              ? BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Theme.of(context).colorScheme.secondary,
                  unselectedItemColor: Colors.grey,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.people), label: 'Employees'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.co_present), label: 'Attendance'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.summarize), label: 'Summary'),
                  ],
                )
              : null,
          body: SizedBox(
            height: MediaQuery.of(context).size.height -
                (isMobile ? kToolbarHeight + kBottomNavigationBarHeight : 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left Panel (Sidebar)
                if (isDesktop) const SizedBox(width: 220, child: SidebarWidget()),
                if (isTablet)
                  const SizedBox(width: 70, child: SidebarWidget(isCollapsed: true)),

                // Center (Main Content)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MainContentWidget(isMobile: isMobile),
                        // Append Right Panel content on Mobile
                        if (isMobile) const RightPanelWidget(isMobileAppended: true),
                      ],
                    ),
                  ),
                ),

                // Right Panel (Desktop only) — scrolls independently
                if (isDesktop)
                  const SizedBox(
                    width: 280,
                    child: RightPanelWidget(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MainContentWidget extends StatelessWidget {
  final bool isMobile;
  const MainContentWidget({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopNavbar(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeroBanner(),
              const SizedBox(height: 16),
              isMobile
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AllProjectsCard(),
                        SizedBox(height: 16),
                        TopCreatorsTable(),
                      ],
                    )
                  : const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: AllProjectsCard()),
                        SizedBox(width: 16),
                        Expanded(child: TopCreatorsTable()),
                      ],
                    ),
              const SizedBox(height: 16),
              const PerformanceChart(),
            ],
          ),
        ),
      ],
    );
  }
}


