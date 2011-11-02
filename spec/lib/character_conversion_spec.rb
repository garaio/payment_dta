require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'character_conversion'

CONVERSION_MAP_UTF8 = {
  32     => {:name => "SPACE", :convert_to => " "},
  33     => {:name => "EXCLAMATION MARK", :convert_to => "."},
  34     => {:name => "QUOTATION MARK", :convert_to => "."},
  35     => {:name => "NUMBER SIGN", :convert_to => "."},
  36     => {:name => "DOLLAR SIGN", :convert_to => "."},
  37     => {:name => "PERCENT SIGN", :convert_to => "."},
  38     => {:name => "AMPERSAND", :convert_to => "+"},
  39     => {:name => "APOSTROPHE", :convert_to => "'"},
  40     => {:name => "LEFT PARENTHESIS", :convert_to => "("},
  41     => {:name => "RIGHT PARENTHESIS", :convert_to => ")"},
  42     => {:name => "ASTERISK", :convert_to => "."},
  43     => {:name => "PLUS SIGN", :convert_to => "+"},
  44     => {:name => "COMMA", :convert_to => ","},
  45     => {:name => "HYPHEN-MINUS", :convert_to => "-"},
  46     => {:name => "FULL STOP", :convert_to => "."},
  47     => {:name => "SOLIDUS", :convert_to => "/"},
  48     => {:name => "DIGIT ZERO", :convert_to => "0"},
  49     => {:name => "DIGIT ONE", :convert_to => "1"},
  50     => {:name => "DIGIT TWO", :convert_to => "2"},
  51     => {:name => "DIGIT THREE", :convert_to => "3"},
  52     => {:name => "DIGIT FOUR", :convert_to => "4"},
  53     => {:name => "DIGIT FIVE", :convert_to => "5"},
  54     => {:name => "DIGIT SIX", :convert_to => "6"},
  55     => {:name => "DIGIT SEVEN", :convert_to => "7"},
  56     => {:name => "DIGIT EIGHT", :convert_to => "8"},
  57     => {:name => "DIGIT NINE", :convert_to => "9"},
  58     => {:name => "COLON", :convert_to => ":"},
  59     => {:name => "SEMICOLON", :convert_to => "."},
  60     => {:name => "LESS-THAN SIGN", :convert_to => "."},
  61     => {:name => "EQUALS SIGN", :convert_to => "."},
  62     => {:name => "GREATER-THAN SIGN", :convert_to => "."},
  63     => {:name => "QUESTION MARK", :convert_to => "?"},
  64     => {:name => "COMMERCIAL AT", :convert_to => "."},
  65     => {:name => "LATIN CAPITAL LETTER A", :convert_to => "A"},
  66     => {:name => "LATIN CAPITAL LETTER B", :convert_to => "B"},
  67     => {:name => "LATIN CAPITAL LETTER C", :convert_to => "C"},
  68     => {:name => "LATIN CAPITAL LETTER D", :convert_to => "D"},
  69     => {:name => "LATIN CAPITAL LETTER E", :convert_to => "E"},
  70     => {:name => "LATIN CAPITAL LETTER F", :convert_to => "F"},
  71     => {:name => "LATIN CAPITAL LETTER G", :convert_to => "G"},
  72     => {:name => "LATIN CAPITAL LETTER H", :convert_to => "H"},
  73     => {:name => "LATIN CAPITAL LETTER I", :convert_to => "I"},
  74     => {:name => "LATIN CAPITAL LETTER J", :convert_to => "J"},
  75     => {:name => "LATIN CAPITAL LETTER K", :convert_to => "K"},
  76     => {:name => "LATIN CAPITAL LETTER L", :convert_to => "L"},
  77     => {:name => "LATIN CAPITAL LETTER M", :convert_to => "M"},
  78     => {:name => "LATIN CAPITAL LETTER N", :convert_to => "N"},
  79     => {:name => "LATIN CAPITAL LETTER O", :convert_to => "O"},
  80     => {:name => "LATIN CAPITAL LETTER P", :convert_to => "P"},
  81     => {:name => "LATIN CAPITAL LETTER Q", :convert_to => "Q"},
  82     => {:name => "LATIN CAPITAL LETTER R", :convert_to => "R"},
  83     => {:name => "LATIN CAPITAL LETTER S", :convert_to => "S"},
  84     => {:name => "LATIN CAPITAL LETTER T", :convert_to => "T"},
  85     => {:name => "LATIN CAPITAL LETTER U", :convert_to => "U"},
  86     => {:name => "LATIN CAPITAL LETTER V", :convert_to => "V"},
  87     => {:name => "LATIN CAPITAL LETTER W", :convert_to => "W"},
  88     => {:name => "LATIN CAPITAL LETTER X", :convert_to => "X"},
  89     => {:name => "LATIN CAPITAL LETTER Y", :convert_to => "Y"},
  90     => {:name => "LATIN CAPITAL LETTER Z", :convert_to => "Z"},
  91     => {:name => "LEFT SQUARE BRACKET", :convert_to => "."},
  92     => {:name => "REVERSE SOLIDUS", :convert_to => "."},
  93     => {:name => "RIGHT SQUARE BRACKET", :convert_to => "."},
  94     => {:name => "CIRCUMFLEX ACCENT", :convert_to => "."},
  95     => {:name => "LOW LINE", :convert_to => "."},
  96     => {:name => "GRAVE ACCENT", :convert_to => "."},
  97     => {:name => "LATIN SMALL LETTER A", :convert_to => "a"},
  98     => {:name => "LATIN SMALL LETTER B", :convert_to => "b"},
  99     => {:name => "LATIN SMALL LETTER C", :convert_to => "c"},
  100    => {:name => "LATIN SMALL LETTER D", :convert_to => "d"},
  101    => {:name => "LATIN SMALL LETTER E", :convert_to => "e"},
  102    => {:name => "LATIN SMALL LETTER F", :convert_to => "f"},
  103    => {:name => "LATIN SMALL LETTER G", :convert_to => "g"},
  104    => {:name => "LATIN SMALL LETTER H", :convert_to => "h"},
  105    => {:name => "LATIN SMALL LETTER I", :convert_to => "i"},
  106    => {:name => "LATIN SMALL LETTER J", :convert_to => "j"},
  107    => {:name => "LATIN SMALL LETTER K", :convert_to => "k"},
  108    => {:name => "LATIN SMALL LETTER L", :convert_to => "l"},
  109    => {:name => "LATIN SMALL LETTER M", :convert_to => "m"},
  110    => {:name => "LATIN SMALL LETTER N", :convert_to => "n"},
  111    => {:name => "LATIN SMALL LETTER O", :convert_to => "o"},
  112    => {:name => "LATIN SMALL LETTER P", :convert_to => "p"},
  113    => {:name => "LATIN SMALL LETTER Q", :convert_to => "q"},
  114    => {:name => "LATIN SMALL LETTER R", :convert_to => "r"},
  115    => {:name => "LATIN SMALL LETTER S", :convert_to => "s"},
  116    => {:name => "LATIN SMALL LETTER T", :convert_to => "t"},
  117    => {:name => "LATIN SMALL LETTER U", :convert_to => "u"},
  118    => {:name => "LATIN SMALL LETTER V", :convert_to => "v"},
  119    => {:name => "LATIN SMALL LETTER W", :convert_to => "w"},
  120    => {:name => "LATIN SMALL LETTER X", :convert_to => "x"},
  121    => {:name => "LATIN SMALL LETTER Y", :convert_to => "y"},
  122    => {:name => "LATIN SMALL LETTER Z", :convert_to => "z"},
  123    => {:name => "LEFT CURLY BRACKET", :convert_to => "."},
  124    => {:name => "VERTICAL LINE", :convert_to => "."},
  125    => {:name => "RIGHT CURLY BRACKET", :convert_to => "."},
  126    => {:name => "TILDE", :convert_to => "."},
  127    => {:name => "CONTROL", :convert_to => ' '},
  194128 => {:name => "CONTROL", :convert_to => ' '},
  194129 => {:name => "CONTROL", :convert_to => ' '},
  194130 => {:name => "CONTROL", :convert_to => ' '},
  194131 => {:name => "CONTROL", :convert_to => ' '},
  194132 => {:name => "CONTROL", :convert_to => ' '},
  194133 => {:name => "CONTROL", :convert_to => ' '},
  194134 => {:name => "CONTROL", :convert_to => ' '},
  194135 => {:name => "CONTROL", :convert_to => ' '},
  194136 => {:name => "CONTROL", :convert_to => ' '},
  194137 => {:name => "CONTROL", :convert_to => ' '},
  194138 => {:name => "CONTROL", :convert_to => ' '},
  194139 => {:name => "CONTROL", :convert_to => ' '},
  194140 => {:name => "CONTROL", :convert_to => ' '},
  194141 => {:name => "CONTROL", :convert_to => ' '},
  194142 => {:name => "CONTROL", :convert_to => ' '},
  194143 => {:name => "CONTROL", :convert_to => ' '},
  194144 => {:name => "CONTROL", :convert_to => ' '},
  194145 => {:name => "CONTROL", :convert_to => ' '},
  194146 => {:name => "CONTROL", :convert_to => ' '},
  194147 => {:name => "CONTROL", :convert_to => ' '},
  194148 => {:name => "CONTROL", :convert_to => ' '},
  194149 => {:name => "CONTROL", :convert_to => ' '},
  194150 => {:name => "CONTROL", :convert_to => ' '},
  194151 => {:name => "CONTROL", :convert_to => ' '},
  194152 => {:name => "CONTROL", :convert_to => ' '},
  194153 => {:name => "CONTROL", :convert_to => ' '},
  194154 => {:name => "CONTROL", :convert_to => ' '},
  194155 => {:name => "CONTROL", :convert_to => ' '},
  194156 => {:name => "CONTROL", :convert_to => ' '},
  194157 => {:name => "CONTROL", :convert_to => ' '},
  194158 => {:name => "CONTROL", :convert_to => ' '},
  194159 => {:name => "CONTROL", :convert_to => ' '},
  194160 => {:name => "NO-BREAK SPACE", :convert_to => '.'},
  194161 => {:name => "INVERTED EXCLAMATION MARK", :convert_to => '.'},
  194162 => {:name => "CENT SIGN", :convert_to => '.'},
  194163 => {:name => "POUND SIGN", :convert_to => '.'},
  194164 => {:name => "CURRENCY SIGN", :convert_to => '.'},
  194165 => {:name => "YEN SIGN", :convert_to => '.'},
  194166 => {:name => "BROKEN BAR", :convert_to => '.'},
  194167 => {:name => "SECTION SIGN", :convert_to => '.'},
  194168 => {:name => "DIAERESIS", :convert_to => '.'},
  194169 => {:name => "COPYRIGHT SIGN", :convert_to => '.'},
  194170 => {:name => "FEMININE ORDINAL INDICATOR", :convert_to => '.'},
  194171 => {:name => "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK", :convert_to => '.'},
  194172 => {:name => "NOT SIGN", :convert_to => '.'},
  194173 => {:name => "SOFT HYPHEN", :convert_to => '.'},
  194174 => {:name => "REGISTERED SIGN", :convert_to => '.'},
  194175 => {:name => "MACRON", :convert_to => '.'},
  194176 => {:name => "DEGREE SIGN", :convert_to => '.'},
  194177 => {:name => "PLUS-MINUS SIGN", :convert_to => '.'},
  194178 => {:name => "SUPERSCRIPT TWO", :convert_to => '.'},
  194179 => {:name => "SUPERSCRIPT THREE", :convert_to => '.'},
  194180 => {:name => "ACUTE ACCENT", :convert_to => '.'},
  194181 => {:name => "MICRO SIGN", :convert_to => '.'},
  194182 => {:name => "PILCROW SIGN", :convert_to => '.'},
  194183 => {:name => "MIDDLE DOT", :convert_to => '.'},
  194184 => {:name => "CEDILLA", :convert_to => '.'},
  194185 => {:name => "SUPERSCRIPT ONE", :convert_to => '.'},
  194186 => {:name => "MASCULINE ORDINAL INDICATOR", :convert_to => '.'},
  194187 => {:name => "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK", :convert_to => '.'},
  194188 => {:name => "VULGAR FRACTION ONE QUARTER", :convert_to => '.'},
  194189 => {:name => "VULGAR FRACTION ONE HALF", :convert_to => '.'},
  194190 => {:name => "VULGAR FRACTION THREE QUARTERS", :convert_to => '.'},
  194191 => {:name => "INVERTED QUESTION MARK", :convert_to => '.'},
  195128 => {:name => "LATIN CAPITAL LETTER A WITH GRAVE", :convert_to => 'A'},
  195129 => {:name => "LATIN CAPITAL LETTER A WITH ACUTE", :convert_to => 'A'},
  195130 => {:name => "LATIN CAPITAL LETTER A WITH CIRCUMFLEX", :convert_to => 'A'},
  195131 => {:name => "LATIN CAPITAL LETTER A WITH TILDE", :convert_to => 'A'},
  195132 => {:name => "LATIN CAPITAL LETTER A WITH DIAERESIS", :convert_to => 'AE'},
  195133 => {:name => "LATIN CAPITAL LETTER A WITH RING ABOVE", :convert_to => 'A'},
  195134 => {:name => "LATIN CAPITAL LETTER AE", :convert_to => 'AE'},
  195135 => {:name => "LATIN CAPITAL LETTER C WITH CEDILLA", :convert_to => 'C'},
  195136 => {:name => "LATIN CAPITAL LETTER E WITH GRAVE", :convert_to => 'E'},
  195137 => {:name => "LATIN CAPITAL LETTER E WITH ACUTE", :convert_to => 'E'},
  195138 => {:name => "LATIN CAPITAL LETTER E WITH CIRCUMFLEX", :convert_to => 'E'},
  195139 => {:name => "LATIN CAPITAL LETTER E WITH DIAERES", :convert_to => 'E'},
  195140 => {:name => "LATIN CAPITAL LETTER I WITH GRAVE", :convert_to => 'I'},
  195141 => {:name => "LATIN CAPITAL LETTER I WITH ACUTE", :convert_to => 'I'},
  195142 => {:name => "LATIN CAPITAL LETTER I WITH CIRCUMFLEX", :convert_to => 'I'},
  195143 => {:name => "LATIN CAPITAL LETTER I WITH DIAERESIS", :convert_to => 'I'},
  195144 => {:name => "LATIN CAPITAL LETTER ETH", :convert_to => '.'},
  195145 => {:name => "LATIN CAPITAL LETTER N WITH TILDE", :convert_to => 'N'},
  195146 => {:name => "LATIN CAPITAL LETTER O WITH GRAVE", :convert_to => 'O'},
  195147 => {:name => "LATIN CAPITAL LETTER O WITH ACUTE", :convert_to => 'O'},
  195148 => {:name => "LATIN CAPITAL LETTER O WITH CIRCUMFLEX", :convert_to => 'O'},
  195149 => {:name => "LATIN CAPITAL LETTER O WITH TILDE", :convert_to => 'O'},
  195150 => {:name => "LATIN CAPITAL LETTER O WITH DIAERESIS", :convert_to => 'OE'},
  195151 => {:name => "MULTIPLICATION SIGN", :convert_to => '.'},
  195152 => {:name => "LATIN CAPITAL LETTER O WITH STROKE", :convert_to => '.'},
  195153 => {:name => "LATIN CAPITAL LETTER U WITH GRAVE", :convert_to => 'U'},
  195154 => {:name => "LATIN CAPITAL LETTER U WITH ACUTE", :convert_to => 'U'},
  195155 => {:name => "LATIN CAPITAL LETTER U WITH CIRCUMFLEX", :convert_to => 'U'},
  195156 => {:name => "LATIN CAPITAL LETTER U WITH DIAERESIS", :convert_to => 'UE'},
  195157 => {:name => "LATIN CAPITAL LETTER Y WITH ACUTE", :convert_to => 'Y'},
  195158 => {:name => "LATIN CAPITAL LETTER THORN", :convert_to => '.'},
  195159 => {:name => "LATIN SMALL LETTER SHARP S", :convert_to => 'ss'},
  195160 => {:name => "LATIN SMALL LETTER A WITH GRAVE", :convert_to => 'a'},
  195161 => {:name => "LATIN SMALL LETTER A WITH ACUTE", :convert_to => 'a'},
  195162 => {:name => "LATIN SMALL LETTER A WITH CIRCUMFLEX", :convert_to => 'a'},
  195163 => {:name => "LATIN SMALL LETTER A WITH TILDE", :convert_to => 'a'},
  195164 => {:name => "LATIN SMALL LETTER A WITH DIAERESIS", :convert_to => 'ae'},
  195165 => {:name => "LATIN SMALL LETTER A WITH RING ABOVE", :convert_to => 'a'},
  195166 => {:name => "LATIN SMALL LETTER AE", :convert_to => 'ae'},
  195167 => {:name => "LATIN SMALL LETTER C WITH CEDILLA", :convert_to => 'c'},
  195168 => {:name => "LATIN SMALL LETTER E WITH GRAVE", :convert_to => 'e'},
  195169 => {:name => "LATIN SMALL LETTER E WITH ACUTE", :convert_to => 'e'},
  195170 => {:name => "LATIN SMALL LETTER E WITH CIRCUMFLEX", :convert_to => 'e'},
  195171 => {:name => "LATIN SMALL LETTER E WITH DIAERESIS", :convert_to => 'e'},
  195172 => {:name => "LATIN SMALL LETTER I WITH GRAVE", :convert_to => 'i'},
  195173 => {:name => "LATIN SMALL LETTER I WITH ACUTE", :convert_to => 'i'},
  195174 => {:name => "LATIN SMALL LETTER I WITH CIRCUMFLEX", :convert_to => 'i'},
  195175 => {:name => "LATIN SMALL LETTER I WITH DIAERESIS", :convert_to => 'i'},
  195176 => {:name => "LATIN SMALL LETTER ETH", :convert_to => '.'},
  195177 => {:name => "LATIN SMALL LETTER N WITH TILE", :convert_to => 'n'},
  195178 => {:name => "LATIN SMALL LETTER O WITH GRAVE", :convert_to => 'o'},
  195179 => {:name => "LATIN SMALL LETTER O WITH ACUTE", :convert_to => 'o'},
  195180 => {:name => "LATIN SMALL LETTER O WITH CIRCUMFLEX", :convert_to => 'o'},
  195181 => {:name => "LATIN SMALL LETTER O WITH TILDE", :convert_to => 'o'},
  195182 => {:name => "LATIN SMALL LETTER O WITH DIAERESIS", :convert_to => 'oe'},
  195183 => {:name => "DIVISION SIGN", :convert_to => '.'},
  195184 => {:name => "LATIN SMALL LETTER O WITH STROKE", :convert_to => '.'},
  195185 => {:name => "LATIN SMALL LETTER U WITH GRAVE", :convert_to => 'u'},
  195186 => {:name => "LATIN SMALL LETTER U WITH ACUTE", :convert_to => 'u'},
  195187 => {:name => "LATIN SMALL LETTER U WITH CIRCUMFLEX", :convert_to => 'u'},
  195188 => {:name => "LATIN SMALL LETTER U WITH DIAERESIS", :convert_to => 'ue'},
  195189 => {:name => "LATIN SMALL LETTER Y WITH ACUTE", :convert_to => 'y'},
  195190 => {:name => "LATIN SMALL LETTER THORN", :convert_to => '.'},
  195191 => {:name => "LATIN SMALL LETTER Y WITH DIAERESIS", :convert_to => 'y'},
}


