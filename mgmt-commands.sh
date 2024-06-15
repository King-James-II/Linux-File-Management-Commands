#!/bin/bash

# Exercise 1 - Viewing and Modifying File Access Permissions

# 1.1 View file access permissions

# Step 1: Change to the specified directory
cd /home/project

# Step 2: Download the required file
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-LX0117EN-SkillsNetwork/labs/module%201/usdoi.txt

# Step 3: View file access permissions
echo "Current file permissions for usdoi.txt:"
ls -l usdoi.txt


# 1.2 Change file access permissions

# Step 4: Revoke read permissions for all users
chmod -r usdoi.txt
echo "Permissions after revoking read access for all users:"
ls -l usdoi.txt

# Step 5: Grant read permissions for all users
chmod +r usdoi.txt
echo "Permissions after granting read access for all users:"
ls -l usdoi.txt

# Step 6: Remove read permission for 'other' category
chmod o-r usdoi.txt
echo "Permissions after removing read access for 'other' category:"
ls -l usdoi.txt


# Exercise 2 - Understanding Directory Access Permissions

# 2.1 View default directory access permissions

# Step 1: Move to the project directory and create a new directory called test
cd /home/project
mkdir test

# Step 2: Check the default permissions set for the new test directory
echo "Default permissions for the test directory:"
ls -l

# Step 3: Change to the test directory, create a new directory within it, then return to the parent directory
cd test
mkdir test2
cd ../


# 2.2 Remove user execute permissions on the test directory

# Step 4: Remove user execute permissions on test
chmod u-x test
echo "Permissions after removing execute permissions for the user on the test directory:"
ls -l

# Step 5: Try to change directories to test (expected to fail)
echo "Attempting to change directory to test (expected to fail):"
cd test || echo "Permission denied"

# Step 6: Try to list the contents of the test directory
echo "Listing contents of the test directory:"
ls -l test

# Step 7: Try to create a new directory within test (expected to fail)
echo "Attempting to create a new directory within test (expected to fail):"
mkdir test/test3 || echo "Permission denied"

# Step 8: Restore execute permissions and remove write permissions on test
chmod u+x test
chmod u-w test
echo "Permissions after restoring execute and removing write permissions for the user on the test directory:"
ls -l

# Step 9: Change to the test directory and try to create a new directory within it (expected to fail)
cd test
echo "Attempting to create a new directory within test (expected to fail):"
mkdir test_again || echo "Permission denied"
cd ../