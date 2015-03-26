# coding: utf-8
require 'active_support'
require 'active_support/core_ext'
require "japanese_trend_keywords/version"
require 'open-uri'
require 'yaml'

module JapaneseTrendKeywords
  class JapaneseTrendKeywords
    DEFAULT_NAME = :hatena
    RSS_CONFIGS = YAML.load_file(File.expand_path('../services.yaml', __FILE__))

    def get(name)
      name = DEFAULT_NAME if name.nil?
      config = RSS_CONFIGS[name]
      generateGetResult(name, config[:url], config[:path])
    end

    def getAll
      RSS_CONFIGS.map{|key, value| self.get(key)}
    end

    private

    def generateGetResult(name, url, path)
      rss = getRss(url)
      {
        :name => name,
        :title => convertIntoTitle(rss, path[:title]),
        :url => url,
        :keywords => convertIntoKeywords(rss, path[:item]),
      }
    end

    def getRss(uri)
      Hash.from_xml open(uri).read
    end

    def convertIntoTitle(hash, path)
      title = hash
      path.each do |i|
        title = title[i]
      end
      title
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
