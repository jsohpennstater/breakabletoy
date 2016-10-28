import React from 'react';

let Question = props => {
  return (
    <div className="large-12 columns userquestion-display" key={props.id}>
      <h1 className="row question-content">{props.content}</h1>
      <div className="row">
        <p onClick={props.oneQuestionClick}>
          <button className="ScaleOne">Not at all</button>
        </p>
        <p onClick={props.twoQuestionClick}>
          <button className="ScaleTwo">A little bit</button>
        </p>
        <p onClick={props.threeQuestionClick}>
          <button className="ScaleThree">Somewhat</button>
        </p>
        <p onClick={props.fourQuestionClick}>
          <button className="ScaleFour">Quite a bit</button>
        </p>
        <p onClick={props.fiveQuestionClick}>
          <button className="ScaleFive">Very Much</button>
        </p>
      </div>
      <p id={`response_${props.questionId}`}>""</p>
    </div>
  );
};

export default Question;
