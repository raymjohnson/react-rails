query = """
  query {
    questions
  }
"""

result = SurveyorSchema.execute(
  query: query
)

p result
