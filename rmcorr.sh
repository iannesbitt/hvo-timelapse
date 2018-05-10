find . --name “*” -exec jpeginfo -c {} \; | grep -E “WARNING|ERROR” | cut -d “ “ -f 1 | xargs rm -r
