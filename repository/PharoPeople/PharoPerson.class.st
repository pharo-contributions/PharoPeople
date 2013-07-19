"
PharoPerson describes an individual's online attributes.

Instance Variables
	email <String> john@foo.com
	name <String> John Doe
	website <String> http:://people.foo.com/john


"
Class {
	#name : #PharoPerson,
	#superclass : #Object,
	#instVars : [
		'name',
		'email',
		'website',
		'id'
	],
	#category : #PharoPeople
}

{ #category : #accessing }
PharoPerson >> email [
	^ email
]

{ #category : #accessing }
PharoPerson >> email: anObject [
	email := anObject
]

{ #category : #accessing }
PharoPerson >> id [
	^ id ifNil: [ id := (name select: [ :each | each isLetter ]) asLowercase ]
]

{ #category : #accessing }
PharoPerson >> id: anObject [
	id := anObject
]

{ #category : #accessing }
PharoPerson >> name [
	^ name
]

{ #category : #accessing }
PharoPerson >> name: anObject [
	name := anObject
]

{ #category : #printing }
PharoPerson >> printOn: stream [
	super printOn: stream.
	stream
		nextPut: $(;
		<< self id;
		nextPut: $)
]

{ #category : #converting }
PharoPerson >> stonString [
	^ STON toStringPretty: self
]

{ #category : #accessing }
PharoPerson >> website [
	^ website
]

{ #category : #accessing }
PharoPerson >> website: anObject [
	website := anObject
]
