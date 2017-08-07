// Vimium/cVim
map('u', 'e');
mapkey('p', "Open the clipboard's URL in the current tab", function() {
    Front.getContentFromClipboard(function(response) {
        window.location.href = response.data;
    });
});
map('P', 'cc');
map('gi', 'i');
map('F', 'C');
map('gf', 'w');
map('`', '\'');
// save default key `t` to temp key `>_t`
map('>_t', 't');
// create a new key `t` for default key `on`
map('t', 'on');
// create a new key `o` for saved temp key `>_t`
map('o', '>_t');
map('H', 'S');
map('L', 'D');
map('gt', 'R');
map('gT', 'E');
map('K', 'R');
map('J', 'E');


settings.hintAlign = "left";
settings.smartPageBoundary = true;

// Search aliases
removeSearchAliasX('b', 's'); // Get rid of baidu
removeSearchAliasX('w', 's'); // Get rid of bing

// Wikipedia search alias
addSearchAliasX(
  'w', // Alias
  'wikipedia', // Prompt
  'https://en.wikipedia.org/w/index.php?title=Special:Search&search=', // search url
  's', // leader key
  'https://en.wikipedia.org/w/api.php?action=opensearch&format=json&formatversion=2&namespace=0&limit=20&suggest=true&search=', // suggestion url
  (response) =>  JSON.parse(response.text)[1] // Response parser
);

// Pivotal tracker search alias
addSearchAliasX(
  'p',
  'pivotal story id',
  'https://www.pivotaltracker.com/story/show/',
  's'
);

// click `Save` button to make above settings to take effect.
// set theme
// settings.theme = `
// .sk_theme {
//     background: #000;
//     color: #fff;
// }
// .sk_theme tbody {
//     color: #000;
// }
// .sk_theme input {
//     color: #317ef3;
// }
// .sk_theme .url {
//     color: #38f;
// }
// .sk_theme .annotation {
//     color: #38f;
// }
//
// .sk_theme .focused {
//     background: #aaa;
// }`;
