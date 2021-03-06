# coding: utf-8
require 'active_support'
require 'active_support/core_ext'
require "japanese_trend_keywords/version"
require 'kconv'
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
      generateGetResult(name, config[:url], config[:xpath], config[:split])
    end

    def getAll
      RSS_CONFIGS.map{|key, value| self.get(key)}
    end

    private

    def generateGetResult(name, url, xpath, split)
      doc = getDocument(url)
      {
        :name => name,
        :title => getByXPath(doc, xpath[:title])[0],
        :url => url,
        :keywords => getKeywords(doc, xpath[:item], split),
      }
    end

    def getDocument(url)
      html = open(url, "r:binary").read
      Nokogiri::HTML.parse(html.toutf8.gsub(/\xEF\xBB\xBF|\xEF\xBF\xBE/,""), nil, "utf-8")
    end

    def getByXPath(doc, xpath)
      doc.xpath(xpath).map{|item| item.inner_html}
    end

    def getKeywords(doc, xpath, split)
      doc.xpath(xpath).map{|item|
        keyword = item.inner_html
        unless split.nil? || split[:index].nil? || split[:index].nil?
            keyword = keyword.split(split[:pattern])[split[:index]]
        end
        keyword.strip
      }
    end
  end
end
