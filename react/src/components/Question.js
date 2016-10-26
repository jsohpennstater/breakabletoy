import React from 'react';

let Question = props => {
  return (
    <div className="row callout" key={props.id}>
      <p className="small-2 columns">{props.content}</p>
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
      <p id={`response_${props.questionId}`}>""</p>
    </div>
  );
};

export default Question;
