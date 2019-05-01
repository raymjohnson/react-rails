account = Account.create(name: "Culture Amp")

account.users.create(
  name: "Rachel Johnson",
  email: "rachel.johnson@example.com",
  password: "password"
)

survey = account.surveys.create(name: "Culture Amp first survey")

5.times do |n|
  survey.rating_questions.create(title: "Example Question #{n+1}")
end
