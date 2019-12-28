using Toybox.WatchUi;
using Toybox.Communications ;


class SpeedSelectDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        return true;
    }

    function responseCallback(responseCode, data){
	    System.println("Response Code : " + responseCode.toFloat());
	    System.println(data.toString());
	    var location = data.get("name");
	    
	    System.println(location);
	   	speed = location;
	   	updateSpeed(speed);
    }

	function callWebService(){
		var url  = "https://api.openweathermap.org/data/2.5/weather?lat=22.5726&lon=88.3639&appid=7bae6479223f41dcc50abc905879774d" ;
//		var url = "http://api.openweathermap.org/data/2.5/weather" ;
		var params = {
				    "lat" => "22.5726",
				    "lon" => "88.3639",
				    "appId" => "7bae6479223f41dcc50abc905879774d"
				};
		var request_code = "HTTP_RESPONSE_CONTENT_TYPE_JSON" ;
		Communications.makeWebRequest(url, {}, {}, method(:responseCallback)) ;
	}

    function onMenuItem(item) {
//		speed = item.toString().substring(2,3);
		System.println(speed) ;
		callWebService();
		if (speed == "3"){
			System.println("calling webservice ") ;
			callWebService();
		}
    }

    function onBack(){
    	System.println("onBack MenuTestDelegate");
    }
    
    
}