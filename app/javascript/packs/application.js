// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require('dotenv').config()
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("local-time").start()

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require chartkick
//= require Chart.bundle
// to get the new features in 2.3.0:
// require highcharts/highcharts-more
// require highcharts/modules/annotations
// require highcharts/modules/data
// require highcharts/modules/drilldown
// require highcharts/modules/exporting
// require highcharts/modules/funnel
// require highcharts/modules/heatmap
// require highcharts/modules/no-data-to-display
// require highcharts/modules/offline-exporting
// require highcharts/themes/dark-blue
// require highcharts/themes/dark-green
// require highcharts/themes/gray
// require highcharts/themes/grid
// require highcharts/themes/skies

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "data-confirm-modal"
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import {chart} from '../plugins/chart.js'
import {burger} from '../plugins/burger.js'
import {flip} from '../plugins/flip.js'
import {tradingview} from '../plugins/tradingview.js'
import {showCoin} from '../plugins/showCoin.js'
import {chartApi} from '../plugins/chartApi.js'
import {load} from '../plugins/load.js'
//import {cardsApi} from '../plugins/cardsApi.js'
import {deleteChatInput} from '../plugins/room.js'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  load();
  burger();
  flip();
  tradingview();
  showCoin();
  chartApi();
  //cardsApi();
  chart();
  deleteChatInput();
});

