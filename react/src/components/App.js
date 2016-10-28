import React, {Component} from 'react';
import Question from './Question'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: "",
      questionId: "0",
      questionnaireId: "0",
    };
    this.handleOneClick = this.handleOneClick.bind(this);
    this.handleTwoClick = this.handleTwoClick.bind(this);
    this.handleThreeClick = this.handleThreeClick.bind(this);
    this.handleFourClick = this.handleFourClick.bind(this);
    this.handleFiveClick = this.handleFiveClick.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  };

  handleOneClick(id, questionnaireId) {
    event.preventDefault();
    let request = $.ajax({
      url: `/questionnaires/${questionnaireId}/questions/${id}/scaleone`,
      method: "POST",
    })
    .done(data => {
      this.setState({ questionId: id, questionnaireId: questionnaireId });
    });
    let response = `response_${id}`
    let Answer = `Not at all`;
    document.getElementById(response).innerHTML = Answer;
  };

  handleTwoClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${questionnaireId}/questions/${id}/scaletwo`,
      method: "POST",
    })
    .done(data => {
      this.setState({ questionId: id, questionnaireId: questionnaireId });
    });
    let response = `response_${id}`;
    let Answer = `A little bit`;
    document.getElementById(response).innerHTML = Answer;
  };

  handleThreeClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${questionnaireId}/questions/${id}/scalethree`,
      method: "POST",
    })
    .done(data => {
      this.setState({ questionId: id, questionnaireId: questionnaireId });
    });
    let response = `response_${id}`;
    let Answer = `Somewhat`;
    document.getElementById(response).innerHTML = Answer;
  };

  handleFourClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${questionnaireId}/questions/${id}/scalefour`,
      method: "POST",
    })
    .done(data => {
      this.setState({ questionId: id, questionnaireId: questionnaireId });
    });
    let response = `response_${id}`;
    let Answer = `Quite a bit`;
    document.getElementById(response).innerHTML = Answer;
  }

  handleFiveClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${questionnaireId}/questions/${id}/scalefive`,
      method: "POST",
    })
    .done(data => {
      this.setState({ questionId: id, questionnaireId: questionnaireId });
    });
    let response = `response_${id}`;
    let Answer = `Very Much`;
    document.getElementById(response).innerHTML = Answer;
  };

  handleSubmit() {
    let Answer = `Submission Recorded`;
    let status = `submission`;
    document.getElementById(status).innerHTML = Answer;
  };

  componentDidMount() {
    $.ajax({
      url: `/questionnaires/${this.props.id}.json`,
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ questions: data.questions });
    });
  }

  render() {
    let questionSet = "";
    let status = "";
    if (this.state.questions.length !== 0) {
        questionSet = this.state.questions.map(question => {
          let oneQuestionClick = () =>
          this.handleOneClick(question.id, question.questionnaire_id);
          let twoQuestionClick = () =>
          this.handleTwoClick(question.id, question.questionnaire_id);
          let threeQuestionClick = () =>
          this.handleThreeClick(question.id, question.questionnaire_id);
          let fourQuestionClick = () =>
          this.handleFourClick(question.id, question.questionnaire_id);
          let fiveQuestionClick = () =>
          this.handleFiveClick(question.id, question.questionnaire_id);
        return(
          <Question
          key={question.id}
          questionId={question.id}
          content={question.content}
          oneQuestionClick={oneQuestionClick}
          twoQuestionClick={twoQuestionClick}
          threeQuestionClick={threeQuestionClick}
          fourQuestionClick={fourQuestionClick}
          fiveQuestionClick={fiveQuestionClick}
          />
        )
      });
    }
    return(
      <div className="questionnaire-walkthrough">
        {questionSet}
        <button className="submit" onClick={this.handleSubmit}>Submit</button>
        <p id="submission">{status}</p>
      </div>
    );
  }
}
export default App;
