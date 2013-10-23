"
PharoPerson describes an individual's online attributes.

Instance Variables
	email <String> john@foo.com
	name <String> John Doe
	website <String> http:://people.foo.com/john
	id <String> johndoe


"
Class {
	#name : #PharoPerson,
	#superclass : #PharoPeopleObject,
	#instVars : [
		'name',
		'website'
	],
	#category : #PharoPeople
}

{ #category : #converting }
PharoPerson >> asSmalltalkExpression [
	^ String streamContents: [ :out |
		out << self class name; space; << 'new'; cr.
		self fields do: [ :each |
			(self instVarNamed: each)
				ifNotNil: [ :value |
					out tab; << each asMutator; space; print: value; nextPut: $; ; cr ] ].
		out tab; << 'yourself'; cr ]
]

{ #category : #accessing }
PharoPerson >> defaultWebsite [
	^ ZnUrl new
		scheme: #http;
		host: 'www.google.com';
		addPathSegment: 'search';
		queryAt: 'q' put: self name;
		yourself
]

{ #category : #accessing }
PharoPerson >> fields [
	^ #( name id email website )
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
	^ website ifNil: [ self defaultWebsite ]
]

{ #category : #accessing }
PharoPerson >> website: anObject [
	website := anObject
]
