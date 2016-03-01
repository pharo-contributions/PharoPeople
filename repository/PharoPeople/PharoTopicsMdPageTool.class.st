"
A PharoTopicsMdPageTool generates a markdown for master and bachelor topics.

PharoTopicsMdPageTool
	new 
	dataFromUrl: 'https://raw.github.com/pharo-project/pharo-project-proposals/master/Topics.st';
	generatePageFile.

For debugging 
	
PharoTopicsMdPageTool new
	dataFromFile: '/home/peter/prog/gsoc/pharo-project-proposals/Topics.st' asFileReference;
	generatePageFile: '/home/peter/prog/gsoc/pharo-project-proposals/Topics.md'
"
Class {
	#name : #PharoTopicsMdPageTool,
	#superclass : #PharoPeoplePageTool,
	#category : #PharoPeople
}

{ #category : #accessing }
PharoTopicsMdPageTool >> dataFromStream: aStream [
	| ast |
	ast := RBParser parseExpression: aStream contents.
	data := ast statements collect: [ :each | OpalCompiler evaluate: each formattedCode ]
]

{ #category : #default }
PharoTopicsMdPageTool >> defaultFile [
	^ 'pharo-topics'
]

{ #category : #default }
PharoTopicsMdPageTool >> defaultHtmlFile [
	^ self defaultFile, '.md'
]

{ #category : #'html generation' }
PharoTopicsMdPageTool >> generateBody [
	stream << self title << String crlfcrlf.
	stream << self preamble.
	self generateToc.
	data
		do:
			[ :each | 
			self generateEntryFor: each.
			stream << String crlf << '***' << String crlfcrlf ].
	stream << self postamble
]

{ #category : #'html generation' }
PharoTopicsMdPageTool >> generateEntryElementsFor: topic [
	stream << '##Title: ' << topic title << String crlf.
	#(#contact #supervisors #keywords)
		do:
			[ :each | stream << '###' << each capitalized << ': ' << (each value: topic) << String crlf ].
	stream << '###' << 'Context' << String crlf << topic context << String crlf.
	stream << '###' << 'Goal' << String crlf << topic goal << String crlf.
	stream << '###' << 'Level: ' << topic level << String crlf
]

{ #category : #'html generation' }
PharoTopicsMdPageTool >> generateEntryFor: topic [
	self generateEntryElementsFor: topic
]

{ #category : #'html generation' }
PharoTopicsMdPageTool >> generatePage [
	self generateBody
]

{ #category : #'html generation' }
PharoTopicsMdPageTool >> generateToc [
	data
		do:
			[ :each | 
			stream << '* ' << '[' << each title << ']'.
			stream << '(#title-' << (self anchorForTitle: each title) << ')'.
			stream << String crlf ].
	stream << String crlf
]

{ #category : #constants }
PharoTopicsMdPageTool >> preamble [
	^ ''
]

{ #category : #constants }
PharoTopicsMdPageTool >> title [
	^ '#Pharo GSOC Topics'
]
