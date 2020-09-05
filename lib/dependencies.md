slidy install flushbar, brasil_fields, intl, flutter_masked_text, image_picker, google_fonts, font_awesome_flutter, dio

ˋˋˋ

# Dependencies
flushbar

brasil_fields

intl

flutter_masked_text

image_picker
<key>NSPhotoLibraryUsageDescription</key>
<string>Necessário permissão para acessar a galeria de fotos</string>
<key>NSCameraUsageDescription</key>
<string>Necessário permissão para acessar a câmera</string>
<key>NSMicrophoneUsageDescription</key>
<string>Necessário permissão para acessar ao microfone</string>

google_fonts

font_awesome_flutter

dio

# AndroidManifest
<uses-permission android:name="android.permission.INTERNET"/>

# Pubspec
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
],
supportedLocales: [const Locale('pt', 'BR')],


