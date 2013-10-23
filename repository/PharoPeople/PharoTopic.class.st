"
PharoTopic describes a master or bachelor topic.
"
Class {
	#name : #PharoTopic,
	#superclass : #Object,
	#instVars : [
		'contact',
		'context',
		'date',
		'goal',
		'keywords',
		'supervisors',
		'title'
	],
	#category : #PharoPeople
}

{ #category : #'instance creation' }
PharoTopic class >> contact: contact context: context date: date goal: goal keywords: keywords supervisors: supervisors title: title [

	^ self new
		contact: contact;
		context: context;
		date: date;
		goal: goal;
		keywords: keywords;
		supervisors: supervisors;
		title: title;
		yourself
]

{ #category : #'instance creation' }
PharoTopic class >> sample [
	"self sample"
	^ PharoTopic new
		title: 'Better Message Browser';
		contact: 'stephane.ducasse@inria.fr';
		supervisors: 'S. Ducasse / B. van Ryseghem';
		keywords: 'tools ui spec';
		context: 'The browser showing results of senders and implementors won''t help you navigate in the call chain. Often we want to perform a sender on a message and would like to see if there are senders of the senders. This is typically interesting when doing cleaning.';
		goal: 'The goal of the project is to define a tool to support message browsing.';
		yourself
	
]

{ #category : #accessing }
PharoTopic >> contact: anObject [
	
	contact := anObject
]

{ #category : #accessing }
PharoTopic >> context: anObject [
	
	context := anObject
]

{ #category : #accessing }
PharoTopic >> date: anObject [
	
	date := anObject
]

{ #category : #accessing }
PharoTopic >> goal: anObject [
	
	goal := anObject
]

{ #category : #accessing }
PharoTopic >> keywords: anObject [
	
	keywords := anObject
]

{ #category : #printing }
PharoTopic >> printOn: aStream [

	aStream << self class name; << ' new '; cr.
	aStream tab << 'title: '.
	aStream tab << title printString ; << ';' ; cr.
	aStream tab << 'keywords: '.
	aStream tab << keywords printString << ';' ; cr.
	aStream tab << 'contact: '.
	aStream tab << contact printString << ';' ; cr.
	aStream tab << 'supervisors: '.
	aStream tab << supervisors printString << ';' ; cr.
	aStream tab << 'context: '.
	aStream tab << context printString << ';' ; cr.
	aStream tab << 'goal: '.
	aStream tab << goal printString << ';' ; cr.
	aStream tab << 'yourself'
	
]

{ #category : #accessing }
PharoTopic >> supervisors: anObject [
	
	supervisors := anObject
]

{ #category : #accessing }
PharoTopic >> title: anObject [
	
	title := anObject
]
