from transformers import pipeline

# Initialize the language model pipeline
model = pipeline("text-generation", model="gpt2")

# Ask the question
question = "How are you?"

# Generate a response
response = model(question, max_length=100, num_return_sequences=1)

# Print the response
print(response[0]['generated_text'])
