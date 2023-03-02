CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission 

if [[ -f ListExamples.java ]]
then
    echo "ListExamples found"
else
    echo "need file ListExamples.java"
    exit 1
fi 

cp ../TestListExamples.java ./ 
cp -rf ../lib .

javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo ""
else    
    echo "Failed Compilation, Grade : F"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples >java-tester.txt 2>&1

if [[ $? -eq 0 ]]
then
    echo "Passes all Test Cases, Grade : A"
elif [[ $? -eq 1 ]]  
then 
    echo "Failed to Pass All Cases, Grade : B"
else 
    echo "Failed All Test Cases, Grade : F"
    exit
fi