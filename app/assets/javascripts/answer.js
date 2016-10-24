$(document).ready(function(){

$('.ScaleOne').on('click', function(event) {
    event.preventDefault();
    let path = this.parentElement.action
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    let new_path = this.parentElement.action.slice(0,-9);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      let Scale = `Scale_${data.question_id}`;
      let Answer = `Not at all`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleTwo').on('click', function(event) {
    event.preventDefault();
    let path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    let new_path = this.parentElement.action.slice(0,-9);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      let Scale = `Scale_${data.question_id}`;
      let Answer = `A little bit`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleThree').on('click', function(event) {
    event.preventDefault();
    let path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    let new_path = this.parentElement.action.slice(0,-11);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      let Scale = `Scale_${data.question_id}`;
      let Answer = `Somewhat`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleFour').on('click', function(event) {
    event.preventDefault();
    let path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    let new_path = this.parentElement.action.slice(0,-10);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      let Scale = `Scale_${data.question_id}`;
      let Answer = `Quite a bit`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.ScaleFive').on('click', function(event) {
    event.preventDefault();
    let path = this.parentElement.action;
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    let new_path = this.parentElement.action.slice(0,-10);
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      let Scale = `Scale_${data.question_id}`;
      let Answer = `Very Much`;
      document.getElementById(Scale).innerHTML = Answer;
    });
  });

$('.Submit').on('click', function(event) {
      event.preventDefault();
      let path = this.parentElement.action
      var request = $.ajax({
        url: `${path}`,
        method: "POST",
      });
      request.done(function(data) {
        let status = `status_completion`;
        let completion = `Status: Completed`;
        debugger;
        document.getElementById(status).innerHTML = completion;
      });
    });

});
