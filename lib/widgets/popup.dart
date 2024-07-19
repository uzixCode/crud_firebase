import 'package:flutter/material.dart';

enum PopupType { success, error, warning }

class Popup extends StatelessWidget {
  const Popup({super.key, required this.popupType});
  final PopupType popupType;
  Future show(BuildContext context) => showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => build(context));
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      popupType == PopupType.success
                          ? Icons.check_circle
                          : popupType == PopupType.error
                              ? Icons.error
                              : Icons.warning,
                      color: popupType == PopupType.success
                          ? Colors.green
                          : popupType == PopupType.error
                              ? Colors.red
                              : Colors.orange,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      popupType == PopupType.success
                          ? "Sukses"
                          : popupType == PopupType.error
                              ? "Error"
                              : "Warning",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FilledButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
