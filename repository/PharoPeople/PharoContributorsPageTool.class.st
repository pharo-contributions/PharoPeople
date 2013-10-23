"
PharoTopicsPageTool generates an HTML page listing all topics for master and bachelor students.

PharoContributorsPageTool new
	loadFromFile;
	yourself.
	
PharoContributorsPageTool new
	loadFromFile;
	generatePageFile.
"
Class {
	#name : #PharoContributorsPageTool,
	#superclass : #PharoPeoplePageTool,
	#category : #PharoPeople
}

{ #category : #accessing }
PharoContributorsPageTool >> defaultFile [
	^ 'pharo-contributors'
]

{ #category : #'html generation' }
PharoContributorsPageTool >> ensureImageFor: contributor [
	| file |
	file := contributor processedImageUrl asFileReference.
	file exists
		ifTrue: [ ^ self ].
	file writeStreamDo: [ :out |
		out binary.
		out nextPutAll: contributor processedPngEntity bytes ]

]

{ #category : #'html generation' }
PharoContributorsPageTool >> generateEntryElementsFor: contributor [
	self ensureImageFor: contributor.
	self tag: #tr with: [ 
		self tag: #td with: [ 
			self tag: #span attributes: { #class -> 'cn' } asDictionary with: [ stream << contributor name ] ].
		self tag: #td attributes: { #rowspan-> 4 } asDictionary with: [ 
			self tag: #img attributes: { #src -> contributor processedImageUrl } asDictionary with: [ ] ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ self generateWebsiteLinkFor: contributor ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ self generateEmailFor: contributor ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << contributor description ] ]
]

{ #category : #'html generation' }
PharoContributorsPageTool >> generateEntryFor: contributor [
	self tag: #a attributes: { #name -> contributor id } asDictionary with: [   
		self tag: #p with: [ 
			self tag: #table with: [ 
				stream << self tableColGroup.
				self generateEntryElementsFor: contributor ] ] ]
]

{ #category : #constants }
PharoContributorsPageTool >> preamble [
	^ '<p>These are some of the individuals from all over the world that have contributed to <a href="http://www.pharo.org">Pharo</a> over the years. They filed issues, fixed bugs and generally cleaned up code. They wrote documentation, answered questions on the mailing lists and wrote whole new subsystems.</p>
<p>Thank you !</p>
<a href="http://www.pharo.org"><img src="http://www.pharo-project.org/images/pharo.png"/></a>
<p class="footer">( In random order )</p>'
]

{ #category : #constants }
PharoContributorsPageTool >> tableColGroup [
	^ '<colgroup><col style="text-align:left;"/><col style="text-align:left;width:25%;"/></colgroup>'
]

{ #category : #constants }
PharoContributorsPageTool >> title [
	^ 'Pharo Contributors'
]
