---
title: People
layout: page
permalink: people.html
---

# People

{% capture letters %}{% for item in site.data.persname_tags %}{{ item.name | slice: 0 | capitalize }};{% endfor %}{% endcapture %}
{%- assign uniqueLetters = letters | split: ';' | uniq -%}
{%- assign glossary = site.data.persname_tags | sort: "name" -%}

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
    <dt class="glossary-def">{% if item.annotation %}<div id="{{ item.key }}"><a href="{{ '/browse.html#' | append: item.key | relative_url }}">
    {{ item.name }}</a></div>{% else %}{{ item.name }}{% endif %}</dt> 
    <dd>- {{ item.annotation }}</dd>
{%- endif -%}
{%- endfor -%}
</dl>

{%- endfor -%}
</div>
