import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: "Email"),
            validator: MultiValidator([
              RequiredValidator(errorText: "Email is required"),
              EmailValidator(errorText: "Enter a valid email"),
            ]),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: "Password"),
            validator: MultiValidator([
              RequiredValidator(errorText: "Password is required"),
              MinLengthValidator(6,
                  errorText: "Password must be at least 6 characters"),
            ]),
          ),
        ],
      ),
    );
  }
}
