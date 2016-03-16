#// Gulpfile.js
gulp = require('gulp')
nodemon = require('gulp-nodemon')
runSequence = require('run-sequence')
browsersync = require('browser-sync')
gulp.task('default',(callback)->
  runSequence(['clean'],['develop','brsync','watch'],callback)
)
gulp.task('clean',(callback)->
  console.log('this is clean task .....')
  callback()
)

gulp.task('develop', ->
  nodemon({
    script: './bin/www'
    ext: 'html ejs js'
    , tasks: ['clean']
  }).on('restart', ->
    console.log('=========================restarted!')
  )
)
gulp.task('brsync', ->
  browsersync({
    proxy: 'http://localhost:3000'
    port: 8888
    notify: true
  })
)
gulp.task('watch', ->
  gulp.watch(['./routes/**/*.js', './views/**/*.ejs', './public/css/style.css'], ['reload-server'])
)
gulp.task('reload-server', (callback) ->
  runSequence(['develop'],['bs-reload'],callback)
)
gulp.task('bs-reload', ->
  browsersync.reload()
)
