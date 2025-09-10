set shell := ["nu", "-c"]

[private]
default:
    just -l

test name:
    wollok test -f 'mensajeros.wtest' -t '{{name}}' --skipValidations

repl name:
    wollok repl '{{name}}.wlk'