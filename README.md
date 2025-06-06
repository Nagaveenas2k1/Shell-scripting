# GitHub Collaborator Access Checker
A simple and efficient Bash script that uses the GitHub API to list all collaborators who have read (pull) access to a specific GitHub repository.

This script is useful for:
* Auditing repository collaborators
* Automating DevOps workflows
* Ensuring repository security and transparency

## Features
* Lists users with read (pull) access
* Uses GitHub Personal Access Token for secure authentication
* Works with curl and jq
* Supports Linux, macOS, and Git Bash on Windows

## Requirements
Before using the script, make sure the following tools are installed:

| Tool  |          Description           |     Install Command (Ubuntu)  |
|-------|--------------------------------|-------------------------------|
| bash  |      Shell interpreter         | Pre-installed on most systems |
| curl  |    HTTP client for API calls   |        sudo apt install curl  |
| jq    |        JSON processor          |         sudo apt install jq   |

If you're on Windows, install and run this in *Git Bash*.

## GitHub Authentication
To access private repositories, use a “GitHub Personal Access Token (PAT)” with at least the repo scope.

Set Your Credentials as Environment Variables:
* export GITHUB_USERNAME="your_github_username"
* export GITHUB_TOKEN="your_github_token"

## Configuration
Open list-users.sh and update these lines:

* REPO_OWNER="your_repo_owner"
* REPO_NAME="your_repo_name"

Replace with the actual repository owner’s username and the repository name.

## How to run the script
1. Make the script executable
**"chmod +x list_users.sh"**  
2. Run the script
**"./list_users.sh"**

## Sample Output
**If users have read access**  
* Listing users with read access to your_repo_owner/your_repo_name...
Users with read access to your_repo_owner/your_repo_name:  
username1  
username2  
username3

**If no users have read access:**  
* No users with read access found for your_repo_owner/your_repo_name.

## How it works
* The script uses the GitHub REST API to fetch collaborators:
  **GET https://api.github.com/repos/{owner}/{repo}/collaborators**
* It filters users who have **"permission pull": true** (i.e., read access)
* The response is parsed using jq

## Author
**S. Nagaveena**


















