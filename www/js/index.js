// Elm initialisation
var elm_app = Elm.Main.embed(document.getElementById('elm-main'));

// Cordova initialisation if needed
// ...
$(document).on('click', 'a', function (event) {
    event.preventDefault();
    window.open($(this).attr('href'), '_system');
    return false;
});