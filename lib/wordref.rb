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

module Wordref

  class Wordref
    def initialize(api_key)
      @api_key = api_key
    end

    def translate(params = {})
      dic = "#{params[:from] || 'en'}#{params[:to]}"
      word = params[:word]
      
      response = attempt(3, 3) {
        open("http://api.wordreference.com/#{@api_key}/json/#{dic}/#{URI::encode(word)}").read
      }
      response.gsub!(/\t/, ' ')
      json = MultiJson.load(response)['term0']
      return "" if json.nil?
      data = json['PrincipalTranslations'] || json['Entries']
      data.first[1]['FirstTranslation']['term']
    end
  end

end
