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

			# Create the task group to handle multiple Browserify files.
			tasks = new TaskGroup({concurrency:0, next})

			# Create a new task for each Browserify files.
			opts.collection.findAll({cleancss: $exists: true}).each (file) ->
				cleanOpts = file.get('cleancss')
				return  if cleanOpts is false  # Skip the file when the option is explicitly false
				tasks.addTask (complete) ->
					# Extract opts
					cleanOpts = {}  if cleanOpts is true
					cleanOpts.relativeTo = file.get('outDirPath')

					# Provide the default configuration options if needed.
					for own key, value of plugin.getConfig().cleancssOpts
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
