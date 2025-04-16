package security_context

default allow = false

allow { input.user_id != 0; input.group_id == 0 }

violations["root_user"] { input.user_id == 0 }
violations["non_zero_group"] { input.group_id != 0 }