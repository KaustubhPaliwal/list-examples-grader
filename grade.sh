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
    echo "successful compile"
else    
    echo "failed to compile"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
