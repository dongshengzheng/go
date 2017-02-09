//==========================

accessid = '';
accesskey = '';
host = '';
policyBase64 = '';
signature = '';
callbackbody = '';
filename = '';
key = '';
expire = 0;
g_object_name = '';
g_object_name_type = 'random_name';
now = timestamp = Date.parse(new Date()) / 1000;

function send_request(domain) {
    var xmlhttp = null;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    if (xmlhttp != null) {
        serverUrl = domain + 'oss/policy';
        xmlhttp.open("GET", serverUrl, false);
        xmlhttp.send(null);
        return xmlhttp.responseText
    }
    else {
        alert("Your browser does not support XMLHTTP.");
    }
}

function get_signature(domain) {
    //可以判断当前expire是否超过了当前时间,如果超过了当前时间,就重新取一下.3s 做为缓冲
    body = send_request(domain);
    var obj = eval("(" + body + ")");
    host = obj['host'];
    policyBase64 = obj['policy'];
    accessid = obj['accessid'];
    signature = obj['signature'];
    expire = parseInt(obj['expire']);
    callbackbody = obj['callback'];
    key = obj['dir'];
    return true;
}

function random_string(len) {
    len = len || 32;
    var chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
    var maxPos = chars.length;
    var pwd = '';
    for (i = 0; i < len; i++) {
        pwd += chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
}

function get_suffix(filename) {
    pos = filename.lastIndexOf('.');
    suffix = '';
    if (pos != -1) {
        suffix = filename.substring(pos)
    }
    return suffix;
}

function calculate_object_name(filename) {
    suffix = get_suffix(filename);
    g_object_name = key + random_string(10) + suffix
}

function set_upload_param(up, filename, ret, domain) {
    if (ret == false) {
        ret = get_signature(domain)
    }
    g_object_name = key;
    if (filename != '') {
        suffix = get_suffix(filename);
        calculate_object_name(filename)
    }
    new_multipart_params = {
        'key': g_object_name,
        'policy': policyBase64,
        'OSSAccessKeyId': accessid,
        'success_action_status': '200', //让服务端返回200,不然，默认会返回204
        'callback': callbackbody,
        'signature': signature
    };

    up.setOption({'url': host, 'multipart_params': new_multipart_params});

    up.start();
}


function initUploaders(buttonId, bucket, domain) {
    var uploader = new plupload.Uploader({
        runtimes: 'html5,flash,silverlight,html4',
        browse_button: buttonId,
        flash_swf_url: domain + 'assets/plugins/plupload-2.1.2/js/Moxie.swf',
        silverlight_xap_url: domain + 'assets/plugins/plupload-2.1.2/js/Moxie.xap',
        url: 'http://oss.aliyuncs.com',
        filters: {
            mime_types: [ //只允许上传图片和zip,rar文件
                {title: "Image files", extensions: "jpg,gif,png,bmp,jpeg"},
                {title: "Zip files", extensions: "zip,rar"}
            ],
            max_file_size: '10mb', //最大只能上传10mb的文件
            prevent_duplicates: true //不允许选取重复文件
        },
        init: {
            FilesAdded: function (up) {
                set_upload_param(up, '', false, domain);
            },
            BeforeUpload: function (up, file) {
                set_upload_param(up, file.name, true, domain);
            },
            FileUploaded: function () {
                $("#" + buttonId).before('<div class="" onclick=""  style="float:left;position:relative;padding: 0px;margin-bottom: 5px;"><input name="images" type="hidden" value="' + g_object_name + '" >' +
                    '<span onclick="javascript:this.parentNode.remove();" class="glyphicon glyphicon-remove" style="background: rgba(0,0,0,.5);color:white;position:absolute;top:0px;right:5px;z-index: 999;"></span>' +
                    '<img src="http://' + bucket + '.img-cn-shanghai.aliyuncs.com/' + g_object_name + '?x-oss-process=image/resize,m_fill,h_100,w_100" ' +
                    'style="max-height: 100px;margin-right:5px;" onclick="" class="min-img" data-url="' + g_object_name + '" >' + '</div>');


            }
        }
    });
    uploader.init();
}


function initUploaders_logo(buttonId, bucket, domain, imgId, inputId) {
    var uploader = new plupload.Uploader({
        runtimes: 'html5,flash,silverlight,html4',
        browse_button: buttonId,
        flash_swf_url: domain + 'assets/plugins/plupload-2.1.2/js/Moxie.swf',
        silverlight_xap_url: domain + 'assets/plugins/plupload-2.1.2/js/Moxie.xap',
        url: 'http://oss.aliyuncs.com',
        filters: {
            mime_types: [ //只允许上传图片和zip,rar文件
                {title: "Image files", extensions: "jpg,gif,png,bmp,jpeg"},
                {title: "Zip files", extensions: "zip,rar"}
            ],
            max_file_size: '10mb', //最大只能上传10mb的文件
            prevent_duplicates: true //不允许选取重复文件
        },
        init: {
            FilesAdded: function (up) {
                set_upload_param(up, '', false, domain);
            },
            BeforeUpload: function (up, file) {
                set_upload_param(up, file.name, true, domain);
            },
            FileUploaded: function () {
                $("#" + imgId).attr("src", "http://" + bucket + ".img-cn-shanghai.aliyuncs.com/" + g_object_name + "?x-oss-process=image/resize,m_fill,h_100,w_100");
                $("#" + inputId).val(g_object_name);
            }
        }
    });
    uploader.init();
}



