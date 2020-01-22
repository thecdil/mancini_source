{%- capture t -%}{{ include.type }}{%- endcapture -%}
{%- assign tag = site.data.tags | where: "type", t -%}

{%- for t in tag -%}
<{{ t.tag }}>{{ include.text }}</{{ t.tag }}>
{%- endfor -%}
