//window.document.oncontextmenu = function() { return false; }
window.status = " ";

document.onmouseover = function() {
    window.status = "  ";
    return true;
};

if (typeof (window.event) != 'undefined') {
    document.onkeydown = function() {
        var t = event.srcElement.type;
        var kc = event.keyCode;

        return
        (
            (kc != 8 && kc != 13) ||
            (t == 'text' && kc != 13) ||
            (t == 'textarea') ||
            (t == 'a' && kc == 13) ||
            (t == 'submit' && kc == 13)
        );
    }
}

/*(function () {
    window.spawn = window.spawn || function (gen) {
        function continuer(verb, arg) {
            var result;
            try {
                result = generator[verb](arg);
            } catch (err) {
                return Promise.reject(err);
            }
            if (result.done) {
                return result.value;
            } else {
                return Promise.resolve(result.value).then(onFulfilled, onRejected);
            }
        }
        var generator = gen();
        var onFulfilled = continuer.bind(continuer, 'next');
        var onRejected = continuer.bind(continuer, 'throw');
        return onFulfilled();
    };
    window.showModalDialog = window.showModalDialog || function (url, arg, opt) {
        url = url || ''; //URL of a dialog
        arg = arg || null; //arguments to a dialog
        opt = opt || 'dialogWidth:300px;dialogHeight:200px'; //options: dialogTop;dialogLeft;dialogWidth;dialogHeight or CSS styles
        var caller = showModalDialog.caller.toString();
        var dialog = document.body.appendChild(document.createElement('dialog'));
        dialog.setAttribute('style', opt.replace(/dialog/gi, ''));
        dialog.innerHTML = '<a href="#" id="dialog-close" style="position: absolute; top: 0; right: 4px; font-size: 20px; color: #000; text-decoration: none; outline: none;">&times;</a><iframe id="dialog-body" src="' + url + '" style="border: 0; width: 100%; height: 100%;"></iframe>';
        document.getElementById('dialog-body').contentWindow.dialogArguments = arg;
        document.getElementById('dialog-close').addEventListener('click', function (e) {
            e.preventDefault();
            dialog.close();
        });
        dialog.showModal();
        //if using yield
        if (caller.indexOf('yield') >= 0) {
            return new Promise(function (resolve, reject) {
                dialog.addEventListener('close', function () {
                    var returnValue = document.getElementById('dialog-body').contentWindow.returnValue;
                    document.body.removeChild(dialog);
                    resolve(returnValue);
                });
            });
        }
        //if using eval
        var isNext = false;
        var nextStmts = caller.split('\n').filter(function (stmt) {
            if (isNext || stmt.indexOf('showModalDialog(') >= 0)
                return isNext = true;
            return false;
        });
        dialog.addEventListener('close', function () {
            var returnValue = document.getElementById('dialog-body').contentWindow.returnValue;
            document.body.removeChild(dialog);
            nextStmts[0] = nextStmts[0].replace(/(window\.)?showModalDialog\(.*\)/g, JSON.stringify(returnValue));
            eval('{\n' + nextStmts.join('\n'));
        });
        throw 'Execution stopped until showModalDialog is closed';
    };
})();*/

function validarCPF(campo) {
    cpf = campo.value;
    cpf = cpf.replace(".", "");
    cpf = cpf.replace(".", "");
    cpf = cpf.replace(",", "");
    cpf = cpf.replace(",", "");
    cpf = cpf.replace("-", "");
    cpf = cpf.replace("___________", "");

    if (cpf == "")
        return true;

    var posicao, i, soma, dv, dv_informado;
    var digito = new Array(10);
    dv_informado = cpf.substr(9, 2);

    for (i = 0; i <= 8; i++) {
        digito[i] = cpf.substr(i, 1);
    }

    posicao = 10;
    soma = 0;
    for (i = 0; i <= 8; i++) {
        soma = soma + digito[i] * posicao;
        posicao = posicao - 1;
    }

    digito[9] = soma % 11;

    if (digito[9] < 2) {
        digito[9] = 0;
    }
    else {
        digito[9] = 11 - digito[9];
    }

    posicao = 11;
    soma = 0;

    for (i = 0; i <= 9; i++) {
        soma = soma + digito[i] * posicao;
        posicao = posicao - 1;
    }

    digito[10] = soma % 11;

    if (digito[10] < 2) {
        digito[10] = 0;
    }
    else {
        digito[10] = 11 - digito[10];
    }

    dv = digito[9] * 10 + digito[10];

    if (dv != dv_informado ||
           cpf == "00000000000" ||
           cpf == "11111111111" ||
           cpf == "22222222222" ||
           cpf == "33333333333" ||
           cpf == "44444444444" ||
           cpf == "55555555555" ||
           cpf == "66666666666" ||
           cpf == "77777777777" ||
           cpf == "88888888888" ||
           cpf == "99999999999") {
        campo.value = "";
        campo.focus();
        return false;
    }
    else
        return true;
}

