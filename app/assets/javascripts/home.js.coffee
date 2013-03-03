$ ->
  languages = ['English', 'Spanish', 'French', 'Chinese']
  currentLang = 0

  setInterval ->
      $('.lang').slideToggle 'fast', ->
        $('.lang').text(languages[currentLang]).slideToggle()
      currentLang++
      currentLang = 0 if currentLang == languages.length
    , 2000