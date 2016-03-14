var express = require('express');
var router = express.Router();
var s = require('../spiders/ipspiders')
/* GET home page. */

router.get('/', function(req, res) {
  var ss = new s('http://www.xicidaili.com/');
  ss.getData(res);
  //res.render('index', { title: 'Express', });
});

module.exports = router;
