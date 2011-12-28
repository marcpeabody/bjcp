$(function(){
  var $quiz;
  var quizTypes = ['Aroma', 'Apperance', 'Flavor', 'Mouthfeel', 'History', 'Impression', 'Comments', 'Ingredients', 'Examples']

  $.get('/styles/all', function(data){
    window.styles = data;
  });

  $('.styleNumberQuiz').live('click', function(e){
    e.preventDefault();
    window.currentQuiz = $(this).attr('class');
    getStyleNumberQuiz();
  });
  $('.styleAppearanceQuiz').live('click', function(e){
    e.preventDefault();
    window.currentQuiz = $(this).attr('class');
    getStyleAppearanceQuiz();
  });

  var getStyleNumberQuiz = function(){
    stylesChosen      = _.sample(window.styles, 4);
    answerIndex       = _.randomIndex(stylesChosen);
    askingStyleNumber = stylesChosen[answerIndex].style_number;
    questionText      = 'Style '+askingStyleNumber+' is:'
    multipleChoiceQuiz(stylesChosen, answerIndex, questionText);
  };

  var getStyleAppearanceQuiz = function(){
    var stylesChosen          = _.sample(window.styles, 4);
    var answerIndex           = _.randomIndex(stylesChosen);
    var askingStyleAppearance = stylesChosen[answerIndex].appearance;
    var questionText          = 'Which style is described here?<br/><b>Appearance:</b> '+askingStyleAppearance;
    multipleChoiceQuiz(stylesChosen, answerIndex, questionText);
  };

  var multipleChoiceQuiz = function(options, answerIndex, questionText){
    var quizTemplate = "<div class='question'>{{{questionText}}} <span class='status'></span> <ul>{{#options}}<li class='answerOption'>{{style_name}}</li>{{/options}}</ul></div>"
    $quiz = $(Mustache.to_html(quizTemplate, {options: options, questionText: questionText}));
    $quiz.find('.answerOption').eq(answerIndex).addClass('correct');
    $('.content').html($quiz);
  };

  var getExampleQuiz = function(){
    var stylesChosen          = _.sample(window.styles, 4);
    var answerIndex           = _.randomIndex(stylesChosen);
    var askingStyleAppearance = stylesChosen[answerIndex].appearance;
    var questionText          = 'Give a commercial example of ?<br/><b>Appearance:</b> '+askingStyleAppearance;
    fillBlankQuiz(stylesChosen, answerIndex, questionText);
  };

  var fillBlankQuiz = function(rightAnswers, questionText){
    var quizTemplate = "<div class='question'>{{{questionText}}} <span class='status'></span><form class='fillBlankForm'><input name='example' type='text'/></form></div>"
    $quiz = $(Mustache.to_html(quizTemplate, {questionText: questionText}));
    $quiz.find('.answerOption').eq(answerIndex).addClass('correct');
    $('.content').html($quiz);
  };

  _.randomIndex = function(arr){
    return Math.floor(Math.random() * arr.length);
  }
  _.sample = function(arr, count){
    if(_.isUndefined(count)) count = 1;
    arrToPick = arr.slice(0); //copy because this will get destructive
    arrPicked = [];
    _(count).times(function(){
      randomIndex = _.randomIndex(arrToPick);
      chosen = arrToPick.splice(randomIndex,1)[0];
      arrPicked.unshift(chosen);
    });
    if(count === 1){
      return arrPicked[0];
    }else{
      return arrPicked;
    }
  }

  $('.answerOption').live('click', function(){
    if($(this).hasClass('correct')){
      status = '<br/><font color="green"> Correct! <a class="'+window.currentQuiz+'" href="#">next question</a></font>';
    }else{
      status = '<br/><font color="red"> Sorry... "'+$(this).html()+'" is not correct.</font>';
    }
    $('.status').html(status)
  });

  $('.fillBlankForm').live('submit', function(e){
    e.preventDefault();
    // $('.purposeForm li').each(function(x){
    //   submittedVal = $(this).find('input').val();
    //   $answerElement= $(this).find('.revealAnswer');
    //   answerVal    = $answerElement.html();
    //   if(submittedVal.toLowerCase() == answerVal.toLowerCase()){
    //     $answerElement.css('color','green');
    //   }else{
    //     $answerElement.css('color','red');
    //   }
    //   $answerElement.show();
    // });
  });
});
