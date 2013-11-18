#!/usr/bin/env node

process.stdin.resume();
var fs = require('fs');
var response = fs.readFileSync('/dev/stdin').toString();
process.stdin.pause();


var tag = response.split("\n").map(function(tag){
	// remove everything except digits and decimals
	tag = tag.replace(/[^0-9.]+/g, "");

	// then convert it into an array of numbers
	return tag.split(".").map(function(tag){ return tag | 0});
}).reduce(function(a, b){
	// make sure both inputs are valid
	if (!a || a.length !== 3) {
		return b;
	}

	if (!b || b.length !== 3) {
		return a;
	}

	// then compare each tag 1 by 1
	for (var i=0; i<3; i++) {
		if (isNaN( a[i] )) return b;
		if (isNaN( b[i] )) return a;
		if (a[i] > b[i]) return a;
		if (b[i] > a[i]) return b;
	}	
});

console.log(tag.join("."));


