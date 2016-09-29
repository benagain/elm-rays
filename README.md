# Raycasting.  On Mobile.

Kris Jenkins wrote a raycaster in Elm. I put it in a mobile app.

[See Kris' original live here](http://krisajenkins.github.io/elm-rays/).

## Building

```
npm install elm
npm install cordova

git clone https://github.com/benagain/elm-rays-cordova.git
cd elm-rays-cordova

npm install
cordova platform add android
cordova run android --
```