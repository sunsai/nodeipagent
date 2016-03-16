superagent = require('superagent')
cheerio = require('cheerio')
#/* GET home page. */

ipspiders = (type)->
  @type = type
ipspiders()
ipspiders.prototype = {
  agents: {
    xc: {
      gn: ['http://www.xicidaili.com/nt/', 'http://www.xicidaili.com/nn/']
      gw: ['http://www.xicidaili.com/wn/', 'http://www.xicidaili.com/wt/']
    }
    td: {
#      gn: ['http://www.kuaidaili.com/free/inha/', 'http://www.kuaidaili.com/free/intr/']
      gn: ['http://www.kuaidaili.com/free/intr/']
      gw: ['http://www.kuaidaili.com/free/outha/', 'http://www.kuaidaili.com/free/outtr/']
    }
  }
  getData: (response)->
    ips = []
    for page in @agents[@type].gn
      console.log('================================^-^=======================')
      superagent.get(page).end((err, res)->
        if err
          console.error(err)
        else
          $ = cheerio.load(res.text)
          $('table tr').each(->
            ip = $(this).find('td:nth-child(1)').text().trim()
            if ip
              ips.push({
                  ip: ip
                  port: $(this).find('td:nth-child(2)').text().trim()
                  user: $(this).find('td:nth-child(3)').text().trim()
                  pro: $(this).find('td:nth-child(4)').text().trim()
                  dist: $(this).find('td:nth-child(5)').text().trim()
                  time: $(this).find('td:nth-child(6)').text().trim()
                  date: $(this).find('td:nth-child(7)').text().trim()
                }
              )
          )
        console.log(ips)
        console.log('============================ips.length:')
        console.log(ips.length)
        console.log(ips.length)
      )
    res.render('index', {title: 'Express',});
#    if @type =='xc'
#      iplists = []
#      for page in  @agents.xc.gn
#        console('===============page:'+page)
#        response.render('index',{title:'node ip agent'})
#        superagent.get(page).end((err, res)->
#          if err
#            console.error(err)
#          else
#            $ = cheerio.load(res.text);
#            console.log("========================^_^======================")
#            #        console.log(res.text)
#            id = 0
#            $('table tr').each((i, elem)->
#              ip = $(this).find('td:nth-child(2)').text().trim()
#              if ip
#                iplists.push({
#                  id: id
#                  ip: ip
#                  port: $(this).find('td:nth-child(3)').text().trim()
#                  dis: $(this).find('td:nth-child(4)').text().trim()
#                  user: $(this).find('td:nth-child(5)').text().trim()
#                  type: $(this).find('td:nth-child(6)').text().trim()
#                  time: $(this).find('td:nth-child(7)').text().trim()
#                })
#                id += 1
#            )
#            console.log("========================^_^======================")
#            response.render('index', {
#              title: 'Express'
##              ips: iplists
#            })
#        )
}


module.exports = ipspiders;
