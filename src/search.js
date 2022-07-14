export function Search($container, $input) {
  const container = $container;
  const input = $input;
  let content = [];

  function init () {
    input.onfocus = (e) => {
      loadContent();
    };

    input.oninput = (e) => {
      showResults(input.value);
    };
  }

  function loadContent () {
    fetch("/search.json")
      .then(response => response.json())
      .then(json => content = cleanupTitles(removeUnwantedPages(json)));
  }

  function removeUnwantedPages (json) {
    const removeIds = ['/404/']
    return json.filter( item => !removeIds.includes(item['id']))
  }

  function cleanupTitles(json) {
    return json.map(item => (
      { id: item['id'],
      title: item['title'].replace('| DNSimple API v2', ''),
      body: item['body'] }
    ));
  }

  function showResults(query) {
    container.innerHTML = "";

    const $h1 = document.createElement('h1');
    $h1.innerText = 'Search results';
    container.appendChild($h1)

    if (query.length > 0) {
      $h1.innerText += ` for "${query}"`;
    } else {
      noResults();
      return;
    }

    const text = query.toLowerCase();
    const title_match = content.filter(item => item["title"].toLowerCase().includes(text));
    const body_match = content.filter(item => item["body"].toLowerCase().includes(text));

    // remove duplicate results if any
    const results = [...new Set(title_match.concat(body_match))];

    if (results.length == 0) {
      noResults();
      return;
    }

    const ul = document.createElement('ul');
    container.appendChild(ul);

    for (const item of results) {
      const li = document.createElement('li');
      const anchor = document.createElement('a');
      const text = document.createTextNode(item['title']);

      anchor.appendChild(text);
      anchor.href = item['id'];

      li.appendChild(anchor);
      ul.appendChild(li);
    }
  }

  function noResults () {
    const noResults = document.createTextNode("No results found.");
    container.appendChild(noResults);
  }

  return {
    init,
  };
}
