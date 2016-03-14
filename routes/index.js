var express = require('express');
var router = express.Router();
var s = require('../spiders/ipspiders')
/* GET home page. */

router.get('/', function (req, res) {
  var type = (req.query.s == undefined)?'xc':req.query.s.toString();
  var ss = new s(type);
  ss.getData(res);
  //res.render('index', {title: 'Express',});
})

module.exports = router;
