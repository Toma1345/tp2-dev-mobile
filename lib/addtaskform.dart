import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddTaskForm extends StatefulWidget {

  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une task"),
      ),
      body: Center(
        child: FormBuilder(
          key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormBuilderTextField(
                    name: 'Title',
                  decoration: const InputDecoration(labelText: 'Title:'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()])
                ),
                FormBuilderTextField(
                    name: 'Description',
                    decoration: const InputDecoration(labelText: 'Description:'),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required()])
                ),
                FormBuilderTextField(
                    name: 'Tags',
                    decoration: const InputDecoration(labelText: 'Tags:'),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required()])
                ),
                FormBuilderTextField(
                    name: 'Difficulty',
                    decoration: const InputDecoration(labelText: 'Difficulty:'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ])
                ),
                FormBuilderTextField(
                    name: 'Nbhours',
                    decoration: const InputDecoration(labelText: 'Nb hours:'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                    ])
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green
                    ),
                    onPressed: (){},
                    child: const Text('Ajouter')
                )
              ],
            ),
        ),
      ),
    );
  }
}