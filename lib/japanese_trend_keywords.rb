# coding: utf-8
require 'active_support'
require 'active_support/core_ext'
require "japanese_trend_keywords/version"
require 'open-uri'
require 'nokogiri'
require 'yaml'

module JapaneseTrendKeywords
  class JapaneseTrendKeywords
    DEFAULT_NAME = :hatena
    RSS_CONFIGS = YAML.load_file(File.expand_path('../services.yaml', __FILE__))

    def get(name)
      name = DEFAULT_NAME if name.nil?
      config = RSS_CONFIGS[name]
      generateGetResult(name, config[:url], config[:xpath])
    end

    def getAll
      RSS_CONFIGS.map{|key, value| self.get(key)}
    end

    private

    def generateGetResult(name, url, xpath)
      doc = getDocument(url)
      {
        :name => name,
        :title => getByXPath(doc, xpath[:title])[0],
        :url => url,
        :keywords => getByXPath(doc, xpath[:item]),
      }
    end

    def getDocument(url)
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
      Nokogiri::HTML.parse(html, nil, charset)
    end

    def getByXPath(doc, xpath)
      doc.xpath(xpath).map{|item| item.inner_html}
    end
  end
end
