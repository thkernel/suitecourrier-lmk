import SlimSelect from "../vendor/backend/bracket/lib/slimselect/js/slimselect.min";
window.SlimSelect = SlimSelect;

/*

$(document).on('turbolinks:load', function() {  


new SlimSelect({
  select: 'select',

  settings: {
    
    disabled: false,
    alwaysOpen: false,
    showSearch: true,
    focusSearch: true,
    searchPlaceholder: 'Search',
    searchText: 'No Results',
    searchingText: 'Searching...',
    searchHighlight: false,
    closeOnSelect: true,
    contentLocation: document.body,
    contentPosition: 'absolute',
    openPosition: 'auto', // options: auto, up, down
    placeholderText: 'Select Value',
    allowDeselect: false,
    hideSelected: false,
    showOptionTooltips: false,
    minSelected: 0,
    maxSelected: 1000,
    timeoutDelay: 200,
    maxValuesShown: 20,
    maxValuesMessage: '{number} selected',
    addableText: 'Press "Enter" to add {value}',
  },
})

});


*/


$(document).on('turbolinks:load', function() {  
  

  const selects = document.querySelectorAll('.customSelect select')
  selects.forEach((selectElement) => {
    new SlimSelect({
      select: selectElement
    })
    //setSlimData(selectElement)
  })

});