{% if grains['os'] == 'Gentoo' %}

include:
  - web-browser.deps

{% set keywords_file = '/etc/portage/package.accept_keywords/all' %}

{% for pkg in 'www-client/google-chrome-beta','www-client/firefox','www-client/opera','www-client/vivaldi' %}
keyword-{{ pkg }}:
  file.replace:
    - name: {{ keywords_file }}
    - pattern: .*{{ pkg }}.*
    - repl: {{ pkg }}
    - append_if_not_found: True

package-{{ pkg }}:
  pkg.installed:
    - name: {{ pkg }}
    - version: latest

{% endfor %}

{% endif %}
