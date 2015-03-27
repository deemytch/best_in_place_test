//=require jstree.js

var rtypes = { 'dish': 'dishes', 'section': 'sections', 'cuisine': 'cuisines', 'festival': 'festivals' };

$(document).ready(function(){
  // подгоняем размер списка под окно
  $('#tree_list').innerHeight(window.innerHeight - 80);
  $(".best_in_place").best_in_place();

  $(window).on('resize orientationChanged', function() {
    $('#tree_list').innerHeight(window.innerHeight - 80);
  });

  // при выборе элемента списка подгружаем редактор слева
  $('#festival_tree').jstree({ core: { check_callback: 'true' }, plugins: ['wholerow', 'dnd', 'types', 'unique']})
    .on('select_node.jstree', function(e,data){
      if(data.node.data.id == 'new'){
        $.get('/'+ rtypes[data.node.data.t] +'/new')
          .done(function(msg){ $('#dish_edit_form').html(msg); })
      }else{
        $.get('/'+ rtypes[data.node.data.t] +'/'+data.node.data.id+'/edit')
          .done(function(msg){
            $('#dish_edit_form').html(msg);
          })
      }
    });

  // после редактирования, если меняли имя - меняем имя и в списке
  $(document).on('ajax:success', '.best_in_place', function(){
    switch(this.dataset.field){
      case 'descr':
        this.innerHTML = this.innerHTML.replace(/\n/g, '<br />');
        break;
    }
  });

  // после редактирования сервер отсылает новые данные на канале /dishes/restaurant.code cmd:update, dish: @dish
  var menu_channel = faye_client().subscribe('/menu/'+rcode, function(msg){
    if(msg['cmd'] == 'update'){
      $('#festival_tree').jstree('rename_node', '[data-id="'+msg.dish.id+'"]', msg.dish.name);
      if(msg.dish.available){
        $('#festival_tree [data-id="'+msg.dish.id+'"]').removeClass('text-muted').addClass('text-success');
      }else{
        $('#festival_tree [data-id="'+msg.dish.id+'"]').removeClass('text-success').addClass('text-muted');
      }
    }
  });
});
