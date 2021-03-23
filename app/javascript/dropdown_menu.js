// $(function(){
//   $(".category__parent--name").show();{
//   };
// });
// $('.category-search').hover(
//   function(){
//       $(".category__parent--name").show();
//   }
// );
$(function(){
  $(".leftbar li.left-left").hover(function(){
      $(this).children('li').show();
    },function(){
      $(this).children('li').hide();
  })
})
