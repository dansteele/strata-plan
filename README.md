#StrataPlan
##Final Project for We Got Coders


###Completion time: 10 days


StrataPlan is an end-to-end trip planning tool. It features
- Google maps integration
- MetOffice integration
- AJAX
- Encapsulated, object oriented JS
- Dynamic route calculations
- Extensive use of geocoder
- Single-table inheritance
- Scheduled tasks
- 97% code coverage (1:0.7)
- Mocked HTTP requests

There were two big things that I learned from this:

1. When planning in PivotalTracker, research the APIs that I plan on using, since I made some silly assumptions about how the Google APIs would integrate.

2. Don't use subclass inheritence until it seems appropriate: the scope of a class may change, and it's easy end up doing stuff like `if type == x`, which defeats the point.

###View the [StrataPlan site](http://strata-plan.herokuapp.com/)

####View the [PivotalTracker project](https://www.pivotaltracker.com/n/projects/1321330)

If you're browsing the code, pay special interest to
- [Map javascript](https://github.com/dansteele/strata-plan/blob/master/app/assets/javascripts/journey.js)
- [FlightPlan model](https://github.com/dansteele/strata-plan/blob/master/app/models/flight_plan.rb)
- [Weather Scheduler](https://github.com/dansteele/strata-plan/blob/master/lib/weather_scheduler/weather_scheduler.rb)
- [Model specs](https://github.com/dansteele/strata-plan/tree/master/spec/models)
- [Cucumber tests](https://github.com/dansteele/strata-plan/tree/master/features)
