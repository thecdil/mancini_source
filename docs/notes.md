alternative call for images on letter layout:

{%- assign images = site.data.mancini | where: 'title', page.title -%}

{{ images }}

{% for i in images %}
<img src="{{ i.page01 | prepend: '/assets/letters/' | append: '.jpg' | relative_url }}" alt="Enlace al facsímil" style="display:inline-block; margin-bottom:-3px;">
{% endfor %}


.title {
  text-align: left;
  position: absolute;
  top: 50%;
  left: 30%;
  transform: translate(-50%, -50%);
  color: white;
  font-family: 'Merienda One', cursive;
}
</style>

<div class="title">
    <h1 class="display-4">The Letters of</h1>
    <h1 class="display-3">Marie Mancini</h1>
    <div class="mt-4">
        <a href="letters.html" role="button" class="btn btn-lg btn-outline-light mx-2">Letters</a>
        <a href="about.html" role="button" class="btn btn-lg btn-outline-light mx-2">About</a>
    </div>
</div>