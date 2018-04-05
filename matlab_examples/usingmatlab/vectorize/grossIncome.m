function T = grossIncome(dollarIncome,euroIncome, stirlingIncome)
  convertToDollar(1.1);
  convertToStirling(1.7);
  T = dollarIncome + euroIncome + stirlingIncome;

  function convertToDollar(rate)
    dollarIncome = rate*euroIncome;
  end

  function convertToStirling(rate)
    stirlingIncome = rate*euroIncome;
  end

end

