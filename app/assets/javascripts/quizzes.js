$(function(){
  $.get('styles/all', function(data){
    window.styles = data;
  });
  // TODO make controller/route
  $.get('categories/all', function(data){
    window.categories = data;
  });

  $('.styleNumberQuiz').click(function(e){
    e.preventDefault();
    getStyleNumberQuiz();
  });
  $('.categoryNumberQuiz').click(function(e){
    e.preventDefault();
    getCategoryNumberQuiz();
  });

  var getStyle = function(count){
    return _.sample(window.styles, count);
  }
  var getCategoryNumberQuiz = function(){
    optionCount = 2;
    // TODO do for categories
    stylesChosen = getStyle(optionCount);
    answerIndex = Math.floor(Math.random() * optionCount);
    quiz = Mustache.to_html(quizTemplate, {style1_name: stylesChosen[0].style_name,
                                           style2_name: stylesChosen[1].style_name,
                                           answerIndex: answerIndex,
                                           answerStyleNumber: stylesChosen[answerIndex].style_number})
    $('.content').html(quiz)
  }
  var getStyleNumberQuiz = function(){
    // TODO more options - is Mustache really the right choice?
    optionCount = 2;
    stylesChosen = getStyle(optionCount);
    answerIndex = Math.floor(Math.random() * optionCount);
    quiz = Mustache.to_html(quizTemplate, {style1_name: stylesChosen[0].style_name,
                                           style2_name: stylesChosen[1].style_name,
                                           answerIndex: answerIndex,
                                           answerStyleNumber: stylesChosen[answerIndex].style_number})
    $('.content').html(quiz)
  }

  var quizTemplate = "Style {{answerStyleNumber}} is: a) {{style1_name}} or b) {{style2_name}}  =   ({{answerIndex}})"

  _.sample = function(arr, count){
    if(_.isUndefined(count)) count = 1;
    arrToPick = arr.slice(0); //copy because this will get destructive
    arrPicked = [];
    _(count).times(function(){
      randomIndex = Math.floor(Math.random() * arrToPick.length);
      console.log(randomIndex)
      chosen = arrToPick.splice(randomIndex,1)[0];
      arrPicked.unshift(chosen);
    });
    return arrPicked;
  }
});
