---
title: People
layout: page
permalink: people.html
---

# People

Learn more about the people in Marie's letters. Click on a name to browse related letters.

{% capture letters %}{% for item in site.data.persname_master %}{{ item.name | slice: 0 | capitalize }};{% endfor %}{% endcapture %}
{%- assign uniqueLetters = letters | split: ';' | uniq -%}
{%- assign glossary = site.data.persname_master | sort: "name" -%}

<ul class="list-inline">
{% for letter in uniqueLetters %}
<li class="list-inline-item h2"><a href="#{{ letter }}">{{ letter }}</a></li>
{% endfor %}
</ul>
<hr>

<div>

{% for letter in uniqueLetters %}
<h2 class="pt-4" id="{{ letter }}">{{ letter }}</h2>

<dl id="glossary-list">
{% for item in glossary %}
{%- assign x = item.name | slice: 0 | capitalize -%}
{%- if x == letter -%}
    <dt class="glossary-def"><div id="{{ item.key }}"><a href="{{ '/browse.html#' | append: item.key | relative_url }}">
    {{ item.name }}</a></div></dt> 
    {% if item.annotation %}<dd>- {{ item.annotation }}</dd>{%- endif -%}
{%- endif -%}
{%- endfor -%}
</dl>

{%- endfor -%}
</div>
