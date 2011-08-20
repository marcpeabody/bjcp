$(function(){
  $.get('judge_procedure/all', function(data){
    window.judgingTF = data;
  });

  $('.judgingTFQuiz').live('click', function(e){
    e.preventDefault();
    getJudgingTFQuiz();
  });

  $('.tfQuestionsForm').live('submit', function(e){
    e.preventDefault();
    numberCorrect = 0;
    $(this).find('li').each(function(){
      selectedVal = $(this).find(':checked').val();
      actualVal   = $(this).find('.answer').html();
      $questionText = $(this).find('.questionText')
      if(selectedVal == actualVal){
        numberCorrect += 1;
        $questionText.css('color', 'green');
      }else{
        $questionText.css('color', 'red');
      }
    });
    updateStatus(numberCorrect);
  });

  var updateStatus = function(numberCorrect){
    status = "You got "+numberCorrect+" out of 15 answers correct. ";
    points = (Math.floor(numberCorrect/3)||'').toString();
    if(remainder=numberCorrect%3) points += " <sup>"+remainder+"</sup>&frasl;<sub>3</sub>";
    status += "You get "+points+" out of 5 possible points for this section.";
    $('.status').html(status);
  };

  var getJudgingTFQuiz = function(){
    optionCount = 15;
    randomQuestions = _.sample(window.judgingTF, optionCount);
    $quiz = $(Mustache.to_html(quizTemplate, {questions : randomQuestions}));
    $('.content').html($quiz);
  };

  var quizTemplate = "<div class='question'><span class='status'></span><form class='tfQuestionsForm'><ul>{{#questions}} <li> <label><input type='radio' name='{{number}}' value='T'/>T</label> <label><input type='radio' name='{{number}}' value='F'/>F</label> <span class='answer' style='display: none;'>{{answer}}</span><span class='questionText'>{{question}}</span></li> {{/questions}}</ul><input type='submit' value='Submit Answers'/></form></div>";

});
