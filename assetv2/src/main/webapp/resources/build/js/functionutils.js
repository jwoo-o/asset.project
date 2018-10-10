/**
 * Form Object Serialize
 */
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

/**
 * Combo Options Setting
 * columnName: Database 컬럼명
 * objectId: 셀렉트 오브젝트의 ID 문자형
 * selectedVal: 선택되도록 할 옵션의 값으로 null 없음
 * addOptionC: "C" 선택, "A" 전체, null 없음
 */
function gfn_setCombo(columnName, objectId, selectedVal, addOptionC){
	var arr = CODES[columnName];
	var obj = document.getElementById(objectId);
	if(addOptionC) {
		if(addOptionC == "A") $(obj).append("<option value=''>전체</option>");
		else if(addOptionC == "C") $(obj).append("<option value=''>선택</option>");
	}
	$.each(arr, function(i, o) {
		$(obj).append("<option value='"+o.value+"'>"+o.text+"</option>");
	});
	if(selectedVal) $(obj).val(selectedVal);
}
/**
 * 변환도메인유효코드값
 * @param columnName
 * @param selectedVal
 */
function gfn_getCnvtDmnVldCVal(columnName, selectedVal){
	var arr = CODES[columnName], str = '';
	$.each(arr, function(i, o) {
		if(o.value == selectedVal) {
			str = o.text;
		}
	});
	if(str.length == 0) return selectedVal;
	else return str;
}
/**
 * bootstrap-wysiwyg 초기화 
 */
function gfn_initToolbarBootstrapBindings() {
	var fonts = [ 'Serif', 'Sans',
			'Arial', 'Arial Black',
			'Courier', 'Courier New',
			'Comic Sans MS',
			'Helvetica', 'Impact',
			'Lucida Grande',
			'Lucida Sans', 'Tahoma',
			'Times', 'Times New Roman',
			'Verdana' ]
	, fontTarget = $('[title=Font]').siblings('.dropdown-menu');
	$.each(fonts,function(idx,fontName) {
		fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">'
						+ fontName
						+ '</a></li>'));
	});
	$('a[title]').tooltip({container : 'body'});
	$('.dropdown-menu input').click(function() {
				return false;
	}).change(function() {
		$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
	}).keydown('esc', function() {
		this.value = '';
		$(this).change();
	});

	$('[data-role=magic-overlay]').each(function() {
		var overlay = $(this), target = $(overlay.data('target'));
		overlay.css('opacity',0).css('position','absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
	});

	if ("onwebkitspeechchange" in document.createElement("input")) {
		var editorOffset = $('#editor').offset();

		$('.voiceBtn').css('position','absolute').offset({
			top : editorOffset.top,
			left : editorOffset.left+ $('#editor').innerWidth()- 35
		});
	} else {
		$('.voiceBtn').hide();
	}
}

function gfn_showErrorAlert(reason, detail) {
	var msg = '';
	if (reason === 'unsupported-file-type') {
		msg = "Unsupported format "+ detail;
	} else {
		console.log("error uploading file",reason, detail);
	}
	$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
					+ '<strong>File upload error</strong> '
					+ msg + ' </div>').prependTo('#alerts');
}

/**
 * Form 초기화
 */
$.gfn_formReset=function(objectId) {
	var obj = document.getElementById(objectId)
	, _form = $(obj);

    // input 초기화
    _form.find('input').each(function() {
        var _input = $(this);
        
        switch (_input.attr('type')) {
            case 'checkbox' :
                _input.iCheck("uncheck");
                break;
            case 'radio' :
            	_form.find('[name="' + _input.attr('name') + '"]:first').iCheck('check');
                break;
            case 'text' :
                _input.val('');
                break;
            case 'hidden' :
                _input.val('');
        }
    });

    /// 셀렉트 박스 초기화
    _form.find('select').val('').trigger('change');

    // textarea 초기화
    _form.find('textarea').val('');
}

$.gfn_Alert=function(alertId, alertClass, alertContent){
	var msg = "<div class=\"alert " + alertClass + " alert-dismissible fade in\" role=\"alert\">"
		+ alertContent
		+"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
		+"<span aria-hidden=\"true\">&times;</span>"
		+"</button>"
		"</div>";
		$("#"+alertId).html(msg);
	
	window.setTimeout(function () {
	    $("#"+alertId+" .alert").fadeTo(500, 0).slideUp(500, function () {
	        $(this).remove();
	    });
	}, 3000);
}


