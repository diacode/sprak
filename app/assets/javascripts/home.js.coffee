$ ->
  languages = ['English', 'Spanish', 'French', 'Swedish', 'Chinese', 'German', 'Russian']
  currentLang = 0

  setInterval ->
      $('.lang').slideToggle 'fast', ->
        $('.lang').text(languages[currentLang]).slideToggle('fast')
      currentLang++
      currentLang = 0 if currentLang == languages.length
    , 2000