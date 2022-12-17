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
//= require popper
//= require bootstrap
//= require rails-ujs
//= require jquery-fileupload/basic
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {
  $(".sort_paginate_ajax th a, .sort_paginate_ajax .pagination a").on("click", function(){
    $.getScript(this.href);
    return false;
  });
});

$("#fileupload").fileupload({
  dataType: "json",
  add: function(e, data) {
    data.context = $('<p class="file"></p>')
      .append($('<a target="_blank"></a>').text(data.files[0].name))
      .appendTo(document.body);
    data.submit();
  },
  progress: function(e, data) {
    var progress = parseInt((data.loaded / data.total) * 100, 10);
    data.context.css("background-position-x", 100 - progress + "%");
  },
  done: function(e, data) {
    data.context
      .addClass("done")
      .find("a")
      .prop("href", data.result.files[0].url);
  }
});