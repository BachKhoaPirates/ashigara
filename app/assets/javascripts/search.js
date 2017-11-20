$(document).on('turbolinks:load', function(){
  var shoes = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/shoes/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#shoes_search').typeahead(null, {
    source: shoes
  });
})
