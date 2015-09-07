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
    def translate(params = {})
      dic = "#{params[:from] || 'en'}#{params[:to]}"
      word = params[:word]
      
      response = attempt(3, 3) {
        open("http://www.wordreference.com/#{dic}/#{URI::encode(word)}",
             'User-Agent' => 'Mozilla/5.0 (X11; Linux i686; rv:10.0) Gecko/20100101 Firefox/10.0').read
      }
      doc = Nokogiri::HTML(response)
      first_trans = doc.css("tr[id^='#{dic}:']").first
      return nil if first_trans.nil?
      first_trans.css('td[class="ToWrd"] > text()').to_s.strip
    end
  end

end
