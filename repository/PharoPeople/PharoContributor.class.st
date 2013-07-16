"
PharoContributor is a PharoPerson that has contributed to the Pharo Project.

Instance Variables
	description <String> Loves object systems, enjoys hacking.


"
Class {
	#name : #PharoContributor,
	#superclass : #PharoPerson,
	#instVars : [
		'description'
	],
	#category : #PharoPeople
}

{ #category : #examples }
PharoContributor class >> demo [
	^ #(md sd) collect: [ :each | self perform: each ]
]

{ #category : #examples }
PharoContributor class >> md [
	^ self new
		name: 'Marcus Denker';
		email: 'marcus.denker@inria.fr';
		website: 'http://marcusdenker.de/';
		description: 'Permanent researcher at INRIA Lille in RMoD Team. Pharo board member';
		yourself
]

{ #category : #examples }
PharoContributor class >> sd [
	^ self new
		name: 'Stéphane Ducasse';
		id: 'stephaneducasse';
		email: 'stephane.ducasse@inria.fr';
		website: 'http://stephane.ducasse.free.fr/';
		description: 'Research director at INRIA Lille leading the RMoD Team. Pharo board member and president of ESUG.';
		yourself
]

{ #category : #accessing }
PharoContributor >> description [
	^ description
]

{ #category : #accessing }
PharoContributor >> description: anObject [
	description := anObject
]
