"
PharoTopic describes a master or bachelor topic.
"
Class {
	#name : #PharoTopic,
	#superclass : #PharoPeopleObject,
	#instVars : [
		'context',
		'date',
		'goal',
		'keywords',
		'supervisors',
		'title',
		'level',
		'candidate'
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
PharoTopic >> candidate [
	
	^ candidate ifNil: [ candidate := 'Topic still free' ].
]

{ #category : #accessing }
PharoTopic >> candidate: anObject [
	
	candidate := anObject
]

{ #category : #accessing }
PharoTopic >> contact [
	
	^ email
]

{ #category : #accessing }
PharoTopic >> contact: anObject [
	
	email := anObject
]

{ #category : #accessing }
PharoTopic >> context [
	
	^ context
]

{ #category : #accessing }
PharoTopic >> context: anObject [
	
	context := anObject
]

{ #category : #accessing }
PharoTopic >> date [
	
	^ date
]

{ #category : #accessing }
PharoTopic >> date: anObject [
	
	date := anObject
]

{ #category : #accessing }
PharoTopic >> goal [
	
	^ goal
]

{ #category : #accessing }
PharoTopic >> goal: anObject [
	
	goal := anObject
]

{ #category : #accessing }
PharoTopic >> id [
	^ id ifNil: [ id := (title select: [ :each | each isLetter ]) asLowercase ]
]

{ #category : #accessing }
PharoTopic >> keywords [
	
	^ keywords
]

{ #category : #accessing }
PharoTopic >> keywords: anObject [
	
	keywords := anObject
]

{ #category : #accessing }
PharoTopic >> level [

	^ level ifNil: [ 'Currently undefined, we are working on it.' ]
]

{ #category : #accessing }
PharoTopic >> level: aString [
	
	level := aString
]

{ #category : #printing }
PharoTopic >> printOn: aStream [

	aStream << self class name; << ' new '; cr.
	aStream tab << 'title: '.
	aStream tab << title printString ; << ';' ; cr.
	aStream tab << 'keywords: '.
	aStream tab << keywords printString << ';' ; cr.
	aStream tab << 'contact: '.
	aStream tab << email printString << ';' ; cr.
	aStream tab << 'supervisors: '.
	aStream tab << supervisors printString << ';' ; cr.
	aStream tab << 'context: '.
	aStream tab << context printString << ';' ; cr.
	aStream tab << 'goal: '.
	aStream tab << goal printString << ';' ; cr.
	aStream tab << 'level: '.
	aStream tab << self level printString << ';' ; cr.
	aStream tab << 'candidate: '.
	aStream tab << self candidate printString << ';' ; cr.
	aStream tab << 'yourself'
	
]

{ #category : #accessing }
PharoTopic >> supervisors [
	
	^ supervisors
]

{ #category : #accessing }
PharoTopic >> supervisors: anObject [
	
	supervisors := anObject
]

{ #category : #accessing }
PharoTopic >> title [
	
	^ title
]

{ #category : #accessing }
PharoTopic >> title: anObject [
	
	title := anObject
]
