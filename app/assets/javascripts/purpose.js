<script type="text/javascript">
$(function(){
  var purposes = [{answer:'Promote Beer Literacy'}
                 ,{answer:'Promote the Appreciation of Real Beer'}
                 ,{answer:'Recognize Beer Tasting and Evaluation Skills'}]
  window.Quiz = Ember.Application.create();

  Quiz.Question = Ember.Object.create({
    setup: function() {
      var self = this;
      window.setMainView('multi-choice-quiz');
      $.each(purposes, function(i, purpose){
      });
    },
    answerOption: function(x) {
      x['click'] = function(){
        Quiz.Question.set('answerGuessed', this);
      };
      return Ember.View.extend(x);
    }
  });

  Quiz.Question.setup();
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

  // submit form
  //   each li
  //     if $('.revealAnswer') === answerSubmitted
  //       make green
  //     else
  //       make red
});
</script>
<script type="text/x-handlebars" data-template-name="multi-choice-quiz">
  <div class='question'>
    {{#with Quiz.Question}}
      {{view promptView  questionBinding="this"}}
      {{view answersView questionBinding="this"}}
    {{/with}}
  </div>
</script>
