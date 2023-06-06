student@student-OptiPlex-3020:~/mongodb-linux-x86_64-2.6.3/bin$ ./mongo 10.10.12.108/t31232db -u
t31232 -p
MongoDB shell version: 2.6.3
Enter password:
connecting to: 10.10.12.108/t31232db
> use 31232DB
switched to db 31232DB
> db.createCollection("Employee")
{ "ok" : 1 }
> show collections
Employee
system.indexes
> db.Employee.insert({"empID" :101 , "Company": "Apple","Designation": "Service Analyst"})
WriteResult({ "nInserted" : 1 })
> db.Employee.insert({"empID" :102 , "Company": "Google","Designation": "Driver System Analyst"})
WriteResult({ "nInserted" : 1 })
> db.Employee.insert({"empID" :103 , "Company": "Apple","Designation": "Software Engineer"})
WriteResult({ "nInserted" : 1 })
> db.Employee.insert({"empID" :104 , "Company": "Google","Designation": "SDE 2"})
WriteResult({ "nInserted" : 1 })
> db.Employee.insert({"empID" :105 , "Company": "Tesla","Designation": "UI Designer"})
WriteResult({ "nInserted" : 1 })
> db.Employee.find()
{ "_id" : ObjectId("63478b92eaf2f2a7aa7b00d6"), "empID" : 101, "Company" : "Apple", "Designation" :
"Service Analyst" }
{ "_id" : ObjectId("63478baeeaf2f2a7aa7b00d7"), "empID" : 102, "Company" : "Google", "Designation"
: "Driver System Analyst" }
{ "_id" : ObjectId("63478be5eaf2f2a7aa7b00d8"), "empID" : 103, "Company" : "Apple", "Designation" :
"Software Engineer" }
{ "_id" : ObjectId("63478c0feaf2f2a7aa7b00d9"), "empID" : 104, "Company" : "Google", "Designation" :
"SDE 2" }
{ "_id" : ObjectId("63478c28eaf2f2a7aa7b00da"), "empID" : 105, "Company" : "Tesla", "Designation" :
"UI Designer" }
> db.Employee.find({"empID":104})
{ "_id" : ObjectId("63478c0feaf2f2a7aa7b00d9"), "empID" : 104, "Company" : "Google", "Designation" :
"SDE 2" }
> db.Employee.update({"Designation": "SDE 2"}, {$set:{"Designation": "CEO"}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.Employee.find()
{ "_id" : ObjectId("63478b92eaf2f2a7aa7b00d6"), "empID" : 101, "Company" : "Apple", "Designation" :
"Service Analyst" }
{ "_id" : ObjectId("63478baeeaf2f2a7aa7b00d7"), "empID" : 102, "Company" : "Google", "Designation"
: "Driver System Analyst" }
{ "_id" : ObjectId("63478be5eaf2f2a7aa7b00d8"), "empID" : 103, "Company" : "Apple", "Designation" :
"Software Engineer" }
{ "_id" : ObjectId("63478c0feaf2f2a7aa7b00d9"), "empID" : 104, "Company" : "Google", "Designation" :
"CEO" }
{ "_id" : ObjectId("63478c28eaf2f2a7aa7b00da"), "empID" : 105, "Company" : "Tesla", "Designation" :
"UI Designer" }

> db.Employee.remove({"Company": "Tesla"})
WriteResult({ "nRemoved" : 1 })
> db.Employee.find()
{ "_id" : ObjectId("63478b92eaf2f2a7aa7b00d6"), "empID" : 101, "Company" : "Apple", "Designation" :
"Service Analyst" }
{ "_id" : ObjectId("63478baeeaf2f2a7aa7b00d7"), "empID" : 102, "Company" : "Google", "Designation"
: "Driver System Analyst" }
{ "_id" : ObjectId("63478be5eaf2f2a7aa7b00d8"), "empID" : 103, "Company" : "Apple", "Designation" :
"Software Engineer" }
{ "_id" : ObjectId("63478c0feaf2f2a7aa7b00d9"), "empID" : 104, "Company" : "Google", "Designation" :
"CEO" }
> db.Employee.find().pretty()
{
"_id" : ObjectId("63478b92eaf2f2a7aa7b00d6"),
"empID" : 101,
"Company" : "Apple",
"Designation" : "Service Analyst"
}
{
"_id" : ObjectId("63478baeeaf2f2a7aa7b00d7"),
"empID" : 102,
"Company" : "Google",
"Designation" : "Driver System Analyst"
}
{
"_id" : ObjectId("63478be5eaf2f2a7aa7b00d8"),
"empID" : 103,
"Company" : "Apple",
"Designation" : "Software Engineer"
}
{
"_id" : ObjectId("63478c0feaf2f2a7aa7b00d9"),
"empID" : 104,
"Company" : "Google",
"Designation" : "CEO"
}
> db.Employee.find({"Company":{$in : ["Google","ABC"]}})
{ "_id" : ObjectId("63478baeeaf2f2a7aa7b00d7"), "empID" : 102, "Company" : "Google", "Designation"
: "Driver System Analyst" }
{ "_id" : ObjectId("63478c0feaf2f2a7aa7b00d9"), "empID" : 104, "Company" : "Google", "Designation" :
"CEO" }
> db.Employee.find( { "Company": "Apple", "empID": { $lt: 104 } } )
{ "_id" : ObjectId("63478b92eaf2f2a7aa7b00d6"), "empID" : 101, "Company" : "Apple", "Designation" :
"Service Analyst" }
{ "_id" : ObjectId("63478be5eaf2f2a7aa7b00d8"), "empID" : 103, "Company" : "Apple", "Designation" :
"Software Engineer" }
