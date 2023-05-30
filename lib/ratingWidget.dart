import 'package:flutter/material.dart';
import 'globals.dart';

class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PopupMenuButton<int>(
          itemBuilder: (context) => List<PopupMenuEntry<int>>.generate(
            5,
            (index) => PopupMenuItem<int>(
              value: index + 1,
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color:
                      selectedRating >= index + 1 ? Colors.amber : Colors.grey,
                ),
                title: Text('${index + 1}'),
              ),
            ),
          ),
          child: IconButton(
            onPressed: isGuest ? showSignInDialog : null,
            icon: Icon(
              Icons.star,
              color: selectedRating > 0 ? Colors.amber : Colors.grey,
            ),
          ),
          onSelected: (value) {
            if (!isGuest) {
              setRating(value);
            } else {
              showSignInDialog();
            }
          },
        ),
        Text(selectedRating > 0 ? 'Chosen rate: $selectedRating' : 'Rating'),
      ],
    );
  }

  void setRating(int rating) {
    setState(() {
      selectedRating = rating;
    });
  }

  void showSignInDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign-In Required'),
          content: const Text('You need to be signed in to interact.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
