import React, { Component } from 'react';
// import Axios from 'axios';

// import styles from './styles/form.module.scss';
// import button from './styles/button.module.scss';

interface FormState {
  title: string;
}

interface FormProps {
  id: string;
  action: string;
}

class Form extends Component<FormProps, FormState> {
  state = {
    title: '',
  };

  handleChange = (event: React.FormEvent) => {
    this.setState({ title: (event.target as HTMLInputElement).value });
  };

  handleSubmit = (event: React.FormEvent) => {
    // if (this.props.action === 'submit') {
    //   Axios.post('http://localhost:4567/ratingQuestions', {
    //     title: this.state.title,
    //   });
    // } else if (this.props.action === 'edit') {
    //   Axios.put(`http://localhost:4567/ratingQuestions/${this.props.id}`, {
    //     title: this.state.title,
    //   });
    // }
  };

  render(): JSX.Element {
    return (
      <form onSubmit={this.handleSubmit}>
        <input
          type="text"
          name="title"
          value={(this.state as HTMLInputElement).value}
          onChange={this.handleChange}
        />
        <input type="submit" value="Submit" />
      </form>
    );
  }
}

export default Form;
