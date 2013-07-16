"
PharoConsultantPageTool generates an HTML page listing all Pharo Consultants.

PharoConsultantPageTool new
	consultants: PharoConsultant demo;
	saveToFile.

PharoConsultantPageTool new
	loadFromFile;
	yourself.
	
PharoConsultantPageTool new
	loadFromFile;
	generatePageFile.
"
Class {
	#name : #PharoConsultantPageTool,
	#superclass : #Object,
	#instVars : [
		'consultants',
		'stream'
	],
	#category : #PharoPeople
}

{ #category : #accessing }
PharoConsultantPageTool >> consultants [
	^ consultants
]

{ #category : #accessing }
PharoConsultantPageTool >> consultants: anObject [
	consultants := anObject
]

{ #category : #constants }
PharoConsultantPageTool >> css [
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
'
]

{ #category : #accessing }
PharoConsultantPageTool >> defaultDataFile [
	^ 'pharo-consultants.ston'
]

{ #category : #accessing }
PharoConsultantPageTool >> defaultHtmlFile [
	^ 'pharo-consultants.html'
]

{ #category : #'html generation' }
PharoConsultantPageTool >> generateBody [
	^ self tag: #body with: [ 
		self tag: #h1 with: [ stream << self title ].
		stream << self preamble.
		consultants shuffled do: [ :each |
			self generateEntryFor: each ].
		stream << self postamble ]
]

{ #category : #'html generation' }
PharoConsultantPageTool >> generateEmailFor: consultant [
	stream << '$@ join: #('.
	($@ split: consultant email)
		do: [ :each | stream print: each ]
		separatedBy: [ stream space ].
	stream << ')'
]

{ #category : #'html generation' }
PharoConsultantPageTool >> generateEntryElementsFor: consultant [
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Name' ].
		self tag: #td with: [ 
			self tag: #span attributes: { #class -> 'cn' } asDictionary with: [ stream << consultant name ] ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Location' ].
		self tag: #td with: [ stream << consultant location ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Email' ].
		self tag: #td with: [ self generateEmailFor: consultant ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Website' ].
		self tag: #td with: [ self generateWebsiteLinkFor: consultant ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Industry Experience' ].
		self tag: #td with: [ stream << 'since '; print: consultant industryExperienceSince ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Smalltalk Experience' ].
		self tag: #td with: [ stream << 'since '; print: consultant smalltalkExperienceSince ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Pharo Experience' ].
		self tag: #td  with: [ stream << 'since '; print: consultant pharoExperienceSince ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Areas Of Expertise' ].
		self tag: #td with: [ stream << consultant areasOfExpertise ] ]
]

{ #category : #'html generation' }
PharoConsultantPageTool >> generateEntryFor: consultant [
	self tag: #a attributes: { #name -> consultant id } asDictionary with: [   
		self tag: #p with: [ 
			self tag: #table with: [ 
				stream << self tableColGroup.
				self generateEntryElementsFor: consultant ] ] ]
]

{ #category : #'html generation' }
PharoConsultantPageTool >> generateHeader [
	self tag: #head with: [ 
		self tag: #title with: [ stream << self title ].
		self tag: #style with: [ stream << self css ] ]
]

{ #category : #'html generation' }
PharoConsultantPageTool >> generatePage [
	self
		tag: #html
		with: [ 
			self generateHeader.
			self generateBody ]
]

{ #category : #public }
PharoConsultantPageTool >> generatePageFile [
	self generatePageFile: self defaultHtmlFile
]

{ #category : #public }
PharoConsultantPageTool >> generatePageFile: file [
	stream := file asFileReference writeStream.
	self generatePage.
	stream close.
]

{ #category : #'html generation' }
PharoConsultantPageTool >> generateWebsiteLinkFor: consultant [
	| url |
	url := consultant website asZnUrl.
	self 
		tag: #a 
		attributes: { #href -> url asString } asDictionary 
		with: [ stream print: url ]
]

{ #category : #public }
PharoConsultantPageTool >> loadFromFile [
	self loadFromFile: self defaultDataFile
]

{ #category : #public }
PharoConsultantPageTool >> loadFromFile: file [
	file asFileReference readStreamDo: [ :in |
		consultants := STON fromStream: in ]
]

{ #category : #constants }
PharoConsultantPageTool >> postamble [
	^ '<img src="http://www.pharo-project.org/images/desk.jpg"/>'
]

{ #category : #constants }
PharoConsultantPageTool >> preamble [
	^ '<p>Pharo consultants can help you to successfully realise your application or project based on Pharo technology. These professionals from all over the world have experience in building great software, in flexibly using object technology and specifically in working with Pharo and all the tools in its ecosystem.</p>
<p>These individuals are involved in the <a href="http://www.pharo.org">Pharo open source project</a> and are supporting Pharo through the <a href="http://association.pharo.org">Association</a> or <a href="http://consortium.pharo.org">Consortium</a>. Most of them have contributed to the Pharo code base or to open source frameworks and libraries running on top of Pharo.</p>
<p>Feel free to contact them to for more information and to negotiate terms, conditions and availability.</p>
<img src="http://www.pharo-project.org/images/pharo.png"/>'
]

{ #category : #public }
PharoConsultantPageTool >> saveToFile [
	self saveToFile: self defaultDataFile
]

{ #category : #public }
PharoConsultantPageTool >> saveToFile: file [
	file asFileReference writeStreamDo: [ :out |
		(STON writer on: out)
			newLine: String crlf;
			prettyPrint: true;
			nextPut: consultants ]
]

{ #category : #constants }
PharoConsultantPageTool >> tableColGroup [
	^ '<colgroup><col style="text-align:left;width:25%;"/><col style="text-align:left;"/></colgroup>'
]

{ #category : #'html generation' }
PharoConsultantPageTool >> tag: tag attributes: dictionary with: block [
	stream nextPut: $<; nextPutAll: tag.
	dictionary keysAndValuesDo: [ :key :value | 
		stream space; << key; nextPut: $=; nextPut: $"; << value; nextPut: $" ]. 
	stream nextPut: $>.
	block value.
	stream nextPut: $<; nextPut: $/; nextPutAll: tag; nextPut: $>.
]

{ #category : #'html generation' }
PharoConsultantPageTool >> tag: tag with: block [
	stream nextPut: $<; nextPutAll: tag; nextPut: $>.
	block value.
	stream nextPut: $<; nextPut: $/; nextPutAll: tag; nextPut: $>.
]

{ #category : #constants }
PharoConsultantPageTool >> title [
	^ 'Pharo Consultants'
]
