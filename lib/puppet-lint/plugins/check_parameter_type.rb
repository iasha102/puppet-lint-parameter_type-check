PuppetLint.new_check(:parameter_type) do
  def check
    pass_checks_types = Set.new([:TYPE, :RBRACK, :EQUALS, :DQPRE, :DQMID])
    msg = "expected a parameter with type declared"
    (class_indexes + defined_type_indexes).each do |class_idx|
      next if class_idx[:param_tokens].nil?

      class_idx[:param_tokens].each_with_index do |token, i|
        if token.type == :VARIABLE
          next if pass_checks_types.include? token.prev_code_token.type

          notify(
            :warning,
            :message => msg,
            :line    => token.line,
            :column  => token.column
          )
        end
      end
    end
  end
end
