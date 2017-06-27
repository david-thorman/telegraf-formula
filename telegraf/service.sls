{% from "telegraf/map.jinja" import telegraf with context %}

telegraf-service:
  service.{{ "running" if telegraf.enabled else "dead" }}:
    - name: telegraf
    - enable: {{ telegraf.enabled }}
    - watch:
      - sls: telegraf.install
      - sls: telegraf.config
    - require:
      - sls: telegraf.install
      - sls: telegraf.config
