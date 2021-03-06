
- hosts: all
#  gather_facts: true
  gather_facts: false
  connection: network_cli

  
  tasks:
  - name: Get Running Config
    block:
    - name: Get show running
      ios_command:
        commands: show running-config
      register: ios_cmd

#    - name: Gather facts (ios)
    - ios_facts:
#    - cisco.ios.ios_facts:
       when: ansible_network_os == 'ios'

    - name: copy Running config to backup folder
      copy:
        content: "{{ ios_cmd.stdout[0] }}"
        dest: "/tmp/{{ ansible_net_hostname }}.conf"
#        dest: "/etc/ansible/{{ lookup('env','PROJECT_NAME') }}/{{ ansible_net_hostname }}.conf"

#    - name: Add files to Git staging area, commit and push
#      shell: |
#        git add .
#        git commit -m "Configuration Backup"
#        git push origin
#      args:
#        chdir: "/etc/ansible/"
#      delegate_to: localhost
#      run_once: yes
   
#    - name: run show commands
#      ansible.netcommon.telnet:
#        user: admin
#        password: admin
#        login_prompt: 'Username: '
#        prompts:
#        - '[>#]'
#        command:
#        - terminal length 0
#        - show running-config
#        register: output
