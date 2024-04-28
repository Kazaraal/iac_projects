Role Name
=========

This is a minimal Nginx test server.

Role Variables
--------------

roles/nginx-role/vars/main.yml: Custom directory for Nginx installation

## defaults/main.yml
nginx_version: Specific version of nginx to install (latest version at the time)
nginx_custom_directory: Custom directory for Nginx installation

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      become: true
      roles:
         - nginx-role

License
-------

Apache-2.0

Author Information
------------------

Ken