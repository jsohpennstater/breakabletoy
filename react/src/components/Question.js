import React from 'react';

let Question = props => {
  return (
    <div className="large-12 columns userquestion-display" key={props.id}>
      <h1 className="row question-content">{props.content}</h1>
      <div className="row scale">
        <p onClick={props.oneQuestionClick}>
          <button className="large-1 columns ScaleOne">Not at all</button>
        </p>
        <p onClick={props.twoQuestionClick}>
          <button className="large-1 columns ScaleTwo">A little bit</button>
        </p>
        <p onClick={props.threeQuestionClick}>
          <button className="large-1 columns ScaleThree">Somewhat</button>
        </p>
        <p onClick={props.fourQuestionClick}>
          <button className="large-1 columns ScaleFour">Quite a bit</button>
        </p>
        <p onClick={props.fiveQuestionClick}>
          <button className="large-1 columns ScaleFive">Very Much</button>
        </p>
      </div>
      <div className="responsetext">
      <p id={`response_${props.questionId}`}> </p>
    </div>
    </div>
  );
};

export default Question;
