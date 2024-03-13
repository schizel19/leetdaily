cd ..

toc ./Source -o Resource/TableOfContents.md

cd Resource

format_file="Format.md"
content_file="TableOfContents.md"
output_file="../README.md"

# Read content from Format.md and Content.md
format_content=$(<"$format_file")
content=$(<"$content_file")

# Replace the string (!!!!TOC!!!!) with the content
result="${format_content/..TOC../$content}"

# Output the result to Output.md
echo "$result" > "$output_file"