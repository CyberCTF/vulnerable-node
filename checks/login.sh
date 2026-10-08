#!/bin/sh
# A lab account (alice) logs in against PostgreSQL: the login form redirects to the shop, where a
# failed login redirects back to /login with the error.
curl -sS -o /dev/null -w '%{redirect_url}' -X POST -d 'username=alice&password=alice123' \
  http://web:3000/login/auth | grep -qv '/login'
