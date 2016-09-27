module.exports = function(context) {

    var Q = context.requireCordovaModule('q');
    var deferral = new Q.defer();
    var compile = require("node-elm-compiler").compile;

    compile(["./src/Main.elm"], {
        output: "www/js/elm-main.js"
    })
    .on('close', function(exitCode) {
        if(exitCode == 0)
            deferral.resolve(exitCode);
        else
            deferral.reject(new Error("Elm compilation"));
    });

    return deferral.promise;
}
