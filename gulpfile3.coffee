gulp = require('gulp')
server = require('gulp-develop-server')
browsersync = require('browser-sync')


gulp.task('server', ->
  server.listen({
    path: './bin/www',
  }, ->
      browsersync.init({
        proxy: 'http://localhost:3000'
      })
  )
)

gulp.task('serverrestart', ->
  server.restart(->
      browsersync.reload()
  )
)

gulp.task('default', ['serverrestart'], ->
  gulp.watch(['./apps/app.js', './routes/*.js'], ['server-restart'])
)
