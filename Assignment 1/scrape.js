var fname;
var lname;
var university;
var dept;
var phd;

var links = [];
var casper = require('casper').create();
var fs = require('fs');

casper.start('http://www.tuck.dartmouth.edu/faculty/faculty-directory/sort-alphabetical');
casper.then(function getLinks() {
	links = this.evaluate(function() {
		var links = document.querySelectorAll('.faculty-directory dt a');
        links = Array.prototype.map.call(links,function(link) {
        	return link.getAttribute('href');
        });
	});
	return links;
});

casper.then(function() {
    this.each(links,function(self,link) {
        self.thenOpen(link,function(a) {
			$('.profileHeader').filter(function(){
		        var data = $(this);
		        var name = data.children().first().text();
		        var nameArray = name.split(" ");

		        fname = nameArray[0];
		        lname = nameArray[1];
	        })

	        university = "Dartmouth College";
	        dept = "Tuck School of Business";

	        $('.bio').filter(function(){
	        	var data = $(this);
	        	phd = data.children().third().children().first().innerHTML; 
		        var phds = phd.split("\x22")
		        phds = phds[1].split(";");
	        	phd = phds[0];
	        })
        });
    });
});

casper.run(function(){ this.exit(); });