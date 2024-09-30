// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")
require("@nathanvda/cocoon")


Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

const images = require.context('../images', true)// For images accessibility


// To fix rails-ujs error.
window.jQuery = $;
window.jquery = $;
window.$ = $;


//import "bootstrap";
import 'bootstrap/dist/js/bootstrap'
import "@fortawesome/fontawesome-free/css/all";
//import '@fortawesome/fontawesome-free';

/*
const myDropdown = document.getElementById('myDropdown')
myDropdown.addEventListener('show.bs.dropdown', event => {
  // do something...
})*/

