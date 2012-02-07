$(function(){
  //$('.srm_range[title]').qtip();
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

  window.setMainView = function(templateName){
    if(window.mainView) window.mainView.remove();
    window.mainView = Ember.View.create({templateName: templateName});
    append(window.mainView);
  };

  window.runWithSampleStyles = function(limit, callback){
    $.ajax({url: '/styles/styles', data: {limit: limit}, success: callback});
  };

  window.Bjcp = {};
  Bjcp.QuizLink = Ember.View.extend({
    click: function(e){
      e.preventDefault();
      var template = this.get('templateName');
      if(template){
        Quiz.MenuModel.set('selectedType', template);
        Quiz.Question.redisplay();
      }else{
        Quiz.Question.setup();
      }
    }
  });

  window.keys = function(obj){
    var keys = [];
    for(var key in obj) keys.push(key);
    return keys;
  }

  window.append = function(emberView){
    emberView.appendTo('.mainArea');
  }

  window.srm_colors = {0: '#FFFFFF',
     1: '#F3F993', 2: '#F5F75C', 3: '#F6F513', 4: '#EAE615', 5: '#E0D01B',
     6: '#D5BC26', 7: '#CDAA37', 8: '#C1963C', 9: '#BE8C3A', 10: '#BE823A',
    11: '#C17A37', 12: '#BF7138', 13: '#BC6733', 14: '#B26033', 15: '#A85839',
    16: '#985336', 17: '#8D4C32', 18: '#7C452D', 19: '#6B3A1E', 20: '#5D341A',
    21: '#4E2A0C', 22: '#4A2727', 23: '#361F1B', 24: '#261716', 25: '#231716',
    26: '#19100F', 27: '#16100F', 28: '#120D0C', 29: '#100B0A', 30: '#050B0A' };
  window.srmRGB = function(colorNumber){
    colorNumber = parseInt(colorNumber);
    if(!colorNumber || colorNumber > 30) colorNumber = 30;
    return srm_colors[colorNumber];
  }
  Handlebars.registerHelper('glass', function(property) {
    var value = Ember.getPath(this, property);
    var rgb = srmRGB(value);
return new Handlebars.SafeString("<div class='srm_range' style='background-color: "+
    rgb +
    "; width: 25px; height: 25px; display: inline-block;'> <img src='/images/glass.png' width='100px' height='100px' alt='"+
    value +
    "SRM'/> </div>");
  });
});
