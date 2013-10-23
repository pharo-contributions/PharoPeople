"
A PharoPeopleObject is the root of the PharoPeople objects that we can manipulate in the collected lists.
"
Class {
	#name : #PharoPeopleObject,
	#superclass : #Object,
	#instVars : [
		'id',
		'email'
	],
	#category : #PharoPeople
}

{ #category : #default }
PharoPeopleObject >> defaultEmail [
	^ 'pharo-dev@lists.pharo.org'
]

{ #category : #accessing }
PharoPeopleObject >> email [
	^ email ifNil: [ self defaultEmail ]
]

{ #category : #accessing }
PharoPeopleObject >> email: anObject [
	email := anObject
]

{ #category : #accessing }
PharoPeopleObject >> id [
	^ id ifNil: [ id := (name select: [ :each | each isLetter ]) asLowercase ]
]

{ #category : #accessing }
PharoPeopleObject >> id: anObject [
	id := anObject
]
