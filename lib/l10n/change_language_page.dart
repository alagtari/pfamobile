// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile/core/theme/colors.dart';
// import 'package:mobile/core/theme/styles.dart';
// import 'package:mobile/l10n/bloc/language_bloc.dart';
// import 'package:mobile/l10n/l10n.dart';
// import 'package:mobile/main.dart';

// class ChangeLanguagePage extends StatefulWidget {
//   const ChangeLanguagePage({super.key});

//   @override
//   State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
// }

// class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kScaffoldBackgroundCOlor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(
//           color: kDarkColor,
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: BlocBuilder<LanguageBloc, LanguageState>(
//           builder: (context, state) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 context.l10n.language,
//                 style: TextStyles.largeTextStyle,
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               for (final l in MyApp.supportedLocales)
//                 RadioListTile<Locale>(
//                   title: Text(
//                     _getLangName(l),
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       decoration: TextDecoration.none,
//                       fontVariations: .variationSemiBold,
//                     ),
//                   ),
//                   value: l,
//                   activeColor: kBlueBrandColor,
//                   groupValue: state.locale,
//                   onChanged: _onChanged,
//                   selected: state.locale == l,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _onChanged(Locale? l) {
//     if (l != null) {
//       context.read<LanguageBloc>().add(
//             ChangeLanguageEvent(l),
//           );
//     }
//   }

//   String _getLangName(Locale l) {
//     switch (l.languageCode) {
//       case "fr":
//         return context.l10n.fr;
//       case "en":
//         return context.l10n.en;
//       case "ar":
//         return context.l10n.ar;
//       default:
//         return context.l10n.fr;
//     }
//   }
// }
