db.students.insertMany([
{ name: 'Ryan', age: 21,gender: 'M', marks : 78 },
{ name: 'Joanna', age: 20,gender: 'F', marks : 67 },
{ name: 'Harsh', age: 22,gender: 'M', marks : 80 },
{ name: 'Chinmay', age: 20,gender: 'M', marks : 97 },
{ name: 'John', age: 21,gender: 'M', marks : 88 },
{ name: 'Riya', age: 20,gender: 'F', marks : 77 },
{ name: 'Soham', age: 22,gender: 'M', marks : 83},
{name : 'Atharwa',age: 20, gender :'M',marks : 74},
{name : 'Priya',age : 21,gender : 'F',marks : 98}
]);
db.students.find().pretty();
{
"acknowledged" : true,
"insertedIds" : [
ObjectId("635a06f369917430cc58e282"),
ObjectId("635a06f369917430cc58e283"),
ObjectId("635a06f369917430cc58e284"),
ObjectId("635a06f369917430cc58e285"),
ObjectId("635a06f369917430cc58e286"),
ObjectId("635a06f369917430cc58e287"),
ObjectId("635a06f369917430cc58e288"),
ObjectId("635a06f369917430cc58e289"),
ObjectId("635a06f369917430cc58e28a")
]
}
{
"_id" : ObjectId("635a06f369917430cc58e282"),
"name" : "Ryan",
"age" : 21,
"gender" : "M",
"marks" : 78
}
{
"_id" : ObjectId("635a06f369917430cc58e283"),
"name" : "Joanna",
"age" : 20,
"gender" : "F",
"marks" : 67
}
{
"_id" : ObjectId("635a06f369917430cc58e284"),
"name" : "Harsh",
"age" : 22,
"gender" : "M",
"marks" : 80
}
{
"_id" : ObjectId("635a06f369917430cc58e285"),
"name" : "Chinmay",
"age" : 20,
"gender" : "M",
"marks" : 97
}
{
"_id" : ObjectId("635a06f369917430cc58e286"),
"name" : "John",
"age" : 21,
"gender" : "M",
"marks" : 88
}
{
"_id" : ObjectId("635a06f369917430cc58e287"),
"name" : "Riya",

"age" : 20,
"gender" : "F",
"marks" : 77
}
{
"_id" : ObjectId("635a06f369917430cc58e288"),
"name" : "Soham",
"age" : 22,
"gender" : "M",
"marks" : 83
}
{
"_id" : ObjectId("635a06f369917430cc58e289"),
"name" : "Atharwa",
"age" : 20,
"gender" : "M",
"marks" : 74
}
{
"_id" : ObjectId("635a06f369917430cc58e28a"),
"name" : "Priya",
"age" : 21,
"gender" : "F",
"marks" : 98
}
[Execution complete with exit code 0]

var mapfunction = function(){emit(this.age,this.marks)}
var reducefunction = function(key,values){return Array.sum(values)}
db.students.mapReduce(mapfunction,reducefunction,{'out':'Result1_mapreduce'})
db.Result1_mapreduce.find()
{ "result" : "Result1_mapreduce", "ok" : 1 }
{ "_id" : 21, "value" : 264 }
{ "_id" : 22, "value" : 163 }
{ "_id" : 20, "value" : 315 }
[Execution complete with exit code 0]
var mapfunction = function(){emit(this.age,this.marks)}
var reducefunction = function(key,values){return Array.avg(values)}
db.students.mapReduce(mapfunction,reducefunction,{query:{age:{$gt:21}},out:'Result2_mapreduce'})
db.Result2_mapreduce.find()
{ "result" : "Result2_mapreduce", "ok" : 1 }
{ "_id" : 22, "value" : 81.5 }
[Execution complete with exit code 0]
var mapfunction = function(){emit(this.gender,this.marks)}
var reducefunction = function(key,values){return Array.sum(values)}
db.students.mapReduce(mapfunction,reducefunction,{'out':'Result3_mapreduce'})
db.Result3_mapreduce.find()
{ "result" : "Result3_mapreduce", "ok" : 1 }
{ "_id" : "M", "value" : 500 }
{ "_id" : "F", "value" : 242 }
[Execution complete with exit code 0]

var mapfunction = function(){emit(this.gender,this.marks)}
var reducefunction = function(key,values){return Array.avg(values)}
db.students.mapReduce(mapfunction,reducefunction,{'out':'Result4_mapreduce'})
db.Result4_mapreduce.find()

{ "result" : "Result4_mapreduce", "ok" : 1 }
{ "_id" : "M", "value" : 83.33333333333333 }
{ "_id" : "F", "value" : 80.66666666666667 }
[Execution complete with exit code 0]
