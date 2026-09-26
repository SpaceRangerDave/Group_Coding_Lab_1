# Group_Coding_Lab_1

KNH Digital Infrastructure group assignment.

## Group Members

**David Parsley**
- Setting up and creating github repo
- Added README and created script files and invited everyone
- Reviewed every PR request and merged every single branch created by members
- Member 1 in hospital_admin.sh, wrote the function that creates the active_logs, archived_logs, and reports folders if they don't already exist

**Bill Ajengo**
- Member 2 in hospital_admin.sh, wrote the function that locks down active_logs so only the owner can read or write to it

**Neema Maina**
- Member 3 in hospital_admin.sh, wrote the execution logic that runs Member 1 and Member 2's functions in order and confirms the system is secured

**Edouard Maniragaba**
- Added the Python engine and .gitignore
- Member 4, wrote hospital_archive.sh which moves the logs out of active_logs into archived_logs with a timestamp, then recreates empty log files so the engine can keep recording
- Member 6 in hospital_analysis.sh, wrote the function that calculates and prints the average water usage for the ICU

**Frank Mugisha**
- Member 5 in hospital_analysis.sh, wrote the function that pulls out every critical heart rate and temperature reading and saves them into a report

## How to run it

Start the engine: python3 hospital_system.py start
Set up and secure the directories: ./hospital_admin.sh
Run the analysis: ./hospital_analysis.sh
Archive the logs: ./hospital_archive.sh
Stop the engine: python3 hospital_system.py stop
