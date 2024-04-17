Class {
	#name : #BaselineOfnew,
	#superclass : #BaselineOf,
	#category : #BaselineOfnew
}

{ #category : #loading }
BaselineOfnew class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'new_test' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfnew >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'New_test'
		]
]
