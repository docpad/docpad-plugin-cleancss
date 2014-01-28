# Test our plugin using DocPad's Testers
require('docpad').require('testers')
	.test(
			pluginPath: require('path').join(__dirname, '..')
			outExpectedPath: __dirname+'/../test/out-expected-development'
			testerClass: 'RendererTester'
		,
			env: 'development'
	)
	.test(
			name: ''
			pluginPath: require('path').join(__dirname, '..')
			outExpectedPath: __dirname+'/../test/out-expected-production'
			testerClass: 'RendererTester'
		,
			env: 'production'
	)