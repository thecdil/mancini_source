{%- capture i -%}{{ include.id }}{%- endcapture -%}
{%- assign names = site.data.annotations | where: "id", i -%}

{%- for n in names -%}
<a href="#{{ n.id }}" data-toggle="tooltip" title="{{ n.text }}">[{{ include.no }}]</a>
{%- endfor -%}