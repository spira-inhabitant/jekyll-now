/* Parse article to fill the side table of content
 */

$(document).ready(function() {
    $("#article-content").children().each(function() {
        var h1 = $(this).find('h1');
        $("#article-sidetoc").append("<li class=\"\"><a href=\"#" + h1.attr('id') + "\">"
                                     + h1.text() + "</a><ul class=\"nav\"></ul></li>");
        /*
        var h2 = $(this).find('h2').each(function() {
            ul = $("#article-sidetoc li:last").find('ul');
            ul.append("<li><a href=\"#" + $(this).attr('id') + "\">"
                      + $(this).text() + "</a></li>");
        });
        */
        var h2 = $(this).find('h2');
        h2.each(function() {
            ul = $("#article-sidetoc > li:last").find('ul');
            ul.append("<li><a href=\"#" + $(this).attr('id') + "\">"
                      + $(this).text() + "</a></li>");
        });
        
    });
});