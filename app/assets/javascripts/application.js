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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery

document.addEventListener("DOMContentLoaded", function() {
  const pressed = [];
  const secretCode = "`god";
  const body = document.querySelector("body");
  const button = document.querySelector(".audio-button");
  const play = document.querySelector(".audio-play");
  const checkbox = document.querySelector("#advance");
  const dateInput = document.querySelector(".time");

  window.addEventListener("keyup", function(e) {
    console.log(e.key);
    pressed.push(e.key);
    pressed.splice(-secretCode.length - 1, pressed.length - secretCode.length);
    if (pressed.join("").includes(secretCode)) {
      console.log("DING DING!");
      body.style.display = "none";
    }
  });

  button.addEventListener("click", function() {
    play.play();
  });

  checkbox.addEventListener("change", function() {
    dateInput.style.display =
      dateInput.style.display === "inline-block" ? "none" : "inline-block";
  });
});
