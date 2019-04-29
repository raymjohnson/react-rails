import React, { Component } from "react";
import Axios from "axios";
import RatingOption from "./RatingOption";
import Form from "./Form";
// import formstyles from "./styles/form.module.scss";
import styles from "./styles/question.module.scss";
import button from "./styles/button.module.scss";

interface RatingQuestionProps {
  id: string;
  title: string;
  url: string;
}

interface RatingQuestionState {
  selectOption: string;
  showForm: boolean;
}

export default class RatingQuestion extends Component<
  RatingQuestionProps,
  RatingQuestionState
> {
  // this is the same as having a constructor with super(props)
  state = {
    selectOption: "Nothing Selected",
    showForm: false
  };

  optionSelected = (option: string) => {
    this.setState({ selectOption: option });
  };

  deleteQuestion = () => {
    const confirm = window.confirm(
      `Are you sure you want to delete question: ${this.props.title}`
    );
    if (confirm) {
      Axios.delete(this.props.url);
    }
  };

  showForm = () => {
    this.setState({ showForm: true });
  };

  render() {
    return (
      <div className={styles.questionBlock}>
        <h1>{this.props.title}</h1>
        <h2>
          <span className={styles.label}>Selected option:</span>
          {this.state.selectOption}
        </h2>
        <div className={styles.options}>
          {this.renderOptions(this.props.title)}
        </div>
        <div className={button.wrapper}>
          <button className={button.edit} onClick={this.showForm}>
            Edit Title
          </button>
          <button className={button.destroy} onClick={this.deleteQuestion}>
            Delete
          </button>
        </div>
        {this.state.showForm ? (
          <Form action="edit" id={this.props.id} title={this.props.title} />
        ) : null}
      </div>
    );
  }

  renderOptions(title: string) {
    let values = [
      "Strongly Agree",
      "Agree",
      "Neutral",
      "Disagree",
      "Strongly Disagree"
    ];
    // add a key so that each is unique when mapping through the array
    return values.map((value, index) => (
      <RatingOption
        key={index}
        title={title}
        value={value}
        optionSelected={this.optionSelected}
      />
    ));
  }
}
