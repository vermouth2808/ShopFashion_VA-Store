var itemsidebar = document.querySelectorAll('.cartegory_left-li')
itemsidebar.forEach(function(sidebar,index){
    sidebar.addEventListener("click", ()=> {
        sidebar.classList.toggle("close");
        
    })
});

//đối tượng 'Validator'
function Validator(options)
{

    function getParent(element,selector){
        while(element.parentElement){
            if(element.parentElement.matches(selector)){
                return element.parentElement;
            }
            element=element.parentElement;
        }
    }


    var selectorRules={};

//hàm thực hiện Validate
    function validate(inputElement,rule){
        var errorElement = getParent(inputElement,options.formGroupSelector).querySelector(options.errorSelect);
        var errorMessage;

        //lấy ra các rules của selector
        var rules=selectorRules[rule.selector];
        //lặp qua từng rule & kiểm tra
        //nếu có lỗi thì dừng việc kiểm tra
        for(var i=0;i<rules.length;++i)
        {
            switch(inputElement.type)
            {
                case 'radio':

                case 'checkbox':
                    errorMessage= rules[i](
                        formElement.querySelector(rule.selector + ':checked')
                    );

                break;
                default:
                    errorMessage= rules[i](inputElement.value);

            }
           if(errorMessage) break;
        }
        if(errorMessage)
        {
            errorElement.innerText=errorMessage;
            inputElement.parentElement.classList.add("invalid");
            
        }else{
            errorElement.innerText='';
            inputElement.parentElement.classList.remove("invalid");

        }
        return !errorMessage;
    }

    //lấy element của form cần validate
    var formElement = document.querySelector(options.form);

    if(formElement)
    {

        //khi submit form
        formElement.onsubmit=function(e){
            e.preventDefault();

            var isFormValid= true;
            //lặp qua từng rule và validate
            options.rules.forEach(function (rule){
            var inputElement = formElement.querySelector(rule.selector);
           var isValid = validate(inputElement,rule);
                if(!isValid){
                    isFormValid = false;
                }
            });

            if(isFormValid)
            {
                //trường hợp submit với javascript
                if(typeof options.onSubmit === 'function'){
                    var enableInput=formElement.querySelectorAll('[name]');
                    
                    var formValues=Array.from(enableInput).reduce(function(values,input){
                       switch(input.type)
                       {
                        case 'radio':
                            case 'checkbox':
                                values[input.name]=formElement.querySelector('input[name="'+input.name + '"]:checked').value;
                                
                                break;

                                case 'file':
                                    values[input.name]=input.files;
                                    break;
                                default:
                                    values[input.name]=input.value;
                       }
                        return values;
                    },{});
                    options.onSubmit(formValues);
                }
                else{
                    formElement.submit();
                }
            }
          

        }
        //lặp qua mỗi rule và xử lý (lắng nghe sự kiện blur ,input ,...)
        options.rules.forEach(function (rule) 
        {

            //lưu lại các rules cho mỗi input
            if(Array.isArray(selectorRules[rule.selector])){
                selectorRules[rule.selector].push(rule.test);
            }else{
                selectorRules[rule.selector] = [rule.test];
            }

            var inputElement = formElement.querySelector(rule.selector);
            if(inputElement)
            {
                //Xử lý trường hợp blur khỏi input
                inputElement.onblur=function(){
                   validate(inputElement,rule);
                }

                //Xử lý mỗi khi người dùng nhập vào input
                inputElement.oninput=function(){
        var errorElement = inputElement.parentElement.querySelector('.form-message');
                    errorElement.innerText='';
            inputElement.parentElement.classList.remove("invalid");
                }
            }
        });
    }
}


//nguyên tác các rules
//1.khi có lỗi thì => trả về message lỗi;
//2.khi hợp lệ =>không về gì cả(undefined)
//lưu ý : trim() bỏ các khoảng cách đầu và cuối.
Validator.isRequired = function(selector,message)
{
    return {
        selector: selector,
        test: function(value) {
            return value ? undefined : message || 'Vui lòng nhập trường này'
        }

    };
}

Validator.email = function(selector)    
{
    return {
        selector: selector,
        test: function(value) {
            var regex=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : 'Trường này phải là email'
        }

    };
}

Validator.minLength = function(selector,min)    
{
    return {
        selector: selector,
        test: function(value) {
           
            return value.length >= min ? undefined : `Vui lòng nhập tối thiểu ${min} kí tự`;
        }

    };
}

Validator.isConfirmed =function(selector,getConfirmValue,message){
    return {
        selector:selector,
        test:function(value){
            return value === getConfirmValue() ? undefined : message || 'Giá trị nhập vào không chính xác';
        }

    }
}
