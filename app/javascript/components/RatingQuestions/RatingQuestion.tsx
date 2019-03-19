import React, { Component } from 'react';
// import Axios from 'axios';
import RatingOption from './RatingOption';
import Form from './Form';

import * as styles from './styles/RatingQuestion.module.scss'

// import styles from './styles/Question.module.css';
import button from './styles/button.module.scss';

interface RatingQuestionProps {
  id: string;
  title: string;
  // optionSelected(value: string): void;
}

interface RatingQuestionState {
  selectedOption: string;
  showForm: boolean;
}

class RatingQuestion extends Component<
  RatingQuestionProps,
  RatingQuestionState
  > {
  // this is the same as having a constructor with super(props)
  state = {
    selectedOption: 'Nothing Selected',
    showForm: false,
  };

  optionSelected = (option: string) => {
    this.setState({ selectedOption: option });
  };

  removeItem = () => {
    let result = window.confirm(
      `Are you sure you want to delete question: ${this.props.title}`
    );
    // if (result) {
    //   Axios.delete(`http://localhost:4567/ratingQuestions/${this.props.id}`);
    // }
  };

  showForm = () => {
    this.setState({ showForm: true });
  };

  render(): JSX.Element {
    return (
      // <div className={styles.questionBlock}>
      <div>
        <h1>{this.props.title}</ h1>

        <h2>
          <span>Selected option:</span>
          {this.state.selectedOption}
        </h2>

        <div>
          {this.renderRatingOptions(this.props.title)}
        </div>
        <div className={button.wrapper}>
          <button className={button.edit} onClick={this.showForm}>
            Edit Title
          </button>
          <button className={button.destroy} onClick={this.removeItem}>
            Delete
          </button>
        </div>
        {this.state.showForm ? <Form action="edit" id={this.props.id} /> : null}
      </div>
    );
  }

  renderRatingOptions(title: string) {
    let values = [
      'Strongly Agree',
      'Agree',
      'Neutral',
      'Disagree',
      'Strongly Disagree',
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

export default RatingQuestion;
