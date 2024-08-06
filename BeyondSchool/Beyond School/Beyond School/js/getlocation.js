/**
 * Created by SDeivasigamani on 5/18/2016.
 */
// This example displays an address form, using the autocomplete feature
// of the Google Places API to help users fill in the information.

var autocomplete_textarea;
var componentForm = {
    street_number: 'short_name',
    route: 'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    country: 'long_name',
    postal_code: 'short_name'
};

function initialize() {

    autocomplete_textarea = new google.maps.places.Autocomplete((document.getElementById('autocomplete_textarea')),
        { types: ['geocode'] }
    );
    google.maps.event.addListener(autocomplete_textarea, 'place_changed', function() {
        fillInAddress();
    });
}


// [START region_fillform]
function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete_textarea.getPlace();
    $('#autocomplete_textarea').val( place.formatted_address );
    console.log( JSON.stringify(place) );
    for (var component in componentForm) {
        document.getElementById(component).value = '';
        document.getElementById(component).disabled = false;
    }

    // Get each component of the address from the place details
    // and fill the corresponding field on the form.
    for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            //document.getElementById(addressType).value = val;
           // [componentForm[addressType]];
            //document.getElementById(addressType).value = val;
            localStorage.setItem(addressType, val);
        }
    }
       
}
// [END region_fillform]
