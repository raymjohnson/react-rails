import React, { Component } from "react";
import Axios from "axios";

interface FormProps {
  id: string;
  action: string;
  title: string;
}

interface FormState {
  title: string;
  flash: string;
}

export default class Form extends Component<FormProps, FormState> {
  state = {
    title: this.props.title || "",
    flash: ""
  };

  handleChange = (event: React.FormEvent) => {
    this.setState({ title: (event.target as HTMLInputElement).value });
  };

  createQuestion = () => {
    Axios.post("/rating_questions.json", {
      rating_question: { title: this.state.title }
    }).then(response => {
      this.setState({
        flash: "Question created successfully"
      });
    });
  };

  updateQuestion = () => {
    Axios.put(`/rating_questions/${this.props.id}.json`, {
      rating_question: { title: this.state.title }
    }).then(response => {
      this.setState({
        flash: "Question successfully updated"
      });
    });
  };

  handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    this.props.action === "submit"
      ? this.createQuestion()
      : this.updateQuestion();
  };

  renderForm = () => {
    return (
      <div>
        <h1>{this.state.flash ? this.state.flash : ""}</h1>
        <form onSubmit={this.handleSubmit}>
          <input
            onChange={this.handleChange}
            name="title"
            value={this.state.title}
          />
          <br />
          <button type="submit" className="submit">
            {this.props.action === "submit"
              ? "Create Question"
              : "Update Question"}
          </button>
        </form>
      </div>
    );
  };

  render() {
    return <div>{this.renderForm()}</div>;
  }
}
