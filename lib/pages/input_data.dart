import 'package:flutter/material.dart';
import '../enums/gender.dart';
import '../widgets/gender_widget.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: _body(),
    );
  }

  Widget _body() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameField(),
            _verticalGap(),
            _heightField(),
            _verticalGap(),
            _weightField(),
            _verticalGap(),
            _genders(),
            _verticalGap(),
            _calculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _genders() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _male()),
        _horizentalGap(),
        Expanded(child: _female()),
      ],
    );
  }

  SizedBox _verticalGap() => const SizedBox(height: 10);
  SizedBox _horizentalGap() => const SizedBox(width: 10);

  Widget _heightField() => TextFormField(
        // validator: ,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            label: Text('Height'), border: OutlineInputBorder()),
      );

  Widget _weightField() => TextFormField(
        // validator: ,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            label: Text('Weight'), border: OutlineInputBorder()),
      );

  Widget _nameField() => TextFormField(
        controller: _nameController,
        // validator: ,
        decoration: const InputDecoration(
            label: Text('Name'), border: OutlineInputBorder()),
      );

  Widget _calculateButton() {
    return TextButton(onPressed: () {}, child: const Text('Calculate'));
  }

  Widget _male() {
    return GenderWidget(
      value: Gender.male,
      onTap: _changeGender,
      selectedValue: _gender,
    );
  }

  Widget _female() {
    return GenderWidget(
      value: Gender.female,
      onTap: _changeGender,
      selectedValue: _gender,
    );
  }

  void _changeGender(Gender newValue) {
    setState(() {
      _gender = newValue;
    });
  }
}
