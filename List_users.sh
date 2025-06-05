#!/bin/bash

#######################################################

#About: 
# list-users.sh is a shell script that connects to the GitHub API using basic authentication (username and personal access token)
# Fetches a list of users who have read (pull) access to a specified GitHub repository. 
# This is useful for repository admins or DevOps engineers to audit and track repository access rights via the command line.

#Features: 
# - Uses curl to make authenticated API requests to GitHub
# - Lists collaborators with read access to a specific repository
# - Parses API JSON response using jq

#Input:
# USERNAME
# TOKEN
# REPO_OWNER
# REPO_NAME

#Owner : S Nagaveena

#######################################################

helper()

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

function helper{
    expected_cmd_agrs = 2
    id [$#-ne $expected_cmd_agrs]; then 
    echo "please execute the script with required cmd args"
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
