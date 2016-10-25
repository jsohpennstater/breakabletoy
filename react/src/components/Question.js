import React from 'react';

let Question = props => {
  return (
    <div onClick={props.onQuestionClick}>
      {props.body}
    </div>
  );
};

export default Question;
