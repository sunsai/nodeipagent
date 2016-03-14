// Generated by CoffeeScript 1.10.0
(function() {
  var browsersync, del, gulp, minicss, minihtml, minijs, runsequence;

  gulp = require('gulp');

  del = require('del');

  minijs = require('gulp-uglify');

  minicss = require('gulp-minify-css');

  minihtml = require('gulp-minify-html');

  browsersync = require('browser-sync');

  runsequence = require('run-sequence');

  gulp.task('default', function(callback) {
    return runsequence(['clean'], ['build'], ['server', 'watch'], callback);
  });

  gulp.task('clean', function(callback) {
    return del('', callback);
  });

  gulp.task('miniJS', function() {});

  gulp.task('miniCSS', function() {});

  gulp.task('miniHTML', function() {});

  gulp.task('build', function(callback) {
    return runsequence(['miniCSS', 'miniJS'], callback);
  });

  gulp.task('server', function() {
    return browsersync.init({
      port: 3000
    });
  });

  gulp.task('watch', function() {
    return gulp.watch(['./routes/**/*.js', './views/**/*.ejs', './public/css/style.css'], ['reload']);
  });

  gulp.task('reload', function(callback) {
    return runsequence(['build'], ['reload-browser'], callback);
  });

  gulp.task('reload-browser', function() {
    return browsersync.reload();
  });

}).call(this);
