alternative call for images on letter layout:

{%- assign images = site.data.mancini | where: 'title', page.title -%}

{{ images }}

{% for i in images %}
<img src="{{ i.page01 | prepend: '/assets/letters/' | append: '.jpg' | relative_url }}" alt="Enlace al facsímil" style="display:inline-block; margin-bottom:-3px;">
{% endfor %}