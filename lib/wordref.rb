# -*- encoding : utf-8 -*-
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
#  Copyright (C) 2004 Sam Hocevar
#  14 rue de Plaisance, 75014 Paris, France
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#
#
#  David Hagege <david.hagege@gmail.com>
#

require "wordref/version"
require 'open-uri'
require 'multi_json'
require 'attempt'
require 'nokogiri'

module Wordref
  class Wordref
    class InvalidLangFormat < ArgumentError; end;

    def translate(params = {})
      if !accepted_langs.keys.include?(params[:from] + params[:to])
        raise InvalidLangFormat,
          "Invalid chosen language (#{params[:from]} / #{params[:to]}).\n" +
          "Accepted langs are:\n" + accepted_langs.to_s
      end

      dic = "#{params[:from] || 'en'}#{params[:to]}"
      word = params[:word]

      response = attempt(tries: 3, interval: 3) {
        open("http://www.wordreference.com/#{dic}/#{URI::encode(word)}",
             'User-Agent' => 'Mozilla/5.0 (X11; Linux i686; rv:10.0) Gecko/20100101 Firefox/10.0').read
      }
      doc = Nokogiri::HTML(response)
      first_trans = doc.css("tr[id^='#{dic}:']").first
      return nil if first_trans.nil?
      first_trans.css('td[class="ToWrd"] > text()').to_s.strip
    end

    private 
    def accepted_langs
      {
        "enes" => "English-Spanish",
        "esen" => "Spanish-English",
        "esfr" => "Spanish-French",
        "espt" => "Spanish-Portuguese",
        "enfr" => "English-French",
        "fren" => "French-English",
        "fres" => "French-Spanish",
        "enit" => "English-Italian",
        "iten" => "Italian-English",
        "ende" => "English-German",
        "deen" => "German-English",
        "ensv" => "English-Swedish",
        "sven" => "Swedish-English",
        "enru" => "English-Russian",
        "ruen" => "Russian-English",
        "enpt" => "English-Portuguese",
        "pten" => "Portuguese-English",
        "ptes" => "Portuguese-Spanish",
        "enpl" => "English-Polish",
        "plen" => "Polish-English",
        "enro" => "English-Romanian",
        "roen" => "Romanian-English",
        "encz" => "English-Czech",
        "czen" => "Czech-English",
        "engr" => "English-Greek",
        "gren" => "Greek-English",
        "entr" => "English-Turkish",
        "tren" => "Turkish-English",
        "enzh" => "English-Chinese",
        "zhen" => "Chinese-English",
        "enja" => "English-Japanese",
        "jaen" => "Japanese-English",
        "enko" => "English-Korean",
        "koen" => "Korean-English",
        "enar" => "English-Arabic",
        "aren" => "Arabic-English"
      }
    end

  end
end
