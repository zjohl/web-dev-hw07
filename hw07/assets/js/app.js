import jQuery from 'jquery';
window.jQuery = window.$ = jQuery; // Bootstrap requires a global "$" object.
import "bootstrap";
import _ from "lodash";

// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

$(function () {
    function update_page(time_block) {
        let start_time = new Date(time_block.start_time);
        let end_time = new Date(time_block.end_time);
        return `<span>Started at: ${start_time.toISOString()}</span><span>  Ended at: ${end_time.toISOString()}</span>`;
    }

    function update_time_blocks(task_id) {
        $('#start-working-button').removeClass("disabled");
        $('#time-display').text('Not currently working on this task')

        $.ajax(`/ajax/time_blocks/${task_id}`, {
            method: "get",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            data: "",
            success: (resp) => {
                let text = _.map(resp.data, update_page);
                $("#time-blocks").html(text);
            },
        });
    }

    $('#start-working-button').click((ev) => {
        let time = Date.now();
        $('#stop-working-button').attr('data-start-time', time);
        $('#time-display').text('Working since ' + new Date(time));

        $('#start-working-button').addClass("disabled");
        $('#stop-working-button').removeClass("disabled");
    });

    $('#stop-working-button').click((ev) => {
        $('#stop-working-button').addClass("disabled");

        let task_id = $('#stop-working-button').attr('data-task-id');
        let start_time = $('#stop-working-button').attr('data-start-time');
        let end_time = Date.now();

        let body = JSON.stringify({
            time_block: {
                task_id: task_id,
                start_time: start_time,
                end_time: end_time,
            },
        });

        $.ajax("/ajax/time_blocks", {
            method: "post",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            data: body,
            success: (resp) => {
                update_time_blocks(task_id);
            },
        });
    });
});