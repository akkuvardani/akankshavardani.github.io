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


{% for post in site.research reversed %}
  {% include archive-single.html %}
{% endfor %}


Work in Progress
===


Other work
===

{% for post in site.otherworks reversed %}
  {% include archive-single.html %}
{% endfor %}