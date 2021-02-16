# Basic Encoding Rules for LDAP

The Basic Encoding Rules ([BER](https://ldapwiki.com/wiki/Basic%20Encoding%20Rules)) are a set of [Abstract Syntax Notation One](https://ldapwiki.com/wiki/Abstract%20Syntax%20Notation%20One) 
encoding rules that define a specific way in which information may be encoded in a binary form. 

This gem contains the _BER_ core extensions from [ruby-net-ldap](https://github.com/ruby-ldap/ruby-net-ldap/tree/master/lib/net/ber/core_ext) 
refactored into refinements for use in the [rom-ldap](https://gitlab.com/peterdavidhamilton/rom-ldap) gem and the accompanying TestUnit tests have been rewritten in Rspec.

I would like to thank the authors of `NET::LDAP` for their continued work.
