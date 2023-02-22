import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formsValues = {
      'first_name': '',
      'last_name': '',
      'email': '',
      'password': '',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs Screen'),
      ),
      body: SingleChildScrollView(
         padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 20 ),
         child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField( labelText: 'Nombre', hintText: 'Nombre del usuario', formProperty: 'first_name', formValues: formsValues),
                const SizedBox( height: 30),
                CustomInputField( labelText: 'Apellido', hintText: 'Apellido del usuario', formProperty: 'last_name', formValues: formsValues,),
                const SizedBox( height: 30),
                CustomInputField( labelText: 'Email', hintText: 'Correo del usuario', keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: formsValues,),
                const SizedBox( height: 30),
                CustomInputField( labelText: 'Password', hintText: 'Password del usuario', keyboardType: TextInputType.emailAddress, obscureText: true, formProperty: 'password', formValues: formsValues,),
                const SizedBox( height: 30),

                DropdownButtonFormField<String>(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem( value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem( value: 'SuperUser', child: Text('SuperUser')),
                    DropdownMenuItem( value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem( value: 'JR. Developer', child: Text('JR. Developer')),

                  ],
                  onChanged: (value) {
                    formsValues['role'] = value ?? 'Admin';
                  },
                ),

                ElevatedButton(
                  onPressed: () {

                    // FocusScope.of(context).requestFocus( FocusNode() );

                    if (!(myFormKey.currentState?.validate() ?? false)) {
                      print('Formulario no valido');
                      return;
                    }
                    print(formsValues);
                  }, 
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'),),
                  ))
              ],
            ),


         ),
      ),
    );
  }
}