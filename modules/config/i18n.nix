{ pkgs, ... }:
{
  environment.pathsToLink = [ "/share/skk" ];

  environment.systemPackages = with pkgs.skkDictionaries; [
    # ── Standard dictionary ───────────────────────────────────────────────────
    # Ref: https://skk-dev.github.io/dict/
    l # SKK-JISYO.L - the largest general-purpose dictionary

    # ── Specialized dictionaries ──────────────────────────────────────────────
    # Ref: https://skk-dev.github.io/dict/
    jinmei # SKK-JISYO.jinmei - Japanese personal names
    fullname # SKK-JISYO.fullname - full names of individuals in newspapers
    geo # SKK-JISYO.geo - Japanese place names and locations
    propernoun # SKK-JISYO.propernoun - proper nouns (excluding names and places)
    station # SKK-JISYO.station - railway station names and terminology
    law # SKK-JISYO.law - legal terminology
    okinawa # SKK-JISYO.okinawa - Okinawan dialect and terminology
    china_taiwan # SKK-JISYO.china_taiwan - Chinese and Taiwanese place names
    zipcode # postal codes
    jis2 # SKK-JISYO.JIS2 - JIS X 0208 character set
    jis3_4 # SKK-JISYO.JIS3_4 - JIS X 0213 character set
    jis2004 # SKK-JISYO.JIS2004 - JIS X 0213:2004 character set
    itaiji # SKK-JISYO.itaiji - variant character conversion dictionary
    itaiji_jis3_4 # SKK-JISYO.itaiji.JIS3_4 - variant characters for JIS X 0213
    mazegaki # SKK-JISYO.mazegaki - mixed kanji/kana writing dictionary

    # ── Emoji dictionary ──────────────────────────────────────────────────────
    # Ref: https://github.com/ymrl/SKK-JISYO.emoji-ja
    emoji # Emoji input via SKK
  ];
}
