import 'package:flutter/material.dart'; // Flutter UI toolkit
import 'package:harari_prosperity_app/routes/app_routes.dart'; // App routes
import 'package:harari_prosperity_app/shared/widgets/custom_button.dart'; // Custom button widget
import 'package:harari_prosperity_app/shared/widgets/responsive_widgets.dart'; // Responsive padding widget

// ReportDetailScreen: Multi-step form for submitting a report
class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({super.key});

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  // Track the current step in the multi-step form
  int currentStep = 1;

  // Keys for each form step
  final Map<int, GlobalKey<FormState>> _formKeys = {
    1: GlobalKey<FormState>(),
    2: GlobalKey<FormState>(),
    3: GlobalKey<FormState>(),
    4: GlobalKey<FormState>(),
    5: GlobalKey<FormState>(),
  };

  // Store all form data here
  final Map<String, String> formData = {
    'name': '',
    'reportType': '',
    'type': '',
    'receiverName': '',
    'objective': '',
    'description': '',
    'importance': '',
    'mainPoints': '',
    'sources': '',
    'roles': '',
    'trends': '',
    'themes': '',
    'implications': '',
    'scenarios': '',
    'futurePlans': '',
    'approvingBody': '',
    'senderName': '',
    'role': '',
    'date': '',
  };

  // Go to previous step
  void previousStep() {
    if (currentStep > 1) {
      setState(() => currentStep--);
    }
  }

  // Go to next step
  void nextStep() {
    if (_formKeys[currentStep]!.currentState!.validate()) {
      _formKeys[currentStep]!.currentState!.save();
      if (currentStep < 5) {
        setState(() => currentStep++);
      } else {
        // TODO: Save report to database before navigating
        Navigator.pushNamed(context, AppRoutes.attachment);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Add progress indicator for steps
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (currentStep > 1) {
              previousStep();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: ResponsivePadding(
        child: Form(
          key: _formKeys[currentStep],
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildStepContent(),
                const SizedBox(height: 20),
                // Navigation buttons for steps
                if (currentStep == 5)
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "BACK",
                          onPressed: previousStep,
                          filled: false,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          text: "NEXT",
                          onPressed: nextStep,
                          filled: true,
                        ),
                      ),
                    ],
                  )
                else ...[
                  if (currentStep > 1)
                    CustomButton(
                      text: "BACK",
                      onPressed: previousStep,
                      filled: false,
                    ),
                  if (currentStep > 1) const SizedBox(height: 10),
                  CustomButton(
                    text: "NEXT",
                    onPressed: nextStep,
                    filled: true,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build content for the current step
  Widget _buildStepContent() {
    switch (currentStep) {
      case 1: return _buildStep1();
      case 2: return _buildStep2();
      case 3: return _buildStep3();
      case 4: return _buildStep4();
      case 5: return _buildStep5();
      default: return _buildStep1();
    }
  }

  // Step 1: Basic info
  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Heading title", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) => null, // TODO: Add validation
          onSaved: (value) => formData['name'] = value ?? '',
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(labelText: "Report Type"),
          validator: (value) => null,
          onSaved: (value) => formData['reportType'] = value ?? '',
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(labelText: "Type"),
          validator: (value) => null,
          onSaved: (value) => formData['type'] = value ?? '',
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(labelText: "Receiver Name"),
          validator: (value) => null,
          onSaved: (value) => formData['receiverName'] = value ?? '',
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(labelText: "Objective of Report"),
          validator: (value) => null,
          onSaved: (value) => formData['objective'] = value ?? '',
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(labelText: "Description"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['description'] = value ?? '',
        ),
      ],
    );
  }

  // Step 2: Importance, points, sources
  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Importance of Report", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['importance'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Main points", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['mainPoints'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Information Sources", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['sources'] = value ?? '',
        ),
      ],
    );
  }

  // Step 3: Roles, trends, themes
  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Roles of actors and stakeholders", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Description"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['roles'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Positive and Negative trends", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['trends'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Taken Themes", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['themes'] = value ?? '',
        ),
      ],
    );
  }

  // Step 4: Implications, scenarios, future plans
  Widget _buildStep4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Implications and Conclusions", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['implications'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Scenarios", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['scenarios'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Future plans and activities", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Explanation"),
          maxLines: 3,
          validator: (value) => null,
          onSaved: (value) => formData['futurePlans'] = value ?? '',
        ),
      ],
    );
  }

  // Step 5: Approvals and sender info
  Widget _buildStep5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Report approving body", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) => null,
          onSaved: (value) => formData['approvingBody'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Sender Name", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) => null,
          onSaved: (value) => formData['senderName'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Role", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Role"),
          validator: (value) => null,
          onSaved: (value) => formData['role'] = value ?? '',
        ),
        const SizedBox(height: 20),
        const Text("Time/Month/Date", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: "Time/Month/Date"),
          validator: (value) => null,
          onSaved: (value) => formData['date'] = value ?? '',
        ),
      ],
    );
  }
}