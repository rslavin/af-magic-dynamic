# af-magic-dynamic
This is a copy of the [af-magic](https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme) theme by andyfleming, but with a dynamically-resizing prompt based on a minimum amount of whitespace which can be set by the user. The prompt changes  by collapsing the prompt either by using the shrink-path plugin or by truncating
it to only show the last segments (this can also be set by the user). See comments for details.

## Settings
Set the following shell variables in your `.zshrc` file to customize the theme.

`ENABLE_SHRINK_PROMPT` - Will use the [shrink-path](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/shrink-path/shrink-path.plugin.zsh) plugin (which must be installed separately) to truncate parent directories to single letter. Note that this can decrease performance.

`MIN_PROMPT_WHITESPACE` - Specifies the minimum number of characters to reserve for entering commands. The directory path shortens to accommodate this number. This is set to 60 by default.
