using Toybox.WatchUi;
using Toybox.Communications ;


class SpeedSelectDelegate extends WatchUi.BehaviorDelegate {
	var url = "https://api.openweathermap.org/data/2.5/weather" ;
	var params = {
				    "lat" => "22.5726",
				    "lon" => "88.3639",
				    "appId" => "7bae6479223f41dcc50abc905879774d"
				};
	
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        return true;
    }

    function responseCallback(responseCode, data){
	    if (data){updateSpeed(data.get("name"));}
	    else {updateSpeed(speed);}
    }

	function callWebService(){
		updateSpeed("Updating..") ;
		Communications.makeWebRequest(url, params, {}, method(:responseCallback)) ;
	}

    function onMenuItem(item) {
		speed = item.toString().substring(2,3);
		if (speed.equals("3")){
			callWebService();
		}
		else{
			updateSpeed(speed) ;
		}
    }

    function onBack(){
    }
    
    
}