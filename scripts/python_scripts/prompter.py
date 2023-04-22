#!/usr/bin/env python

import os
import subprocess


# Create prompts directory if it doesn't exist
os.makedirs('resources/prompts', exist_ok=True)

# Get existing prompt filenames and extract three-digit numbers
filenames = os.listdir(os.getenv("SALSA_CHAT_GPT_PROMPTS_DIR"))
largest_file_number = 0
numbers = "{:03d}".format(largest_file_number)
number_list = []
for filename in filenames:
    if filename[:6] == 'prompt' and filename[-4:] == '.txt':
        current_file_number = "{:03d}".format(int(filename[6:9]))
        largest_file_number = max(
            [int(current_file_number), int(largest_file_number)])

file_number = "{:03d}".format(largest_file_number + 1)
filename = f'prompt{file_number}.txt'

# Create/open new file in vim
subprocess.run(['vim', f'resources/prompts/{filename}'])
