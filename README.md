# [CSS-Minifier](http://github.com/GoalSmashers/clean-css) Plugin for [DocPad](http://docpad.org)

[![Build Status](https://secure.travis-ci.org/RobLoach/docpad-plugin-cssmin.png?branch=master)](http://travis-ci.org/RobLoach/docpad-plugin-cssmin "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-cssmin.png)](http://badge.fury.io/js/docpad-plugin-cssmin "View this project on NPM")
[![Gittip button](http://img.shields.io/gittip/RobLoach.png)](https://www.gittip.com/RobLoach/ "Support this project using Gittip")
[![Flattr button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/2257574/RobLoach "Support this project using Flattr")

Allows minification of CSS from within [DocPad](https://docpad.org), using
[clean-css](http://github.com/GoalSmashers/clean-css).

Convention:  `.css.anything`


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


### Template Configuration

It is possible to override the default configuration on a per-template basis. In
this example, we are acting on `src/documents/style.css`:

``` css
---
cssmin:
  processImport: true
---

/**
 * The import.css file will be imported directly into this document.
 */
@import 'import.css';
```


## History
[You can discover the history inside the `History.md` file](https://github.com/robloach/docpad-plugin-cssmin/blob/master/HISTORY.md#files)


## Contributing
[You can discover the contributing instructions inside the `Contributing.md` file](https://github.com/robloach/docpad-plugin-cssmin/blob/master/CONTRIBUTING.md#files)


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2013 [Rob Loach](http://robloach.net)
