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

require 'wordref'

describe Wordref do
  it "can translate the word car in french" do
    tr = Wordref::Wordref.new
    expect(tr.translate(from: 'en', to: 'fr', word: 'car')).to eq("voiture")
  end
end