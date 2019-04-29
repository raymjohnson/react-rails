import * as React from "react";
import styles from "./styles/index.module.scss";
// import formStyles from "./styles/form.module.scss";
import RatingQuestion from "./RatingQuestion";
import Form from "./Form";

interface ContainerProps {
  questions: Question[];
}

interface Question {
  id: string;
  title: string;
  url: string;
}

export default class Container extends React.Component<ContainerProps, {}> {
  renderRatingQuestions() {
    const { questions } = this.props;
    return questions.map(question => {
      return <RatingQuestion key={question.id} {...question} />;
    });
  }

  render() {
    return (
      <div className={styles.wrapper}>
        <h1 className={styles.heading}>Rating Questions</h1>
        <div className={styles.formWrapper}>
          <h2>Submit a new question:</h2>
          <Form action="submit" id={""} title={""} />
        </div>
        <div>{this.renderRatingQuestions()}</div>
      </div>
    );
  }
}
