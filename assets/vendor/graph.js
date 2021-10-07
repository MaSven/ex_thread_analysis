import * as d3 from "d3";

function add_noed(){

}

let dataset = [100,200,300,400,500];
let size = 500;
d3.select("#graph").append("svg").attr('width',size).attr('height',size);

let rect_width = 95;

d3.selectAll("svg").selectAll("rect").data(dataset)
  .enter()
  .append('rect')
  .attr('x',(d,i) => 5 + i*(rect_width+5))
  .attr('y',d => size-d)
  .attr('width',rect_width)
  .attr('height',d=>d)
  .attr('fill','teal')
