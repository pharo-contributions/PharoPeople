"
!!!Current loading expressions and dev history

25/10/2013 - First configuration.
[[[
(ConfigurationOfPharoPeople project version: #'stable') load
(ConfigurationOfPharoPeople project version: '1.0') load
]]]
"
Class {
	#name : #ConfigurationOfPharoPeople,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfPharoPeople
}

{ #category : #private }
ConfigurationOfPharoPeople class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #catalog }
ConfigurationOfPharoPeople class >> catalogChangeLog [
		
 ^ '
-1/10/2013 - Migrated to XMLParser.
[[[
(ConfigurationOfSoup project version: #''stable'') load
(ConfigurationOfSoup project version: ''1.5'') load
]]]

- Version 1. 4 21/02/2013 migrated to SmalltalkHub
[[[
(ConfigurationOfSoup project version: ''1.4'') load
]]]
- Version 1.3  adding better stable version.
[[[
(ConfigurationOfSoup project version: ''1.3'') load
]]]
'
	
	
]

{ #category : #catalog }
ConfigurationOfPharoPeople class >> catalogDescription [

^ 
'Soup is a frameworks for scrapping HTML. It offers a simplified query mechanism to abstract over the XML and HTML structures of a document.'
]

{ #category : #catalog }
ConfigurationOfPharoPeople class >> catalogKeyClassesAndExample [

	^ 'It is composed of some keys classes: 
		
- ==SoupElement== is the root of elements that are extracted during the parsing of an HTML document. Contrary to traditional HTML Parser, Soup produces a limited set of elements which approximate the HTML elements but supports querying and extracting information. 
		
- Soup. ==Soup== is the main public class of the package. It is the class to interact with as shown by the tests.

The best way to get started is to get a soup of html elements using ==Soup class>>fromString:== as follows:

[[[ 
	Soup fromString: ''http://www.bedetheque.com/album-105582-BD-Atomium-Express.html'' 
	    asUrl retrieveContents
]]]
	
Tests of the ==Soup== class are the place to start to learn the API.'
]

{ #category : #catalog }
ConfigurationOfPharoPeople class >> catalogKeywords [
	^ #(HTML web query scrapping Soup XPath)
	
]

{ #category : #private }
ConfigurationOfPharoPeople class >> ensureMetacello [
	"Bootstrap Gofer (if necessary), bootstrap ConfigurationOfMetacello (using old Gofer API), then load the latest 
	version of Metacello itself."

	Smalltalk at: #MetacelloProject ifAbsent: [
		Smalltalk at: #Gofer ifAbsent: [
			"Current version of Gofer from which to bootstrap - as of 1.0-beta.21"
			self bootstrapPackage: 'Gofer-Core-lr.115' from: 'http://seaside.gemstone.com/ss/metacello' ].
		Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
			gofer := goferClass new
				url: 'http://seaside.gemstone.com/ss/metacello';
				yourself.
			[ gofer addPackage: 'ConfigurationOfMetacello' ] on: Warning do: [:ex | ex resume ].
			gofer load ].
		"load 'default' group of Metacello"
		(Smalltalk at: #ConfigurationOfMetacello) perform: #load ]
]

{ #category : #'metacello support' }
ConfigurationOfPharoPeople class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello support' }
ConfigurationOfPharoPeople class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #load }
ConfigurationOfPharoPeople class >> load [
	"self load"

	^self project latestVersion load
]

{ #category : #load }
ConfigurationOfPharoPeople class >> loadDefault [
	"self loadDefault"

	"^ self loadMostRecentCoreWithTests"
	^ self load.
]

{ #category : #load }
ConfigurationOfPharoPeople class >> loadMostRecentCoreWithTests [
	^self project lastVersion load: #('Core' 'Tests')
]

{ #category : #'metacello support' }
ConfigurationOfPharoPeople class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfPharoPeople class >> project [

	^self new project
]

{ #category : #'metacello support' }
ConfigurationOfPharoPeople class >> unloadMetacello [

	Smalltalk at: #ConfigurationOfMetacello ifPresent: [:cls | cls unloadMetacello ]
]

{ #category : #baselines }
ConfigurationOfPharoPeople >> baseline10: spec [
	<version: '1.0-baseline'>
	spec
		for: #pharo
		do: [ 
			spec blessing: #baseline.
			spec description: 'First Full Configuration'.
			spec author: 'StephaneDucasse'.
			spec timestamp: '29/10/2013'.
			spec repository: 'http://www.smalltalkhub.com/mc/Pharo/PharoPeople/main'.
			spec
				package: 'PharoPeople' with: [ spec requires: 'STON' ].
			spec
				project: 'STON'
				with: [ 
					spec
						className: 'ConfigurationOfSTON';
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/SvenVanCaekenberghe/STON/main' ] ]
]

{ #category : #accessing }
ConfigurationOfPharoPeople >> customProjectAttributes [
	^ #()
]

{ #category : #'symbolic versions' }
ConfigurationOfPharoPeople >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.2'.
	spec for: #'pharo1.3.x' version: '1.1'.
	spec for: #'pharo1.4.x' version: '1.3'.
	spec for: #'pharo2.x' version: '1.5'.
	spec for: #'pharo3.x' version: '1.5'.
]

{ #category : #accessing }
ConfigurationOfPharoPeople >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfPharoPeople >> stable: spec [
	<symbolicVersion: #stable>
	spec for: #'pharo3.x' version: '1.0'.
]

{ #category : #versions }
ConfigurationOfPharoPeople >> version10: spec [ 
	<version: '1.0'> 
	
	spec 
		package: 'PharoPeople' 
		with: 'PharoPeople-StephaneDucasse.13'
	
]
