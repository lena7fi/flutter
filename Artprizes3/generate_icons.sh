#!/bin/bash
 convert assets/logo.png -alpha off assets/ogo.png
flutter pub run flutter_launcher_icons:main remove_alpha_ios: true

