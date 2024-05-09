import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Suporte extends StatefulWidget {
  const Suporte({super.key});

  @override
  State<Suporte> createState() => _SuporteState();
}

class _SuporteState extends State<Suporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Suporte",
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 150,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Justify text
          children: [
            Text(
              "Caso tenha alguma dúvida, contacte-nos através:",
              style: GoogleFonts.quicksand(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0), // Add spacing
            GestureDetector(
              onTap: () async {
                // Launch email app with default compose screen
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'suporteTRAC@gmail.com',
                  query:
                      'subject=Reportar&body=Detalhe aqui qual bug você encontrou: ',
                );
                String url = params.toString();
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  debugPrint('Could not launch $url');
                }
              },
              child: Text(
                "email: suporteTRAC@gmail.com",
                style: GoogleFonts.quicksand(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline), // Style as a link
              ),
            ),
            const SizedBox(height: 10.0), // Add spacing
            GestureDetector(
              onTap: () async {
                // Launch phone dialer with pre-filled number
                const url = "tel:86994324465";
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                "Linha do Cliente: 81004",
                style: GoogleFonts.quicksand(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline), // Style as a link
              ),
            ),
          ],
        ),
      ),
    );
  }
}
