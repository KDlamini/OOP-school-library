class Corrector
  def correct_name(name)
    name.downcase.capitalize[0, 10].strip
  end
end
