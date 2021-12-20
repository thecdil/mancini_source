map tabs

<div class="container mt-4">

    {{ content }}

    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="locations-tab" data-toggle="tab" href="#locations" role="tab" aria-controls="locations" aria-selected="true">Locations</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="origins-tab" data-toggle="tab" href="#origins" role="tab" aria-controls="origins" aria-selected="false">Letter Origins</a>
        </li>
    </ul>
    <div class="tab-content my-3">
        <div id="locations" class="tab-pane fade show active" role="tabpanel" aria-labelledby="locations-tab">
            <h2>Locations Mentioned in Marie's Letters</h2>
            <p>Marie refers to several locations in her letters. Explore them below.</p>
            <div id="map" class="mb-4"></div>
        </div>
    
        <div id="origins" class="tab-pane fade show active" role="tabpanel" aria-labelledby="origins-tab">
            <h2>Origins of Marie's Letters</h2>
            <p>Where was Marie over the years she wrote these letters? Filter by date using the checkboxes on the map below.</p>
            <div id="newmap" class="mb-4"></div>
        </div>
    </div>

</div>

---

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


{% include tag.md type="strike" text="scel" %}
{% include entity.md type="grave" letter="i" %}

            {% for part in site.parts %}
            {% if part.letter == page.letter and part.section == 'a' %}
            {{ part.content }}
            {% endif %}
            {% endfor %}