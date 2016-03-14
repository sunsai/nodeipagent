superagent = require('superagent')
cheerio = require('cheerio')
#/* GET home page. */
ipspiders = (page)->
  @page = page
ipspiders.prototype = {
  getData: (response)->
    superagent.get(@page).end((err,res)->
      if err
        console.error(err)
      else
        $ = cheerio.load(res.text);
        iplists = []
        console.log("========================^_^======================")
        $('#ip_list tbody tr td').each(()->
          console.log($(this))
        )
        console.log("========================^_^======================")
    )
}
#router.get('/', function(req, res) {
#  res.render('index', { title: 'Express' });
#});

module.exports = ipspiders;
