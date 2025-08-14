import 'package:flutter/material.dart';
import 'package:harari_prosperity_app/routes/app_routes.dart';
import 'package:harari_prosperity_app/shared/widgets/custom_button.dart';

class AttachmentScreen extends StatelessWidget {
  const AttachmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attachment")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth < 500 ? double.infinity : 400;
          EdgeInsets padding = constraints.maxWidth < 500
              ? const EdgeInsets.fromLTRB(12, 24, 12, 12)
              : const EdgeInsets.fromLTRB(20, 32, 20, 20);
          return SingleChildScrollView(
            child: Padding(
              padding: padding,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Attach files or links to your report. You can choose one or both.",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Center(child: Text("FILE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 12),
                            Center(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.attach_file),
                                label: const Text("Choose File"),
                                onPressed: () {
                                  // TODO: Implement file picker
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("File picker not implemented.")),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Center(child: Text("LINK", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 12),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: "Paste link here",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "SKIP",
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.finalStep),
                            filled: false,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomButton(
                            text: "Next",
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.finalStep),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}