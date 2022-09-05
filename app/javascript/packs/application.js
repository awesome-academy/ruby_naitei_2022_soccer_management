// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery");
import "bootstrap";


require("bootstrap/dist/js/bootstrap")
require("jquery")
require("jquery-ui")
require("jquery-datetimepicker")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
global.$ = require("jquery")


$(document).on('turbolinks:load', function() {
  var time_arr = [];
  for(var i=0; i<24; i++) {
    time_arr.push(i + ':00');
    time_arr.push(i + ':15');
    time_arr.push(i + ':30');
    time_arr.push(i + ':45');
  }

  var date = new Date()

  var start_time = date.getHours()
  var finish_time = start_time + 1

  $('#soccer_field_order_time_start_picker').datetimepicker({
    allowTimes: time_arr,
    defaultDate: date,
    defaultTime: start_time,
    format:'d.m.Y H:i',
  });

  $('#soccer_field_order_time_finish_picker').datetimepicker({
    allowTimes: time_arr,
    defaultDate: date,
    defaultTime: finish_time,
    format:'d.m.Y H:i',
  });
});
