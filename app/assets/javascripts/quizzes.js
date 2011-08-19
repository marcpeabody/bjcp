$(function(){
  $.get('styles/all', function(data){
    window.styles = data;
  });
  // TODO make controller/route
  $.get('categories/all', function(data){
    window.categories = data;
  });

  $('.styleNumberQuiz').live('click', function(e){
    e.preventDefault();
    getStyleNumberQuiz();
  });
  $('.categoryNumberQuiz').live('click', function(e){
    e.preventDefault();
    getCategoryNumberQuiz();
  });

  var getStyle = function(count){
    return _.sample(window.styles, count);
  }
  var getCategoryNumberQuiz = function(){
    optionCount = 4;
    // TODO do for categories
    stylesChosen = getStyle(optionCount);
    answerIndex = Math.floor(Math.random() * optionCount);
    quiz = Mustache.to_html(quizTemplate, {stylesChosen : stylesChosen,
                                           answerIndex: answerIndex,
                                           answerStyleNumber: stylesChosen[answerIndex].style_number})
    $('.content').html(quiz)
  }
  var getStyleNumberQuiz = function(){
    // TODO more options - is Mustache really the right choice?
    optionCount = 4;
    stylesChosen = getStyle(optionCount);
    answerIndex = Math.floor(Math.random() * optionCount);
    askingStyleNumber = stylesChosen[answerIndex].style_number;
    $quiz = $(Mustache.to_html(quizTemplate, {options : stylesChosen
                                             , questionText: 'Style '+askingStyleNumber+' is:'}));
    $quiz.find('.answerOption').eq(answerIndex).addClass('correct');
    $('.content').html($quiz);
  }

  var quizTemplate = "<div class='question'>{{questionText}} <span class='status'></span> <ul>{{#options}} <li class='answerOption'>{{style_name}}</li> {{/options}}</ul></div>"

  _.sample = function(arr, count){
    if(_.isUndefined(count)) count = 1;
    arrToPick = arr.slice(0); //copy because this will get destructive
    arrPicked = [];
    _(count).times(function(){
      randomIndex = Math.floor(Math.random() * arrToPick.length);
      chosen = arrToPick.splice(randomIndex,1)[0];
      arrPicked.unshift(chosen);
    });
    return arrPicked;
  }

  $('.answerOption').live('click', function(){
    if($(this).hasClass('correct')){
      status = 'Correct! <a class="styleNumberQuiz" href="#">next question</a>';
    }else{
      status = 'Sorry... "'+$(this).html()+'" is not correct.';
    }
    $('.status').html(status)
  });
});