//String Builder - Classe para manipulação de Strings.
function stringBuilder(value) {
    this.strings = new Array("");
    this.append(value);
}

//Adiciona uma String ao Builder
stringBuilder.prototype.append = function(value) {
    if (value) {
        this.strings.push(value);
    }
}

//Adiciona uma String ao Builder, colocando um quebra de linha ao final
stringBuilder.prototype.appendLine = function(value) {
    this.appendLine(value, false);
}

//Adiciona uma String ao Builder, colocando um quebra de linha ao final
stringBuilder.prototype.appendLine = function(value, isWeb) {
    if (value) {
        this.strings.push(value);
        this.strings.push(isWeb ? "<br />" : "\r\n");
    }
}

//Esvazia o String Builder
stringBuilder.prototype.clear = function() {
    this.strings.length = 1;
}

//Retorna a String em buffer.
stringBuilder.prototype.toString = function() {
    return this.strings.join("");
}

function replace(sIn, sFind, sReplace) {
    var converted = "";
    var expr1;
    var sResult = sIn;
    for (var i = 0; i < sFind.length; i++) {
        converted = converted + "\\x" + hexConvert(sFind.charCodeAt(i));
    }
    expr1 = new RegExp(converted, "g");
    sResult = sResult.replace(expr1, sReplace);

    return sResult;
}

function hexConvert(convert) {
    var hexa;
    var firstnum;
    var lastnum;

    b = Math.floor(convert / 16);
    c = convert; c %= 16
    charx = '0123456789ABCDEF';
    firstnum = charx.substring(b, b + 1);
    lastnum = charx.substring(c, c + 1);
    hexa = firstnum + lastnum;

    return hexa;
}

//Scripts de area de texto
// Evita o estouro em campos de area de texto
function areaTextoAoDigitar(control) {
    maxLength = control.attributes["maxLength"].value;
    value = control.value;

    if (maxLength && value.length > maxLength - 1) {
        event.returnValue = false;
        maxLength = parseInt(maxLength);
    }
}
// Cancela o comportamento padrao
function areaTextoAntesDeColar(control) {
    maxLength = control.attributes["maxLength"].value;

    if (maxLength) {
        event.returnValue = false;
    }
}
// Cancela o comportamento padrao e cria um novo para "colar"
function areaTextoAoColar(control) {
    maxLength = control.attributes["maxLength"].value;
    value = control.value;

    if (control.attributes["readOnly"] && control.attributes["readOnly"].value == "true") {
        event.returnValue = false;
        return;
    }

    if (maxLength) {
        event.returnValue = false;
        maxLength = parseInt(maxLength);
        var oTR = control.document.selection.createRange();
        var iInsertLength = maxLength - value.length + oTR.text.length;
        var sData = window.clipboardData.getData("Text").substr(0, iInsertLength);
        oTR.text = sData;
    }
}

//Grid View
function selecionarTodos(objeto, idCheckBox) {
    var checkBox = document.getElementsByTagName('input');

    for (i = 0; i < checkBox.length; i++) {
        var input = checkBox[i];
        if (input.type == 'checkbox' && input.name != objeto.name && input.id.indexOf(idCheckBox) > -1) {
            input.checked = objeto.checked;
        }
    }
}

//Scripts das seções de formulários
function expandirContrairSecao(sender, idTrConteudoSecao, idHidden) {
    var conteudoSecao = document.getElementById(idTrConteudoSecao);
    var hidden = document.getElementById(idHidden);
    var visibilidadeAtual = conteudoSecao.style.display;

    if ((visibilidadeAtual == null || visibilidadeAtual == '') || visibilidadeAtual == 'block') {
        conteudoSecao.style.display = 'none';
        hidden.value = 'True';
        sender.innerHTML = sender.innerHTML.replace("-", "+");
    }
    else {
        conteudoSecao.style.display = 'block';
        hidden.value = 'False';
        sender.innerHTML = sender.innerHTML.replace("+", "-");
    }
}

//Caixa de Lista
function iniciarCaixaLista() {
    if (!(document.getElementById)) { return; }
    for (var i = 0; i < caixasLista.length; i++) {
        var info = caixasLista[i];
        carregarCaixaLista(info);
    }
}

