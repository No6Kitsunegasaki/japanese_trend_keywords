# encoding: utf-8
require 'test/unit'
require 'test/unit/rr'
require 'japanese_trend_keywords'

class TestJapaneseTrendKeywords < Test::Unit::TestCase
  def setup
    base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
    test_dir = File.join(base_dir, "test")

    @Dummy0Path = test_dir + '/dummy0.xml'
    @Dummy1Path = test_dir + '/dummy1.xml'
    @Dummy2Path = test_dir + '/dummy2.xml'

    JapaneseTrendKeywords::JapaneseTrendKeywords.const_set(:DEFAULT_NAME, :testname1)
    JapaneseTrendKeywords::JapaneseTrendKeywords.const_set(:RSS_URLS, {
      :testname0 => @Dummy0Path,
      :testname1 => @Dummy1Path,
      :testname2 => @Dummy2Path,
    })
    @JTK = JapaneseTrendKeywords::JapaneseTrendKeywords.new
  end

  def test_get
    name = nil
    expected = {
      :name => :testname1,
      :url => @Dummy1Path,
      :keywords => ["アイテムタイトルdummy1"],
    }
    result = @JTK.get(name)
    assert(result.instance_of?(Hash), "Should be Hash")
    assert_equal(expected[:name], result[:name], "Should have got correctoly")
    assert_equal(expected[:url], result[:url], "Should have got correctoly")
    assert_equal(expected[:keywords], result[:keywords], "Should have got correctoly")

    name = :testname0
    expected = {
      :name => name,
      :url => @Dummy0Path,
      :keywords => [],
    }
    result = @JTK.get(name)
    assert(result.instance_of?(Hash), "Should be Hash")
    assert_equal(expected[:name], result[:name], "Should have got correctoly")
    assert_equal(expected[:url], result[:url], "Should have got correctoly")
    assert_equal(expected[:keywords], result[:keywords], "Should have got correctoly")

    name = :testname1
    expected = {
      :name => name,
      :url => @Dummy1Path,
      :keywords => ["アイテムタイトルdummy1"],
    }
    result = @JTK.get(name)
    assert(result.instance_of?(Hash), "Should be Hash")
    assert_equal(expected[:name], result[:name], "Should have got correctoly")
    assert_equal(expected[:url], result[:url], "Should have got correctoly")
    assert_equal(expected[:keywords], result[:keywords], "Should have got correctoly")

    name = :testname2
    expected = {
      :name => name,
      :url => @Dummy2Path,
      :keywords => ["アイテムタイトルdummy2-1","アイテムタイトルdummy2-2"],
    }
    result = @JTK.get(name)
    assert(result.instance_of?(Hash), "Should be Hash")
    assert_equal(expected[:name], result[:name], "Should have got correctoly")
    assert_equal(expected[:url], result[:url], "Should have got correctoly")
    assert_equal(expected[:keywords], result[:keywords], "Should have got correctoly")
  end

  def test_getAll
    result = @JTK.getAll
    expected = [
      {
        :name => :testname0,
        :url => @Dummy0Path,
        :keywords => [],
      },
      {
        :name => :testname1,
        :url => @Dummy1Path,
        :keywords => ["アイテムタイトルdummy1"],
      },
      {
        :name => :testname2,
        :url => @Dummy2Path,
        :keywords => ["アイテムタイトルdummy2-1","アイテムタイトルdummy2-2"],
      },
    ]
    assert(result.instance_of?(Array), "Should be Array")
    assert_equal(expected.size, result.size, "Should have got correctoly")
    assert(result[0].instance_of?(Hash), "Should be Hash")
    assert_equal(expected[0][:name], result[0][:name], "Should have got correctoly")
    assert_equal(expected[0][:url], result[0][:url], "Should have got correctoly")
    assert_equal(expected[0][:keywords], result[0][:keywords], "Should have got correctoly")
    assert(result[1].instance_of?(Hash), "Should be Hash")
    assert_equal(expected[1][:name], result[1][:name], "Should have got correctoly")
    assert_equal(expected[1][:url], result[1][:url], "Should have got correctoly")
    assert_equal(expected[1][:keywords], result[1][:keywords], "Should have got correctoly")
    assert(result[2].instance_of?(Hash), "Should be Hash")
    assert_equal(expected[2][:name], result[2][:name], "Should have got correctoly")
    assert_equal(expected[2][:url], result[2][:url], "Should have got correctoly")
    assert_equal(expected[2][:keywords], result[2][:keywords], "Should have got correctoly")
  end

  def teardown
    @JTK = nil
  end
end
