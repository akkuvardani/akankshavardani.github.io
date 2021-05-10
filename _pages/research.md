---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

Below is a list of recent research work.

Publications
---

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}


<!-- Working Papers
---

{% for post in site.workingpapers reversed %}
  {% include archive-single.html %}
{% endfor %} -->


Work in Progress
---

<b> The Dynamics of Conflict </b>, with [Duarte Gonçalves](https://duartegoncalves.com)


Other work
---

{% for post in site.otherworks reversed %}
  {% include archive-single.html %}
{% endfor %}