# Dependencies
image_picker
<key>NSPhotoLibraryUsageDescription</key>
<string>Necessário permissão para acessar a galeria de fotos</string>
<key>NSCameraUsageDescription</key>
<string>Necessário permissão para acessar a câmera</string>
<key>NSMicrophoneUsageDescription</key>
<string>Necessário permissão para acessar ao microfone</string>

flutter_masked_text

intl

# AndroidManifest
<uses-permission android:name="android.permission.INTERNET"/>

slidy install flutter_masked_text


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


