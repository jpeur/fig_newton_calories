import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class fig_newton_caloriesApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new fig_newton_caloriesView() ];
    }

    function getGlanceView() as [ WatchUi.GlanceView ] or [ WatchUi.GlanceView, WatchUi.GlanceViewDelegate ] or Null {
        return [ new fig_newton_glanceView() ];
    }

}

function getApp() as fig_newton_caloriesApp {
    return Application.getApp() as fig_newton_caloriesApp;
}