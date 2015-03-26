# coding: utf-8
require 'active_support'
require 'active_support/core_ext'
require "japanese_trend_keywords/version"
require 'open-uri'

module JapaneseTrendKeywords
  class JapaneseTrendKeywords
    DEFAULT_NAME = :hatena
    RSS_URLS = {
      hatena: {url: 'http://d.hatena.ne.jp/hotkeyword?mode=rss', path: ['RDF', 'item']},
      yahoo_burst: {url: 'http://searchranking.yahoo.co.jp/rss/burst_ranking-rss.xml', path: ['rss', 'channel', 'item']},
    }.freeze

    def get(name)
      name = DEFAULT_NAME if name.nil?
      generateGetResult(name, RSS_URLS[name][:url], RSS_URLS[name][:path])
    end

    def getAll
      RSS_URLS.map{|key, value| self.get(key)}
    end

    private

    def generateGetResult(name, url, path)
      {
        :name => name,
        :url => url,
        :keywords => convertIntoKeywords(getRss(url), path),
      }
    end

    def getRss(uri)
      Hash.from_xml open(uri).read
    end

    def convertIntoKeywords(hash, path)
      items = hash
      path.each do |i|
        items = items[i]
      end
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
