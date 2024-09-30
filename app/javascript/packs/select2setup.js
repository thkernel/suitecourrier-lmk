import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

/// if you don't have turnbolinks then use this:
//// document.addEventListener('DOMContentLoaded', () => { 
window.addEventListener( () => {
  $('.customSelect').select2({
    tags: true,
    tokenSeparators: [',', ' ']
  });
})