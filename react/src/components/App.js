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


// export default App;


// import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      current: "",
    }
    this.handleButtonOne = this.handleButtonOne.bind(this);
    this.handleButtonTwo = this.handleButtonTwo.bind(this);
    this.handleButtonThree = this.handleButtonThree.bind(this);
    this.handleButtonFour = this.handleButtonFour.bind(this);
    this.handleButtonFive = this.handleButtonFive.bind(this);
  }

  handleButtonOne() {
    // if (this.state.current[0].criteria === "A") {
    //     $.ajax({
    //       url: `/questionnaires/${this.props.id}.json`,
    //       contentType: 'application/json'
    //     })
    //     .done(data => {
    //       this.setState({ current: data.qtwo });
    //     });
    //   } else if (this.state.current[0].criteria === "B") {
    //     $.ajax({
    //       url: `/questionnaires/${this.props.id}.json`,
    //       contentType: 'application/json'
    //     })
    //     .done(data => {
    //       this.setState({ current: data.qthree });
    //     });
    //   };
  }
  handleButtonTwo() {

  }

  handleButtonThree() {

  }

  handleButtonFour() {

  }

  handleButtonFive() {

  }

  // handleButtonBefore() {
  //   if (this.state.current[0].criteria === "B") {
  //       $.ajax({
  //         url: `/questionnaires/${this.props.id}.json`,
  //         contentType: 'application/json'
  //       })
  //       .done(data => {
  //         this.setState({ current: data.qone });
  //       });
  //     } else if (this.state.current[0].criteria === "C") {
  //       $.ajax({
  //         url: `/questionnaires/${this.props.id}.json`,
  //         contentType: 'application/json'
  //       })
  //       .done(data => {
  //         this.setState({ current: data.qtwo });
  //       });
  //     };
  // }


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
        <button className="ScaleOne" onClick={this.handleButtonOne}>Not at all</button>
        <button className="ScaleTwo" onClick={this.handleButtonTwo}>A little bit</button>
        <button className="ScaleThree" onClick={this.handleButtonThree}>Somewhat</button>
        <button className="ScaleFour" onClick={this.handleButtonFour}>Quite a bit</button>
        <button className="ScaleFive" onClick={this.handleButtonFive}>VeryMuch</button>
      </div>
    );
  }
}
export default App;
