$(document).ready(function(){

$('.ScaleOne').on('click', function(event) {
    event.preventDefault();
    var path = this.parentElement.action
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    var new_path = this.parentElement.action.slice(0,-9);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      var Scale = `Scale_${data.question_id}`;
      var Answer = `Not at all`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleTwo').on('click', function(event) {
    event.preventDefault();
    var path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    var new_path = this.parentElement.action.slice(0,-9);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      var Scale = `Scale_${data.question_id}`;
      var Answer = `A little bit`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleThree').on('click', function(event) {
    event.preventDefault();
    var path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    var new_path = this.parentElement.action.slice(0,-11);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      var Scale = `Scale_${data.question_id}`;
      var Answer = `Somewhat`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleFour').on('click', function(event) {
    event.preventDefault();
    var path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    var new_path = this.parentElement.action.slice(0,-10);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      var Scale = `Scale_${data.question_id}`;
      var Answer = `Quite a bit`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleFive').on('click', function(event) {
    event.preventDefault();
    var path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    var new_path = this.parentElement.action.slice(0,-10);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      var Scale = `Scale_${data.question_id}`;
      var Answer = `Very Much`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.Submit').on('click', function(event) {
      event.preventDefault();
      var path = this.parentElement.action
      var request = $.ajax({
        url: `${path}`,
        method: "POST",
      });
      request.done(function(data) {
        var status = `status_completion`;
        var completion = `Status: Complete`;
        document.getElementById(status).innerHTML = completion;
      });
    });

});
