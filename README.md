# Boston University Society of Asian Scientists and Engineers (BU SASE)

This repository contains the website for the Boston University chapter of the Society of Asian Scientists and Engineers (SASE). The website showcases our organization, board members, events, mentorship programs, and more.

## Overview

This website is built using [Jekyll](https://jekyllrb.com/), a static site generator, and is hosted on [GitHub Pages](https://pages.github.com/). Jekyll allows us to create a professional website without needing complex backend infrastructure.

## Getting Started for New Developers

### Prerequisites

Before you begin, make sure you have the following installed on your computer:

1. **Ruby** (version 2.5.0 or higher)
   - Windows: [RubyInstaller](https://rubyinstaller.org/)
   - Mac: Ruby comes pre-installed, but you may want to use [Homebrew](https://brew.sh/) to install a newer version
   - Linux: Use your distribution's package manager (e.g., `apt-get install ruby-full` for Ubuntu)

2. **Bundler** (to manage Ruby gems/dependencies)
   - After installing Ruby, run: `gem install bundler`

3. **Git** (for version control)
   - Download from [git-scm.com](https://git-scm.com/downloads)

### Setting Up Your Local Development Environment

1. **Clone this repository**
   ```
   git clone https://github.com/busase/busase.github.io.git
   cd busase.github.io
   ```

2. **Install dependencies**
   ```
   bundle install
   ```

3. **Run the website locally**
   ```
   bundle exec jekyll serve
   ```

4. **View your local site**
   - Open your web browser and go to: [http://localhost:4000](http://localhost:4000)
   - Any changes you make to the files will be automatically refreshed in the browser (you may need to reload the page)

## Project Structure Explained

Understanding how Jekyll sites are organized will help you make changes effectively:

- **`_config.yml`**: Main configuration file for the entire site
  - Contains site title, description, social media handles
  - Defines navigation menu items
  - Configures Jekyll plugins and settings

- **`_layouts/`**: Contains template files that define how pages are structured
  - `default.html`: The main site layout with header and footer
  - `page.html`: Layout for standard pages

- **`_includes/`**: Reusable components that can be included in layouts and pages
  - `header.html`: Site navigation and logo
  - `footer.html`: Footer with contact info and links
  - `head.html`: Contains metadata, CSS links, and other `<head>` elements

- **`_pages/`**: Contains the actual content pages of the site
  - `home.html`: The site's homepage
  - `about.html`: About page content
  - `board.html`: Information about board members
  - `events.html`: Upcoming and past events
  - etc.

- **`assets/`**: Static files like images, CSS, and JavaScript
  - `css/style.css`: Main stylesheet for the website
  - `js/main.js`: JavaScript for interactive elements
  - `images/`: Contains all site images organized in folders

## Common Tasks for Website Maintenance

### Adding a New Board Member

1. Open `_pages/board.html`
2. Find the appropriate section (Core Executive Board or General Executive Board)
3. Copy an existing board card and modify the details:
   ```html
   <div class="board-card">
     <div class="board-photo">
        <img src="/assets/images/board/your-photo.jpg" alt="Your Name">
     </div>
     <div class="board-info">
        <h3>Your Name</h3>
        <h4>Position Title</h4>
        <p class="board-major">Major, Graduation Year</p>
        <a href="https://www.linkedin.com/in/yourprofile" class="board-social" target="_blank">
           <i class="fab fa-linkedin"></i> LinkedIn
        </a>
     </div>
   </div>
   ```
4. Replace the placeholder image with the new member's photo (add the photo to `/assets/images/board/` folder)

### Updating the Navigation Menu

1. Open `_config.yml`
2. Find the `navigation:` section
3. Add or modify menu items as needed:
   ```yaml
   navigation:
     - title: New Page
       url: /new-page/
   ```

### Creating a New Page

1. Create a new HTML file in the `_pages/` directory (e.g., `_pages/new-page.html`)
2. Add the Jekyll front matter at the top:
   ```yaml
   ---
   layout: default
   title: New Page Title
   permalink: /new-page/
   ---
   ```
3. Add your page content below the front matter
4. Update the navigation menu in `_config.yml` if you want the page to appear in the header

## Contributing Changes

To maintain the quality of the live website, we follow a branching workflow. **Avoid pushing directly to the main branch** as any changes to main will automatically deploy to the busasechapter.com website.

### Step 1: Create a new branch for your changes

```
# First, make sure you have the latest version of main
git checkout main
git pull origin main

# Create a new branch with a descriptive name
git checkout -b your-name/feature-description
# Example: git checkout -b jane/update-board-members
```

### Step 2: Make and test your changes

Make your changes locally, commit them, and test thoroughly:

```
# Add your changed files
git add .

# Commit your changes with a descriptive message
git commit -m "Description of your changes"

# Run locally to test
bundle exec jekyll serve
```

### Step 3: Push your branch to GitHub

```
git push origin your-name/feature-description
```

### Step 4: Create a Pull Request

1. Go to the repository on GitHub
2. Click on "Pull Requests" > "New Pull Request"
3. Select your branch as the "compare" branch
4. Add a description of your changes
6. Submit the pull request

### Step 5: Merge and deploy

Once your pull request has been approved:

1. Merge the pull request on GitHub
2. GitHub Pages will automatically rebuild the site from the main branch
3. This usually takes a minute or two
4. Visit [busasechapter.com](https://busasechapter.com) to see your changes live

**Important:** Remember that any changes pushed to the main branch will automatically be published to the live website. Always use branches and pull requests to ensure quality control.

## Troubleshooting Common Issues

### Jekyll Build Errors

If you see errors when running `bundle exec jekyll serve`:

1. Make sure all dependencies are installed: `bundle install`
2. Check for syntax errors in your HTML/Markdown files
3. Try updating your gems: `bundle update`

### CSS Changes Not Appearing

1. Make sure you're editing the correct CSS file (`assets/css/style.css`)
2. Try hard-refreshing your browser (Ctrl+F5 or Cmd+Shift+R)
3. Clear your browser cache

### Images Not Displaying

1. Verify file paths are correct (they should start with `/assets/images/`)
2. Check that image files exist in the specified location
3. Ensure file names match exactly (case-sensitive)

## Resources for Learning More

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Help](https://docs.github.com/en/pages)
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/)
- [HTML & CSS Tutorial](https://www.w3schools.com/html/)

## Need Help?

Contact Brianna Li on Discord.