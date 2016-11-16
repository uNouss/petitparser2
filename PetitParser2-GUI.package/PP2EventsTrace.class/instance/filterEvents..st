private
filterEvents: eventsCollection
	fPositions := OrderedCollection new.
	fEvents := OrderedCollection new.
	fSelectors := OrderedCollection new.
	fNodes := OrderedCollection new.
	"for the last stream only"
	
	(start to: stop) do: [ :index | | e |
		e := self events at: index.
		(eventsCollection isNil or: [ eventsCollection includes: e ]) ifTrue: [
			fPositions addLast: (self positions at: index).
			fSelectors addLast: (self selectors at: index).
			fNodes addLast: (self nodes at: index).
			fEvents addLast: e.
		]
	].
	
	^ fEvents