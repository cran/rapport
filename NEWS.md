# rapport 1.2 (2025-04-07)

Maintenance release with no user-visible changes (documentation
reference updates, small code style updates).


# rapport 1.1 (2015-04-11)

Maintenance release changing only the URL of the package homepage,
which old domain now hosts very different kind of content.


# rapport 1.0 (2013-12-06)

We started the `rapport` package back in 2011 but never thought of
that the version number should ever exceed ONE - because we are shy
guys. Now, almost 3 years later, so much stuff have changes in the
package, that time has come for a major version bump. Most important
updates since the birth of the package:

* dropped dependecy packages (`evaluate` and `ascii`) and implemented custom solutions for our custom needs
* some part of the package were out-sourced to the `pander` package in the name of modularity
* `pander` became more popular compared to `rapport`
* new syntax for template headers with YAML syntax instead our custom solution
* new file extension (`rapport` instead of `tpl`) not to confuse new-comers
* bunch of fiddles with naming conventions
* build a production-ready system on the top of the package at rapporter.net
* take part in Google Summer of Code 2013 increasing the number of available templates

Most recent changes since 0.51:

* helpers and statistical functions move to `rapportools` package
* ditched the `rp` prefix for all those (rp.max became max -- for those who load the package directly)
* ditched `tpl` prefix for tempalte functions as was confusing and every `rapport` template specific function starts with `rapport` now
* changing dependencies to Imports instead of cluttering the global namespace
* code review and doc update
* new variables available for easy access of template metadata (rapport.data, rapport.template, rapport.inputs)

Please note that the functions can still be accessed by the old names to preserve backward-compatibility, but will be definitely removed later to keep the clutter in the namespace at a minimal level. So please be advised to update your functions if building on the top (or parts) of `rapport`.

Function name changes:

* tpl.find -> rapport.read
* tpl.tangle -> rapport.tangle
* tpl.list -> rapport.ls
* tpl.header -> rapport.header
* tpl.body -> rapport.body
* tpl.info -> rapport.info
* tpl.meta -> rapport.meta
* tpl.inputs -> rapport.inputs
* tpl.example -> rapport.example
* tpl.rerun -> rapport.rerun
* tpl.renew -> rapport.renew
* tpl.export -> rapport.export
* tpl.check -> rapport.check.template
* tpl.paths -> rapport.path
* tpl.paths.reset -> rapport.path.reset
* tpl.paths.add -> rapport.path.add
* tpl.paths.remove -> rapport.path.remove

Variable name changes inside of templates:

* rp.data -> rapport.data

Option name changes:

* tpl.file.name -> rapport.file.name
* tpl.file.path -> rapport.file.path
* tpl.user -> rapport.user
* rp.use.labels -> rapport.user.labels
* tpl.paths -> rapport.path
* rp.tags -> rapport.tags
* graph.reply -> rapport.graph.replay

Classes:

* rp.meta -> rapport.meta
* rp.inputs -> rapport.inputs

# rapport 0.51 (2013-05-06)

* matchable inputs do not use `match.arg` for matching any more. Instead, a simple `%in%` with indexing is used, so exact match is required.
* `value` attribute is not used to store values that you choose from - `options` attribute is used instead, with `value` holding the (default) value(s) from the `options` list.
* new attribute `allow_multiple` was introduced in matchable inputs. If `TRUE`, it will allow one to match values from `options` list multiple times. Defaults to `FALSE`.
* for factor matchable inputs, matching is not performed on factor levels, but on values (just like in character inputs).


# rapport 0.5 (2013-02-18)

Template header specification updates:

* Template header specification is rewritten. Custom cumbersome syntax is no more, and the header content is 100% pure YAML. See `?tpl.meta` and `?tpl.inputs` for details on new metadata and input specification.
* Input specification relies on R class system, and the old one is deprecated (though kept for backwards compatibility). Only atomic vector classes are currently supported: `character`, `complex`, `integer`, `logical`, `numeric` and `raw`.
* More robust `length` checks are manageable via `exactly` and `min`/`max` attributes.
* `option` inputs are removed. You should use `matchable` attribute in `character` and `factor` inputs instead. Multiple matches are now allowed.
* `boolean`, `string` and `number` inputs are removed and `logical`, `character` and `numeric` are to be used instead, respectively.
* Added `integer` and `raw` inputs.
* Fine-tune control over inputs is achieved via class-specific options that resemble native R object methods and/or attributes, e.g. `nlevels` for factors, or `nchar` for character vectors.

Others changes:

* Added `yaml` package to dependencies.
* `tpl.inputs` and `tpl.meta` will now perform validation of inputs and metadata, respectively. Warnings are issued if unsupported fields are found.
* `dataRequired` metadata attribute is deprecated. Dataset is required if the template contains non-standalone inputs (see `?tpl.inputs` for details).

Bug fixes:

* Duplicate input names are not allowed in the templates.
* `is.empty` now returns `TRUE` for zero-length objects.

# rapport 0.4 (2012-08-04)

* Removed `ascii` and `evaluate` packages and introduced `pander`

    This was a quite big change in the backend which resulted in some removed functions of prior version.
    For example `tpl.tangle` is dropped temporarily and most of the custom options were moved to
    `panderOptions()` and `evalsOptions()` from `pander` package.

* The repository was moved to Rapporter's organisation GH account from @aL3xa

# rapport 0.33

New features:

* towards method/class-based reporting (issue #42)

Changes:

* removing most packages from 'Depends' and using NAMESPACE imports instead
* rearrange "templates" directory: subtemplates and internationalized templates goes to separate directories

Bug fixes:

* typos in templates

# rapport 0.32 (2012-02-18)

New features:

* New global options:
    * to specify exported documents and generated images (dynamic) name and path
    * to generate "portable" HTML files
* raw pandoc/asciidoc etc. outputs are also saved with appropriate extension

Changes:

* removing `makes.plot` function
* performance boost in `rp.prettyascii` (rounding)
* `tpl.export` returns the generated document's filename
* tweaks in `htest`

Bug fixes:

* fixed: deadlinks in exported documents to Rapport homepage
* fixed: NULL-indexing bug in tpl.meta

# rapport 0.31 (2012-02-08)


This is a hotfix release:
 * fixed .onLoad/windowsFont call error
 * fixed #47 (https://github.com/rapporter/rapport/issues/36) of custom RefClassField
 * removed `RJSONIO` dependency (just like: `table.json` function)
 * small documentation and CSS tweaks

# rapport 0.3 (2012-02-07)

New features:

* Introduced own `skewness()` and `kurtosis()` functions to get rid of `moments` dependency.
* Option (default set to FALSE) to view generated plots without exporting (`replayPlot`)
* Same option let users resize generated (and saved) images on the fly while printing rapport classes
  and later exporting

Changes:

* Removed `moments` and `latticeExtra` from package dependencies.
* Updated demo
* `rapport()` will now check for packages specified in the template header and throw error if
  something goes wrong while loading.
* `tpl.example` now uses `readlines` instead of reading from `stdin` (Windows and Eclipse/StatET bug)
* `tpl.export` now checks if specified backend is installed and throws an error if not.
* Checking if a plot was generated in `evals` is done with the help of `replayPlot` instead of
  file size checks (for OS independence).

Bug fixes:

* Windows path issue
* Windows default grDevice bug with checking if a plot was generated (by checking file size changes)
* Formatting issues with non-pandoc backends

# rapport 0.2 (2012-02-04)

Initial CRAN release.
