
// var map= AmCharts;

var targetSVG = "M9,0C4.029,0,0,4.029,0,9s4.029,9,9,9s9-4.029,9-9S13.971,0,9,0z M9,15.93 c-3.83,0-6.93-3.1-6.93-6.93S5.17,2.07,9,2.07s6.93,3.1,6.93,6.93S12.83,15.93,9,15.93 M12.5,9c0,1.933-1.567,3.5-3.5,3.5S5.5,10.933,5.5,9S7.067,5.5,9,5.5 S12.5,7.067,12.5,9z";

$.ajax({
	url: '/trends/available',
}).done( function(data){
	console.log('got data in map.js');

	var cityimages = [];

	$.each(data, function(index, city) {			
		// var compiledTmpl = _.template(template, {city : city});
		var cityobj = {
			svgPath: targetSVG,
			zoomLevel: 5,
			scale: 0.5,
			title: city.name,
			latitude: city.lat,
			longitude: city.long
		};

		cityimages.push(cityobj);

	}); // end each loop
	console.log(cityimages);
	


	// svg path for target icon
	

var mapOptions = {
		type: "map",
		"theme": "none",
    // change this to local image path
    pathToImages: "http://www.amcharts.com/lib/3/images/",

    imagesSettings: {
    	rollOverColor: "#089282",
    	rollOverScale: 3,
    	selectedScale: 3,
    	selectedColor: "#089282",
    	color:"#13564e"
    },

    zoomControl:{buttonFillColor:"#15A892"},

    areasSettings:{unlistedAreasColor:"#15A892"},

    dataProvider: {
    	map: "worldHigh",
    	images: cityimages
    }
}; // end mapOptions
debugger;

	var map = AmCharts.makeChart("map", mapOptions); // end map

	}); // end done



