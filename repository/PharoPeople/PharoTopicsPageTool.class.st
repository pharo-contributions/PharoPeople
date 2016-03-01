"
A PharoTopicsPageTool generates a html for master and bachelor topics.

PharoTopicsPageTool
	new 
	dataFromUrl: 'https://raw.github.com/pharo-project/pharo-project-proposals/master/Topics.st';
	generatePageFile.

For debugging 
	
PharoTopicsPageTool
	new 
	dataFromFile: '/Users/sven/Develop/git/pharo-project-proposals/Topics.st';
	generatePageFile.

"
Class {
	#name : #PharoTopicsPageTool,
	#superclass : #PharoPeoplePageTool,
	#category : #PharoPeople
}

{ #category : #accessing }
PharoTopicsPageTool >> dataFromStream: aStream [
	| ast |
	ast := RBParser parseExpression: aStream contents.
	data := ast statements collect: [ :each | OpalCompiler evaluate: each formattedCode ]
]

{ #category : #default }
PharoTopicsPageTool >> defaultFile [
	^ 'pharo-topics'
]

{ #category : #'html generation' }
PharoTopicsPageTool >> generateBody [
	| shuffled |
	shuffled := data shuffled.
	^ self
		tag: #body
		with:
			[ self tag: #h1 with: [ stream << self title ].
			stream << self preamble.
			self generateTocFor: shuffled.
			shuffled
				do: [ :each | 
					self generateEntryFor: each.
					stream << String crlf ].
			stream << self postamble ]
]

{ #category : #'html generation' }
PharoTopicsPageTool >> generateEntryElementsFor: topic [
	
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Title' ].
		self tag: #td with: [ 
			self tag: #span attributes: { #class -> 'cn' . #id -> ('topic-' , (self anchorForTitle: topic title)) } asDictionary with: [ stream << topic title ] ] ].
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
	topic goal 
		ifNotNil: [self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Goal' ].
		self tag: #td with: [ stream << topic goal ] ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Level' ].
		self tag: #td with: [ stream << topic level ] ].
	self tag: #tr with: [ 
		self tag: #td with: [ stream << 'Candidate' ].
		self tag: #td with: [ stream << topic candidate ] ]
]

{ #category : #'html generation' }
PharoTopicsPageTool >> generateEntryFor: topic [
	self tag: #a attributes: { #name -> topic id } asDictionary with: [   
		self tag: #p with: [ 
			self tag: #table with: [ 
				stream << self tableColGroup.
				self generateEntryElementsFor: topic ] ] ]
]

{ #category : #'html generation' }
PharoTopicsPageTool >> generateTocFor: topics [
	self
		tag: #ul
		with:
			[ topics
				do:
					[ :each | 
					self
						tag: #li
						with:
							[ self
								tag: #a
								attributes: {(#href -> ('#topic-' , (self anchorForTitle: each title)))} asDictionary
								with: [ stream nextPutAll: each title ] ] ] ]
]

{ #category : #constants }
PharoTopicsPageTool >> preamble [
	^  '
    <a href="http://www.pharo.org"><img src="http://www.pharo.org/files/pharo.png"/></a>
	
	<p><a href="http://www.pharo.org">Pharo</a>
      is a pure object-oriented programming
      language and a powerful environment, focused on simplicity and
      immediate feedback (think IDE and OS rolled into one).</p>

<h2>Table of Contents</h2>

<ul>
	<li><a href="#guidelines">Guidelines</a>
		<ul>
			<li><a href="#for-students">Information for Students</a></li>
			<li><a href="#adding-a-proposal">Adding a Proposal</a></li>
			<li><a href="#admin">Administration</a></li>
		</ul>
		<li><a href="#topics"><b>List of Topics</b></a></li>
	</li>
</ul>

    <h2 id="guidelines">Guidelines</h2>

    <h3 id="for-students">Information for Students</h3>

    <p>
    These ideas were contributed by our developers and users. They are
    sometimes vague or incomplete. If you wish to submit a proposal based
    on these ideas, you may wish to contact the developers and find out
    more about the particular suggestion you''re looking at.
    </p>
    <p>
    Being accepted as a Google Summer of Code student is quite
    competitive. Accepted students typically have thoroughly researched
    the technologies of their proposed project and have been in frequent
    contact with potential mentors. Simply copying and pasting an idea
    here will not work. On the other hand, creating a completely new idea
    without first consulting potential mentors is unlikely to work out.
    </p>
    <p>
    If there is no specific contact given you can ask questions on the
    general Pharo development list
    <a href="mailto:pharo-dev@lists.pharo.org">pharo-dev@lists.pharo.org</a>. See the
    <a href="http://pharo.org/community">Pharo community page</a>
    for information on available mailing lists and how to subscribe.
    </p>
    
    <h3 id="adding-a-proposal">Adding a Proposal</h3>

    <p>Please propose your own project by following the following template.
      You can edit the list on github here:
      <a href="https://github.com/pharo-project/pharo-project-proposals/blob/master/Topics.st">https://github.com/pharo-project/pharo-project-proposals/blob/master/Topics.st</a> and send a pull request.</p>

    <code><pre>
     PharoTopic new
       title: ''The name of your project'';
       contact: ''email address'';
       supervisors: ''Supervisors names'';
       keywords: ''keywords separated by spaces'';
       context: ''a description of the context of the project'';
       goal: ''description of the goal'';
       level: ''Beginner or Intermediate or Advanced'';
       yourself.
    </pre></code>

    <h3 id="admin">Administration</h3>
    
    <p>
      Do not hesitate to ask questions. Administrators of this year’s
      application are <a href="mailto:serge.stinckwich@gmail.com">Serge Stinckwich</a>, <a href="mailto:yuriy.tymchuk@me.com">Yuriy Tymchuk</a> and <a href="mailto:i.uhnak@gmail.com">Peter Uhnak</a>.
    </p>

<h2 id="topics">Pharo GSOC Topics</h2>
'
]

{ #category : #constants }
PharoTopicsPageTool >> tableColGroup [
	^ '<colgroup><col style="text-align:left;width:25%;"/><col style="text-align:left;"/></colgroup>'
]

{ #category : #constants }
PharoTopicsPageTool >> title [
	^ 'Pharo GSOC 2016<br>Ideas List'
]
