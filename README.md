# Basic Encoding Rules for LDAP

The Basic Encoding Rules (BER) are a set of Abstract Syntax Notation One encoding rules that define a specific way in which information may be encoded in a binary form. It is used as the underlying mechanism for encoding message.


transactions

https://tools.ietf.org/html/rfc5805

'1.3.6.1.1.21.1'




## Common Types

source: [http://www.zytrax.com/books/ldap/apa/types.html#binary]

- **IA5String - 1.3.6.1.4.1.1466.115.121.1.26**
  IA5 (almost ASCII) character set (7-bit).
  Does NOT allow extended characters e.g. é, Ø, å etc.

- **DirectoryString - 1.3.6.1.4.1.1466.115.121.1.15**
  UTF-8 encoding of ISO-10646 (Unicode) - a variable byte encoding system that includes IA5/ASCII as a subset - grubby details.
  DOES include extended characters e.g. é, Ø, å etc.
  Allows matchingRules of `caseIgnoreMatch` and `caseIgnoreSubstringsMatch`.

- **PrintableString - 1.3.6.1.4.1.1466.115.121.1.44**
  IA5 (almost ASCII) string but limited to characters defined in RFC 2252 section 4.1 production p.
  Does NOT allow extended characters, for instance, é, Ø, å etc.
  Allows matchingRules of `caseIgnoreMatch` and `caseIgnoreSubstringsMatch`.

- **OctetString - 1.3.6.1.4.1.1466.115.121.1.40**
  Are treated as transparent 8-bit bytes.
  They may, or may not, be printable or human readable.
  Typically used by passwords.
  Allows matchingRules of `octetStringMatch` and `octetStringOrderingMatch`.

- **PostalAddress - 1.3.6.1.4.1.1466.115.121.1.41**
  A special format which uses UTF-8 encoding of ISO-10646 (Unicode) separated by '$' used for generating printable labels or other output.
  DOES allow extended characters e.g. é, Ø, å etc.
  Allows matchingRules of `caseIgnoreListMatch` and `caseIgnoreListSubstringsMatch`.

- **CountryString - 1.3.6.1.4.1.1466.115.121.1.11**
  Special field uses IA5 (almost ASCII) character set but limited to exactly two characters describing the ISO 3166 country code.
  Use friendlyCountryName if full country name required.
  Allows matchingRules of `caseIgnoreMatch` and `caseIgnoreSubstringsMatch`.

- **NumericString - 1.3.6.1.4.1.1466.115.121.1.36**
  Uses a numeric subset (RFC 2252 section 4.1 production d) of the IA5 (almost ASCII) character set.
  Allows matchingRules of `numericStringMatch` and `numericStringSubstringsMatch`.
