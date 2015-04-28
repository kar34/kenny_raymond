// to run this script install casperjs and phantomjs using homebrew (brew install casperjs and brew install phantomjs)
// and enter casperjs scrape2.js in command line

// kimono was used to create a csv

// initializing variables
var university = "University Washington";
var dept = "Business";
var i = 0;
var links;

// initializing casper
var casper = require('casper').create({
    logLevel:"verbose",
    debug:true
});


// starting a casper instance
casper.start('http://foster.uw.edu/faculty-research/directory/');
casper.echo("");
casper.echo("If there is an error message involving userSpaceScaleFactor, please ignore it. It is not used in this script. This script can take up to 25 mins to run, so be very, very patient... :)");

// collects all links from the given url above
casper.then(function getLinks(){
     links = this.evaluate(function(){
        var links = document.getElementsByTagName('a');       
        links = Array.prototype.map.call(links,function(link){
            return link.getAttribute('href');
        });
        return links;
    });
});

// loops through all links
casper.then(function(){
    this.each(links,function(self,link){
        self.thenOpen(link,function(a){
            if (i > 168 && i < 320) { // links with faculty pages, other links are from menu, footer etc and are irrelevant 

                // grabs faculty name
                var name = casper.evaluate(function(){
                    return document.getElementById('Boundless').children[0].children[2].children[0].children[1].children[0].innerHTML;
                });
                // this.echo(this.getCurrentUrl()); // comment this line out if you do not want the url to print
                var names = name.split(' ')
                var fname = names[0];
                var lname = names[1];

                // grabs phd school and year
                phd = casper.evaluate(function(){
                    return document.getElementById('Education').children[1].children[0].innerHTML;
                });
                if (phd == null) {
                    phd = "PhD  no PhD &nbsp;  (no PhD)";
                }
                phds = phd.split('&nbsp;  (');
                phd = phds[0].split('  ')[1];

                // prints data to console
                /*casper.echo("First name: " + fname);
                casper.echo("Last name: " + lname);
                casper.echo("University: " + university);
                casper.echo("Department: " + dept)*/
                casper.echo(phd);
            }
            i++;
        });
    });
});

// ends the instance of casper
casper.run(function(){
    this.exit();
});