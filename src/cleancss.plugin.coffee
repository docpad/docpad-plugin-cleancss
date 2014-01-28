# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class CleancssPlugin extends BasePlugin
		# Name
		name: 'cleancss'

		# Configuration
		config:
			cleancssOpts:
				keepSpecialComments: '*'
				keepBreaks: false
				benchmark: false
				processImport: true
				noRebase: false
				noAdvanced: true
				debug: false

			# Disabled on development environments by default.
			environments:
				development:
					enabled: false

		# Write After
		writeAfter: (opts, next) ->
			# Import
			CleanCSS = require('clean-css')
			{TaskGroup} = require('taskgroup')

			# Prepare
			plugin = @
			config = @getConfig()
			docpad = @docpad
			docpadConfig = docpad.getConfig()

			# Create the task group to handle multiple Browserify files.
			tasks = new TaskGroup({concurrency:0, next})

			# Create a new task for each Browserify files.
			opts.collection.findAll({cleancss: $exists: true}).each (file) ->
				# Skip the file when the option is explicitly false
				return  if file.get('cleancss') is false

				tasks.addTask (complete) ->
					# Extract opts
					cleanOpts = file.get('cleancss')
					cleanOpts = {}  if cleanOpts is true
					cleanOpts.relativeTo = file.get('outDirPath')
					cleanOpts.root = docpadConfig.outPath

					# Provide the default configuration options if needed.
					for own key, value of config.cleancssOpts
						cleanOpts[key] ?= value

					try
						output = new CleanCSS(cleanOpts).minify(file.get('contentRendered'))
					catch err
						return complete(err)

					# Update references other
					if cleanOpts.processImport
						file.setMetaDefaults('referencesOthers': true)

					# Update the out content for the document
					file.set({
						contentRendered: output
						contentRenderedWithoutLayouts: output
					})

					# Update the out content for the file
					file.action('write', complete)


			# Execute all of the created tasks.
			tasks.run()

			# Chain
			@
