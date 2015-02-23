# coding: utf-8
require 'active_support'
require 'active_support/core_ext'
require "japanese_trend_keywords/version"
require 'open-uri'

module JapaneseTrendKeywords
  class JapaneseTrendKeywords
    DEFAULT_NAME = :hatena
    RSS_URLS = {
      :hatena => 'http://d.hatena.ne.jp/hotkeyword?mode=rss',
    }.freeze

    def get(name)
      name = DEFAULT_NAME if name.nil?
      generateGetResult(name, RSS_URLS[name])
    end

    def getAll
      RSS_URLS.map{|key, value| self.get(key)}
    end

    private

    def generateGetResult(name, url)
      {
        :name => name,
        :url => url,
        :keywords => convertIntoKeywords(getRss(url)),
      }
    end

    def getRss(uri)
      Hash.from_xml open(uri).read
    end

    def convertIntoKeywords(hash)
      items = hash['RDF']['item']
      if items.blank?
        []
      elsif items.instance_of?(Hash)
        [items['title']]
      elsif items.instance_of?(Array)
        items.map{|item| item['title']}
      end
    end
  end
end
