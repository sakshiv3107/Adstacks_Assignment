import 'package:flutter/material.dart';
import '../models/project_model.dart';

void showProjectSheet(BuildContext context, {ProjectModel? project, required Function(String, String, Color) onSave}) {
  final isDesktop = MediaQuery.of(context).size.width > 768;
  if (isDesktop) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 480,
          padding: const EdgeInsets.all(24),
          child: ProjectFormSheet(project: project, onSave: onSave),
        ),
      ),
    );
  } else {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: ListView(
            controller: controller,
            children: [ProjectFormSheet(project: project, onSave: onSave)],
          ),
        ),
      ),
    );
  }
}

class ProjectFormSheet extends StatefulWidget {
  final ProjectModel? project;
  final Function(String title, String subtitle, Color color) onSave;

  const ProjectFormSheet({super.key, this.project, required this.onSave});

  @override
  State<ProjectFormSheet> createState() => _ProjectFormSheetState();
}

class _ProjectFormSheetState extends State<ProjectFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _subtitleController;
  late Color _selectedColor;

  final List<Color> _colorOptions = [
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.tealAccent,
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.project?.title ?? '');
    _subtitleController = TextEditingController(text: widget.project?.subtitle ?? '');
    _selectedColor = widget.project?.color ?? _colorOptions.first;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_titleController.text, _subtitleController.text, _selectedColor);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.project == null ? 'Add Project' : 'Edit Project',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Project Title',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            maxLength: 60,
            validator: (value) => value == null || value.isEmpty ? 'Title is required' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _subtitleController,
            decoration: InputDecoration(
              labelText: 'Subtitle / Description',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            validator: (value) => value == null || value.isEmpty ? 'Subtitle is required' : null,
          ),
          const SizedBox(height: 24),
          const Text('Project Color', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _colorOptions.map((color) {
              final isSelected = _selectedColor.value == color.value;
              return GestureDetector(
                onTap: () => setState(() => _selectedColor = color),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? (isDark ? Colors.white : Colors.black) : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 20)
                      : null,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Save Project'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
