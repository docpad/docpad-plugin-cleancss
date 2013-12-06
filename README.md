# [CSS-Minifier](http://github.com/GoalSmashers/clean-css) Plugin for [DocPad](http://docpad.org)

[![Build Status](https://secure.travis-ci.org/RobLoach/docpad-plugin-cssmin.png?branch=master)](http://travis-ci.org/RobLoach/docpad-plugin-cssmin "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-cssmin.png)](http://badge.fury.io/js/docpad-plugin-cssmin "View this project on NPM")

Allows minifying CSS, using [clean-css](http://github.com/GoalSmashers/clean-css),
from within [DocPad](https://docpad.org).

Convention:  `.css.cssmin.anything`


## Install

```bash
$ docpad install cssmin
```


## Configure

### Defaults

The default configuration for this plugin is the equivalant of adding the
following [clean-css options](https://github.com/GoalSmashers/clean-css#how-to-use-clean-css-programmatically)
to your [DocPad configuration file](http://docpad.org/docs/config):

``` coffee
  plugins:
    cssmin:
      # * for keeping all (default), 1 for keeping first one only, 0 for
      # removing all
      keepSpecialComments: '*'

      # Whether to keep line breaks (default is false).
      keepBreaks: false

      # Turns on benchmarking mode measuring time spent on cleaning up.
      benchmark: false

      # Whether to process @import rules.
      processImport: false

      # Whether to skip URLs rebasing.
      noRebase: false

      # set to true to disable advanced optimizations.
      noAdvanced: false

      # Enables debug mode.
      debug: false
```


## History
[You can discover the history inside the `History.md` file](https://github.com/robloach/docpad-plugin-htmlmin/blob/master/History.md#files)


## Contributing
[You can discover the contributing instructions inside the `Contributing.md` file](https://github.com/robloach/docpad-plugin-htmlmin/blob/master/Contributing.md#files)


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2013 [Rob Loach](http://robloach.net)
