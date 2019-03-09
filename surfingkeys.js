// Vimium/cVim
map('u', 'e');
mapkey('p', "Open the clipboard's URL in the current tab", function() {
    Front.getContentFromClipboard(function(response) {
        window.location.href = response.data;
    });
});
map('P' , 'cc');
map('gi', 'i');
map('_F', 'F');
map('_C', 'C');
map('F' , '_C');
map('C' , '_F');
map('gf', 'w');
map('`' , '\'');
map('H' , 'S');
map('L' , 'D');
map('gt', 'R');
map('gT', 'E');
map('K' , 'R');
map('J' , 'E');

// Unmap temporary keys
unmap('_F');


// settings.hintAlign = "left"

// Smart Page Boundary
settings.smartPageBoundary = true;

// Search aliases
removeSearchAliasX('b', 's') // Get rid of baidu
removeSearchAliasX('w', 's') // Get rid of bing

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
)


Hints.style(`font-family: "Helvetica Neue" `);
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
