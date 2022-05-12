// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import $ from 'jquery'
global.$ = jQuery

import 'jquery-mask-plugin'

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$( document ).on('turbolinks:load', function() {
    $('#bank_document_type').change(function(){
        $('#bank_document_number').val('');
    });

    $("#bank_document_number").keydown(function(){
        var mask_type = $( "#bank_document_type option:selected").val();

        if(mask_type == 'cpf'){
            $("#bank_document_number").mask("999.999.999-99");
        } else if (mask_type == 'cnpj'){
            $("#bank_document_number").mask("99.999.999/9999-99");
        }
    });
});