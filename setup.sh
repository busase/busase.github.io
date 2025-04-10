#!/bin/bash
# BU SASE Jekyll Website Setup Script
# This script creates the directory structure and empty files for the BU SASE Jekyll website

echo "Setting up BU SASE Jekyll website structure..."

# Create directories
mkdir -p _layouts
mkdir -p assets/css
mkdir -p assets/js
mkdir -p assets/images/sase
mkdir -p assets/images/board
mkdir -p assets/images/company
mkdir -p assets/images/events
mkdir -p _includes
mkdir -p pages

# Create layout files
touch _layouts/default.html
touch _layouts/page.html
touch _layouts/home.html

# Create include files
touch _includes/header.html
touch _includes/footer.html
touch _includes/head.html

# Create asset files
touch assets/css/styles.scss
touch assets/js/main.js

# Create main pages in pages directory
touch pages/index.html
touch pages/about.html
touch pages/board.html
touch pages/alumni.html
touch pages/sponsors.html
touch pages/events.html
touch pages/mentorship.html
touch pages/signup.html

# Create _sass directory and main.scss
mkdir -p _sass
touch _sass/main.scss

# Only create _config.yml if it doesn't exist
if [ ! -f _config.yml ]; then
  echo "Creating new _config.yml file..."
  echo "# BU SASE Website Configuration
title: BU Society of Asian Scientists and Engineers
email: sase@bu.edu
description: >-
  Boston University Society of Asian Scientists and Engineers (BU SASE) 
  is a student organization dedicated to the professional development of 
  Asian scientists and engineers.
baseurl: \"\"
url: \"https://busase.github.io\"
github_username: busase

# Build settings
theme: minima
plugins:
  - jekyll-feed

# Exclude from processing
exclude:
  - .sass-cache/
  - .jekyll-cache/
  - gemfiles/
  - Gemfile
  - Gemfile.lock
  - node_modules/
  - vendor/bundle/
  - vendor/cache/
  - vendor/gems/
  - vendor/ruby/" > _config.yml
else
  echo "_config.yml already exists, keeping the existing file..."
fi

# Check for existing files (don't overwrite)
if [ ! -f README.md ]; then
  echo "Creating README.md file..."
  echo "# BU Society of Asian Scientists and Engineers

Website for the Boston University chapter of the Society of Asian Scientists and Engineers (SASE).

## Development

This website is built with Jekyll and hosted on GitHub Pages.

To run locally:
1. \`bundle install\`
2. \`bundle exec jekyll serve\`
3. Open http://localhost:4000 in your browser" > README.md
else
  echo "README.md already exists, keeping the existing file..."
fi

# Don't touch .gitignore if it already exists
if [ ! -f .gitignore ]; then
  echo "Creating basic .gitignore file..."
  echo "_site
.sass-cache
.jekyll-cache
.jekyll-metadata
vendor" > .gitignore
else
  echo ".gitignore already exists, keeping the existing file..."
fi

# Update 404.html or create it if it doesn't exist
if [ ! -f 404.html ]; then
  echo "Creating 404.html file..."
  echo "---
permalink: /404.html
layout: default
---

<div class=\"container text-center\">
  <h1>404</h1>
  <p><strong>Page not found</strong></p>
  <p>The requested page could not be found.</p>
  <p><a href=\"/\">Return to home page</a></p>
</div>" > 404.html
else
  echo "404.html already exists, keeping the existing file..."
fi

# Clean up any _posts directory since you don't need blog posts
if [ -d _posts ]; then
  echo "Removing _posts directory (blog posts not needed)..."
  rm -rf _posts
fi

# Remove index.markdown and about.markdown if they exist
if [ -f index.markdown ]; then
  echo "Removing index.markdown..."
  rm index.markdown
fi

if [ -f about.markdown ]; then
  echo "Removing about.markdown..."
  rm about.markdown
fi

echo "File structure created successfully!"
echo "Next steps:"
echo "1. Review the _config.yml with your site details"
echo "2. Add content to your layout files"
echo "3. Create your custom CSS in assets/css/styles.scss"
echo "4. Add content to your pages"
echo "5. Add your images to the assets/images subdirectories"