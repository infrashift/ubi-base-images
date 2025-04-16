package openshift

default allow = false

allow { input.user_id != 0; input.privileged == false; count(input.capabilities) == 0 }

violations["root_user"] { input.user_id == 0 }
violations["privileged"] { input.privileged == true }
violations["extra_capabilities"] { count(input.capabilities) > 0 }