"
PharoPeoplePageTool generates HTML based on data.
"
Class {
	#name : #PharoPeoplePageTool,
	#superclass : #Object,
	#instVars : [
		'stream',
		'data'
	],
	#category : #PharoPeople
}

{ #category : #accessing }
PharoPeoplePageTool >> add: person [
	data := data copyWith: person
]

{ #category : #constants }
PharoPeoplePageTool >> css [
	^ '
body{
  color:#74706f;
  font-size:18px;
  background:#f7f7f7;
  background-repeat:repeat-x;
  background-position:top center;
  background-image:url(http://www.pharo-project.org/images/body.png);
  font-family:"Myriad Pro","Lucida Grande","Helvetica Neue",Arial,Helvetica,Geneva,sans-serif;
}
p { 
  line-height:1.4em;
  padding: 1em;
}
h1 {
  font-size:5em;
  color:#0d64af;
  color:rgba(13,100,175,0.9);
  padding:18px;
}
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
table {
  border-collapse:collapse;
  border-spacing:0;
  font-size:100%;
  font:inherit;
  width:100%;
}
table td {
  border:1px solid #ccc;
  padding:6px 13px;
}
table tr {
  border-top:1px solid #ccc;
  background-color:#fff;
}
span.cn { 
  font-weight:bold;
  color:black;
}
p.footer { 
  font-size:0.75em;
  text-align:center;
  font-style:italic;
}
'
]

{ #category : #accessing }
PharoPeoplePageTool >> data [
	^ data
]

{ #category : #accessing }
PharoPeoplePageTool >> data: anObject [
	data := anObject
]

{ #category : #accessing }
PharoPeoplePageTool >> defaultDataFile [
	^ self defaultFile, '.ston'
]

{ #category : #accessing }
PharoPeoplePageTool >> defaultFile [
	^ self subclassResponsibility
]

{ #category : #accessing }
PharoPeoplePageTool >> defaultHtmlFile [
	^ self defaultFile, '.html'
]

{ #category : #'html generation' }
PharoPeoplePageTool >> generateBody [
	^ self tag: #body with: [ 
		self tag: #h1 with: [ stream << self title ].
		stream << self preamble.
		data shuffled do: [ :each |
			self generateEntryFor: each.
			stream << String crlf ].
		stream << self postamble ]
]

{ #category : #'html generation' }
PharoPeoplePageTool >> generateEmailFor: consultant [
	stream << '$@ join: #('.
	($@ split: consultant email)
		do: [ :each | stream print: each ]
		separatedBy: [ stream space ].
	stream << ')'
]

{ #category : #'html generation' }
PharoPeoplePageTool >> generateEntryFor: consultant [
	self subclassResponsibility
]

{ #category : #'html generation' }
PharoPeoplePageTool >> generateHeader [
	self tag: #head with: [ 
		stream << '<meta charset="utf-8">'.
		self tag: #title with: [ stream << self title ].
		self tag: #style with: [ stream << self css ] ]
]

{ #category : #'html generation' }
PharoPeoplePageTool >> generatePage [
	self
		tag: #html
		with: [ 
			self generateHeader.
			self generateBody ]
]

{ #category : #public }
PharoPeoplePageTool >> generatePageFile [
	self generatePageFile: self defaultHtmlFile
]

{ #category : #public }
PharoPeoplePageTool >> generatePageFile: file [
	stream := file asFileReference writeStream.
	self generatePage.
	stream close.
]

{ #category : #'html generation' }
PharoPeoplePageTool >> generateWebsiteLinkFor: person [
	| url |
	url := person website asZnUrl.
	self 
		tag: #a 
		attributes: { #href -> url asString } asDictionary 
		with: [ stream print: url ]
]

{ #category : #public }
PharoPeoplePageTool >> loadFromFile [
	self loadFromFile: self defaultDataFile
]

{ #category : #public }
PharoPeoplePageTool >> loadFromFile: file [
	file asFileReference readStreamDo: [ :in |
		data := STON fromStream: in ]
]

{ #category : #constants }
PharoPeoplePageTool >> postamble [
	^ '<img src="http://www.pharo-project.org/images/desk.jpg"/><p class="footer">Page last generated on {1} by {2}</p>' format: { DateAndTime now. SystemVersion current }
]

{ #category : #constants }
PharoPeoplePageTool >> preamble [
	^ self subclassResponsibility
]

{ #category : #public }
PharoPeoplePageTool >> saveToFile [
	self saveToFile: self defaultDataFile
]

{ #category : #public }
PharoPeoplePageTool >> saveToFile: file [
	file asFileReference writeStreamDo: [ :out |
		(STON writer on: out)
			newLine: String crlf;
			prettyPrint: true;
			nextPut: data ]
]

{ #category : #'html generation' }
PharoPeoplePageTool >> tag: tag attributes: dictionary with: block [
	stream nextPut: $<; nextPutAll: tag.
	dictionary keysAndValuesDo: [ :key :value | 
		stream space; << key; nextPut: $=; nextPut: $"; << value; nextPut: $" ]. 
	stream nextPut: $>.
	block value.
	stream nextPut: $<; nextPut: $/; nextPutAll: tag; nextPut: $>.
]

{ #category : #'html generation' }
PharoPeoplePageTool >> tag: tag with: block [
	stream nextPut: $<; nextPutAll: tag; nextPut: $>.
	block value.
	stream nextPut: $<; nextPut: $/; nextPutAll: tag; nextPut: $>.
]

{ #category : #constants }
PharoPeoplePageTool >> title [
	^ self subclassResponsibility
]