function carregarCaixaLista(info) {
    var list = document.getElementById(info.id);
    if (list == null || typeof (list.tracker) != 'undefined') {
        return;
    }

    list.tracker = document.getElementById(info.idHiddenEstado);
    list.adicionar = adicionarItemCaixaLista;
    list.inserir = inserirItemCaixaLista;
    list.remover = removerItemCaixaLista;
    list.moverParaCima = moverItemCaixaListaCima;
    list.moverParaBaixo = moverItemCaixaListaBaixo;
    list.tracker.texto = "";
}

function adicionarItemCaixaLista(value, text, title, index) {
    var newOption = new Option();
    newOption.text = text;
    newOption.value = value;
    newOption.title = title;
    var insertIndex = parseInt(index);
    if (!isNaN(insertIndex)) {
        this.tracker.value += "+" + value + "\x03" + text + "\x03" + index + "\x1F";
        this.inserir(newOption, insertIndex);
    } else {
        this.tracker.value += "+" + value + "\x03" + text + "\x1F";
        this.inserir(newOption);
    }
}

function removerItemCaixaLista(index) {
    if (typeof (this.options.remove) == "undefined") {
        this.options.remove = removerItemCaixaListaNivelMenor;
    }
    this.tracker.value += "-" + index + "\x1F";
    this.options.remove(index);
}

function removerItemCaixaListaNivelMenor(index) {
    this[index] = null;
}

function inserirItemCaixaLista(option, index) {
    if (typeof (index) == "undefined" || index >= this.options.length) {
        this.options[this.options.length] = option;
    } else {
        for (var i = this.options.length; i > index; i--) {
            var optionCopy = new Option();
            optionCopy.text = this.options[i - 1].text;
            optionCopy.value = this.options[i - 1].value;
            optionCopy.title = this.options[i - 1].title;
            this.options[i] = optionCopy;
        }
        this.options[index] = option;
    }
}

function moverItemCaixaListaCima() {
    var index = this.options.selectedIndex;
    if (index == -1 || index == 0) {
        return;
    }
    var theItem = this.options[index];
    var oldText = theItem.text;
    var oldValue = theItem.value;
    var oldTitle = theItem.title;
    this.remover(index);
    this.adicionar(oldValue, oldText, oldTitle, index - 1);
    this.options.selectedIndex = index - 1;
}

function moverItemCaixaListaBaixo() {
    var index = this.options.selectedIndex;
    if (index == -1 || index == this.options.length - 1) {
        return;
    }
    var theItem = this.options[index];
    var oldText = theItem.text;
    var oldValue = theItem.value;
    var oldTitle = theItem.title;
    this.remover(index);
    this.adicionar(oldValue, oldText, oldTitle, index + 1);
    this.options.selectedIndex = index + 1;
}

function possuiOpcoes(combo) {
    if (combo != null && combo.options != null) {
        return true;
    }

    return false;
}

/* 
Move os itens selecionados de um ListBox para outro, com mensagem em caso de não seleção.
Obs: Só é utilizado com ListBox do tipo CaixaLista 
*/
function moverOpcoesSelecionadasMensagem(de, para, moverTodas, mensagem) {
    var comboDe = document.getElementById(de);
    if (comboDe.selectedIndex == -1)
        alert(mensagem);

    moverOpcoesSelecionadas(de, para, moverTodas);
}
/* 
Move os itens selecionados de um ListBox para outro 
Obs: Só é utilizado com ListBox do tipo CaixaLista 
*/
function moverOpcoesSelecionadas(de, para, moverTodas) {
    var comboDe = document.getElementById(de);
    var comboPara = document.getElementById(para);

    if (!possuiOpcoes(comboDe)) {
        return;
    }

    for (var i = 0; i < comboDe.options.length; i++) {
        var o = comboDe.options[i];

        if (o.selected || moverTodas) {
            if (!possuiOpcoes(comboPara)) {
                var index = 0;
            }
            else {
                var index = comboPara.options.length;
            }

            comboPara.adicionar(o.value, o.text, o.title, index);
        }
    }

    for (var i = (comboDe.options.length - 1); i >= 0; i--) {
        var o = comboDe.options[i];

        if (o.selected || moverTodas) {
            comboDe.remover(i);
        }
    }

    comboDe.selectedIndex = -1;
    comboPara.selectedIndex = -1;
}

//Trim
function trim(texto) {
    return texto.replace(/^\s+|\s+$/g, '');
}

//Caixa de Cores
function exibirCaixaSelecao(botao, idCaixaTexto) {
    var caixaTexto = document.getElementById(idCaixaTexto);

    if (caixaTexto) {
        showColorPicker(botao, caixaTexto);
    }
}

//Fechar dialogo retornado mensagem
function fecharRetorno(mensagem)
{
    window.returnValue = mensagem;        
    window.close();    
}

//Abrir dialogo

