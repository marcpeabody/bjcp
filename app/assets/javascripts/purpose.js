$(function(){
  var purpose = [{answer:'Promote Beer Literacy'}
                ,{answer:'Promote the Appreciation of Real Beer'}
                ,{answer:'Recognize Beer Tasting and Evaluation Skills'}]

  $('.purposeQuiz').live('click', function(e){
    e.preventDefault();
    $quiz = $(Mustache.to_html(purposeTemplate, {purpose: purpose}));
    $('.content').html($quiz)
  });

  var purposeTemplate = "<div class='question'><form class='purposeForm'>List three primary purposes of the BJCP as listed on http://www.bjcp.org and in the BJCP Study Guide. <ul>{{#purpose}}<li><input type='text' /><span class='revealAnswer' style='display:none;'>{{answer}}</span></li>{{/purpose}}</ul><input type='submit' value='Submit Answers'/></form></div>"

  $('.purposeForm').live('submit', function(e){
    e.preventDefault();
    $('.purposeForm li').each(function(x){
      submittedVal = $(this).find('input').val();
      $answerElement= $(this).find('.revealAnswer');
      answerVal    = $answerElement.html();
      if(submittedVal.toLowerCase() == answerVal.toLowerCase()){
        $answerElement.css('color','green');
      }else{
        $answerElement.css('color','red');
      }
      $answerElement.show();
    });
  });
});

