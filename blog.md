---
layout: default
---
<div class="home">
  {%- if page.title -%}
    <h1 class="page-heading">{{ page.title }}</h1>
  {%- endif -%}

{%- if site.posts.size > 0 -%}
  <h2 class="cím">{{ page.list_title | default: "Posts" }}</h2>
  <div style="display:flex; flex-direction: column; flex-wrap: wrap; margin:1rem 20rem; border:solid; border-radius: 20px;">
    {%- for post in site.posts -%}
      <div class="post" style="flex-grow:1 ; font-size: 20px; border:solid;border-radius: 10px;margin:1rem; padding: 1rem;" onclick="window.location='{{ post.url | relative_url }}';">
          <div style="display: flex; align-items: center;">
            <div style="padding-right: 1rem;">
              <div style="padding: 0 1rem;">{%- if post.thumbnail -%}<img style="width: 20rem; height: 20rem;" src="{{- post.thumbnail | relative_url -}}" width="50px">{%- else -%}<img style="width: 20rem; height: 20rem;" src="/assets/images/pfwlogo-darkgray.png" width="50px">{%- endif -%}</div>
            </div>
            <div style="font-size: 5rem;">{{ post.title | escape }}</div>
          </div>
          {%- assign date_format = site.minima.date_format | default: "%Y. %b. %-d." -%}
          <div style="display: flex; align-items: center;">
            <div> {{ post.date | date: date_format }} {{ post.author}}</div>
            <div style="padding: 0 1rem;">{%- if post.author_img -%}<img style="border-radius: 2rem;" src="{{- post.author_img | relative_url -}}" width="50px">{%- else -%}<img style="border-radius: 2rem;" src="/assets/images/harcipan_ins_logo.jpg" width="50px">{%- endif -%}</div>
          </div>
        <div style="font-size: 1rem;">
          {{post.tags}}
        </div>
      </div>
      {%- if site.show_excerpts -%}
        {{ post.excerpt }}
      {%- endif -%}
    {%- endfor -%}
  {%- endif -%}
</div>
</div>