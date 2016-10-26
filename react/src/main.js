import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

$(function() {
  ReactDOM.render(
    <App id={window.location.href.split("/")[4]}/>,
    document.getElementById('app')
  );
});


// var new_path = this.parentElement.action.slice(0,-9);
// var request = $.ajax({
//   url: new_path + ".json"
// });
// request.done(function(data) {
//   var Scale = "Scale_" + data.question_id;
//   var Answer = "Not at all";
//   document.getElementById(Scale).innerHTML = Answer;
// });
//
