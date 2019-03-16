// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
$(document).ready(function(){

  $('#toggle_login').click(function(){
    $('#login_form').toggle();
  });
});

var disclaimerArr = [

  "Consuming raw or undercooked meats, poultry, seafood, shellfish, or eggs may increase your risk of foodborne illness.",
  "Our menu does not contain any suitable Vegan or Vegetarian dishes currently at this time.",
  "Our food may contain peanuts, dairy, fish, soy, wheat and alcohol."
]

function changeDisclaimer(value) {

    $('#disclaimer').val(disclaimerArr[value]);
}
