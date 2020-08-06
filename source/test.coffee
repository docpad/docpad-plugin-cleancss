# Test our plugin using DocPad's Testers
require('docpad-plugintester')
	.test(
		{
			outExpectedPath: __dirname+'/../test/out-expected-development'
		}
		{
			env: 'development'
		}
	)
	.test(
		{
			outExpectedPath: __dirname+'/../test/out-expected-production'
		}
		{
			env: 'production'
		}
	)
