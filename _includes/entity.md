{%- capture t -%}{{ include.type }}{%- endcapture -%}
{%- capture l -%}{{ include.letter }}{%- endcapture -%}
{%- assign entities = site.data.entities | where: "type", t -%}
{%- for e in entities -%}
{%- if e.letter == l -%}
{{ e.code }}
{% endif %}
{%- endfor -%}