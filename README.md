# [CSS-Minifier](http://github.com/GoalSmashers/clean-css) Plugin for [DocPad](http://docpad.org)

<!-- BADGES/ -->

[![Build Status](https://secure.travis-ci.org/RobLoach/docpad-plugin-cssmin.png?branch=master)](http://travis-ci.org/RobLoach/docpad-plugin-cssmin "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-cssmin.png)](http://badge.fury.io/js/docpad-plugin-cssmin "View this project on NPM")
[![Gittip button](http://img.shields.io/gittip/RobLoach.png)](https://www.gittip.com/RobLoach/ "Support this project using Gittip")
[![Flattr button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/2257574/RobLoach "Support this project using Flattr")

<!-- /BADGES -->


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

    # Disabled on development environments by default.
    environments:
      development:
        enabled: false
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


<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/RobLoach/docpad-plugin-cssmin/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/RobLoach/docpad-plugin-cssmin/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Rob Loach (https://github.com/robloach)

### Contributors

These amazing people have contributed code to this project:

- Rob Loach (https://github.com/robloach) - [view contributions](https://github.com/RobLoach/docpad-plugin-cssmin/commits?author=RobLoach)

[Become a contributor!](https://github.com/RobLoach/docpad-plugin-cssmin/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; Rob Loach (http://robloach.net)

<!-- /LICENSE -->
