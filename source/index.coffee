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
				rebase: true
				advanced: false
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
			tasks = TaskGroup.create(concurrency:0).done(next)

			# Create a new task for each Browserify files.
			opts.collection.findAll({cleancss: $exists: true}).each (file) ->
				# Skip the file when the option is explicitly false
				return  if file.get('cleancss') is false

				tasks.addTask (complete) ->
					# Extract opts
					content = file.get('contentRendered')
					filePath = file.getPath()
					cleanOpts = file.get('cleancss')
					cleanOpts = {}  if cleanOpts is true
					cleanOpts.relativeTo = file.get('outDirPath')
					cleanOpts.root = docpadConfig.outPath

					# Update references other
					if cleanOpts.processImport and content.indexOf('@import') isnt -1
						file.setMetaDefaults('referencesOthers': true)

					# Extend the file's opts with our default plugin opts
					for own key, value of config.cleancssOpts
						cleanOpts[key] ?= value

					# Perform the render
					new CleanCSS(cleanOpts).minify content, (error, result) ->
						# Check for error
						if error
							err = new Error(
								"The following error occured cleaning the css file: #{filePath}\n"+
								(error.stack or error)
							)
							return complete(err)

						# Check for errors
						if result.errors?.length
							err = new Error(
								"The following errors occured cleaning the css file: #{filePath}\n"+
								((error.stack or error)  for error in result.errors).join('\n\n')
							)
							return complete(err)

						# Check for warnings
						if result.warnings?.length
							warn = new Error(
								"The following warnings occured cleaning the css file: #{filePath}\n"+
								result.warnings.join('\n\n')
							)
							docpad.warn(warn)

						# Update the out content for the document
						file.set({
							contentRendered: result.styles
							contentRenderedWithoutLayouts: result.styles
						})

						# Update the out content for the file
						file.action('write', complete)


			# Execute all of the created tasks.
			tasks.run()

			# Chain
			@
