import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessDialog {
  static void show(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50,
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
class ErrorDialog {
  static void show(BuildContext context, {String message = 'An error occurred!'}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
class ExitDialog {
  static Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
                // Exits the app
                if (Theme.of(context).platform == TargetPlatform.android) {
                  SystemNavigator.pop();    // For Android
                } else {

                }
              },
            ),
          ],
        );
      },
    );
  }
}
class LogoutDialog {
  static Future<void> show(BuildContext context, VoidCallback onLogout) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
                onLogout(); // Calls the callback function to perform the logout action
              },
            ),
          ],
        );
      },
    );
  }
}

class SaveDataDialog {
  static Future<void> show(BuildContext context, VoidCallback onSave) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Save Changes'),
          content: const Text('Do you want to save the changes you made?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismisses the dialog
                onSave(); // Calls the callback function to perform the save action
              },
            ),
          ],
        );
      },
    );
  }
}
showCardDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.info, size: 50),
                title: Text('Card Title'),
                subtitle: Text('This is the content of the card dialog.'),
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
void showCustomSnackbar(BuildContext context,String msg) {
  final snackBar = SnackBar(
    backgroundColor: Colors.blueGrey, // Custom background color
    content:  Row(
      children: <Widget>[
        Icon(Icons.info, color: Colors.white), // Custom icon
        SizedBox(width: 8),
        Expanded(
          child: Text(
            msg,
            style: TextStyle(color: Colors.white), // Custom text style
          ),
        ),
      ],
    ),
    action: SnackBarAction(
      label: 'Undo', // Custom action button text
      onPressed: () {
        // Handle action
      },
      textColor: Colors.yellow, // Custom action button text color
    ),
    behavior: SnackBarBehavior.floating, // Floating behavior
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Custom shape
    ),
    duration: const Duration(seconds: 3), // Duration of the Snackbar
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
