//= require highcharts-release/highcharts.js
//= require highcharts-release/modules/data.js

$(function () {
    $('#container').highcharts({
        data: {
            table: 'data-table'
        },
        chart: {
            type: 'column'
        },
        title: {
            text: null
        }
    });
});
