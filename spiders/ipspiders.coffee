superagent = require('superagent')
cheerio = require('cheerio')
#/* GET home page. */
ipspiders = (page)->
  @page = page
ipspiders.prototype = {
  getData: (response)->
    superagent.get(@page).end((err, res)->
      if err
        console.error(err)
      else
        iplists = []
        $ = cheerio.load(res.text);
        console.log("========================^_^======================")
        #        console.log(res.text)
        id = 0
        $('table tr').each((i, elem)->
          ip = $(this).find('td:nth-child(2)').text().trim()
          if ip
            iplists.push({
              id: id
              ip: ip
              port: $(this).find('td:nth-child(3)').text().trim()
              dis: $(this).find('td:nth-child(4)').text().trim()
              user: $(this).find('td:nth-child(5)').text().trim()
              type: $(this).find('td:nth-child(6)').text().trim()
              time: $(this).find('td:nth-child(7)').text().trim()
            })
            id += 1
        )
        console.log(iplists)
        console.log("========================^_^======================")
        response.render('index', {
          title: 'Express'
          ips: iplists
        })
    )
}


module.exports = ipspiders;
