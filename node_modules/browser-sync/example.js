var browserSync = require("./lib/index");

var files = ["test/fixtures/assets/*", "test/fixtures/*.html"];

var options = {
    server: {
        baseDir: "test/fixtures",
        directory: true
    }
};

browserSync.init(files, options, function (err, bs) {
    return true;
});