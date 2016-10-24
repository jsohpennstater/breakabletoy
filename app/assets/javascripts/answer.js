$(document).ready(function(){

$('.True').on('click', function(event) {
    event.preventDefault();
    let path = this.parentElement.action
    var request = $.ajax({
      url: `${path}`,
      method: "POST",
    });
    let new_path = this.parentElement.action.slice(0,-11)
    var request = $.ajax({
      url: `${new_path}.json`
    });
    request.done(function(data) {
      let Question = `True_Or_False_${data.question_id}`;
      let NewQuestionAnswerTrue = `true`;
      document.getElementById(Question).innerHTML = NewQuestionAnswerTrue;
    });
  });

  $('.False').on('click', function(event) {
      event.preventDefault();
      let path = this.parentElement.action;
      var request = $.ajax({
        url: `${path}`,
        method: "POST",
      });
      let new_path = this.parentElement.action.slice(0,-12);
      var request = $.ajax({
        url: `${new_path}.json`
      });
      request.done(function(data) {
        let Question = `True_Or_False_${data.question_id}`;
        let NewQuestionAnswerFalse = `false`;
        document.getElementById(Question).innerHTML = NewQuestionAnswerFalse;
      });
    });
});
