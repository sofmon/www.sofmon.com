dart2js ./web/main.dart -m -o ./web/main.dart.js
rm -rf template
cp -rf web template
wedit build