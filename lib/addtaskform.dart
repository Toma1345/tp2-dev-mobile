import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';

class AddTaskForm extends StatefulWidget {

  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormBuilderState>();

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
                    onPressed: (){
                      if(_formKey.currentState!.validate()) {
                        context.read<TaskViewModel>().addTask(
                          Task.createTask(
                            _formKey.currentState?.fields['Title']?.value,
                            _formKey.currentState?.fields['Description']?.value,
                            _formKey.currentState?.fields['Tags']?.value,
                              int.parse(_formKey.currentState?.fields['Difficulty']?.value),
                            int.parse(_formKey.currentState?.fields['Nbhours']?.value),
                          )
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Ajouter')
                )
              ],
            ),
        ),
      ),
    );
  }
}
