---
layout: default
---

<div class="home">
  {%- if page.title -%}
    <h1 class="page-heading">{{ page.title }}</h1>
  {%- endif -%}

  {%- if site.posts.size > 0 -%}
  <h2 class="cím">{{ page.list_title | default: "Posts" }}</h2>
  <div style="display:flex; flex-direction: column; flex-wrap: wrap; border:solid;border-radius: 20px;">
    {%- for post in site.posts -%}
      {% include postsList.html %}
    {%- endfor -%}
  {%- endif -%}

</div>
</div>