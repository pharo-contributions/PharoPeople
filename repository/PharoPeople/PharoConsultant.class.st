"
PharoConsultant is a PharoPerson that offers consultancy services related to Pharo technology.

Instance Variables
	areasOfExpertise <String> web apps, GUI & compiler
	industryExperienceSince <Integer> 2000
	languages <String> French (native), English
	location <String> Paris, France
	pharoExperienceSince <Integer> 2011
	smalltalkExperienceSInce <Integer> 2005


"
Class {
	#name : #PharoConsultant,
	#superclass : #PharoPerson,
	#instVars : [
		'location',
		'languages',
		'industryExperienceSince',
		'pharoExperienceSince',
		'areasOfExpertise',
		'smalltalkExperienceSince'
	],
	#category : #PharoPeople
}

{ #category : #examples }
PharoConsultant class >> demo [
	^ #(svc nh jvds sd mp) collect: [ :each | self perform: each ]
]

{ #category : #examples }
PharoConsultant class >> jvds [
	^ self new
		name: 'Jan van de Sandt';
		location: 'Utrecht, The Netherlands';
		email: 'jan@mcast.fm';
		website: 'http://doit.st';
		languages: 'Dutch (native), English';
		industryExperienceSince: 1994;
		smalltalkExperienceSince: 1993;
		pharoExperienceSince: 2009;
		areasOfExpertise: 'Business applications, enterprise integration and web applications';
		yourself
]

{ #category : #examples }
PharoConsultant class >> mp [
	^ self new
		name: 'Mariano Martinez Peck';
		location: 'Buenos Aires, Argentina';
		email: 'marianopeck@gmail.com';
		website: 'http://marianopeck.wordpress.com/';
		languages: 'Spanish (native), English (fluent, Cambridge FCE), French (basic)';
		industryExperienceSince: 2006;
		smalltalkExperienceSince: 2008;
		pharoExperienceSince: 2009;
		areasOfExpertise: 'Libraries and frameworks, web applications and backends, databases and serialization, protocols, virtual machine, system administration';
		yourself
]

{ #category : #examples }
PharoConsultant class >> nh [
	^ self new
		name: 'Norbert Hartl';
		location: 'Cologne, Germany';
		email: 'norbert@2denker.de';
		website: 'http://2denker.de';
		languages: 'German (native), English';
		industryExperienceSince: 1994;
		smalltalkExperienceSince: 2002;
		pharoExperienceSince: 2008;
		areasOfExpertise: 'Web applications and backends, mobile applications, protocols, embedded software, distributed systems, broadcasting, telecommunications';
		yourself
]

{ #category : #examples }
PharoConsultant class >> sd [
	^ self new
		name: 'Sean DeNigris';
		location: 'New York, USA';
		email: 'sean@clipperadams.com';
		website: 'http://seandenigris.com';
		languages: 'English (native)';
		industryExperienceSince: 1996;
		smalltalkExperienceSince: 2010;
		pharoExperienceSince: 2010;
		areasOfExpertise: 'Small business applications; web applications & servers; DDD & customer communication; TDD/BDD';
		yourself
]

{ #category : #examples }
PharoConsultant class >> svc [
	^ self new
		name: 'Sven Van Caekenberghe';
		location: 'Hasselt, Belgium';
		email: 'sven@stfx.eu';
		website: 'http://stfx.eu';
		languages: 'Dutch (native), English, French, German';
		industryExperienceSince: 1990;
		smalltalkExperienceSince: 1993;
		pharoExperienceSince: 2010;
		areasOfExpertise: 'Web Services & Applications, Servers, Networking, Protocols';
		yourself
]

{ #category : #accessing }
PharoConsultant >> areasOfExpertise [
	^ areasOfExpertise
]

{ #category : #accessing }
PharoConsultant >> areasOfExpertise: anObject [
	areasOfExpertise := anObject
]

{ #category : #accessing }
PharoConsultant >> fields [
	^ super fields, #( location industryExperienceSince smalltalkExperienceSince pharoExperienceSince areasOfExpertise languages )
]

{ #category : #accessing }
PharoConsultant >> industryExperienceSince [
	^ industryExperienceSince
]

{ #category : #accessing }
PharoConsultant >> industryExperienceSince: anObject [
	industryExperienceSince := anObject
]

{ #category : #accessing }
PharoConsultant >> languages [
	^ languages
]

{ #category : #accessing }
PharoConsultant >> languages: anObject [
	languages := anObject
]

{ #category : #accessing }
PharoConsultant >> location [
	^ location
]

{ #category : #accessing }
PharoConsultant >> location: anObject [
	location := anObject
]

{ #category : #accessing }
PharoConsultant >> pharoExperienceSince [
	^ pharoExperienceSince
]

{ #category : #accessing }
PharoConsultant >> pharoExperienceSince: anObject [
	pharoExperienceSince := anObject
]

{ #category : #accessing }
PharoConsultant >> smalltalkExperienceSince [
	^ smalltalkExperienceSince
]

{ #category : #accessing }
PharoConsultant >> smalltalkExperienceSince: anObject [
	smalltalkExperienceSince := anObject
]