//SIG 21529 -Inicio
function get_browser() {
    var ua = navigator.userAgent, tem, M = ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
    if (/trident/i.test(M[1])) {
        tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
        return { name: 'IE', version: (tem[1] || '') };
    }
    if (M[1] === 'Chrome') {
        tem = ua.match(/\bOPR\/(\d+)/)
        if (tem != null) { return { name: 'Opera', version: tem[1] }; }
    }
    M = M[2] ? [M[1], M[2]] : [navigator.appName, navigator.appVersion, '-?'];
    if ((tem = ua.match(/version\/(\d+)/i)) != null) { M.splice(1, 1, tem[1]); }
    return {
        name: M[0],
        version: M[1]
    };
}
//SIG 21529 - Fim

function exibirDialogo(url, largura, altura) {
    //SIG 21529 - Adaptado para o chrome --Inicio
    var browser = get_browser();
    var retorno = null;
    if ((browser.name.toLocaleUpperCase() == "IE") || (browser.name.toUpperCase() == "MSIE")) {
        //var retorno = showModalDialog(url, window, 'dialogWidth: ' + largura + 'px; dialogHeight: ' + altura + 'px; center: yes; status: no; help: no; scroll: no;');

        if (typeof (retorno) == 'object') {
            if (retorno.expirou != undefined && retorno.expirou == true) {
                window.location.href = retorno.urlLogin;
                return null;
            }
        }
    } else {
        var left = (screen.width / 2) - (largura / 2);
        var top = (screen.height / 2) - (altura / 2);
        retorno = window.open(url, window, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + largura + ', height=' + altura + ', top=' + top + ', left=' + left);
    }
    //SIG 21529 --fim

    return retorno;
}

//Abrir dialogo com argumentos
function exibirDialogoComArgumentos(url, objeto, largura, altura) {
    var retorno = showModalDialog(url, objeto, 'dialogWidth: ' + largura + 'px; dialogHeight: ' + altura + 'px; center: yes; status: no; help: no; scroll: no;');

    if (typeof (retorno) == 'object') {
        if (retorno.expirou != undefined && retorno.expirou == true) {
            window.location.href = retorno.urlLogin;
            return null;
        }
    }

    return retorno;
}

//Fechar dialogo
function fechar() {
    window.close();
}

//Validar Imagem em campo FileUpload
function ValidateFile(source, args) {
    try {
        var fileAndPath = document.getElementById(source.controltovalidate).value;
        var lastPathDelimiter = fileAndPath.lastIndexOf("\\");
        var fileNameOnly = fileAndPath.substring(lastPathDelimiter + 1);
        var file_extDelimiter = fileNameOnly.lastIndexOf(".");
        var file_ext = fileNameOnly.substring(file_extDelimiter + 1).toLowerCase();
        if (file_ext != "jpg") {
            args.IsValid = false;
            if (file_ext != "gif")
                args.IsValid = false;
            if (file_ext != "png") {
                args.IsValid = false;
                return;
            }
        }
    }
    catch (err) {
    }

    args.IsValid = true;
}

//Validar planilha em campo FileUpload
function validarPlanilha(source, args) {
    try {
        var fileAndPath = document.getElementById(source.controltovalidate).value;
        var lastPathDelimiter = fileAndPath.lastIndexOf("\\");
        var fileNameOnly = fileAndPath.substring(lastPathDelimiter + 1);
        var file_extDelimiter = fileNameOnly.lastIndexOf(".");
        var file_ext = fileNameOnly.substring(file_extDelimiter + 1).toLowerCase();

        if (file_ext != "csv") {
            args.IsValid = false;
            return;
        }
    }
    catch (err) { }

    args.IsValid = true;
}

function navegarDesmarcados(obj) {
    var chk1 = false;

    //Get the mom.
    var head1 = obj.parentElement.previousSibling;

    //no rows, cant do my work.
    if (obj.rows == null) {
        return;
    }

    //This is how may rows are at this level.
    var pTreeLevel1 = obj.rows[0].cells.length;

    //Are we a mommy?
    if (head1.tagName == "TABLE") {
        //Get the list of rows ahead of us.
        var tbls = obj.parentElement.getElementsByTagName("TABLE");
        //get the count of that list.
        var tblsCount = tbls.length;

        //determine if any of the rows underneath are unchecked.
        for (i = 0; i < tblsCount; i++) {
            var childTreeLevel = tbls[i].rows[0].cells.length;

            if (childTreeLevel = pTreeLevel1) {
                var chld = tbls[i].getElementsByTagName("INPUT");

                if (chld[0].checked == true) {
                    chk1 = true;

                    break;
                }
            }
        }

        var nd = head1.getElementsByTagName("INPUT");

        nd[0].checked = chk1;

        //do the same for the level above
        navegarDesmarcados(obj.parentElement);
    }
    else {
        return;
    }
}

