{% if grains['os'] == 'Gentoo' %}

{% set license_file = '/etc/portage/package.accept_keywords/all' %}

{% for item in [{'www-client/google-chrome-beta':'google-chrome','www-client/vivaldi':'Vivaldi'}] %}
{% for pkg, license in item.iteritems() %}
{{ pkg }}:
  file.replace:
    - name: {{ license_file }}
    - pattern: .*{{ pkg }}.*
    - repl: {{ pkg }} {{ license }}
    - append_if_not_found: True
{% endfor %}
{% endfor %}

{% endif %}
