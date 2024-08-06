/**
 * Created by ANAND RAJ on 20-05-2016.
 */
var bar = new ProgressBar.Circle(container, {
    color: '#FFEA82',
    trailColor: '#eee',
    trailWidth: 1,
    duration: 1400,
    easing: 'bounce',
    strokeWidth: 6,
    from: {color: '#FFEA82', a:0},
    to: {color: '#ED6A5A', a:1},
    // Set default step function for all animate calls
    step: function(state, circle) {
        circle.path.setAttribute('stroke', state.color);
    }
});