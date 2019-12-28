 using Toybox.WatchUi ;

class NumUpdateDelegate extends WatchUi.BehaviorDelegate {

	function initialize(){
		BehaviorDelegate.initialize() ;
	}

	function onMenu(){

//		updateSpeed("5") ;
		System.println("onMenu MenuTestDelegate");
        WatchUi.pushView(new Rez.Menus.SpeedSelect(),
        				new SpeedSelectDelegate(), WatchUi.SLIDE_DOWN );
        return true;
	}

}