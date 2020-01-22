{%- capture test -%}{{ include.id }}{%- endcapture -%}
{%- assign names = site.data.names | where: "id", test -%}

{%- for n in names -%}
<a href="#{{ n.id }}" data-toggle="tooltip" title="{{ n.text }}">{{ n.name }}</a>
{%- endfor -%}