---
title: Letters
layout: page
permalink: letters.html
---

# Letters

{% assign fields = site.data.config-table | map: 'display_name' %}
<div class="table-responsive-md">
    <table id="item-table" class="table table-striped">
        <thead>
            <tr>
                {% for f in fields %}
                <th scope="col">{{ f }}</th>
                {% endfor %}
                <th>Link</th>
            </tr>
        </thead>
    </table>
</div>