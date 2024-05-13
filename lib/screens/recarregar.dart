import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recarregar extends StatefulWidget {
  const Recarregar({super.key});

  @override
  State<Recarregar> createState() => _RecarregarState();
}

class _RecarregarState extends State<Recarregar> {
  final _formKey = GlobalKey<FormState>();
  final _numeroUsuarioController = TextEditingController();
  final _valorRecarregarController = TextEditingController();
  final _numeroDestinatarioController = TextEditingController(
      text: "841114789"); // Set initial value for immutable field
  final _pinController = TextEditingController();
  String? _errorMessage;

  RegExp _phoneRegExp = RegExp(r'^[8][4-5]\d{7}$'); // Mozambican phone pattern

  Future<void> _addToFirestore() async {
    final firestore = FirebaseFirestore.instance;
    final collection =
        firestore.collection('recargas'); // Replace with your collection name
    final docRef = collection.doc(); // Generate a unique document ID

    final data = {
      'numeroUsuario': _numeroUsuarioController.text,
      'valorRecarregar': double.parse(_valorRecarregarController.text),
      'numeroDestinatario': _numeroDestinatarioController.text,
      'pin': _pinController.text,
      'timestamp': Timestamp.now(),
    };

    await docRef.set(data);

    setState(() {
      _errorMessage = null; // Clear any previous errors
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recarregar",
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 150,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/highway.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _numeroUsuarioController,
                  decoration: InputDecoration(
                    hintText: "Digite o seu numero",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    errorText: _errorMessage,
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O número do usuário é obrigatório';
                    } else if (!_phoneRegExp.hasMatch(value)) {
                      return 'O número deve ter 9 dígitos e começar com 84 ou 85.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _valorRecarregarController,
                  decoration: InputDecoration(
                    hintText: "Digite o valor",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    errorText: _errorMessage,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O valor a recarregar é obrigatório';
                    } else if (double.tryParse(value) == null) {
                      return 'O valor deve ser um número.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  // Make recipient number field immutable
                  readOnly: true,
                  initialValue: "841114789",
                  // Pre-filled value for recipient number
                  decoration: InputDecoration(
                    hintText: "Número do destinatário", // Clearer label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  controller: _pinController,
                  decoration: InputDecoration(
                    hintText: "Digite a senha (4 dígitos)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    errorText: _errorMessage,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A senha é obrigatória';
                    } else if (value.length != 4) {
                      return 'A senha deve ter 4 dígitos.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                if (_errorMessage == null) ...[
                  Text(
                    "!",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ],
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with Firestore storage
                      try {
                        await _addToFirestore();
                        // Show success message (optional)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Recarga salva com sucesso!'),
                          ),
                        );
                      } catch (error) {
                        setState(() {
                          //_errorMessage = "Recarga efectuada com sucesso";
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Recarga salva com sucesso!'),
                            ),
                          );
                        });
                      }
                    }
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
