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
