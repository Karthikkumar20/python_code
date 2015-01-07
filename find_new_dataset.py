import os.path
import sys
import os
PATH='./*.txt'
print ('Hi All,')
print ('\n')
print ('The New Customer datasets in /import/customer_data/support/ for runmass test upgrade')
print ('Check the Database version for new datasets.If database version is less than 6.6.9 do the conversion(dbcvt or GUI)')
print ('Add the new datasets /home/mreddy/Arjun/runmass/projects/Buckets/support/New_buckets/ and /home/mreddy/Arjun/runmass/projects/READ/auto/README_sup')
print ('Both attached files located in /home/mreddy/Arjun/runmass/projects/READ/auto ')
if len(sys.argv) ==3:
	sourcename=str(sys.argv[1]);
	matchfile=str(sys.argv[2]);
	
else:
	sourcename=raw_input('Enter the source filename ........: ');
	matchfile=raw_input('Enter the filename to be matched..: ');

try:
	cof=open(sourcename,"r");
	
except IOError:
	print "Source file ",sourcename," is not available";
	print "The program has going been stopped";
	sys.exit();
	
try:
	cos=open(matchfile,"r");
	
except IOError:
	print "Match file ",matchfile," is not available";
	print "The program has going been stopped";
        sys.exit();

cof.close;
cos.close;

if sourcename == matchfile:
	print "Both files cannot be same!";
	sys.exit();
#sourcename="README_org";
#matchfile="README_sup";
#opening input files in read mode
with open(sourcename,'r') as source:
    count=0
    with open('file1.txt','w') as result1:
        for line in source:
            count+=1
            str='/import/customer_data/support/'
            c=line.find(str)
            if(c==0):
               result1.write(line)
        print('\ndatasets in README_org file ')
        print(count)
with open(matchfile,'r') as source1:
    count=0
    with open('file2.txt','w') as result2:
        for line in source1:
            count+=1
            str='/import/customer_data/support/'
            c=line.find(str)
            if(c==0):
                    result2.write(line)
        print('datasets in README_sup file ')
        print(count)
with open('file1.txt','r') as org:
  with open('file2.txt','r') as sup:
        same=set(org).intersection(sup)
same.discard('\n')
with open('matchingdatasets.txt','w') as result1:
    count=0
    for line in same:
        count+=1
        result1.write(line)
    print('Matching datasets in README_org and README_sup')
    print(count)
with open('file1.txt','r') as org1:
  with open('file2.txt','r') as sup1:
        diff=set(org1).difference(sup1)
diff.discard('\n')
with open('New_dataset.txt','w') as result2:
    count=0
    for line in diff:
        count+=1
        result2.writelines(line)
    print('New datasets ')
    print(count)
print ('\n')
print ('Thanks,')
print ('\n')
print ('KARTHIK KUMAR P')
