import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.ActivityMonitor;

class fig_newton_glanceView extends WatchUi.GlanceView {
    
        private var cals_per_fig_newton = 50.0;
        private var cals_burned = 0.0;
        private var fig_newtons = 0.0;
        private var myText;
        var fig_newton_pic;
    
        function initialize() {
            GlanceView.initialize();
        }
    
        // Load your resources here
        function onLayout(dc as Dc) as Void {
        }
    
        function onShow() as Void {
            var info = ActivityMonitor.getInfo();
            cals_burned = info.calories;
            // cals_burned = 3000.0;
            fig_newtons = (cals_burned / cals_per_fig_newton).toNumber();
            var fig_newtons_str = fig_newtons.toString();
            // System.println("Calories burned: " + cals_burned.toString());
            // System.println("Fig Newtons: " + fig_newtons_str);

            myText = new WatchUi.Text({
                :text => fig_newtons_str + " Fig Newtons!",
                :color => Graphics.COLOR_WHITE,
                :font => Graphics.FONT_SYSTEM_TINY,
                :locX => LAYOUT_HALIGN_CENTER,
                :locY => LAYOUT_VALIGN_CENTER
    
            });
        }
    
        // Update the view
        function onUpdate(dc as Dc) as Void {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            dc.clear();
            myText.draw(dc);
        }
    
        function onHide() as Void {
        }
}