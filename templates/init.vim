call plug#begin()
" Generic plugins
{% for plugin in nvim_plugins %}
{% if plugin is mapping %}
  Plug '{{ plugin.name }}', {{ plugin.options | to_json | replace("\"", "'") }}
{% else %}
  Plug '{{ plugin }}'
{% endif %}
{% endfor %}
" Nvim exclusive plugins
if has('nvim')
{% for plugin in exclusive_nvim_plugins %}
{% if plugin is mapping %}
  Plug '{{ plugin.name }}', {{ plugin.options | to_json | replace("\"", "'") }}
{% else %}
  Plug '{{ plugin }}'
{% endif %}
{% endfor %}
else
" Vim exclusive plugins
{% for plugin in exclusive_vim_plugins %}
{% if plugin is mapping %}
  Plug '{{ plugin.name }}', {{ plugin.options | to_json | replace("\"", "'") }}
{% else %}
  Plug '{{ plugin }}'
{% endif %}
{% endfor %}
endif
call plug#end()
" Configuration
{{ nvim_configuration }}
if has('nvim')
" Nvim exclusive configuration
{{ exclusive_nvim_configuration }}
else
" Vim exclusive configuration
{{ exclusive_vim_configuration }}
endif