class Converter
  extend DTA::CharacterConversion
end

def create_character_from_ut8_decimal_code(code)
  if code < 128
    code.chr
  else
    [code.to_s[0,3].to_i,code.to_s[3,3].to_i].pack("C*")
  end
end
describe "dta character conversion and encoding" do
  # UTF-8 encoding uses 2 bytes for non US-ASCII characters
  # ISO Latincode 8859-1 uses 1 byte
  it "should map the string before encoding it" do
    Converter.should_receive(:map_characters).with("Äöü").and_return("AEoeue")
    Converter.dta_string("Äöü")
  end

  it "should encode the strings" do
    Converter.should_receive(:encode_characters).with("AEoeue").and_return(Iconv.conv("ISO-8859-1", "UTF8","Äöü"))
    Converter.dta_string("Äöü")
  end

  describe "character mapping/reduction" do
    CONVERSION_MAP_UTF8.each do |id,conversion|
      it "should map #{conversion[:name]} to '#{conversion[:convert_to]}'" do
        character = create_character_from_ut8_decimal_code(id)
        Converter.map_characters(character).should == conversion[:convert_to]
      end
    end

    it "should map strings" do
      Converter.map_characters("ÄäÜüÖö").should == "AEaeUEueOEoe"
    end
  end

  describe 'DTA character encoding' do

    it "should have a default system encoding of utf8" do
      $KCODE.should == 'UTF8'
    end

    it "should convert the encoding from UTF8 to ISO Latincode 8859-1" do
      encoded_string = Converter.encode_characters("Ä")
      encoded_string.size.should == 1
    end
  end
end
