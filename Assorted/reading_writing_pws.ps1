# Define the path to your input document and output file
$InputFile = "C:\Users\maria\Desktop\GPT_model_textembedding\PWS_playing\jellyfish.txt"
$OutputFile = "C:\Users\maria\Desktop\GPT_model_textembedding\PWS_playing\output_jellyfish.txt"

# Check if the output file already exists and clear its contents if it does
if (Test-Path $OutputFile) {
    Clear-Content -Path $OutputFile
}

# Read the input file line by line
Get-Content -Path $InputFile | ForEach-Object {
    # Store the current line in a variable
    $currentCommand = $_

    # Write status to console
    #Write-Host "Executing command: $currentCommand"

    # Try to execute the current command and redirect the output to the output file
    try {
        # Invoke the command and capture the output
        $output = Invoke-Expression $currentCommand

        # Append the output to the output file
        Add-Content -Path $OutputFile -Value $output
        $currentCommand | Tee-Object -FilePath $OutputFile -Append
    } catch {
        # If an error occurs, append the error to the output file
        Add-Content -Path $OutputFile -Value $_.Exception.Message
    }
}

# Write completion status to console
Write-Host "Execution completed. Output is saved in $OutputFile."
