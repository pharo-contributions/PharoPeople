"
PharoContributor is a PharoPerson that has contributed to the Pharo Project.

Instance Variables
	description <String> Loves object systems, enjoys hacking.
	image <String> http://me.com/picture.jpeg


"
Class {
	#name : #PharoContributor,
	#superclass : #PharoPerson,
	#instVars : [
		'description',
		'image'
	],
	#category : #PharoPeople
}

{ #category : #examples }
PharoContributor class >> demo [
	^ #(md sd ll tg) collect: [ :each | self perform: each ]
]

{ #category : #examples }
PharoContributor class >> ll [
	^ self new
		name: 'Laurent Laffont';
		email: 'laurent.laffont@gmail.com';
		website: 'http://magaloma.blogspot.com/';
		description: 'Use Pharo for testing web application, and teaching software development. Contribute to Pharocasts, ProfStef, Autotest.';
		image: 'http://b.vimeocdn.com/ps/765/765789_300.jpg';
		yourself
]

{ #category : #examples }
PharoContributor class >> md [
	^ self new
		name: 'Marcus Denker';
		email: 'marcus.denker@inria.fr';
		website: 'http://marcusdenker.de/';
		description: 'Permanent researcher at INRIA Lille in RMoD Team. Pharo board member.';
		image: 'http://marcusdenker.de/marcus.jpg';
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
		image: 'http://stephane.ducasse.free.fr/StefFingerOnNose128.jpg';
		yourself
]

{ #category : #examples }
PharoContributor class >> tg [
	^ self new
		name: 'Tudor "Doru" Girba';
		id: 'tudorgirba';
		email: 'tudor@tudorgirba.com';
		website: 'http://www.tudorgirba.com/';
		description: 'Consultant through netstyle.ch, concerned with communicating and modeling information in general. Leads the work on the Moose analysis platform since 2003.';
		image: 'http://www.tudorgirba.com/?_s=IMmLz0gQNuyJ-_x_';
		yourself
]

{ #category : #accessing }
PharoContributor >> defaultImage [
	^ 'http://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/500px-Smiley.svg.png'
]

{ #category : #accessing }
PharoContributor >> description [
	^ description
]

{ #category : #accessing }
PharoContributor >> description: anObject [
	description := anObject
]

{ #category : #accessing }
PharoContributor >> fields [
	^ super fields, #( description image )
]

{ #category : #accessing }
PharoContributor >> findImageEntity [
	image ifNotNil: [ ^ self imageEntity ].
	^ [ self gravatarEntity ]
		on: ZnHttpUnsuccessful 
		do: [ self imageEntity "this will use #defaultImage now" ]
]

{ #category : #accessing }
PharoContributor >> form [
	^ self formForImageEntity: self findImageEntity
]

{ #category : #private }
PharoContributor >> formForImageEntity: imageEntity [
	"Parse the actual bytes of imageEntity and return a Form."
	
	| imageType parserClassName parserClass parser |
	imageType := imageEntity contentType sub.
	parserClassName := imageType asUppercase, #ReadWriter.
	parserClass := Smalltalk globals at: parserClassName asSymbol.
	parser := parserClass on: imageEntity readStream.
	^ parser nextImage
]

{ #category : #accessing }
PharoContributor >> gravatarEntity [
	^ ZnClient new 
		enforceHttpSuccess: true;
		beOneShot; 
		url: 'http://www.gravatar.com/avatar';
		addPathSegment: (ZnDigestAuthenticator md5Hash: self email);
		queryAt: #s put: '128';
		queryAt: #d put: '404';
		get;
		entity
]

{ #category : #accessing }
PharoContributor >> image [
	^ image ifNil: [ self defaultImage ]
]

{ #category : #accessing }
PharoContributor >> image: anObject [
	image := anObject
]

{ #category : #accessing }
PharoContributor >> imageEntity [
	^ ZnClient new 
		enforceHttpSuccess: true;
		beOneShot; 
		get: self image;
		entity
]

{ #category : #accessing }
PharoContributor >> processedForm [
	^ self form scaledIntoFormOfSize: 128
]

{ #category : #accessing }
PharoContributor >> processedImageUrl [
	^ 'pharo-contributor-{1}.png' format: { self id }
]

{ #category : #accessing }
PharoContributor >> processedPngEntity [
	^ ZnEntity
		with: (ByteArray streamContents: [ :out |
			(PNGReadWriter on: out) nextPutImage: self processedForm ])
		type: ZnMimeType imagePng
]
