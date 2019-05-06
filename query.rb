query = """
  query {
    questions
    survey
  }
"""

result = SurveyorSchema.execute(
  query: query,
)

p result
