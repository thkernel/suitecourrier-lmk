
//import Rails from "@rails/ujs"
require("./application");

import "../stylesheets/frontend.scss";
import 'bootstrap-icons/font/bootstrap-icons.css'


/* FRONT ASSETS */

import "../vendor/backend/bracket/lib/cookieconsent/dist/cookieconsent";


import AOS from "../vendor/frontend/assets/vendor/aos/aos.js";
window.AOS = AOS;
//import AOS from 'aos';
//require("../vendor/front/assets/vendor/bootstrap/js/bootstrap.bundle.min.js");
import "../vendor/frontend/assets/vendor/glightbox/js/glightbox";
require("../vendor/frontend/assets/vendor/isotope-layout/isotope.pkgd.min.js");
import Swiper from  "../vendor/frontend/assets/vendor/swiper/swiper-bundle.min.js";
window.Swiper = Swiper;

require("../vendor/frontend/assets/js/main.js");


require("./social-share-button");


require("./cookieconsent_init");





/* END */