gulp =require('gulp')
del =require('del')
minijs = require('gulp-uglify')
minicss=require('gulp-minify-css')
minihtml=require('gulp-minify-html')
browsersync =require('browser-sync')
runsequence=require('run-sequence')

gulp.task('default',(callback)->
  runsequence(['clean'],['build'],['server','watch'],callback)
)
gulp.task('clean',(callback)->
  del('',callback)
)
gulp.task('miniJS',->

)
gulp.task('miniCSS',->

)
gulp.task('miniHTML',->

)
gulp.task('build',(callback)->
  runsequence(['miniCSS','miniJS'],callback)
)
gulp.task('server',->
    browsersync.init({
#      server:{
#        baseDir:'./bin'
#      }
      port:3000
    })
)
gulp.task('watch',->
  gulp.watch(['./routes/**/*.js','./views/**/*.ejs','./public/css/style.css'],['reload'])
)
gulp.task('reload',(callback)->
  runsequence(['build'],['reload-browser'],callback)
)
gulp.task('reload-browser',->
  browsersync.reload()
)
