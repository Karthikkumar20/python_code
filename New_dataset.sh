#!/bin/sh/
#Move to the READ directory
cd /home/mreddy/Arjun/runmass/projects/READ/auto/

#copy the Updated README file from /import/customer_data/support/ to current working directory
cp /import/customer_data/support/README .

#remove the Customer Details from README file using Regular Expression and store the all the datasets in README_org
awk '{$1=$2=$3=$4=$5=$6=$7=""}1' README | sed s/^\ *// | sed s%^\.%/import/customer_data/support% > README-org

#Remove README file from current working directory
rm -rf README

#To remove the top 13 lines which are non-dataset lines
sed -i '1,13d' README-org

#Execute the python script it will compare README_org and README_sup files.
#And the script provide two result files and one log_file
#1.matchingdatasets.txt(This file have list of matched datasets in both file
#2.New_dataset.txt(This file have list of New datasets which are updated on README_org
#3.New_DB.log(This log have the Output of the script and send as body of the mail)
nohup python find_new_dataset.py README-org README-sup > New_DB.log &   

#sleep for 5 seconds
sleep 5

#Send mail with 2 result files(Attachments)and one log file(Body of the mail) from find_new_dataset.py script
cat New_DB.log | sudo -u mreddy /bin/mail -a New_dataset.txt -a matchingdatasets.txt -s Runmass_New_Customer_datasets kperiyaswamy@infoblox.com,amanvi@infoblox.com,mreddy@infoblox.com,aramamoorthy@infoblox.com
rm -rf file1.txt file2.txt README-org
