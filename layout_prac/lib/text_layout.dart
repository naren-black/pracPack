import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLayout extends StatelessWidget {
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Yo mate World well hello!',
          style: GoogleFonts.leckerliOne(fontSize: 20.0),
        ),
        Text(
          'Text can wrap without issue',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            Etiam at mauris massa. Suspendisse potenti.
            Aenean aliquet eu nisl vitae tempus.'''),
      ],
    );
  }
}
