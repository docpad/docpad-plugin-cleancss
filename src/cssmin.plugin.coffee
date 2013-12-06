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

    render: (opts,next) ->
      # Prepare.
      {inExtension,outExtension,templateData, file} = opts

      # Ensure we are minifying the CSS.
      if inExtension in ['cssmin'] and outExtension in ['css', null]
        # Prepare
        config = @getConfig()

        # Allow overriding using the document options
        if templateData.document.cssmin or false
          for own key, value of templateData.document.cssmin
            config[key] = value

        # Add in any more needed CleanCSS options.
        config.relativeTo = file.attributes.fullDirPath

        # Render
        try
          opts.content = new @CleanCSS(config).minify(opts.content)
        catch err
          return next(err)

      # Done, return back to DocPad
      return next()
