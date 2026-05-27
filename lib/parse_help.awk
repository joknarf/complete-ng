#!/usr/bin/gawk -f

# Generic help parser (GNU/Linux/git/etc.)
# Output:
# option<TAB>arg, description

function trim(s) {
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", s)
    return s
}

function norm(s) {
    gsub(/[[:space:]]+/, " ", s)
    return trim(s)
}

########################################################################
# Split one option into:
#   RET_OPT = option only
#   RET_ARG = optional argument
########################################################################
function split_optarg(s,    m,opt,arg) {
    s = trim(s)
    opt = s
    arg = ""

    # --name[=ARG]
    if (match(s, /^(--[^[:space:]=]+)(\[=.*\])$/, m)) {
        opt = m[1]; arg = m[2]
    }

    # --name=ARG
    else if (match(s, /^(--[^[:space:]=]+)(=.*)$/, m)) {
        opt = m[1]; arg = m[2]
    }

    # --name ARG
    else if (match(s, /^(--[^[:space:]]+)[[:space:]]+(.+)$/, m)) {
        opt = m[1]; arg = m[2]
    }

    # -x ARG
    else if (match(s, /^(-[[:alnum:]])[[:space:]]+(.+)$/, m)) {
        opt = m[1]; arg = m[2]
    }

    # -xARG
    else if (match(s, /^(-[[:alnum:]])(.+)$/, m) && s !~ /^-[[:alnum:]]$/) {
        opt = m[1]; arg = m[2]
    }

    RET_OPT = trim(opt)
    RET_ARG = norm(arg)
}

########################################################################
function print_pair(opt,arg,desc, txt) {
    txt = desc

    if (arg != "") {
        if (txt != "")
            txt = arg ", " txt
        else
            txt = arg
    }

    if (! opts)
      print opt "\t" txt
    if (opt in a_opts) {
      print a_opts[opt] "\t" txt
      a_done[opt] = 1
    }
}

########################################################################
function emit(opt,desc, a,b) {
    opt = trim(opt)

    if (opt ~ /\[no-\]/) {
        a = opt
        gsub(/\[no-\]/, "", a)
        split_optarg(a)
        print_pair(RET_OPT, RET_ARG, desc)

        b = opt
        sub(/\[no-\]/, "no-", b)
        split_optarg(b)
        print_pair(RET_OPT, RET_ARG, desc)
    } else {
        split_optarg(opt)
        print_pair(RET_OPT, RET_ARG, desc)
    }
}

########################################################################
function flush(   i,n) {
    if (!pending)
        return

    desc = norm(desc)

    n = split(optblock, arr, /,[[:space:]]*/)

    for (i = 1; i <= n; i++)
        emit(arr[i], desc)

    pending = 0
    optblock = ""
    desc = ""
}

BEGIN {
    pending = 0
}

NR==1 {
    split(opts, t)
    for(i in t) a_opts[gensub("=$","",1,t[i])] = t[i]
}

END {
   for (i in a_opts) if (!(i in a_done)) print a_opts[i]
}

########################################################################
# OPTION LINE
#
# Important fix:
# split only if whitespace block is followed by NON-DASH text
# so:
#   -m, --message <msg>
# does NOT split inside "-m, --message"
########################################################################
/^[[:space:]]+-/ {

    flush()

    line = $0
    sub(/^[[:space:]]+/, "", line)

    if (match(line, /[[:space:]]{2,}[^-[:space:]]/)) {
        optblock = substr(line, 1, RSTART - 1)
        desc     = substr(line, RSTART + RLENGTH - 1)
    } else {
        optblock = line
        desc = ""
    }

    pending = 1
    next
}

########################################################################
# CONTINUATION DESCRIPTION
########################################################################
pending && /^[[:space:]]+/ {

    line = trim($0)

    # ignore headers
    if (line !~ /^-/) {
        if (desc != "")
            desc = desc " " line
        else
            desc = line
    }

    next
}

END {
    flush()
}

