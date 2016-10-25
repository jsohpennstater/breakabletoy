import React, {Component} from 'react';
import Question from './Question'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      chosenAnswerId: null
    };
  this.handleQuestionClick = this.handleQuestionClick.bind(this)
  };

  handleQuestionClick(id) {
    this.setState({ chosenAnswerId: id});
  }

  render() {
    let response = "";
    let question = this.props.data.question.body;
    let answers = this.props.data.answers.map(answer => {
      let onQuestionClick = () =>
       this.handleQuestionClick(answer.id);
        if (this.state.chosenAnswerId === answer.id) {
          if (answer.correct) {
             response = "Correct"
          } else {
             response = "Incorrect"
            }
        }
        return (
          <Answer
            key={answer.id}
            id={answer.question_id}
            body={answer.body}
            onQuestionClick={onQuestionClick}
          />
        );
      });

    return (
      <div className="react-quiz">
        {question}
        {answers}
        {response}
      </div>
    )
  };
};


export default App;
