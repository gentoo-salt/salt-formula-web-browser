{% if grains['os'] == 'Gentoo' %}

{% set license_file = '/etc/portage/package.license/all' %}

{% for item in [{'www-client/google-chrome':'google-chrome','www-client/vivaldi':'Vivaldi','www-client/opera':'OPERA-2014'}] %}
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
