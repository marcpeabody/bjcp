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
    window.mainView.append();
  };

  window.runWithSampleStyles = function(limit, callback){
    $.ajax({url: '/styles/styles', data: {limit: limit}, success: callback});
  };

});
