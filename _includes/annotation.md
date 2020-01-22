{%- capture i -%}{{ include.id }}{%- endcapture -%}
{%- assign names = site.data.names | where: "id", i -%}

{%- for n in names -%}
<a href="#{{ n.id }}" data-toggle="tooltip" title="{{ n.text }}">{{ n.name }}</a>
{%- endfor -%}