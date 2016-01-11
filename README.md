# Dotfiles
These are my dotfiles. There are many like them but these are mine.

# Components
+ `.config`
  + `fish`
    + `config.fish`: My fish shell config. You will probably need to edit it before you use it. It has some components specific to your configuration
    + `rbenv.fish`: Rbenv completions
  + `git`: Github for mac stuff
+ `git-template/hooks`: Custom git-hooks, mainly for automatic CTags
+ `.Guardfile`: Config for guard. Mainly enables notification center alerts
+ `.gemrc`: Rubygems configuration. Disables doc install
+ `.gitconfig`: Example gitconfig on how to use includes for my custom settings (`gitconfig-shared`). Copy+paste this into your gitconfig
+ `.pryrc`: Settings for pry
+ `.rspec`: Settings for rspec
+ `com.googlecode.iterm2.plist`: iTerm config
+ `gitconfig-shared`: Some custom git settings. Put into an include file so you don't have to commit personal/sensitive information. See `.gitconfig` on how to include it
+ `karabiner.xml`: My [Karabiner](https://pqrs.org/osx/karabiner/) `private.xml` file. Symlink it as `~/Library/Application\ Support/Karabiner/private.xml`, then open up karabiner and click `Reload private.xml`. I recommend installing [Seil](https://pqrs.org/osx/karabiner/seil.html.en) as well, and binding Caps to F19 (code 80).


# Help help something doesn't work!
You can open up an issue or PR, but please keep in mind these are my personal settings. I do my best to fix issues that bother me.

You're highly encouraged to fork this and/or incorporate the changes into your dotfiles.


# Other things of note
+ [Fish shell](http://fishshell.com/)
+ [My fish theme](https://github.com/paradox460/paradox-theme)
+ [Karabiner](https://pqrs.org/osx/karabiner/) and [Seil](https://pqrs.org/osx/karabiner/seil.html.en)


```
The MIT License (MIT)

Copyright (c) [2015] [Jeffrey Sandberg]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
