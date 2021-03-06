// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require jquery_nested_form
//= require select2
//= require_tree .
//
//
 
$(function(){
  

  $("#sample_sample_date").datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
  

      $('tr[data-link]').click(function(){
      window.location = this.dataset.link
    });

    $('tr[data-link]').hover(
      function(){
        $(this).css("background", "yellow");
        $(this).css("cursor", "pointer");
      },
      function(){
        $(this).css("background", "");
      }
    );
    
    $('.display').dataTable( {
        "sDom": "<'row'<'span6'T><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
        "sPaginationType": "bootstrap"
    } );

  $("#animals").find(".sppCommon").select2();
  //$("#sample_shoreline_cd").select2();
  //$("#sample_mangrove_spp").select2();
  
  //check distance between refernce site and entered running site
  referenceSiteInformation = {}
  $.each(reference_site_info, function(a){
    referenceSiteInformation[reference_site_info[a].id] = { "lat": reference_site_info[a].latitude, "lon": reference_site_info[a].longitude };
  });

    Number.prototype.toRad = function() {
      return this * Math.PI / 180;
    }


    function getStationDistance() {
      var lat2 = parseFloat($('#sample_latitude').val()); 
      var lon2 = parseFloat($('#sample_longitude').val());

      var lat1 = parseFloat(referenceSiteInformation[$("#sample_reference_site").val()].lat);
      var lon1 = parseFloat(referenceSiteInformation[$("#sample_reference_site").val()].lon);
      
      var R = 6371000; // m 
      //has a problem with the .toRad() method below.
      var x1 = lat2-lat1;
      var dLat = x1.toRad();  
      var x2 = lon2-lon1;
      var dLon = x2.toRad();  
      var a = Math.sin(dLat/2) * Math.sin(dLat/2) + 
                      Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
                      Math.sin(dLon/2) * Math.sin(dLon/2);  
      var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
      var d = R * c; 
      
      $('.distanceBetweenRunningReference').text(d.toFixed(0))
    };


    if($("body").hasClass("edit")) {
      getStationDistance();    
    }

    $('.coordinates').change(function(){
      getStationDistance();
    });

  $(document).on('nested:fieldAdded', function(event){
    event.field.find(".sppCommon").select2();
  });

  function enable_disable_animals_fields_on_load(){
    $("#animals").find(".fields [id$=number_individuals]").each(function(){
      var $indValue = $(this).val();
      var $recordID = $(this).attr('id');
      var $mean = $recordID.replace('_number_individuals', '_average_length');
      var $min = $recordID.replace('_number_individuals', '_min_length');
      var $max = $recordID.replace('_number_individuals', '_max_length');

        if ($indValue >= 3) {
          $('input#' + $mean).attr('disabled', false)
          $('input#' + $min).attr('disabled', false)
          $('input#' + $max).attr('disabled', false)
      } else if ($indValue == 1) {
          $('input#' + $mean).attr('disabled', false)
          $('input#' + $min).attr('disabled', true)
          $('input#' + $max).attr('disabled', true)
      } else if ( $indValue == 2 ){
          $('input#' + $mean).attr('disabled', true)
          $('input#' + $min).attr('disabled', false)
          $('input#' + $max).attr('disabled', false)
      }
    });
  };

  function enable_disable_animals_fields(){
    $("[id$=number_individuals]").on('focusout', function(){  
    var $indValue = $(this).val();
    var $recordID = $(this).attr('id');
    var $mean = $recordID.replace('_number_individuals', '_average_length');
    var $min = $recordID.replace('_number_individuals', '_min_length');
    var $max = $recordID.replace('_number_individuals', '_max_length');

      if ($indValue >= 3) {
        $('input#' + $mean).attr('disabled', false)
        $('input#' + $min).attr('disabled', false)
        $('input#' + $max).attr('disabled', false)
    } else if ($indValue == 1) {
        $('input#' + $mean).attr('disabled', false)
        $('input#' + $min).val("")
        $('input#' + $min).attr('disabled', true)
        $('input#' + $max).val("")
        $('input#' + $max).attr('disabled', true)
    } else if ( $indValue == 2 ){
        $('input#' + $mean).val("").attr('disabled', true)
        $('input#' + $min).attr('disabled', false)
        $('input#' + $max).attr('disabled', false)
    }
    });
  };
  
  enable_disable_animals_fields_on_load();
  enable_disable_animals_fields();
  
  $(document).delegate(".add_nested_species", "click", function(){ 
        enable_disable_animals_fields();
        $("#animals input:text:visible").eq(-5).focus();
   });

  $("#submitButton").click(function() {
    $("form").validate().cancelSubmit = true;
    $(".formContainer :input").attr('disabled', false);
    $("form").validate().submit();

    return false;

  });

    $.validator.addMethod("fieldidFormat", function(value, element, params){
      return /...\d[a-zA-B]/.test(value);
    });


    $.validator.addMethod("greaterThan", function(value, element, params){
      return value > $(params).val();
    });
    
    $.validator.addMethod("before", function(value, element, params){
      return value < $(params).val();
    });

    $.validator.addMethod("lessThanEqualTo", function(value, element, params){
      return value <= $(params).val();
    });
    
// Check that a species record does not have overlapping sizes with another
// record of the same species

    $.validator.addMethod("doesNotHaveOverlap", function(value, element, params){
     	var spp = {}
	    var $index = $(element).parent().parent().index();
	    var $thisSpecies = $(element).parent().find('.sppCommon').select2("val");
	    var $thisNumber = $(element).parent().find('[id$="number_individuals"]').val();
	    var $thisMean = $(element).parent().find('[id$="average_length"]').val();
	    var $thisMin = $(element).parent().find('[id$="min_length"]').val();
	    var $thisMax = $(element).parent().find('[id$="max_length"]').val();

    	var $thisRange

    	    if ( $thisNumber == 1 ){
    				$thisRange = [parseFloat($thisMean)];	
    			} else if ( $thisNumber == 2 ) {
    				$thisRange = [parseFloat($thisMin), parseFloat($thisMax)];		
    			} else if ( $thisNumber == 3 ) {
    				$thisRange = [parseFloat($thisMean), parseFloat($thisMin), parseFloat($thisMax)];		
    			} else {
    				$thisRange = _.range(parseFloat($thisMin), parseFloat($thisMax) + 1);	
    			}
     
      	$("#animals .fields").each(function(i){
		      if ($(this).is(":visible") && $(this).find(".sppCommon").select2("val") == $thisSpecies && i != $index ) { 

			      var $animal = $(this).find('.sppCommon').select2("val"); 
		      	var $number = $(this).find('[id$="number_individuals"]').val();
		      	var $mean = $(this).find('[id$="average_length"]').val();
		      	var $min = $(this).find('[id$="min_length"]').val();
		      	var $max = $(this).find('[id$="max_length"]').val();

		      	var $range
		      	if ( $number == 1 ){
		      		$range = [parseFloat($mean)];	
		      	} else if ( $number == 2 ) {
		      		$range = [parseFloat($min), parseFloat($max)];		
		      	} else if ( $number == 3 ) {
		      		$range = [parseFloat($mean), parseFloat($min), parseFloat($max)];		
		      	} else {
		      		$range = _.range(parseFloat($min), parseFloat($max) + 1);	
		      	}	

		      	spp[i] = { "species": $animal, "range": $range}; 
		      };
	      });
      
      var hasOverlap;
      if ( _.isEmpty(spp) ) { hasOverlap = false; }
      else {
        var checkBool = []
        for ( rec in spp ) { checkBool.push( _.intersection(spp[rec].range, $thisRange).length>0); };
        hasOverlap = _.contains( checkBool, true );
      }
      return hasOverlap == false;
    }, "record overlaps with other record"
    );



    $.validator.addMethod(
    "lessThan",
    function(value, element, params) {
      function meanIsEnabled(e) {
        return e.parent().find('[id$="average_length"]').is(":enabled");
      }
 
      if (meanIsEnabled($(element))) {
        return parseFloat(value) <= parseFloat($(element).parent().find('[id$="average_length"]').val());;
      }
 
      return true;
    },
    "must be less than or equal to average length"
  );
 
    $.validator.addMethod(
    "greaterThanEqualToAvg",
    function(value, element, params) {
      function avgIsEnabled(e) {
        return e.parent().find('[id$="average_length"]').is(":enabled");
      }

      if (avgIsEnabled($(element))) {
        return parseFloat(value) >= parseFloat($(element).parent().find('[id$="average_length"]').val());;
      }
 
      return true;
    },
    "must be greater than or equal to average length"
  );
 
    $.validator.addMethod(
    "greaterThanEqualToMin",
    function(value, element, params) {
      function minIsEnabled(e) {
        return e.parent().find('[id$="min_length"]').is(":enabled");
      }
 
      if (minIsEnabled($(element))) {
        return parseFloat(value) >= parseFloat($(element).parent().find('[id$="min_length"]').val());;
      }
 
      return true;
    },
    "must be greater than or equal to min length"
  );

   // modified from http://orip.org/2010/06/jquery-validate-required-if-visible.html 

    $.validator.addMethod(
    "requiredIfEnabled",
    function(value, element, params) {
      function isEnabled(e) {
        // the element and all of its parents must be :visible
        // inspiration: http://remysharp.com/2008/10/17/jquery-really-visible/
        return e.is(":enabled");
      }
 
      if (isEnabled($(element))) {
        // call the "required" method
        return $.validator.methods.required.call(this, $.trim(element.value), element);
      }
 
      return true;
    },
    $.validator.messages.required
  );

    $.validator.setDefaults ({
      errorPlacement: function (error, element) {
        if ( element.is('[id$="number_individuals"]') || element.is('[id$="average_length"]') || element.is('[id$="min_length"]') || element.is('[id$="max_length"]') ) {
          error.insertAfter(element.parent().find('[id$="max_length"]'));
          } else {
            error.insertAfter(element);
          }
        }
    });

    $("form").validate({

      errorElement: "span",


      onfocusout: function(element) {
        this.element(element);
      },

        rules: {
                'sample[diver_id]': {
                         required: true
                       },
                'sample[sample_date]': {
                         required: true
                       },
                'sample[running_site]': {
                         required: true
                       },
                'sample[reference_site]': {
                        required: true
                      },
                'sample[sample_time]': {
                        required: true
                      },
                'sample[latitude]': {
                        required: true,
                        number: true
                      },
                'sample[longitude]': {
                        required: true,
                        number: true
                      },
                'sample[shoreline_cd]': {
                        required: true
                      },
                'sample[mangrove_spp]': {
                        required: true
                      },
                'sample[underwater_habitat]': {
                        required: true
                      },
                'sample[temperature]': {
                        required: true,
                        number: true
                      },
                'sample[salinity]': {
                        required: true,
                        number: true
                      },
                'sample[dissolved_oxygen]': {
                        required: true,
                        number: true
                      },
                'sample[ph]': {
                        required: true,
                        number: true
                      },
                'sample[visibility]': {
                        required: true,
                        number: true
                      },
                'sample[depth_meter_0]': {
                        required: true,
                        number: true
                      },
                'sample[depth_meter_15]': {
                        required: true,
                        number: true
                      },
                'sample[depth_meter_30]': {
                        required: true,
                        number: true
                      }
               },
        messages: {
                'sample[dive_end_time]': {
                  greaterThan: "Dive end cannot be before dive begin"
                    },
                'sample[sample_begin_time]': {
                  greaterThan: "Sample begin cannot be before dive begin",
                  before: "Sample begin time cannot be after dive end time"
                    },
                'sample[sample_end_time]': {
                  greaterThan: "Sample end time cannot be before begin time",
                  before: "Sample end time cannot be after dive end time"
                },
                'sample[field_id]': {
                  fieldidFormat: "Format is invalid"
                },
                'sample[substrate_min_depth]': {
                  lessThanEqualTo: "must less than equal to max depth"
                }
                  }
    });

    $('[name*="diver_id"]').each(function(){
      $(this).rules("add", { required: true });
    });
    
    function validate_fields() {
    $('[name*="number_individuals"]').each(function(){
      $(this).rules('add', {
        required: true,
        number: true,
        doesNotHaveOverlap: true
      });
    });
    $('[name*="average_length"]').each(function(){
      $(this).rules('add', {
        requiredIfEnabled: true,
        number: true,
        doesNotHaveOverlap: true
      });
    });
    $('[name*="min_length"]').each(function(){
      $(this).rules('add', {
        requiredIfEnabled: true,
        number: true,
        lessThan: true,
        doesNotHaveOverlap: true
      });
    });
    $('[name*="max_length"]').each(function(){
      $(this).rules('add', {
        requiredIfEnabled: true,
        number: true,
        greaterThanEqualToAvg: true,
        greaterThanEqualToMin: true,
        doesNotHaveOverlap: true
      });
    });
    };


    validate_fields();
    $(document).delegate(".add_nested_fields", "click", function(){ 
      validate_fields();
    });

    $('#animals').change(function(){
        $('input.error').each(function(){
          $('form').validate().element(this);
        });
    });
  
    $('form').bind('change keyup', function() {
      if ( $('#animals input:visible.error').length == 0 ) {
        $('#submitButton').attr('disabled', false);
      } else {
        $('#submitButton').attr('disabled', true);
      }
    });

    $(".sampleSection").bind("keypress", function(e){
      if (e.keyCode ==13){
        e.preventDefault();
      }
    });
  
    $("#animals").bind("keypress", function(e){
      if (e.keyCode ==13){
        e.preventDefault();
        $(".add_nested_species").trigger("click");
      }
    });

  $("#sample_sample_time").timeEntry({ show24Hours: true });


});