function navegarArvore(obj) {
    //head1 gets the parent node of the checked node
    var head = obj.parentElement.previousSibling;

    if (head.tagName == "TABLE") {
        //checks for the input tag which consists of checkbox

        var matchElement = head.getElementsByTagName("INPUT");

        //matchElement[0] gives us the checkbox and it is checked
        //something is wrong here, fixed
        if (matchElement.length > 0) {
            matchElement[0].checked = true;
        }
    }
    else {
        head = obj.parentElement.previousSibling;
    }

    if (head.tagName == "TABLE") {
        navegarArvore(obj.parentElement);
    }
    else {
        return;
    }
}

function clickArvore() {
    // obj gives us the node on which check or uncheck operation has performed
    var obj = window.event.srcElement;

    var treeNodeFound = false;

    var checkedState;

    //checking whether obj consists of checkbox to avoid exception

    if (obj.tagName == "INPUT" && obj.type == "checkbox") {
        var treeNode = obj;

        checkedState = treeNode.checked;

        //work our way back to the parent <table> element
        do {
            obj = obj.parentElement;
        }
        while (obj.tagName != "TABLE");

        var parentTreeLevel = obj.rows[0].cells.length;
        var parentTreeNode = obj.rows[0].cells[0];

        //get all the TreeNodes inside the TreeView (the parent <div>)
        var tables = obj.parentElement.getElementsByTagName("TABLE");

        //checking for any node is checked or unchecked during operation
        if (obj.tagName == "TABLE") {
            // Modified - if any node is checked then their parent node is checked
            if (treeNode.checked) {
                navegarArvore(obj);
            } //end if - checked

            //total number of TreeNodes
            var numTables = tables.length

            if (numTables >= 1) {
                //cycle through all the TreeNodes
                //until we find the TreeNode we checked

                for (i = 0; i < numTables; i++) {
                    if (tables[i] == obj) {
                        treeNodeFound = true;
                        i++;

                        if (i == numTables) {
                            //if we're on the last TreeNode, we are done
                            break;
                        }
                    }

                    if (treeNodeFound == true) {
                        var childTreeLevel = tables[i].rows[0].cells.length;

                        if (childTreeLevel > parentTreeLevel) {
                            var cell = tables[i].rows[0].cells[childTreeLevel - 1];
                            //set the checkbox to match the checkedState

                            var inputs = cell.getElementsByTagName("INPUT");

                            inputs[0].checked = checkedState;
                        }
                        else {
                            //if any of the preceding TreeNodes are not deeper stop
                            break;
                        }
                    } //end if

                } //end for

            } //end if - numTables >= 1

            //Modified - If all child nodes are unchecked then their parent node is unchecked
            if (!treeNode.checked) {
                navegarDesmarcados(obj);
            } //end if - unChecked

        } //end if - tagName = TABLE

    } //end if

} //end function

