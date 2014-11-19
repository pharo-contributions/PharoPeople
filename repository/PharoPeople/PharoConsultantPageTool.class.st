"
PharoConsultantPageTool generates an HTML page listing all Pharo Consultants.

PharoConsultantPageTool new
	loadFromFile;
	yourself.
	
PharoConsultantPageTool new
	loadFromFile;
	generatePageFile.
"
Class {
	#name : #PharoConsultantPageTool,
	#superclass : #PharoPeoplePageTool,
	#category : #PharoPeople
}

{ #category : #accessing }
PharoConsultantPageTool >> defaultFile [
	^ 'pharo-consultants'
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
		self tag: #td with: [ stream << 'Languages' ].
		self tag: #td with: [ stream << consultant languages ] ].
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

{ #category : #constants }
PharoConsultantPageTool >> preamble [
	^ '<p>Pharo consultants can help you to successfully realise your application or project based on Pharo technology. These professionals from all over the world have experience in building great software, in flexibly using object technology and specifically in working with Pharo and all the tools in its ecosystem.</p>
<p>These individuals are involved in the <a href="http://www.pharo.org">Pharo open source project</a> and are supporting Pharo through the <a href="http://association.pharo.org">Association</a> or <a href="http://consortium.pharo.org">Consortium</a>. Most of them have contributed to the Pharo code base or to open source frameworks and libraries running on top of Pharo.</p>
<p>Feel free to contact them to for more information and to negotiate terms, conditions and availability.</p>
<a href="http://www.pharo.org"><img src="http://pharo.org/web/files/pharo.png"/></a>
<p class="footer">( In random order )</p>'
]

{ #category : #constants }
PharoConsultantPageTool >> tableColGroup [
	^ '<colgroup><col style="text-align:left;width:25%;"/><col style="text-align:left;"/></colgroup>'
]

{ #category : #constants }
PharoConsultantPageTool >> title [
	^ 'Pharo Consultants'
]
