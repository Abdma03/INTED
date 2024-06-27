import re

# The path to your text file
file_path = r'C:\Users\maria\OneDrive - Universitetet i Oslo\VÅR2024\Textembedding\Drexl\llama_output\output_drexl_3.txt'

# Read the text from the file
with open(file_path, 'r', encoding='utf-16le') as file:
    text = file.read()

# Use regular expressions to find all lists of numbers surrounded by brackets
lists = re.findall(r'\[(.*?)\]', text)

print(len(lists))


