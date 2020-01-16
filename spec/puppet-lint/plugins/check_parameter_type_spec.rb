require 'spec_helper'

describe 'parameter_type' do
  let(:msg) { 'expected a parameter with type declared' }

  %w[define class].each do |type|
    context "#{type} parameter without data type" do
      let(:code) { "#{type} foo( $foo ) { }" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end
      col = (type == 'class' ? 12 : 13)
      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(col)
      end
    end

    context "#{type} parameter without data type and valua with unenc variable" do
      let(:code) { "#{type} foo($foo = \"text=${unenc} text=${unenc}\" ) { }" }

      it 'should detect a problem' do
        expect(problems).to have(1).problems
      end
      col = (type == 'class' ? 11 : 12)
      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(col)
      end
    end

    context "#{type} parameter without data type" do
      let(:code) { "#{type} foo( $foo, $bar ) { }" }

      it 'should detect two problem' do
        expect(problems).to have(2).problem
      end
    end

    context "#{type} parameter with data type" do
      let(:code) { "#{type} foo( Hash $foo ) { }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context "#{type} multiple parameter with data type" do
      let(:code) { "#{type} foo(Hash $foo, String $foo,) { }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context "#{type} Optional parameter with data type" do
      let(:code) { "#{type} foo(Optionl[String] $foo) { }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context "#{type} parameter with data type and valua with unenc variable" do
      let(:code) { "#{type} foo(String $foo = \"text=${unenc} text=${unenc}\") { }" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

  end

end