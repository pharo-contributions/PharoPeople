"
A PharoTopicsPageTool generates a html for master and bachelor topics.


PharoTopicsPageTool
	new 
	data: (Compiler evaluate: (ZnClient new 
			 get: 'https://raw.github.com/pharo-project/pharo-project-proposals/master/Topics.st'));
	generatePageFile
"
Class {
	#name : #PharoTopicsPageTool,
	#superclass : #PharoPeoplePageTool,
	#category : #PharoPeople
}

{ #category : #'as yet unclassified' }
PharoTopicsPageTool >> defaultFile [
	^ 'pharo-topics'
]

{ #category : #'as yet unclassified' }
PharoTopicsPageTool >> generateEntryElementsFor: topic [
	
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Title' ].
		self tag: #td with: [ 
			self tag: #span attributes: { #class -> 'cn' } asDictionary with: [ stream << topic title ] ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Email' ].
		self tag: #td with: [ self generateEmailFor: topic ] ]. 
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Supervisors ' ].
		self tag: #td with: [ stream << topic supervisors ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Keywords' ].
		self tag: #td  with: [ stream  << topic keywords ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Context' ].
		self tag: #td with: [ stream << topic context ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Goal' ].
		self tag: #td with: [ stream << topic goal ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Level' ].
		self tag: #td with: [ stream << topic level ] ]
]

{ #category : #'as yet unclassified' }
PharoTopicsPageTool >> generateEntryFor: topic [
	self tag: #a attributes: { #name -> topic id } asDictionary with: [   
		self tag: #p with: [ 
			self tag: #table with: [ 
				stream << self tableColGroup.
				self generateEntryElementsFor: topic ] ] ]
]

{ #category : #'as yet unclassified' }
PharoTopicsPageTool >> preamble [
	^ '<p>Bored to do a bachelor that nobody will ever look at it? </p>
	
	<p>Do a bachelor in contact with a challenging and fun community of developers. 
	We collected some of the topics that interest the  <a href="http://www.pharo.org">Pharo</a> community. If you are interested to get an impact and feedback and more important have fun with us, take a topic contact the author and get started. Ideally we would love that part of what you are doing gets into Pharo or one of its packages. You can also participate to the next coming book by making sure that a part of your master/bachelor describes well what you are doing.</p>
	<p>If you have other ideas of topics or if you want to supervise one of the topics, do not hesitate to contact us</p>
	
<p>Pay attention Pharo is fun and it can change your life :) </p>
<a href="http://www.pharo.org"><img src="http://www.pharo-project.org/images/pharo.png"/></a>
<p class="footer">( In random order )</p>'
]

{ #category : #'as yet unclassified' }
PharoTopicsPageTool >> tableColGroup [
	^ '<colgroup><col style="text-align:left;width:25%;"/><col style="text-align:left;"/></colgroup>'
]

{ #category : #'as yet unclassified' }
PharoTopicsPageTool >> title [
	^ 'Pharo Bachelor and Master Topics'
]
