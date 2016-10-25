import React, {Component} from 'react';
// import Question from './Question'
// 
// class App extends Component {
//   constructor(props) {
//     super(props);
//     this.state = {
//       chosenAnswerId: null
//     };
//   this.handleQuestionClick = this.handleQuestionClick.bind(this)
//   };
//
//   handleQuestionClick(id) {
//     this.setState({ chosenAnswerId: id});
//   }
//
//   render() {
//     let response = "";
//     let question = this.props.data.question.body;
//     let answers = this.props.data.answers.map(answer => {
//       let onQuestionClick = () =>
//        this.handleQuestionClick(answer.id);
//         if (this.state.chosenAnswerId === answer.id) {
//           if (answer.correct) {
//              response = "Correct"
//           } else {
//              response = "Incorrect"
//             }
//         }
//         return (
//           <Answer
//             key={answer.id}
//             id={answer.question_id}
//             body={answer.body}
//             onQuestionClick={onQuestionClick}
//           />
//         );
//       });
//
//     return (
//       <div className="react-quiz">
//         {question}
//         {answers}
//         {response}
//       </div>
//     )
//   };
// };


export default App;


import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      current: "",
    }
    this.handleButtonNext = this.handleButtonNext.bind(this);
    this.handleButtonBefore = this.handleButtonBefore.bind(this);
    this.handleButtonTrue = this.handleButtonTrue.bind(this);
  }

  handleButtonNext() {
    if (this.state.current[0].criteria === "A") {
        $.ajax({
          url: `/questionnaires/${this.props.id}.json`,
          contentType: 'application/json'
        })
        .done(data => {
          this.setState({ current: data.qtwo });
        });
      } else if (this.state.current[0].criteria === "B") {
        $.ajax({
          url: `/questionnaires/${this.props.id}.json`,
          contentType: 'application/json'
        })
        .done(data => {
          this.setState({ current: data.qthree });
        });
      };
  }

  handleButtonBefore() {
    if (this.state.current[0].criteria === "B") {
        $.ajax({
          url: `/questionnaires/${this.props.id}.json`,
          contentType: 'application/json'
        })
        .done(data => {
          this.setState({ current: data.qone });
        });
      } else if (this.state.current[0].criteria === "C") {
        $.ajax({
          url: `/questionnaires/${this.props.id}.json`,
          contentType: 'application/json'
        })
        .done(data => {
          this.setState({ current: data.qtwo });
        });
      };
  }

  handleButtonTrue() {
    document.getElementsByClassName.innerHTML = 'False';
  }



  componentDidMount() {
    $.ajax({
      url: `/questionnaires/${this.props.id}.json`,
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ current: data.qone });
    });
  }



  render() {
    let questionSet = "";
    let current= "";
    if (this.state.current.length !== 0) {
      questionSet = this.state.current.map(question => {
        return(
          <div className="row callout" key={question.id}>
            <p className="small-2 columns">{question.content}</p>
            <button className="True" onClick={this.handleButtonTrue}>True</button>
          </div>
        )
      });
    }
    return(
      <div className="questionnaire-walkthrough">
        {questionSet}
        <button className="previous button" onClick={this.handleButtonBefore}>Previous Question Set</button>
        <button className="next button" onClick={this.handleButtonNext}>Next Question Set</button>
      </div>
    );
  }
}
export default App;
