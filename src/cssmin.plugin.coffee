# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class CssMinPlugin extends BasePlugin
    # Name
    name: 'cssmin'

    # Configuration
    config:
      keepSpecialComments: '*'
      keepBreaks: false
      benchmark: false
      processImport: false
      noRebase: false
      noAdvanced: true
      debug: false

    # Constructor
    constructor: ->
      # Prepare
      super

      # Require the CSS Minifier
      @CleanCSS = require('clean-css')

      # Chain
      @

    renderDocument: (opts,next) ->
      # Prepare.
      {extension, templateData, file, content} = opts

      # Ensure we are acting on a Stylesheet document.
      if extension == 'css' and file.type == 'document'
        # Prepare
        config = @getConfig()
        cssminOptions = {}

        # Allow use of global config options.
        for own key, value of config
          cssminOptions[key] = value

        # Allow overriding using the document options
        if templateData.document.cssmin or false
          for own key, value of templateData.document.cssmin
            cssminOptions[key] = value

        # Add in any more needed CleanCSS options.
        cssminOptions.relativeTo = file.attributes.fullDirPath

        # Render
        try
          opts.content = new @CleanCSS(cssminOptions).minify(opts.content)
        catch err
          return next(err)

      # Done, return back to DocPad
      return next()
