
import * as React from 'react'
import * as styles from './styles/index.module.scss'
import RatingQuestion from './RatingQuestion'
import Form from './Form';

interface Question {
  id: string,
  title: string
}

interface RatingQuestionsProps {
  questions: Question[]
}

class RatingQuestions extends React.Component<RatingQuestionsProps, {}> {

  render(): JSX.Element {
    return (
      <div className={styles.wrapper}>
        <h1 className={styles.heading}>Question Time</h1>
        <div className={styles.formWrapper}>
          <h2>Submit a new question:</h2>
          <Form action="submit" id={""} />
        </div>
        {this.renderRatingQuestions()}
      </div>
    );
  }

  renderRatingQuestions() {
    return this.props.questions.map(optionSelected => (
      <RatingQuestion key={optionSelected.id} {...optionSelected} />
    ));
  }
}

export default RatingQuestions
