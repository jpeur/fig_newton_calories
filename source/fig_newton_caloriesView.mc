import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.ActivityMonitor;

class fig_newton_caloriesView extends WatchUi.View {

    private var cals_per_fig_newton = 50.0;
    private var cals_burned = 0.0;
    private var fig_newtons = 0.0;
    private var myText;
    var fig_newton_pic;
    var width;
    var height;
    var pic_width = 100;
    var pic_height = 78;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        // setLayout(Rez.Layouts.MainLayout(dc));
        // fig_newton_pic = WatchUi.loadResource(Rez.Drawables.fig_newton);
        width = dc.getWidth();
        height = dc.getHeight();
        fig_newton_pic = new WatchUi.Bitmap({
            :rezId => Rez.Drawables.fig_newton_2,
            :locX => width/2 - pic_width/2,
            :locY => height/2 - (1.5 * pic_height),
            :width => pic_width,
            :height => pic_height
        });
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        var info = ActivityMonitor.getInfo();
        cals_burned = info.calories;
        fig_newtons = (cals_burned / cals_per_fig_newton).format("%.2f");
        var fig_newtons_str = fig_newtons.toString();
        System.println("Calories burned: " + cals_burned.toString());
        System.println("Fig Newtons: " + fig_newtons_str);

        myText = new WatchUi.Text({
            :text => "\nYou've burned \n" + fig_newtons_str + " Fig Newtons!",
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_SMALL,
            :locX => LAYOUT_HALIGN_CENTER,
            :locY => LAYOUT_VALIGN_CENTER

        });
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        // View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        myText.draw(dc);
        // System.println("Height: " + height);
        // System.println("Width: " + width);
        // var height_of_pic = fig_newton_pic.getDimensions()[1];
        // var width_of_pic = fig_newton_pic.getDimensions()[0];
        // System.println("Height of pic: " + height_of_pic);
        // System.println("Width of pic: " + width_of_pic);
        fig_newton_pic.draw(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
