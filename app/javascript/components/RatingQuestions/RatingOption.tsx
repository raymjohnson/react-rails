import React, { Component } from "react";

interface RatingOptionProps {
  title: string;
  value: string;
  optionSelected(value: string): void;
}

export default class RatingOption extends Component<RatingOptionProps> {
  optionSelected = (event: React.FormEvent) => {
    this.props.optionSelected((event.target as HTMLInputElement).value);
  };

  render() {
    return (
      <div className="pretty p-default">
        <input
          type="radio"
          name={this.props.title}
          value={this.props.value}
          onChange={this.optionSelected}
        />
        <div className="state">
          <label>{this.props.value}</label>
        </div>
      </div>
    );
  }
}