// Valida o limite de caracteres nos filtros de pesquisas
function validarDataFutura(objeto, args) {
    try {

        var dataAtualServidor = obterData(dataAtual);
        var data = obterData(args.Value);

        if (data > dataAtualServidor) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
    catch (e) {
        args.IsValid = false;
    }
}

// Valida o limite de caracteres nos filtros de pesquisas
function validarPesquisa(objeto, args) {
    try {
        var texto = trim(args.Value);

        if (texto.length > 0 && texto.length < 3) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
    catch (e) {
        args.IsValid = false;
    }
}

function validarDatasParaValidador(val) {
    return validarDatas(val.idDataInicial, val.idDataFinal);
}

function validarDatas(idInicial, idFinal) {
    var dataInicial = obterData(document.getElementById(idInicial).value);
    var dataFinal = obterData(document.getElementById(idFinal).value);

    if (!dataInicial || !dataFinal) {
        return true;
    }

    if (dataInicial <= dataFinal) {
        return true;
    }

    return false;
}

function obterData(sData) {
    if (!sData || sData == "") {
        return null;
    }

    var partes = sData.split('/');

    return new Date(partes[2], partes[1] - 1, partes[0]);
}

    //Thiago Melo SOL 216474 Kintana 2045796
    
    /*Função adicionada para correção do bug do horário de verão.
    No dia que o horario de verão entra em vigor, não existe 0h.
    Então o calendário volta para o dia anterior às 23h.
    Este script adiciona uma hora ao dia, resolvendo o problema.*/
    function checkDate(sender, args) {
        var selectedDate = new Date();
        
        selectedDate = sender._selectedDate;
        
        if (selectedDate.getHours() == 23) {
            selectedDate.setHours(1);
            selectedDate.setDate(selectedDate.getDate() + 1);
            sender._selectedDate = selectedDate;                 
            
            sender._format = "dd/MM/yyyy";
            
            sender._textbox.set_Value(sender._selectedDate.format(sender._format));
        }
    }
    //Thiago Melo SOL 216474 Kintana 2045796
    

function obterAtributoLeft(Elem) {
    xPos = Elem.offsetLeft;
    tempEl = Elem.offsetParent;

    while (tempEl != null) {
        xPos += tempEl.offsetLeft;
        tempEl = tempEl.offsetParent;
    }

    return xPos;
}

function obterAtributoTop(Elem) {
    yPos = Elem.offsetTop;
    tempEl = Elem.offsetParent;

    while (tempEl != null) {
        yPos += tempEl.offsetTop;
        tempEl = tempEl.offsetParent;
    }

    return yPos;
}

function redirecionarComAlerta(mensagem, url) {
    alert(mensagem);
    window.location.replace(url);
}

function redirecionarComConfirmacao(mensagem, url) {
    if ( confirm(mensagem) )
    {
        window.location.replace(url);
    }
}


function atualizarToken(tokenId) {
    //var contexto = new Object();
    //contexto.hiddenId = tokenId;

    //WebForm_DoCallback('__Page', 'atualizarToken', atualizarTokenCallback, contexto, null);
}

function atualizarTokenCallback(result, context) {
    var hiddenToken = document.getElementById(contexto.hiddenId);

    if (hiddenToken) {
        hiddenToken.value = result;
    }
}

function compararValores(objeto, args) {
    try {
        var controleComparacao = document.getElementById(objeto.controleComparacao);
        var tipo = objeto.tipo;
        var separadorGrupo = objeto.separadorGrupo;
        var separadorDecimal = objeto.separadorDecimal;
        var valor1 = args.Value;
        var valor2 = controleComparacao.value;

        if (valor1 == null || trim(valor1) == '') {
            return false;
        }

        if (valor2 == null || trim(valor2) == '') {
            return false;
        }

        valor1 = tratarValor(valor1, separadorGrupo);
        valor2 = tratarValor(valor2, separadorGrupo);

        if (tipo == 'valorInteiro') {
            valor1 = parseInt(valor1);
            valor2 = parseInt(valor2);
        }
        else if (tipo == 'valorDouble') {
            valor1 = parseFloat(valor1.replace(/[separadorGrupo]/g, '').replace(separadorDecimal, '.'));
            valor2 = parseFloat(valor2.replace(separadorDecimal, '.'));
        }

        switch (objeto.operador) {
            case "Equal":
                args.IsValid = (valor1 == valor2);
                return;
            case "NotEqual":
                args.IsValid = (valor1 != valor2);
                return;
            case "GreaterThan":
                args.IsValid = (valor1 > valor2);
                return;
            case "GreaterThanEqual":
                args.IsValid = (valor1 >= valor2);
                return;
            case "LessThan":
                args.IsValid = (valor1 < valor2);
                return;
            case "LessThanEqual":
                args.IsValid = (valor1 <= valor2);
                return;
            default:
                args.IsValid = false;
        }
    }
    catch (e) {
        args.IsValid = false;
    }
}

function tratarValor(valor, separadorGrupo) {
    while (valor.indexOf(separadorGrupo) > -1) {
        valor = valor.replace(separadorGrupo, '');
    }

    if (valor.indexOf('-') > -1) {
        valor = valor.replace('-', '');
        valor = '-' + valor;
    }

    return valor;
}

function obterRegistrosSelecionados(idGrid) {
    var grid = document.getElementById(idGrid);
    var selecionados = 0;

    if (grid) {
        var checkBoxes = grid.getElementsByTagName('input');

        if (checkBoxes != null && checkBoxes.length > 0) {
            for (i = 0; i < checkBoxes.length; i++) {
                var checkBox = checkBoxes[i];

                if (checkBox.id.indexOf('CheckBoxButton') > -1 && !checkBox.disabled && checkBox.checked)
                    selecionados++;
            }
        }
    }

    return selecionados;
}

function definirCarencia(caixaCarenciaId, tipo) {
    var caixaCarencia = document.getElementById(caixaCarenciaId);

    if (caixaCarencia) {
        switch (tipo) {
            case 'A':
                caixaCarencia.valorMinimo = '1';
                caixaCarencia.valorMaximo = '200';
                break;
            case 'M':
                caixaCarencia.valorMinimo = '1';
                caixaCarencia.valorMaximo = '99';
                break;
            default:
                break;
        }

        caixaCarencia.focus();
        caixaCarencia.blur();
    }
}

function congelarCabecalhoGrid(gridID) {
    var grid = document.getElementById(gridID);

    if (grid != 'undefined') {
        grid.style.visibility = 'hidden';
        var div = null;

        if (grid.parentNode != 'undefined') {
            div = grid.parentNode;

            if (div.tagName == 'DIV') {
                div.className = 'divGrid';
                div.style.overflow = "auto";
            }
        }

        var tags = grid.getElementsByTagName('TBODY');

        if (tags != 'undefined') {
            var tbody = tags[0];
            var trs = tbody.getElementsByTagName('TR');
            var headerHeight = 8;

            if (trs != 'undefined') {
                headerHeight += trs[0].offsetHeight;
                var headTR = tbody.removeChild(trs[0]);
                var head = document.createElement('THEAD');
                head.appendChild(headTR);
                grid.insertBefore(head, grid.firstChild);
            }
        }

        grid.style.visibility = 'visible';
    }
}

function carregando(trocaDePagina) {
    if (trocaDePagina) {
        var divCarregando = null;
        var imgCarregando = null;

        var imgs = document.getElementsByTagName("img");

        for (var i = 0; i < imgs.length; i++) {
            if (imgs[i].src.indexOf("imgCarregando") > -1) {
                imgCarregando = imgs[i];
                divCarregando = imgCarregando.parentElement
                break;
            }
        }

        divCarregando.style.top = Number((Number(document.body.scrollTop) + Number(screen.height / 2)) - 17).toString() + "px"
        divCarregando.style.left = Number((screen.width / 2) - 60).toString() + "px"
        divCarregando.style.display = "";
    }
}

function validaCampoNumerico(event) {
    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40 || event.keyCode == 46 || ( event.keyCode > 95 && event.keyCode < 106))
        return true;
    if (event.shiftKey || event.ctrlKey || event.altKey)
        return false;
    return soNumero(String.fromCharCode(event.keyCode));
}

function soNumero(value) {
    return /\d/.test(value);
}

// JavaScript Document
//adiciona mascara de Numero unico de protocolo  Xavier SOL 172525
function MascaraNUP(nup){
        if(mascaraInteiro(nup)==false){
                event.returnValue = false;
        }       
        return formataCampo(nup, '00000.000000/0000', event);
}

//valida numero inteiro com mascara  Xavier SOL 172525
function mascaraInteiro(){
        if (event.keyCode < 48 || event.keyCode > 57){
                event.returnValue = false;
                return false;
        }
        return true;
}
// PosicaoCursor Xavier SOL 172525
function PosicaoCursor(textarea)
{
 var pos = 0;
 if (typeof (document.selection) != ' ')
 {
  //IE
  var range = document.selection.createRange();
  var i = 0;
  for (i = textarea.value.length; i > 0; i--)
  {
   if (range.moveStart('character', 1) == 0)
    break;
  }
  pos = i;
 }
 if (typeof (textarea.selectionStart) != 'undefined')
 {
  //FireFox
  pos = textarea.selectionStart;
 }

 if (pos == textarea.value.length)
  return 0; //retorna 0 quando não precisa posicionar o elemento
 else
  return pos; //posição do cursor
} 


//evita criar mascara quando as teclas são pressionadas Xavier SOL 172525
function teclaValida(tecla)
{
 if (tecla == 8 //backspace
 //Esta evitando o post, quando são pressionadas estas teclas.
 //Foi comentado pois, se for utilizado o evento texchange, é necessario o post.
        || tecla == 9 //TAB
        || tecla == 27 //ESC
        || tecla == 16 //Shif TAB
        || tecla == 45 //insert
        || tecla == 46 //delete
        || tecla == 35 //home
        || tecla == 36 //end
        || tecla == 37 //esquerda
        || tecla == 38 //cima
        || tecla == 39 //direita
        || tecla == 40)//baixo
  return false;
 else
  return true;
} 

// Formata só números Xavier SOL 172525
function formataInteiro(campo, evt)
{
 //1234567890 
 xPos = PosicaoCursor(campo);
 evt = getEvent(evt);
 var tecla = getKeyCode(evt);
 if (!teclaValida(tecla))
  return;

 campo.value = filtraNumeros(filtraCampo(campo));
 MovimentaCursor(campo, xPos);
} 

// recupera o evento do form Xavier SOL 172525
function getEvent(evt)
{
 if (!evt) evt = window.event; //IE
 return evt;
}

// move o cursor para a posição pos Xavier SOL 172525
function MovimentaCursor(textarea, pos)
{
 if (pos <= 0)
  return; //se a posição for 0 não reposiciona

 if (typeof (document.selection) != 'undefined')
 {
  //IE
  var oRange = textarea.createTextRange();
  var LENGTH = 1;
  var STARTINDEX = pos;

  oRange.moveStart("character", -textarea.value.length);
  oRange.moveEnd("character", -textarea.value.length);
  oRange.moveStart("character", pos);
  //oRange.moveEnd("character", pos);
  oRange.select();
  textarea.focus();
 }
 if (typeof (textarea.selectionStart) != 'undefined')
 {
  //FireFox
  textarea.selectionStart = pos;
  textarea.selectionEnd = pos;
 }
}


// limpa todos os caracteres especiais do campo solicitado Xavier SOL 172525
function filtraCampo(campo)
{
 var s = "";
 var cp = "";
 vr = campo.value;
 tam = vr.length;
 for (i = 0; i < tam; i++)
 {
  if (vr.substring(i, i + 1) != "/"
            && vr.substring(i, i + 1) != "-"
            && vr.substring(i, i + 1) != "."
            && vr.substring(i, i + 1) != "("
            && vr.substring(i, i + 1) != ")"
            && vr.substring(i, i + 1) != ":"
            && vr.substring(i, i + 1) != ",")
  {
   s = s + vr.substring(i, i + 1);
  }
 }
 return s;
 //return campo.value.replace("/", "").replace("-", "").replace(".", "").replace(",", "")
}

// limpa todos caracteres que não são números Xavier SOL 172525
function filtraNumeros(campo)
{
 var s = "";
 var cp = "";
 vr = campo;
 tam = vr.length;
 for (i = 0; i < tam; i++)
 {
  if (vr.substring(i, i + 1) == "0" ||
            vr.substring(i, i + 1) == "1" ||
            vr.substring(i, i + 1) == "2" ||
            vr.substring(i, i + 1) == "3" ||
            vr.substring(i, i + 1) == "4" ||
            vr.substring(i, i + 1) == "5" ||
            vr.substring(i, i + 1) == "6" ||
            vr.substring(i, i + 1) == "7" ||
            vr.substring(i, i + 1) == "8" ||
            vr.substring(i, i + 1) == "9")
  {
   s = s + vr.substring(i, i + 1);
  }
 }
 return s;
 //return campo.value.replace("/", "").replace("-", "").replace(".", "").replace(",", "")
}

//Recupera o código da tecla que foi pressionado Xavier SOL 172525
function getKeyCode(evt)
{
 var code;
 if (typeof (evt.keyCode) == 'number')
  code = evt.keyCode;
 else if (typeof (evt.which) == 'number')
  code = evt.which;
 else if (typeof (evt.charCode) == 'number')
  code = evt.charCode;
 else
  return 0;

 return code;
} 


//formata de forma generica os campos Xavier SOL 172525
function formataCampo(campo, Mascara, evento) { 
        var boleanoMascara; 
        
        var Digitato = evento.keyCode;
        exp = /\-|\.|\/|\(|\)| /g
        campoSoNumeros = campo.value.toString().replace( exp, "" ); 
        
        var posicaoCampo = 0;    
        var NovoValorCampo="";
        var TamanhoMascara = campoSoNumeros.length;; 
        
        if (Digitato != 8) { // backspace 
                for(i=0; i<= TamanhoMascara; i++) { 
                        boleanoMascara  = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                                                                || (Mascara.charAt(i) == "/")) 
                        boleanoMascara  = boleanoMascara || ((Mascara.charAt(i) == "(") 
                                                                || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " ")) 
                        if (boleanoMascara) { 
                                NovoValorCampo += Mascara.charAt(i); 
                                  TamanhoMascara++;
                        }else { 
                                NovoValorCampo += campoSoNumeros.charAt(posicaoCampo); 
                                posicaoCampo++; 
                          }              
                  }      
                campo.value = NovoValorCampo;
                  return true; 
        }else { 
                return true; 
        }
}


function mask(inputName, mask, evt) {
    try {
        var text = document.getElementById(inputName);
        var value = text.value;

        // If user pressed DEL or BACK SPACE, clean the value
        try {
            var e = (evt.which) ? evt.which : event.keyCode;
            if (e == 46 || e == 8) {
                text.value = "";
                return;
            }
        } catch (e1) { }

        var literalPattern = /[0\*]/;
        var numberPattern = /[0-9]/;
        var newValue = "";

        for (var vId = 0, mId = 0; mId < mask.length;) {
            if (mId >= value.length)
                break;

            // Number expected but got a different value, store only the valid portion
            if (mask[mId] == '0' && value[vId].match(numberPattern) == null) {
                break;
            }

            // Found a literal
            while (mask[mId].match(literalPattern) == null) {
                if (value[vId] == mask[mId])
                    break;

                newValue += mask[mId++];
            }

            newValue += value[vId++];
            mId++;
        }

        text.value = newValue;
    } catch (e) { }
}
