import React, {Component} from 'react';
import Question from './Question'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: "",
      questionId: null,
      questionnaireId: null,
    }
    this.handleOneClick = this.handleOneClick.bind(this);
    this.handleTwoClick = this.handleTwoClick.bind(this);
    this.handleThreeClick = this.handleThreeClick.bind(this);
    this.handleFourClick = this.handleFourClick.bind(this);
    this.handleFiveClick = this.handleFiveClick.bind(this);
  }

  handleOneClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${this.state.questionId}/questions/${this.state.questionnaireId}/scaleone`,
      method: "POST",
    });
  }

  handleTwoClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${this.state.questionId}/questions/${this.state.questionnaireId}/scaletwo`,
      method: "POST",
    });
  }

  handleThreeClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${this.state.questionId}/questions/${this.state.questionnaireId}/scalethree`,
      method: "POST",
    });
  }

  handleFourClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${this.state.questionId}/questions/${this.state.questionnaireId}/scalefour`,
      method: "POST",
    });
  }

  handleFiveClick(id, questionnaireId) {
    this.setState({ questionId: id, questionnaireId: questionnaireId });
    let request = $.ajax({
      url: `/questionnaires/${this.state.questionnaireId}/questions/${this.state.questionId}/scalefive`,
      method: "POST",
    });
  }

  componentDidMount() {
    $.ajax({
      url: `/questionnaires/${this.props.id}.json`,
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ questions: data });
    });
  }


  render() {
    let questionSet = "";
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
      </div>
    );
  }
}
export default App;
