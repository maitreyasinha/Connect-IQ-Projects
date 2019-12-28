using Toybox.WatchUi;

var speed = 0;
var speedText = "0";

function updateSpeed(spd){
	speedText = spd ;
	WatchUi.requestUpdate();
}

class widget_testView extends WatchUi.View {
		
    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
//        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
            System.println("Post draw _ check");

    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        System.println("onUpdate_check1 Called");
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.drawText( dc.getWidth()/2, dc.getHeight()/4 , Graphics.FONT_LARGE, 
        					"FAN SPEED", Graphics.TEXT_JUSTIFY_CENTER );
        dc.drawText( dc.getWidth()/2, dc.getHeight()/2 , Graphics.FONT_LARGE, speedText, Graphics.TEXT_JUSTIFY_CENTER );
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    	System.println("onHide Called");
    }
}