Class {
	#name : #BaselineOfPharoPeople,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoPeople
}

{ #category : #baselines }
BaselineOfPharoPeople >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'PharoPeople' ]
]
