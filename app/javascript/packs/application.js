// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugins/init_mapbox';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  loadDynamicBannerText();
  initMapbox();
});

const dailyRate = document.getElementById("daily_rate");
const price = document.getElementById("computed_price");
const startDateInput = document.getElementById("booking_start_date");
const endDateInput = document.getElementById("booking_end_date");
const numberOfPersonsInput = document.getElementById("booking_number_of_persons");
const inputs = document.querySelectorAll(".form-control");

const computedPrice = () => {
  const dailyRateInt = parseInt(dailyRate.innerText.match(/\d+/)[0], 10);
  const numberOfPersonsInt = parseInt(numberOfPersonsInput.value, 10);
  let numberOfDays = (Date.parse(endDateInput.value) - Date.parse(startDateInput.value)) / (1000 * 60 * 60 * 24) + 1;
  return numberOfDays * dailyRateInt * numberOfPersonsInt;
}

inputs.forEach((element) => {
  element.addEventListener('change', (event) => {
    let totalPrice = computedPrice();
    if (isNaN(totalPrice)) {
      price.innerText = "CHF";
    } else {
      price.innerText = `${computedPrice()} CHF`;
    }
  });
});
