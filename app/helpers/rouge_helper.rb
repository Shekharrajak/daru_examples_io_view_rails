require 'rouge'

module RougeHelper
  def rouge(source)
    source = source.sub(/(\A\s*\n|\n\s*\z)/, '')
    min_indent = source.split("\n").reject { |l| l.strip.empty? }.map { |l| l.scan(/^(\s*)/).flatten.first.length }.min
    source = source.gsub(/^\s{#{min_indent}}/, '')

    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexers::Ruby.new
    result = '<div class="highlight"><pre>' + formatter.format(lexer.lex(source)) + '</pre></div>'
    result.respond_to?(:html_safe) ? result.html_safe : result
  end
end
