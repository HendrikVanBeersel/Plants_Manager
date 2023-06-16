import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_manager/themes/app_colors.dart';
import 'package:plants_manager/widgets/add_plant_form.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  bool _addButtonIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add plant'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _addButtonIsPressed = true;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddPlantForm();
                    },
                  );
                });
              },
              onTapUp: (_) {
                setState(() {
                  _addButtonIsPressed = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                decoration: BoxDecoration(
                  color: _addButtonIsPressed
                      ? AppColors.primaryColor
                      : AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                    padding: EdgeInsets.all(_addButtonIsPressed ? 4.0 : 8.0),
                    child: Icon(
                      Icons.add_circle,
                      size: _addButtonIsPressed ? 40 : 32,
                    )),
              ),
            ),
            const Text('Add a Plant'),
          ],
        ),
      ),
    );
  }
}
