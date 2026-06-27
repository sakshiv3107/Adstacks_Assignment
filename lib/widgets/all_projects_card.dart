import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../providers/project_provider.dart';
import 'project_form_sheet.dart';

class AllProjectsCard extends StatelessWidget {
  const AllProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SearchProvider, ProjectProvider>(
      builder: (context, searchProvider, projectProvider, _) {
        final projects = searchProvider.filteredProjects(projectProvider.projects);

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Projects',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '${projects.length} found',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          onPressed: () {
                            showProjectSheet(
                              context,
                              onSave: (title, subtitle, color) {
                                projectProvider.addProject(title, subtitle, color);
                              },
                            );
                          },
                          icon: const Icon(Icons.add, size: 16, color: Color(0xFF6C63FF)),
                          label: const Text(
                            'Add Project',
                            style: TextStyle(color: Color(0xFF6C63FF)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (projects.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.search_off, color: Colors.grey, size: 40),
                          SizedBox(height: 8),
                          Text(
                            'No projects found',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  ...projects.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final project = entry.value;
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: project.color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          title: Text(
                            project.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            project.subtitle,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.grey, size: 20),
                                onPressed: () {
                                  showProjectSheet(
                                    context,
                                    project: project,
                                    onSave: (title, subtitle, color) {
                                      projectProvider.editProject(project.id, title, subtitle, color);
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.redAccent, size: 20),
                                onPressed: () {
                                  projectProvider.deleteProject(project.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text("Project deleted"),
                                      action: SnackBarAction(
                                        label: "Undo",
                                        onPressed: () {
                                          projectProvider.addProject(project.title, project.subtitle, project.color);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        if (index < projects.length - 1)
                          const Divider(height: 16),
                      ],
                    );
                  }),
              ],
            ),
          ),
        );
      },
    );
  }
}
