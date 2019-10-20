# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = -> 
    ctx = document.getElementById("myChart");
    myChart = new Chart(ctx, {
       type: "horizontalBar",
       data: {
       datasets: [
        { label: "天使", data: [a], backgroundColor: "rgba(244, 143, 177, 0.6)" },
        { label: "悪魔", data: [d], backgroundColor: "rgba(100, 181, 246, 0.6)" }
        ]
       },
       options: {
           plugins: {
               stacked100: { enable: true }
           },
           scales: {
               xAxes: [
                   stacked: true,
                   gridLines:{
                       display: false,
                       drawBorder: false
                   },
                   ticks: {
                       min: 0,
                       max: 100,
                       stepsize: 50,
                       fontsize: 10
                   }
               ],
               yAxes: [
                   stacked: true,
                   gridLines:{
                       display: false,
                       drawBorder: false
                   }
               ]
           }
       }
    });