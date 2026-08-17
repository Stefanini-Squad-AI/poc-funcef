{
--------------------------------------------------------------------------------
Pendência   : SOL 165269 Kintana 1428881
Responsável : Fanuel Junior
Data        : 22/09/2011
Descrição   : Corrigido erro no Extrato Simples que estava apresentando itens
              internos e quitados como abertos
--------------------------------------------------------------------------------
Pendência   : SOL 158812 Kintana 1407372
Responsável : Fanuel Junior
Data        : 02/09/2011
Descrição   : ajustar a concordância na frase disponível no autoatendimento na
              tela CONSULTA/CONTRATOS. "**Saldo atualizado = saldo devedor + valores
              em aberto atualizado para data solicitada" PARA:SALDO ATUALIZADO =
              SALDO DEVEDOR + VALORES EM ABERTO ATUALIZADOS PARA A DATA SOLICITADA"
--------------------------------------------------------------------------------
Pendência   : SOL 159249 KINTANA 1376423
Responsável : Fanuel Junior
Data        : 30/08/2011
Descrição   : Erro ao mostrar valor efetivos para valores pagos
--------------------------------------------------------------------------------
Pendência   : SOL 157961 KINTANA 1270392
Responsável : Fanuel Junior
Data        : 20/05/2011
Descrição   : Alterar formato da data de MM/DD/YYYY para DD/MM/YYY.
--------------------------------------------------------------------------------
Pendência   : SOL 147389 KINTANA 1018589
Responsável : FERNANDO XAVIER
Data        : 10/01/2011
Descrição   : Ajuste no extrato de empréstimo.
--------------------------------------------------------------------------------
Pendência   : SOL 149267 KINTANA 1065963
Responsável : BRUNO AZEVEDO
Data        : 04/02/2011
Descrição   : Correção na consulta do saldo de empréstimos.
--------------------------------------------------------------------------------
Pendência   : SOL 145673 KINTANA 984802
Responsável : BRUNO AZEVEDO
Data        : 07/01/2011
Descrição   : Separar o Extra de Empréstimos em linhas e colunas.
--------------------------------------------------------------------------------
Pendência   : SOL 141229 KINTANA 906630
Responsável : BRUNO AZEVEDO
Data        : 25/11/2010
Descrição   : Ajuste no extrato simples de empréstimo.
--------------------------------------------------------------------------------
Pendência   : SOL 140492 KINTANA 881593
Responsável : Ádler Souza
Data        : 31/08/2010
Descrição   : Inserir o valor do fundo garantidor abaixo da prestação.
--------------------------------------------------------------------------------
Pendência   : SOL 140310 KINTANA 877933
Responsável : BRUNO AZEVEDO
Data        : 28/07/2010
Descrição   : Permitir atualizar o saldo do contrato apenas para as datas que tem
              atualização diária.
--------------------------------------------------------------------------------
Pendência   : SOL 139842 KINTANA 866182
Responsável : BRUNO AZEVEDO
Data        : 21/07/2010
Descrição   : Retirado o Link para o #SALDO, estava travando o sistema.
--------------------------------------------------------------------------------
Pendência   : SOL 91646 KINTANA 394815
Responsável : BRUNO AZEVEDO
Data        : 01/07/2010
Descrição   : Alteração nos menus do extrato de emprestimo:
              Extrato agrupado  -> Extrato simples
              Extrato Expandido -> Extrato completo
--------------------------------------------------------------------------------
Pendência   : SOL 131352 KINTANA 747109
Responsável : BRUNO AZEVEDO
Data        : 30/06/2010
Descrição   : Modificação na consulta de contratos para apresentar os contratos 
              existentes ao invés do participante ter que informar todas as 
              informações.
--------------------------------------------------------------------------------

}
unit uWebEmpConsEmprestimos;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, JCLSysUtils, Classes, Windows,
     FileCtrl, httpapp, uCmClientDataSet, uTypesEmptmoAA, uCtrlFuncoesAA, uCmFileUtils, DB;

//Monta a página de Saldo de Emprestimos
function SaldoEmprestimos( iIdPessoaLocal, iIdTipoEmptmo, iIdTipoContrEmptmo : integer; iIdContratoEmptmo : extended;
                           iIDITEMPROVPERDA : integer; iFlgAbonoDiverg : integer; dData : TDateTime; bFlgExcepcional : boolean ) : String;

//Monta a página de Extrato de Emprestimos Expandido
function PaginaEmpExtratoExpEmprestimos( iIdPessoaLocal, iIdTitular : integer;
                                         iIdContratoEmptmo : extended;
                                         sFlgSituacao : string;
                                         iIdTipoEmptmo,
                                         iIdTipoContrEmptmo : extended;
                                         sSomenteAbertos, sContrato: String  ) : string;


//Monta a página de Extrato de Emprestimos Agrupado
function PaginaEmpExtratoAgrEmprestimos( iIdPessoaLocal, iIdTitular : integer;
                                         iIdContratoEmptmo : extended;
                                         sFlgSituacao : string;
                                         iIdTipoEmptmo,
                                         iIdTipoContrEmptmo : extended;
                                         sSomenteAbertos, sContrato: String ) : string;

//Monta a página de parametrização de Consulta a Contrato
function PaginaParamConsultaContrato(iIdPessoaLocal, iIdTitular : integer) : string;

//Monta a página de parametrização de Extrato de Empréstimos
//Modo: 0 = Agrupado; 1 = Expandido
function PaginaParamExtratoEmptmo( iModo : integer ) : string;

//Monta a página de Consulta a Contrato
function PaginaConsultaContrato( iIdPessoaLocal : integer;
                                 iIdContratoEmptmo : extended;
                                 sFlgSituacao : string;
                                 iIdTipoEmptmo,
                                 iIdTipoContrEmptmo : extended;
                                 sData : string ) : string;

//Monta a página de parametrização de Consulta a Inscrição
function PaginaParamConsultaInscricao : string;

//Monta a página de Consulta a Inscrição
function PaginaConsultaInscricao( iIdPessoaLocal, iIdTitular : integer;
                                  iIdInscricaoEmptmo : extended;
                                  sFlgSituacao : string;
                                  iIdTipoEmptmo,
                                  iIdTipoContrEmptmo : extended ) : string;

//Monta a página de Confirmação e de exclusão de inscrição
function PaginaConfirmaExclInscricao( iIdInscricaoEmptmo : extended; flgExclui: Integer ) : string;

implementation

//Monta a página de Extrato de Emprestimos
function PaginaEmpExtratoExpEmprestimos( iIdPessoaLocal, iIdTitular : integer;
                                         iIdContratoEmptmo : extended;
                                         sFlgSituacao : string;
                                         iIdTipoEmptmo,
                                         iIdTipoContrEmptmo : extended;
                                         sSomenteAbertos, sContrato: String ) : string;

var
  iIdContratoEmptmoAnt : extended;
  sTituloCampo,sHmeParcAtual : String;
  sDescSit : string;
  bExibeTodos, bExibeAbertos : boolean;
begin

  try
    bExibeTodos := false;
    bExibeAbertos := false;
    if bFlgExtEmptmoAtv then sFlgSituacao := 'A';

    cds.Close;
    cds.Data := WebEmprestimo.ExtratoEmprestimos( iIdPessoaLocal,
                                                  iIdTitular,
                                                  iIdContratoEmptmo,
                                                  sFlgSituacao,
                                                  iIdTipoEmptmo,
                                                  iIdTipoContrEmptmo,
                                                  iIdEmpresaProp,
                                                  False,
                                                  True );

    if cds.IsEmpty then
    begin
      sTitulo := TituloPagina( pEmpExtratoNEncontr );
      Result := MontaPagina( pEmpExtratoNEncontr, Result );
    end
    else
    begin

      sTitulo := TituloPagina( pEmpExtratoExpEmprestimos );
      
      iIdContratoEmptmoAnt := 0;

      if TemAcessoPagina( sTipoUsuario, pEmpExtratoAgrEmprestimos, sTituloCampo ) then
        Result := Result +
         '<form method="POST" name="frmLnkEmpParamExtrato"                      ' + CR +
         '   action="../<#nomearqapl>/EmpExtratoAgrEmprestimos">                ' + CR +
         '  <p class="LINK" align="right">                                      ' + CR +
         '    <a href="JavaScript:EnviaForm( document.frmLnkEmpParamExtrato );">' +
         'Extrato Simples</a>'+
         '  </p>                                                                ' + CR +
         '  <input type="hidden" name="edtIdContratoEmptmo" value="' +
         FloatToStr( iIdContratoEmptmo ) + '">                                  ' + CR +
         '  <input type="hidden" name="cmbFlgSituacao" value="' +
         sFlgSituacao + '">                                                     ' + CR +
         '  <input type="hidden" name="cmbIdTipoEmptmo" value="' +
         FloatToStr( iIdTipoEmptmo ) + '">                                      ' + CR +
         '  <input type="hidden" name="cmbIdTipoContrEmptmo" value="' +
         FloatToStr( iIdTipoContrEmptmo ) + '">                                 ' + CR +
         '  <input type="hidden" name="edtFlgFiltro" value="1">                 ' + CR +
         '  <#hiddenfields>                                                     ' + CR +
         '</form>                                                               ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cEmpExtExpTabela, sTituloCampo ) then
      begin

        if not cds.IsEmpty then
        begin

          cdsHTMLColumns.Close;
          cdsHTMLColumns.CreateDataSet;
          IncluiColuna( cEmpExtExpEvento,         10, 'center'   );
          IncluiColuna( cEmpExtExpItem,           12, 'center'   );
          IncluiColuna( cEmpExtExpParcela,         6, 'center' );
          IncluiColuna( cEmpExtExpSitParcela,     10, 'center'   );
          IncluiColuna( cEmpExtExpSequencial,      5, 'center' );
          IncluiColuna( cEmpExtExpMesRef,          8, 'center'   );
          IncluiColuna( cEmpExtExpMesCobranca,     8, 'center'   );
          IncluiColuna( cEmpExtExpDtVenc,          7, 'center'   );
          IncluiColuna( cEmpExtExpDtPagto,         7, 'center'   );
          IncluiColuna( cEmpExtExpValorCalculado,  7, 'center'  );
          IncluiColuna( cEmpExtExpValorEfetivo,    7, 'center'  );
          IncluiColuna( cEmpExtExpTxJuros,         6, 'center'  );
          IncluiColuna( cEmpExtExpSaldoDevedor,    7, 'center'  );

          CmDebugtoFile(IntToSTr(cds.RecordCount),'C:\AAErro.txt');

          cds.First;
          while True do
          begin
             //Novo contrato
            if cds.FieldByName('IDCONTRATOEMPTMO').AsFloat <> iIdContratoEmptmoAnt then
            begin

              if iIdContratoEmptmoAnt <> 0 then
                Result := Result + '<BR><BR><BR>' + CR;

              Result := Result +
               '<table class="PRINC" border="0" width="100%"                  ' + CR +
               ' cellspacing="0" cellpadding="0" >                            ' + CR ;

              if ( TemAcessoCampo( sTipoUsuario, cEmpExtExpNumContrato, sTituloCampo ) or
                   TemAcessoCampo( sTipoUsuario, cEmpExtExpSituacao,    sTituloCampo ) ) then
              begin

                Result := Result +
                 '  <tr>                                                        ' + CR +
                 '    <td width="100%" colspan="2">                             ' + CR +
                 '      <table border="0" width="100%"                          ' + CR +
                 '             cellspacing="0" cellpadding="0" >                ' + CR +
                 '        <tr>                                                  ' + CR +
                 '          <td width="50%" class="CABPRINC">                   ' + CR ;

                if TemAcessoCampo( sTipoUsuario, cEmpExtExpNumContrato, sTituloCampo ) then
                  Result := Result +
                   '<font size=2> Contrato Nº ' + cds.FieldByName('IDCONTRATOEMPTMO').AsString +'</font>'+ CR ;

                Result := Result +
                 '          </td>                                               ' + CR +
                 '          <td width="47%" class="CABPRINC" align="right">     ' + CR ;

                if TemAcessoCampo( sTipoUsuario, cEmpExtExpSituacao, sTituloCampo ) then
                begin
                  sDescSit := cds.FieldByName('FLGSITUACAO').AsString;
                  if sDescSit = 'A' then sDescSit := 'Ativo'                   else
                  if sDescSit = 'E' then sDescSit := 'Ativo'                   else
                  if sDescSit = 'J' then sDescSit := 'Em cobrança judicial'    else
                  if sDescSit = 'K' then sDescSit := 'Em processo de quitação' else
                  if sDescSit = 'Q' then sDescSit := 'Quitado'                 else
                  if sDescSit = 'C' then sDescSit := 'Cancelado'               else
                  if sDescSit = 'S' then sDescSit := 'Suspenso'                else
                  if sDescSit = 'R' then sDescSit := 'Refinanciado'            else
                  if sDescSit = 'P' then sDescSit := 'Pendente de Liberação'   else
                                         sDescSit := cds.FieldByName('FLGSITUACAO').AsString;

                  Result := Result +'<font size=2>'+ sDescSit +'</font>'+ CR ;
                end;

                Result := Result +
                 '          </td>                                               ' + CR +
                 '          <td class="CABPRINC" align="center">                ' + CR ;

                if TemAcessoPagina( sTipoUsuario, pEmpDadosContrato, sTituloCampo ) then
                  Result := Result +
                   '  <a href="JavaScript:EnviaForm( document.frmLnkConsulta'             +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +' )">'                     +
                   '<img src="..\imagem\detalhestbl.gif" border="0"></a>                ' + CR ;

                 Result := Result +
                 '          </td>                                               ' + CR +
                 '      </table>                                                ' + CR +
                 '<table class="PRINC" border="0" width="100%"                  ' + CR +
                 ' cellspacing="0" cellpadding="0" >                            ' + CR +
                 '          <tr>                                                ' + CR +
                 '          <td width="30%" class="CABPRINC" align="Left">                  ' + CR +
                 '<font size=2> Data de Crédito: '+FormatDateTime( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsDateTime)    + CR +
                 '          </td>                                               ' + CR +
                 '          <td width="67%" class="CABPRINC" align="right">      ' + CR +
                 '<font size=2> '+cds.FieldByName('TCEDESCRICAO').AsString +'  '  + CR +
                 '          </td>                                               ' + CR +
                 '          </tr>                                               ' + CR +
                 '      </table>                                                ' + CR +
                 '    </td>                                                     ' + CR +
                 '  </tr>                                                       ' + CR +
                 '  <form method="POST" name="frmLnkConsulta'                     +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +'"               ' + CR +
                 '     action="../<#nomearqapl>/EmpConsultaContrato">           ' + CR +
                 '    <#hiddenfields>                                           ' + CR +
                 '    <input type="hidden" name="edtIdContratoEmptmo" value="'    +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString + '">             ' + CR +
                 '  </form>                                                     ' + CR +

                 //BRUNO AZEVEDO
                 '  <form method="POST" name="frmLnkConsultaExtratoCompleto'       +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +'"               ' + CR +
                 '     action="../<#nomearqapl>/EmpExtratoExpEmprestimos">      ' + CR +
                 '    <#hiddenfields>                                           ' + CR +
                 '    <input type="hidden" name="edtFlgFiltro" value="1">       ' + CR +
                 //'    <input type="hidden" name="bSomenteAbertos" value="' + sNovoSomenteAbertos + '">       ' + CR +
                 '    <input type="hidden" name="bSomenteAbertos" value="N">       ' + CR +
                 '    <input type="hidden" name="Contrato" value="'    +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString + '">             ' + CR +
                 '    <input type="hidden" name="edtIdContratoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbFlgSituacao" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoContrEmptmo" value=""> ' + CR +
                 '  </form>                                                     ' + CR +
                 //BRUNO AZEVEDO

                 //BRUNO AZEVEDO
                 '  <form method="POST" name="frmLnkConsultaExtratoCompletoFechar'       +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +'"               ' + CR +
                 '     action="../<#nomearqapl>/EmpExtratoExpEmprestimos">      ' + CR +
                 '    <#hiddenfields>                                           ' + CR +
                 '    <input type="hidden" name="edtFlgFiltro" value="1">       ' + CR +
                 //'    <input type="hidden" name="bSomenteAbertos" value="' + sNovoSomenteAbertos + '">       ' + CR +
                 '    <input type="hidden" name="bSomenteAbertos" value="S">       ' + CR +
                 '    <input type="hidden" name="Contrato" value="'    +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString + '">             ' + CR +
                 '    <input type="hidden" name="edtIdContratoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbFlgSituacao" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoContrEmptmo" value=""> ' + CR +
                 '  </form>                                                     ' + CR ;
                 //BRUNO AZEVEDO




              end;
              sHmeParcAtual        := cds.FieldByName('HMEPARCELA').AsString;
              iIdContratoEmptmoAnt := cds.FieldByName('IDCONTRATOEMPTMO').AsFloat;


              Result := Result +
               '  <tr>                                                        ' + CR +
               '    <td>                                                      ' + CR ;

              //BRUNO AZEVEDO SOL 145673 KINTANA 984802
              Result := Result + HTMLTableHeader(1);

            end;

            CmDebugtoFile(cds.FieldByName('HMEPARCELA').AsString ,'C:\AAErro.txt');
            //

            if (sSomenteAbertos = 'S') then
               begin
                  //if not(bExibe) then begin       (cds.FieldByName('IDITEMEMPTMO').AsInteger = 13) and
                  if (trim(cds.FieldByName('SITPARCELA').AsString) = 'Em aberto') and (cds.FieldByName('IDITEMEMPTMO').AsInteger = 13) then  begin
                     bExibeTodos := true;
                     CmDebugtoFile(cds.FieldByName('SITPARCELA').AsString ,'C:\AAErro.txt');
                  end;
                  //else
                  //   bExibeTodos  := false;
               end
               else
               begin
                  bExibeTodos  := true;
                  if (trim(cds.FieldByName('SITPARCELA').AsString) = 'Em aberto') and (cds.FieldByName('IDITEMEMPTMO').AsInteger = 13) then 
                     bExibeAbertos := true;
               end;

            //BRUNO AZEVEDO
            if ((((sSomenteAbertos = 'S') and (cds.FieldByName('HMEVLREFETIVO').AsFloat = 0)) or
               ((sSomenteAbertos = 'N') and (sContrato = cds.FieldByName('IDCONTRATOEMPTMO').AsString)) or
               //((sSomenteAbertos = 'N') and (sContrato <> cds.FieldByName('IDCONTRATOEMPTMO').AsString) and (cds.FieldByName('HMEVLREFETIVO').AsFloat = 0)))
               ((sSomenteAbertos = 'N') and (sContrato <> cds.FieldByName('IDCONTRATOEMPTMO').AsString) and (bExibeAbertos)))
               and (bExibeTodos))
                then begin



              if ((cds.FieldByName('HMEDESTACADO').AsInteger = 0) and (cds.FieldByName('HMECENTRALIZA').AsInteger = 0)) then
                 begin
                    PreencheColuna( cEmpExtExpEvento, '' );
                    PreencheColuna( cEmpExtExpSitParcela, '' );
                 end
              else
                 begin
                    PreencheColuna( cEmpExtExpEvento, cds.FieldByName('EVENTO').AsString );
                    PreencheColuna( cEmpExtExpSitParcela,     cds.FieldByName('SITPARCELA').AsString );
                 end;

              PreencheColuna( cEmpExtExpItem,           cds.FieldByName('ITEDESCRICAO').AsString );
              PreencheColuna( cEmpExtExpParcela,        cds.FieldByName('HMEPARCELA').AsString );

              PreencheColuna( cEmpExtExpSequencial,     IntToStr( cds.FieldByName('HMESEQCOBRANCA').AsInteger ) );
              PreencheColuna( cEmpExtExpMesRef,         cds.FieldByName('ANOMESCOMP').AsString );
              PreencheColuna( cEmpExtExpMesCobranca,    cds.FieldByName('ANOMESCOBR').AsString );
              PreencheColuna( cEmpExtExpDtVenc,         FormataDataHora( 'dd/mm/yy', cds.FieldByName('HMEDATAPREVISTA').AsString ) );
              PreencheColuna( cEmpExtExpDtPagto,        FormataDataHora( 'dd/mm/yy', cds.FieldByName('HMEDATAEFETIVA').AsString ) );
              PreencheColuna( cEmpExtExpValorCalculado, FormatFloat( '#,##0.00', cds.FieldByName('HMEVLRPREVISTO').AsFloat ) );
              if (cds.FieldByName('HMEVLREFETIVO').AsFloat > 0) then begin
                PreencheColuna( cEmpExtExpValorEfetivo,   FormatFloat( '#,##0.00', cds.FieldByName('HMEVLREFETIVO').AsFloat ) );
              end else begin
                PreencheColuna( cEmpExtExpValorEfetivo,   cds.FieldByName('HMEVLREFETIVO').AsString );
              end;
              PreencheColuna( cEmpExtExpTxJuros,        FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').AsFloat ) );
              PreencheColuna( cEmpExtExpSaldoDevedor,   FormatFloat( '#,##0.00', cds.FieldByName('HMESALDODEV').AsFloat ) );
              Result := Result + HTMLTableRow;
            end;
            //BRUNO AZEVEDO

            sHmeParcAtual := cds.FieldByName('HMEPARCELA').AsString;
            cds.Next;


            //CmDebugtoFile(sSomenteAbertos,'C:\AAErro.txt');
            //CmDebugtoFile(trim(sHmeParcAtual) +' - '+trim(cds.FieldByName('HMEPARCELA').AsString +'-'+ cds.FieldByName('IDITEMEMPTMO').AsString +'-'+cds.FieldByName('SITPARCELA').AsString),'C:\AAErro.txt');
            if  (trim(sHmeParcAtual) <> trim(cds.FieldByName('HMEPARCELA').AsString)) then
            begin
               bExibeTodos := false;
               bExibeAbertos := false;
            end;

            if ( cds.FieldByName('IDCONTRATOEMPTMO').AsFloat <> iIdContratoEmptmoAnt )
             or cds.Eof then
            begin

              Result := Result + HTMLTableFooter + CR ;

              Result := Result +
               '    </td>                                                 ' + CR +
               '  </tr>                                                   ' + CR +
               '<tr>                                                      ' + CR +
               //BRUNO AZEVEDO
                 '          <td align="right">                ' + CR ;

                 if ((sSomenteAbertos = 'S') or
                     ((sSomenteAbertos <> 'S') and (sContrato <> FloatToStr(iIdContratoEmptmoAnt)))) then begin
                   Result := Result +
                   '  <a href="JavaScript:EnviaForm( document.frmLnkConsultaExtratoCompleto' +
                   FloatToStr(iIdContratoEmptmoAnt) +' )">'         + CR ;
                   Result := Result + '<img src="..\imagem\extratosimplesabrir.gif" border="0"></a> ' + CR ;
                 end else begin
                   Result := Result +
                   '  <a href="JavaScript:EnviaForm( document.frmLnkConsultaExtratoCompletoFechar' +
                   FloatToStr(iIdContratoEmptmoAnt) +' )">'         + CR ;
                   Result := Result + '<img src="..\imagem\extratosimplesfechar.gif" border="0"></a> ' + CR ;
                 end;
                 Result := Result +  '          </td>                                               ' + CR +
               '  </tr>                                                   ' + CR +
                 //BRUNO AZEVEDO   
               '</table>                                                  ' + CR ;
            end;

            if cds.Eof then
             break;

          end;
        end;

        cds.Close;
        cdsHTMLColumns.Close;

      end;

      Result := MontaPagina( pEmpExtratoExpEmprestimos, Result );
    end;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaEmpExtratoExpEmprestimos}


//Monta a página de Extrato de Emprestimos Agrupado
function PaginaEmpExtratoAgrEmprestimos( iIdPessoaLocal, iIdTitular : integer;
                                         iIdContratoEmptmo : extended;
                                         sFlgSituacao : string;
                                         iIdTipoEmptmo,
                                         iIdTipoContrEmptmo : extended;
                                         sSomenteAbertos, sContrato: String ) : string;
var
  iIdContratoEmptmoAnt : extended;
  sTituloCampo : String;
  sDescSit,sHmeParcAtual : string; //Fanuel Junior SOL165269 Kintana1428881
  sNovoSomenteAbertos: String;
  bExibeTodos : boolean; //Fanuel Junior SOL165269 Kintana1428881
begin
    bExibeTodos := false; //Fanuel Junior SOL165269 Kintana1428881
  try

    if bFlgExtEmptmoAtv then sFlgSituacao := 'A';

    cds.Close;
    cds.Data := WebEmprestimo.ExtratoEmprestimos( iIdPessoaLocal,
                                                  iIdTitular,
                                                  iIdContratoEmptmo,
                                                  sFlgSituacao,
                                                  iIdTipoEmptmo,
                                                  iIdTipoContrEmptmo,
                                                  iIdEmpresaProp,
                                                  True,
                                                  True );
   if cds.IsEmpty then
    begin
      sTitulo := TituloPagina( pEmpExtratoNEncontr );
      Result := MontaPagina( pEmpExtratoNEncontr, Result );
    end
    else
    begin

      sTitulo := TituloPagina( pEmpExtratoAgrEmprestimos );
      
      iIdContratoEmptmoAnt := 0;

      if TemAcessoPagina( sTipoUsuario, pEmpExtratoExpEmprestimos, sTituloCampo ) then
        Result := Result +
         '<form method="POST" name="frmLnkEmpParamExtrato"                      ' + CR +
         '   action="../<#nomearqapl>/EmpExtratoExpEmprestimos">                ' + CR +
         '  <p class="LINK" align="right">                                      ' + CR +
         '    <a href="JavaScript:EnviaForm( document.frmLnkEmpParamExtrato );">' +
         'Extrato Completo</a>'+
         '  </p>                                                                ' + CR +
         '  <input type="hidden" name="edtIdContratoEmptmo" value="' +
         FloatToStr( iIdContratoEmptmo ) + '">                                  ' + CR +
         '  <input type="hidden" name="cmbFlgSituacao" value="' +
         sFlgSituacao + '">                                                     ' + CR +
         '  <input type="hidden" name="cmbIdTipoEmptmo" value="' +
         FloatToStr( iIdTipoEmptmo ) + '">                                      ' + CR +
         '  <input type="hidden" name="cmbIdTipoContrEmptmo" value="' +
         FloatToStr( iIdTipoContrEmptmo ) + '">                                 ' + CR +
         '  <input type="hidden" name="edtFlgFiltro" value="1">                 ' + CR +
         '  <#hiddenfields>                                                     ' + CR +
         '</form>                                                               ' + CR ;

      if TemAcessoCampo( sTipoUsuario, cEmpExtAgrTabela, sTituloCampo ) then
      begin

        if not cds.IsEmpty then
        begin

          cdsHTMLColumns.Close;
          cdsHTMLColumns.CreateDataSet;
          IncluiColuna( cEmpExtAgrEvento,         10, 'center'   );
          IncluiColuna( cEmpExtAgrItem,           12, 'center'   );
          IncluiColuna( cEmpExtAgrParcela,         6, 'center' );
          IncluiColuna( cEmpExtAgrSitParcela,     10, 'center'   );
          IncluiColuna( cEmpExtAgrSequencial,      5, 'center' );
          IncluiColuna( cEmpExtAgrMesRef,          8, 'center'   );
          IncluiColuna( cEmpExtAgrMesCobranca,     8, 'center'   );
          IncluiColuna( cEmpExtAgrDtVenc,          7, 'center'   );
          IncluiColuna( cEmpExtAgrDtPagto,         7, 'center'   );
          IncluiColuna( cEmpExtAgrValorCalculado,  7, 'center'  );
          IncluiColuna( cEmpExtAgrValorEfetivo,    7, 'center'  );
          IncluiColuna( cEmpExtAgrTxJuros,         6, 'center'  );
          IncluiColuna( cEmpExtAgrSaldoDevedor,    7, 'center'  );

          cds.First;
          while True do
          begin

            //Novo contrato
            if cds.FieldByName('IDCONTRATOEMPTMO').AsFloat <> iIdContratoEmptmoAnt then
            begin

              if iIdContratoEmptmoAnt <> 0 then
                Result := Result + '<BR><BR><BR>' + CR;

              Result := Result +
               '<table class="PRINC" border="0" width="100%"                  ' + CR +
               ' cellspacing="0" cellpadding="0" >                            ' + CR ;

              if ( TemAcessoCampo( sTipoUsuario, cEmpExtAgrNumContrato, sTituloCampo ) or
                   TemAcessoCampo( sTipoUsuario, cEmpExtAgrSituacao,    sTituloCampo ) ) then
              begin

                Result := Result +
                 '  <tr>                                                        ' + CR +
                 '    <td width="100%" colspan="2">                             ' + CR +
                 '      <table border="0" width="100%"                          ' + CR +
                 '             cellspacing="0" cellpadding="0" >                ' + CR +
                 '        <tr>                                                  ' + CR +
                 '          <td width="50%" class="CABPRINC">                   ' + CR ;

                if TemAcessoCampo( sTipoUsuario, cEmpExtAgrNumContrato, sTituloCampo ) then
                  Result := Result +
                   '<font size=2>  Contrato Nº ' + cds.FieldByName('IDCONTRATOEMPTMO').AsString + '</font>'+CR ;

                Result := Result +
                 '          </td>                                               ' + CR +
                 '          <td width="47%" class="CABPRINC" align="right">     ' + CR ;

                if TemAcessoCampo( sTipoUsuario, cEmpExtAgrSituacao, sTituloCampo ) then
                begin
                  sDescSit := cds.FieldByName('FLGSITUACAO').AsString;
                  if sDescSit = 'A' then sDescSit := 'Ativo'                   else
                  if sDescSit = 'E' then sDescSit := 'Ativo'                   else
                  if sDescSit = 'J' then sDescSit := 'Em cobrança judicial'    else
                  if sDescSit = 'K' then sDescSit := 'Em processo de quitação' else
                  if sDescSit = 'Q' then sDescSit := 'Quitado'                 else
                  if sDescSit = 'C' then sDescSit := 'Cancelado'               else
                  if sDescSit = 'S' then sDescSit := 'Suspenso'                else
                  if sDescSit = 'R' then sDescSit := 'Refinanciado'            else
                  if sDescSit = 'P' then sDescSit := 'Pendente de Liberação'   else
                                         sDescSit := cds.FieldByName('FLGSITUACAO').AsString;

                  Result := Result +'<font size=2>'+ sDescSit +'</font>'+ CR ;
                end;

                Result := Result +
                 '          </td>                                               ' + CR +
                 '          <td class="CABPRINC" align="center">                ' + CR ;

                 if TemAcessoPagina( sTipoUsuario, pEmpDadosContrato, sTituloCampo ) then
                  Result := Result +
                   '  <a href="JavaScript:EnviaForm( document.frmLnkConsulta'             +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +' )">'                     +
                   '<img src="..\imagem\detalhestbl.gif" border="0"></a>                ' + CR +
                 '          </td>                                               ' + CR +
                 //BRUNO AZEVEDO SOL 157137 KINTANA 1248575
                 '          </table>                                            ' + CR ;
                 //'          <td class="CABPRINC" align="center">                ' + CR ;
                 //BRUNO AZEVEDO SOL 157137 KINTANA 1248575
                 
                //BRUNO AZEVEDO
                //if (sSomenteAbertos = 'S') then begin
                //  sNovoSomenteAbertos := 'N';
                //end else begin
                //  sNovoSomenteAbertos := 'S';
                //end;
                //BRUNO AZEVEDO
				        Result := Result +
                 '<table class="PRINC" border="0" width="100%"                  ' + CR +
                 ' cellspacing="0" cellpadding="0" >                            ' + CR +
                 '          <tr>                                                ' + CR +
                 '          <td width="30%" class="CABPRINC" align="Left">                  ' + CR +
                 '<font size=2> Data de Crédito: '+FormatDateTime( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsDateTime)    + CR +
                 '          </td>                                               ' + CR +
                 '          <td width="67%" class="CABPRINC" align="right">     ' + CR +
                 '<font size=2> '+cds.FieldByName('TCEDESCRICAO').AsString +'  '  + CR +
                 '          </td>                                               ' + CR +
                 '          </tr>                                               ' + CR +
                 '      </table>                                                ' + CR +
                 '    </td>                                                     ' + CR +
                 '  </tr>                                                       ' + CR +
                 '  <form method="POST" name="frmLnkConsulta'                     +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +'"               ' + CR +
                 '     action="../<#nomearqapl>/EmpConsultaContrato">           ' + CR +
                 '    <#hiddenfields>                                           ' + CR +
                 '    <input type="hidden" name="edtIdContratoEmptmo" value="'    +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString + '">             ' + CR +
                 '  </form>                                                     ' + CR +

                 //BRUNO AZEVEDO
                 '  <form method="POST" name="frmLnkConsultaExtratoSimples'       +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +'"               ' + CR +
                 '     action="../<#nomearqapl>/EmpExtratoAgrEmprestimos">      ' + CR +
                 '    <#hiddenfields>                                           ' + CR +
                 '    <input type="hidden" name="edtFlgFiltro" value="1">       ' + CR +
                 //'    <input type="hidden" name="bSomenteAbertos" value="' + sNovoSomenteAbertos + '">       ' + CR +
                 '    <input type="hidden" name="bSomenteAbertos" value="N">       ' + CR +
                 '    <input type="hidden" name="Contrato" value="'    +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString + '">             ' + CR +
                 '    <input type="hidden" name="edtIdContratoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbFlgSituacao" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoContrEmptmo" value=""> ' + CR +
                 '  </form>                                                     ' + CR +
                 //BRUNO AZEVEDO

                 //BRUNO AZEVEDO
                 '  <form method="POST" name="frmLnkConsultaExtratoSimplesFechar'       +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString +'"               ' + CR +
                 '     action="../<#nomearqapl>/EmpExtratoAgrEmprestimos">      ' + CR +
                 '    <#hiddenfields>                                           ' + CR +
                 '    <input type="hidden" name="edtFlgFiltro" value="1">       ' + CR +
                 //'    <input type="hidden" name="bSomenteAbertos" value="' + sNovoSomenteAbertos + '">       ' + CR +
                 '    <input type="hidden" name="bSomenteAbertos" value="S">       ' + CR +
                 '    <input type="hidden" name="Contrato" value="'    +
                 cds.FieldByName('IDCONTRATOEMPTMO').AsString + '">             ' + CR +
                 '    <input type="hidden" name="edtIdContratoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbFlgSituacao" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoEmptmo" value=""> ' + CR +
                 '    <input type="hidden" name="cmbIdTipoContrEmptmo" value=""> ' + CR +
                 '  </form>                                                     ' + CR ;
                 //BRUNO AZEVEDO

              end;

              //Fanuel Junior SOL165269 Kintana1428881
              sHmeParcAtual        := cds.FieldByName('HMEPARCELA').AsString;
              iIdContratoEmptmoAnt := cds.FieldByName('IDCONTRATOEMPTMO').AsFloat;

              Result := Result +
               '  <tr>                                                        ' + CR +
               '    <td>                                                      ' + CR ;

              //BRUNO AZEVEDO SOL 145673 KINTANA 984802
              Result := Result + HTMLTableHeader(1);

            end;


            //Fanuel Junior SOL165269 Kintana1428881 - INICIO
            if (sSomenteAbertos = 'S') then
            begin
               //if not(bExibe) then begin
               if (trim(cds.FieldByName('SITPARCELA').AsString) = 'Em aberto') then
                  bExibeTodos := true
               else
                  bExibeTodos := false;
            end
            else    
               bExibeTodos := true;

            //Extrato Simples
            //if (((sSomenteAbertos = 'S') and (cds.FieldByName('HMEVLREFETIVO').AsFloat = 0)) or
            //    ((sSomenteAbertos <> 'S') and (sContrato = cds.FieldByName('IDCONTRATOEMPTMO').AsString))) then begin

            if ((((sSomenteAbertos = 'S') and (cds.FieldByName('HMEVLREFETIVO').AsFloat = 0)) or
               ((sSomenteAbertos = 'N') and (sContrato = cds.FieldByName('IDCONTRATOEMPTMO').AsString)) or
               //((sSomenteAbertos = 'N') and (sContrato <> cds.FieldByName('IDCONTRATOEMPTMO').AsString) and (cds.FieldByName('HMEVLREFETIVO').AsFloat = 0))) and
               ((sSomenteAbertos = 'N') and (sContrato <> cds.FieldByName('IDCONTRATOEMPTMO').AsString) and (trim(cds.FieldByName('SITPARCELA').AsString) = 'Em aberto') )) and
               (bExibeTodos))
                then begin

              CmDebugToFile(sSomenteAbertos,'C:\AAErro.txt');
              PreencheColuna( cEmpExtAgrEvento,         cds.FieldByName('EVENTO').AsString );
              PreencheColuna( cEmpExtAgrItem,           cds.FieldByName('ITEDESCRICAO').AsString );
              PreencheColuna( cEmpExtAgrParcela,        cds.FieldByName('HMEPARCELA').AsString );
              PreencheColuna( cEmpExtAgrSitParcela,     cds.FieldByName('SITPARCELA').AsString );
              PreencheColuna( cEmpExtAgrSequencial,     IntToStr( cds.FieldByName('HMESEQCOBRANCA').AsInteger ) );
              PreencheColuna( cEmpExtAgrMesRef,         cds.FieldByName('ANOMESCOMP').AsString );
              PreencheColuna( cEmpExtAgrMesCobranca,    cds.FieldByName('ANOMESCOBR').AsString );
              PreencheColuna( cEmpExtAgrDtVenc,         FormataDataHora( 'dd/mm/yy', cds.FieldByName('HMEDATAPREVISTA').AsString ) );
              PreencheColuna( cEmpExtAgrDtPagto,        FormataDataHora( 'dd/mm/yy', cds.FieldByName('HMEDATAEFETIVA').AsString ) );
              PreencheColuna( cEmpExtAgrValorCalculado, FormatFloat( '#,##0.00', cds.FieldByName('HMEVLRPREVISTO').AsFloat ) );
              if (cds.FieldByName('HMEVLREFETIVO').AsFloat > 0) then begin
                PreencheColuna( cEmpExtAgrValorEfetivo,   FormatFloat( '#,##0.00', cds.FieldByName('HMEVLREFETIVO').AsFloat ) );
              end else begin
                PreencheColuna( cEmpExtAgrValorEfetivo,   cds.FieldByName('HMEVLREFETIVO').AsString );
              end;
              PreencheColuna( cEmpExtAgrTxJuros,        FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').AsFloat ) );
              PreencheColuna( cEmpExtAgrSaldoDevedor,   FormatFloat( '#,##0.00', cds.FieldByName('HMESALDODEV').AsFloat ) );
              Result := Result + HTMLTableRow;
            end;

            sHmeParcAtual := cds.FieldByName('HMEPARCELA').AsString;
            cds.Next;

            if  (trim(sHmeParcAtual) <> trim(cds.FieldByName('HMEPARCELA').AsString)) then
            begin
               bExibeTodos := false;
            end;
            //Fanuel Junior SOL165269 Kintana1428881 - FIM

            if ( cds.FieldByName('IDCONTRATOEMPTMO').AsFloat <> iIdContratoEmptmoAnt )
             or cds.Eof then
            begin

              Result := Result + HTMLTableFooter + CR ;

              Result := Result +
               '    </td>                                                 ' + CR +
               '  </tr>                                                   ' + CR +
               '  <tr>                                                   ' + CR +

               //BRUNO AZEVEDO
                 '          <td align="right">                ' + CR ;

                 if ((sSomenteAbertos = 'S') or
                     ((sSomenteAbertos <> 'S') and (sContrato <> FloatToStr(iIdContratoEmptmoAnt)))) then begin
                   Result := Result +
                   '  <a href="JavaScript:EnviaForm( document.frmLnkConsultaExtratoSimples' +
                   FloatToStr(iIdContratoEmptmoAnt) +' )">'         + CR ;
                   Result := Result + '<img src="..\imagem\extratosimplesabrir.gif" border="0"></a> ' + CR ;
                 end else begin
                   Result := Result +
                   '  <a href="JavaScript:EnviaForm( document.frmLnkConsultaExtratoSimplesFechar' +
                   FloatToStr(iIdContratoEmptmoAnt) +' )">'         + CR ;
                   Result := Result + '<img src="..\imagem\extratosimplesfechar.gif" border="0"></a> ' + CR ;
                 end;
                 //BRUNO AZEVEDO
                Result := Result +  '          </td>                                               ' + CR +
               '  </tr>   ' + CR +               
               '</table>                                                  ' + CR ;
            end;

            if cds.Eof then
             break;

          end;
        end;

        cds.Close;
        cdsHTMLColumns.Close;

      end;

      Result := MontaPagina( pEmpExtratoAgrEmprestimos, Result );
    end;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaEmpExtratoAgrEmprestimos}



//Monta a página de parametrização de Consulta a Contrato
function PaginaParamConsultaContrato(iIdPessoaLocal, iIdTitular : integer): string;
var
  sTituloCampo : string;
  sCampos, sBotao : string;
  i, iCampo : integer;
  sEsp : string;
begin

  try

    sTitulo := TituloPagina( pEmpParConsContrato );
    
    cds.Close;
    cds.Data := WebEmprestimo.ConsultaContratoPessoa(iIdPessoaLocal, iIdTitular);
    cds.First;

    if cds.IsEmpty then begin
      sTitulo := TituloPagina( pEmpConsContratoNEncontr );
      Result := MontaPagina( pEmpConsContratoNEncontr, Result );
    end else begin

      Result := Result +
       '<form method="POST" name="frmLnkConsultaContrato"                               ' + CR +
       '   action="../<#nomearqapl>/EmpConsultaContrato"                                ' + CR +
       '   onSubmit="EnviaForm( document.frmLnkConsultaContrato )"  >                   ' + CR +
       '  <center>                                                                      ' + CR +
       '    <table border="0" width="500" cellpadding="0" cellspacing="0"               ' + CR +
       '           class="FORMULARIO">                                                  ' + CR ;

      sCampos := '';

      iCampo := 1;

      sEsp := '';
      for i := 1 to 92 do
        sEsp := sEsp + '&nbsp;';

      //BRUNO AZEVEDO SOL 131352 KINTANA 747109
      if TemAcessoCampo( sTipoUsuario, cEmpContrParamConsNumero, sTituloCampo ) then
      begin
      sCampos := sCampos +
         '      <tr>                                                                      ' + CR +
         '        <td valign="middle" class="DESCCAMPO" width="150">                      ' + CR +
         sTituloCampo + ':                                                                ' + CR +
         '        </td>                                                                   ' + CR +
         '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
         '          <select name="edtIdContratoEmptmo" class="TEXT" >       ' + CR +
         '            <option value="">' + sEsp + '</option>                              ' + CR;

        cds.Close;
        cds.Data := WebEmprestimo.ConsultaContratoPessoa(iIdPessoaLocal, iIdTitular);
        cds.First;

        while not cds.Eof do
        begin
          sCampos := sCampos +
           '            <option value="' + cds.FieldByName('IDCONTRATOEMPTMO').AsString+'">' +
           cds.FieldByName('IDCONTRATOEMPTMO').AsString  + ' - ' +
           cds.FieldByName('TCEDESCRICAO').AsString + ' - ' +
           cds.FieldByName('SITUACAO').AsString + ' - ' +
           cds.FieldByName('DATACREDITO').AsString + ' </option> ' + CR ;
          cds.Next;
        end;

        sCampos := sCampos +
         '          </select>                                                             ' + CR +
         '        </td>                                                                   ' + CR +
         'Campo' + IntToStr( iCampo )                                                       + CR +
         '      </tr>                                                                     ' + CR ;
        inc( iCampo );
      end;
      //BRUNO AZEVEDO SOL 131352 KINTANA 747109
      dec( iCampo );

      sBotao :=
       '        <td rowspan="' + IntToStr( iCampo ) + '" valign="bottom" align="center"> ' + CR +
       '          <input type="image" name="imgOk" src="../imagem/ok.gif" border="0">    ' + CR +
       '        </td>                                                                    ' + CR ;

      sCampos := StringReplace( sCampos, 'Campo1', sBotao, [] );

      for i := 2 to iCampo do
        sCampos := StringReplace( sCampos, 'Campo' + IntToStr( i ), '', [] );

      Result := Result + sCampos +
       '    </table>                                                                    ' + CR +
       '    <#hiddenfields>                                                             ' + CR +
       '  </center>                                                                     ' + CR +
       '</form>                                                                         ' + CR +
       '<SCRIPT language="JavaScript">                                                  ' + CR +
       '  document.frmLnkConsultaContrato.elements[0].focus();                          ' + CR +
       '</script>                                                                       ' + CR ;

      Result := MontaPagina( pEmpParConsContrato, Result );
    end;
    
  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaParamConsultaContrato}


//Monta a página de Consulta a Contrato
function PaginaConsultaContrato( iIdPessoaLocal : integer;
                                 iIdContratoEmptmo : extended;
                                 sFlgSituacao : string;
                                 iIdTipoEmptmo,
                                 iIdTipoContrEmptmo : extended;
                                 sData : string ) : string;
var
  sTituloCampo : String;
  sPatro,
  sPlano,
  sAux : String;

  cdsAtualizacaoDiaria : TCMClientDataSet; //BRUNO AZEVEDO SOL 140310 KINTANA 877933

  cdsConsultaFGQC : TCMClientDataSet; //Ádler Souza - SOL 140492 KINTANA 881593

  bFlgExcepcional : boolean;
  iIDITEMPROVPERDA : integer;
  iFlgAbonoDiverg : integer;
  iValorFGQC : extended;

  dData : TDateTime;
  b1 : boolean;

  //Variáveis de geração e emissão de relatórios
  rtContrato     : TReportType;
  sHTMLFile      : string;
  iIdDataView    ,
  iOrigemCMDV    ,
  iIdReports     ,
  iOrigemCm      : integer;

  function Situacao( sSitLocal : string ) : String;
  begin
    if       sSitLocal = 'A' then Result := 'Ativo'
    else if  sSitLocal = 'J' then Result := 'Em Cobrança Judicial'
    else if  sSitLocal = 'K' then Result := 'Em processo de quitação'
    else if  sSitLocal = 'Q' then Result := 'Quitado'
    else if  sSitLocal = 'C' then Result := 'Cancelado'
    else if  sSitLocal = 'S' then Result := 'Suspenso'
    else if  sSitLocal = 'E' then Result := 'Encerrado'
    else if  sSitLocal = 'P' then Result := 'Pendente'
    else if  sSitLocal = 'R' then Result := 'Refinanciado'
    else if  sSitLocal = 'P' then Result := 'Pendente de Liberação'
    else Result := '?';
  end;

  function E1aCol( iCampo : integer) : boolean;
  begin
    Result := False;
    if TemAcessoCampo( sTipoUsuario, iCampo, sAux ) then
    begin
      Result := b1;
      if b1 then b1 := False;
    end;
  end;

  function InsereLink( b1Col : boolean; str : string ) : string;
  begin
    Result := str;
    if b1Col then
      Result :=
       '<a href="JavaScript:document.frmLnkConsultaContrato.edtIdContratoEmptmo.value=''' +
       cds.FieldByName('IDCONTRATOEMPTMO').AsString + '''; EnviaForm( document.frmLnkConsultaContrato )">' +
       Result + '</a>'
  end;


begin

  try

    cds.Close;
    cds.Data           := WebEmprestimo.ParametrosEmprestimo( iIdEmpresaProp );
    iIDITEMPROVPERDA   := StrToIntDef( trim( cds.FieldByName('IDITEMPROVPERDA').AsString ), 0 );
    iFlgAbonoDiverg    := StrToIntDef( trim( cds.FieldByName('FLGABONODIVERG').AsString ), 0 );
    bFlgExcepcional    := ( cds.FieldByName('FLGEXCEPCIONAL').AsInteger = 1 );

    cds.Close;
    cds.Data := WebEmprestimo.ConsultaContrato( iIdPessoaLocal, iIdContratoEmptmo, sFlgSituacao, iIdTipoEmptmo, iIdTipoContrEmptmo );

    // Ádler Souza - SOL 140492 KINTANA 881593
    cdsConsultaFGQC := TCMClientDataSet.Create( nil );
    cdsConsultaFGQC.Data := WebEmprestimo.ConsultaFGQC(iIdContratoEmptmo);

    if cdsConsultaFGQC.IsEmpty then
      iValorFGQC := 0
    else
      iValorFGQC := cdsConsultaFGQC.FieldByName('HMEVLRPREVISTO').AsFloat;

    FreeAndNil(cdsConsultaFGQC);

    //Fim - Ádler Souza - SOL 140492 KINTANA 881593

    if cds.IsEmpty then
    begin
      sTitulo := TituloPagina( pEmpConsContratoNEncontr );
      Result := MontaPagina( pEmpConsContratoNEncontr, Result );
    end
    else
    begin

      if cds.RecordCount > 1 then
      begin

        //Vários registros

        sTitulo := TituloPagina( pEmpConsContratos );

        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        b1 := True;

        IncluiColuna( cEmpConsContrNumContrato,     7, 'left', '', E1aCol( cEmpConsContrNumContrato     ) );
        IncluiColuna( cEmpConsContrInscricao,       7, 'left', '', E1aCol( cEmpConsContrInscricao       ) );
        IncluiColuna( cEmpConsContrSituacao,        7, 'left', '', E1aCol( cEmpConsContrSituacao        ) );
        IncluiColuna( cEmpConsContrTipoContrato,    8, 'left', '', E1aCol( cEmpConsContrTipoContrato    ) );
        IncluiColuna( cEmpConsContrTipoEmprestimo,  8, 'left', '', E1aCol( cEmpConsContrTipoEmprestimo  ) );
        IncluiColuna( cEmpConsContrTotalParcelas,   7, 'left', '', E1aCol( cEmpConsContrTotalParcelas   ) );
        IncluiColuna( cEmpConsContrDtAssinatura,    7, 'left', '', E1aCol( cEmpConsContrDtAssinatura    ) );
        IncluiColuna( cEmpConsContrDtInscricao,     7, 'left', '', E1aCol( cEmpConsContrDtInscricao     ) );
        IncluiColuna( cEmpConsContrDtCredito,       7, 'left', '', E1aCol( cEmpConsContrDtCredito       ) );
        IncluiColuna( cEmpConsContrDt1aParcela,     7, 'left', '', E1aCol( cEmpConsContrDt1aParcela     ) );
        IncluiColuna( cEmpConsContrDtCancelamento,  7, 'left', '', E1aCol( cEmpConsContrDtCancelamento  ) );
        IncluiColuna( cEmpConsContrValorContratado, 7, 'left', '', E1aCol( cEmpConsContrValorContratado ) );
        IncluiColuna( cEmpConsContrTaxaJuros,       7, 'left', '', E1aCol( cEmpConsContrTaxaJuros       ) );
        IncluiColuna( cEmpConsContrValorParcela,    7, 'left', '', E1aCol( cEmpConsContrValorParcela    ) );
        IncluiColuna( cEmpConsVlFGQC,               7, 'left', '', E1aCol( cEmpConsVlFGQC               ) );

        Result := Result + HTMLTableHeader;

        cds.First;
        while not cds.Eof do
        begin

          b1 := True;

          PreencheColuna( cEmpConsContrNumContrato,      InsereLink( E1aCol( cEmpConsContrNumContrato     ), cds.FieldByName('IDCONTRATOEMPTMO').AsString ) );
          PreencheColuna( cEmpConsContrInscricao,        InsereLink( E1aCol( cEmpConsContrInscricao       ), AnsiUpperCase( cds.FieldByName('IDINSCRICAOEMPTMO').AsString ) ) );
          PreencheColuna( cEmpConsContrSituacao,         InsereLink( E1aCol( cEmpConsContrSituacao        ), Situacao( trim( cds.FieldByName('FLGSITUACAO').AsString ) ) ) );
          PreencheColuna( cEmpConsContrTipoContrato,     InsereLink( E1aCol( cEmpConsContrTipoContrato    ), StrToName( cds.FieldByName('TCEDESCRICAO').AsString ) ) );
          PreencheColuna( cEmpConsContrTipoEmprestimo,   InsereLink( E1aCol( cEmpConsContrTipoEmprestimo  ), StrToName( cds.FieldByName('DESCTIPOEMPTMO').AsString ) ) );
          PreencheColuna( cEmpConsContrTotalParcelas,    InsereLink( E1aCol( cEmpConsContrTotalParcelas   ), cds.FieldByName('NUMPARCELAS').AsString ) );
          PreencheColuna( cEmpConsContrDtAssinatura,     InsereLink( E1aCol( cEmpConsContrDtAssinatura    ), FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAASSINATURA').AsString ) ) );
          PreencheColuna( cEmpConsContrDtInscricao,      InsereLink( E1aCol( cEmpConsContrDtInscricao     ), FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINSC').AsString ) ) );
          PreencheColuna( cEmpConsContrDtCredito,        InsereLink( E1aCol( cEmpConsContrDtCredito       ), FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsString ) ) );
          PreencheColuna( cEmpConsContrDt1aParcela,      InsereLink( E1aCol( cEmpConsContrDt1aParcela     ), FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAPRIMPARC').AsString ) ) );
          PreencheColuna( cEmpConsContrDtCancelamento,   InsereLink( E1aCol( cEmpConsContrDtCancelamento  ), FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACANC').AsString ) ) );
          PreencheColuna( cEmpConsContrValorContratado,  InsereLink( E1aCol( cEmpConsContrValorContratado ), FormatFloat( '#,##0.00', cds.FieldByName('VLRCONTRATO').AsFloat ) ) );
          PreencheColuna( cEmpConsContrTaxaJuros,        InsereLink( E1aCol( cEmpConsContrTaxaJuros       ), FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').AsFloat ) + '%' ) );
          PreencheColuna( cEmpConsContrValorParcela,     InsereLink( E1aCol( cEmpConsContrValorParcela    ), FormatFloat( '#,##0.00', cds.FieldByName('VLRPARCELA').AsFloat ) ) );
          PreencheColuna( cEmpConsVlFGQC,                InsereLink( E1aCol( cEmpConsVlFGQC               ), FormatFloat( '#,##0.00', iValorFGQC ) ) );

          Result := Result + HTMLTableRow;

          cds.Next;

        end;

        Result := Result + HTMLTableFooter +
         '<form method="POST" name="frmLnkConsultaContrato"                   ' + CR +
         '   action="../<#nomearqapl>/EmpConsultaContrato">                   ' + CR +
         '    <#hiddenfields>                                                 ' + CR +
         '    <input type="hidden" name="edtIdContratoEmptmo">                ' + CR +
         '</form>                                                             ' + CR ;

        Result := MontaPagina( pEmpConsContratos, Result );

      end
      else
      begin

        //Um registro

        sTitulo := TituloPagina( pEmpDadosContrato );

        iIdContratoEmptmo := cds.FieldByName('IDCONTRATOEMPTMO').AsFloat;

        //Recupera o nome da patrocinadora
        cdsAux.Close;
        cdsAux.Data := Pessoa.RecuperaNomePessoa( cds.FieldByName('IDPATRO').AsInteger );
        sPatro := cdsAux.FieldByName('NOME').AsString;

        //Recupera o nome do plano
        cdsAux.Close;
        cdsAux.Data := WebTransfPlano.RecuperaNomePlano( cds.FieldByName('IDPLANOPREV').AsInteger );
        sPlano := cdsAux.FieldByName('NOME').AsString;
        cdsAux.Close;

        if TemAcessoCampo( sTipoUsuario, cEmpConsNumContrato, sTituloCampo ) then
          Result := Result +
           '<p class="CABDIV">Contrato ' + cds.FieldByName('IDCONTRATOEMPTMO').AsString +' </p>' + CR;

        Result := Result +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0">               ' + CR;

        if TemAcessoCampo( sTipoUsuario, cEmpConsSituacao, sTituloCampo ) then
        begin

          Result := Result +
           '  <tr>                                                                     ' + CR +
           '    <td width="20%">                                                       ' + CR +
           '      <p class="DESCCAMPO">                                                ' + CR +
           sTituloCampo                                                                  + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '    <td width="3%">                                                        ' + CR +
           '      <p class="DESCCAMPO">                                                ' + CR +
           '        :                                                                  ' + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '    <td>                                                                   ' + CR +
           '      <p class="CONTCAMPOD">                                               ' + CR +
           Situacao( trim( cds.FieldByName('FLGSITUACAO').AsString ) )                   + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '  </tr>                                                                    ' + CR ;
        end;

        Result := Result + IncluiCampo( cEmpConsInscEmp,
         AnsiUpperCase( cds.FieldByName('IDINSCRICAOEMPTMO').AsString ) );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsPatrocinadora,
         AnsiUpperCase( sPatro ) );

        Result := Result + IncluiCampo( cEmpConsPlano,
         StrToName( sPlano ) );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsTipoContrato,
         StrToName( cds.FieldByName('TCEDESCRICAO').AsString ) );

        Result := Result + IncluiCampo( cEmpConsTipoEmprestimo,
         StrToName( cds.FieldByName('DESCTIPOEMPTMO').AsString ) );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsDtAssinatura,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAASSINATURA').AsString ) );

        Result := Result + IncluiCampo( cEmpConsDtInscricao,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINSC').AsString ) );

        Result := Result + IncluiCampo( cEmpConsDtCredito,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsString ) );

        Result := Result + IncluiCampo( cEmpConsDt1Parcela,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAPRIMPARC').AsString ) );

        Result := Result + IncluiCampo( cEmpConsDtCancelamento,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACANC').AsString ) );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsVlContratado,
         FormatFloat( '#,##0.00', cds.FieldByName('VLRCONTRATO').AsFloat ) );

        //CMDebugToFile( FloatToStr(cds.FieldByName('VLRCONTRATO').AsFloat) + ' - ' + FormatFloat( '#,##0.00', cds.FieldByName('VLRCONTRATO').AsFloat ) , 'c:\planus\temp\bruno.txt' );

        Result := Result + IncluiCampo( cEmpConsTaxaJuros,
         FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').AsFloat ) + '%' );

        Result := Result + IncluiCampo( cEmpConsVlParcela,
         FormatFloat( '#,##0.00', cds.FieldByName('VLRPARCELA').AsFloat ) );

        //CMDebugToFile( FloatToStr(cds.FieldByName('VLRPARCELA').AsFloat) + ' - ' + FormatFloat( '#,##0.00', cds.FieldByName('VLRPARCELA').AsFloat ) , 'c:\planus\temp\bruno.txt');

        //Ádler Souza - SOL 140492 KINTANA 881593

         Result := Result + IncluiCampo( cEmpConsVlFGQC,
         FormatFloat( '#,##0.00', iValorFGQC) );

        //Fim - Ádler Souza - SOL 140492 KINTANA 881593



        Result := Result + IncluiCampo( cEmpConsQtdeParcCont,
         cds.FieldByName('NUMPARCELAS').AsString );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result +
         '</table>                                                                      ' + CR;

//        // Ádler Souza - SOL 140492 KTN 881593
//        Result := Result +
//                  '<p class="CORPO" align="left"> FGQC** Fundo Garantidor para Quitação de Crédito. </p> '  +
//                  '<BR><BR>' +  CR;
//        // Fim - Ádler Souza - SOL 140492 KTN 881593


        //Saldo de Empréstimos
        if   ( TemAcessoCampo( sTipoUsuario, cEmpConsSaldoContrato, sAux ) )
         and ( ( trim( cds.FieldByName('FLGSITUACAO').AsString ) = 'A' ) or
               ( trim( cds.FieldByName('FLGSITUACAO').AsString ) = 'J' ) or
               ( trim( cds.FieldByName('FLGSITUACAO').AsString ) = 'E' ) or
               ( trim( cds.FieldByName('FLGSITUACAO').AsString ) = 'K' ) ) then
        begin

          //BRUNO AZEVEDO SOL 140310 KINTANA 877933
          try
            cdsAtualizacaoDiaria := TCMClientDataSet.Create( nil );

            sData := trim( sData );
            if sData <> '' then begin
              try

                //BRUNO AZEVEDO SOL 149267 KINTANA 1065963
                dData := EncodeDate(StrToInt(Copy(sData,7,4)), StrToInt(Copy(sData,4,2)), StrToInt(Copy(sData,1,2)));

                //dData := StrToDate( sData );
              except
                raise Exception.Create( 'Data informada inválida' );
              end;

              cdsAtualizacaoDiaria.Data := WebEmprestimo.ChecaAtualizacaoDiaria(iIdContratoEmptmo, sData);
              if (cdsAtualizacaoDiaria.recordcount = 0) then begin
                cdsAtualizacaoDiaria.Data := WebEmprestimo.UltimaAtualizacaoDiaria(iIdContratoEmptmo);
                if (cdsAtualizacaoDiaria.Recordcount > 0) then begin
                  raise Exception.Create( 'Data informada não contém atualização diária de saldo. <BR><BR>' +
                                          'A última data disponível para pesquisa é '+FormatDateTime('dd/mm/yyyy', cdsAtualizacaoDiaria.FieldByName('Data').AsDateTime) ); //Fanuel Junior SOL157961 Kintana1270392
                end else begin
                  raise Exception.Create( 'Data informada não contém atualização diária de saldo.' );
                end;
              end;
            end else begin
              cdsAtualizacaoDiaria.Data := WebEmprestimo.UltimaAtualizacaoDiaria(iIdContratoEmptmo);
              if (cdsAtualizacaoDiaria.Recordcount > 0) then begin
                dData := cdsAtualizacaoDiaria.FieldByName('Data').AsDateTime;
              end else begin
                dData := Now;
              end;
            end;

            Result := Result +
             '<BR>' + SaldoEmprestimos( iIdPessoaLocal,
                                        cds.FieldByName('IDTIPOEMPTMO').AsInteger,
                                        cds.FieldByName('IDTIPOCONTREMPTMO').AsInteger,
                                        iIdContratoEmptmo,
                                        iIDITEMPROVPERDA,
                                        iFlgAbonoDiverg,
                                        dData,
                                        bFlgExcepcional ) +
             '<SCRIPT language="JavaScript">                                ' + CR +
             '  document.frmLnkSaldo.edtDataQuitacao.focus();               ' + CR ;

            if sData <> '' then
            //BRUNO AZEVEDO SOL 139842 KINTANA 866182
            //  Result := Result +
            //   ' top.location = "#SALDO";                                   ' + CR ;

            Result := Result +
             '</script>                                                     ' + CR ;

          finally
            FreeAndNil(cdsAtualizacaoDiaria);
          end;
        end;
        //BRUNO AZEVEDO SOL 140310 KINTANA 877933
        
        //Impressão da Prévia Contratual
        
        if TemAcessoPagina( sTipoUsuario, pEmpContrConcEmptmoReimp, sTituloCampo ) then
        begin

          //Recupera dados do relatório
          RecuperaConfRelatorio( rContratacaoEmprestimo,
                                 rtContrato,
                                 iIdDataView,
                                 iOrigemCMDV,
                                 iIdReports,
                                 iOrigemCM,
                                 sHTMLFile );

          Result := Result +
           '<BR><BR>                                                                   ' + CR +
           GeraDadosRelatorio( rtContrato,
                               'frmLnkContrato',
                               iIdReports,
                               iOrigemCM,
                               sHTMLFile,
                               'Concessão de Empréstimo',
                               WebEmprestimo.RelatorioConcessao( iIdDataView,
                                                                 iOrigemCMDV,
                                                                 iIdContratoEmptmo ) )   +
           '<center>                                                                   ' + CR +
           '  <a href="JavaScript:document.frmLnkContrato.submit();">                  ' + CR +
           '    <img src="../imagem/btnContrato.gif" name="btnContrato" border="0"     ' + CR +
           '         onMouseOver="btnContrato.src=''../imagem/btnContrato_s.gif''"     ' + CR +
           '         onMouseOut="btnContrato.src=''../imagem/btnContrato.gif''"></a>   ' + CR +
           '</center>                                                                  ' + CR ;

        end;
         
        Result := MontaPagina( pEmpDadosContrato, Result );

      end;

    end;

    cds.Close;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaConsultaContrato}

//Monta a página de parametrização de Consulta a Inscrição
function PaginaParamConsultaInscricao : string;
var
  sTituloCampo : string;
  sCampos, sBotao : string;
  i, iCampo : integer;
  sEsp : string;
begin

  try

    sTitulo := TituloPagina( pEmpParConsInscricao );

    Result := Result +
     '<form method="POST" name="frmLnkConsultaInscricao"                              ' + CR +
     '   action="../<#nomearqapl>/EmpConsultaInscricao"                               ' + CR +
     '   onSubmit="EnviaForm( document.frmLnkConsultaInscricao )"  >                   ' + CR +
     '  <center>                                                                      ' + CR +
     '    <table border="0" width="500" cellpadding="0" cellspacing="0"               ' + CR +
     '           class="FORMULARIO">                                                  ' + CR ;

    sCampos := '';

    iCampo := 1;

    sEsp := '';
    for i := 1 to 92 do
      sEsp := sEsp + '&nbsp;';

    if TemAcessoCampo( sTipoUsuario, cEmpInscrParamConsNumero, sTituloCampo ) then
    begin
      sCampos := sCampos +
       '      <tr>                                                                      ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="150">                      ' + CR +
       sTituloCampo + ':                                                                ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
       '          <input type="text" name="edtIdInscricaoEmptmo" size="55"              ' + CR +
       '                 class="TEXT" maxlength="12">                                   ' + CR +
       '        </td>                                                                   ' + CR +
       'Campo' + IntToStr( iCampo )                                                       + CR +
       '      </tr>                                                                     ' + CR ;
      inc( iCampo );
    end;

    if TemAcessoCampo( sTipoUsuario, cEmpInscrParamConsSituacao, sTituloCampo ) then
    begin
      sCampos := sCampos +
       '      <tr>                                                                      ' + CR +
       '        <td class="DESCCAMPO" width="150">                                      ' + CR +
       '          Situação: &nbsp;                                                      ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
       '          <select name="cmbFlgSituacao" class="TEXT">                           ' + CR +
       '            <option value="">' + sEsp + '</option>                              ' + CR +
       '            <option value="A">Ativo</option>                                    ' + CR +
       '            <option value="E">Contrato Associado</option>                       ' + CR +
       '            <option value="C">Cancelado</option>                                ' + CR +
       '          </select>                                                             ' + CR +
       '        </td>                                                                   ' + CR +
       'Campo' + IntToStr( iCampo )                                                       + CR +
       '      </tr>                                                                     ' + CR ;
      inc( iCampo );
    end;

    if TemAcessoCampo( sTipoUsuario, cEmpInscrParamConsTpEmpto, sTituloCampo ) then
    begin

      sCampos := sCampos +
       '      <tr>                                                                      ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="150">                      ' + CR +
       sTituloCampo + ':                                                                ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
       '          <select name="cmbIdTipoEmptmo" class="TEXT">                          ' + CR +
       '            <option value="">' + sEsp + '</option>                              ' + CR ;

      cds.Close;
      cds.Data := WebEmprestimo.TipoEmptmo;
      cds.First;

      while not cds.Eof do
      begin
        sCampos := sCampos +
         '            <option value="' + cds.FieldByName('IDTIPOEMPTMO').AsString + '">' +
         cds.FieldByName('DESCTIPOEMPTMO').AsString + ' </option> ' + CR ;
        cds.Next;
      end;

      sCampos := sCampos +
       '          </select>                                                             ' + CR +
       '        </td>                                                                   ' + CR +
       'Campo' + IntToStr( iCampo )                                                       + CR +
       '      </tr>                                                                     ' + CR ;
      inc( iCampo );
    end;

    if TemAcessoCampo( sTipoUsuario, cEmpInscrParamConsTpContrEmptmo, sTituloCampo ) then
    begin
      sCampos := sCampos +
       '      <tr>                                                                      ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="150">                      ' + CR +
       sTituloCampo + ':                                                                ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
       '          <select name="cmbIdTipoContrEmptmo" class="TEXT">                     ' + CR +
       '            <option value="">' + sEsp + '</option>                              ' + CR ;

      cds.Close;
      cds.Data := WebEmprestimo.TipoContrEmptmo;
      cds.First;

      while not cds.Eof do
      begin
        sCampos := sCampos +
         '            <option value="' + cds.FieldByName('IDTIPOCONTREMPTMO').AsString + '">' +
         cds.FieldByName('TCEDESCRICAO').AsString + ' </option> ' + CR ;
        cds.Next;
      end;

      sCampos := sCampos +
       '          </select>                                                             ' + CR +
       '        </td>                                                                   ' + CR +
       'Campo' + IntToStr( iCampo )                                                       + CR +
       '      </tr>                                                                     ' + CR ;
      inc( iCampo );
    end;

    dec( iCampo );

    sBotao :=
     '        <td rowspan="' + IntToStr( iCampo ) + '" valign="bottom" align="center"> ' + CR +
     '          <input type="image" name="imgOk" src="../imagem/ok.gif" border="0">    ' + CR +
     '        </td>                                                                    ' + CR ;

    sCampos := StringReplace( sCampos, 'Campo1', sBotao, [] );

    for i := 2 to iCampo do
      sCampos := StringReplace( sCampos, 'Campo' + IntToStr( i ), '', [] );

    Result := Result + sCampos +
     '    </table>                                                                    ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '  </center>                                                                     ' + CR +
     '</form>                                                                         ' + CR +
     '<SCRIPT language="JavaScript">                                                  ' + CR +
     '  document.frmLnkConsultaInscricao.elements[0].focus();                          ' + CR +
     '</script>                                                                       ' + CR ;

    Result := MontaPagina( pEmpParConsContrato, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaParamConsultaInscricao}


//Monta a página de Consulta a Inscrição
function PaginaConsultaInscricao( iIdPessoaLocal, iIdTitular : integer;
                                  iIdInscricaoEmptmo : extended;
                                  sFlgSituacao : string;
                                  iIdTipoEmptmo,
                                  iIdTipoContrEmptmo : extended ) : string;
var
  sTituloCampo, sTituloAux : String;
  sPatro, sPlano : String;

  //Variáveis de geração e emissão de relatórios
  rtContrato     : TReportType;
  sHTMLFile      : string;
  iIdDataView    ,
  iOrigemCMDV    ,
  iIdReports     ,
  iOrigemCm      : integer;

  function Situacao( sSitLocal : string ) : String;
  begin
    if       sSitLocal = 'A' then Result := 'Ativo'
    else if  sSitLocal = 'E' then Result := 'Contrato Associado'
    else if  sSitLocal = 'C' then Result := 'Cancelado'
    else Result := '?';
  end;

begin

  try

    cds.Close;
    cds.Data := InscricaoEmptmo.SelecionaDadosInscricao( iIdPessoaLocal,
                                                         iIdTitular,
                                                         iIdInscricaoEmptmo,
                                                         sFlgSituacao,
                                                         iIdTipoEmptmo,
                                                         iIdTipoContrEmptmo );

    if cds.IsEmpty then
    begin
      sTitulo := TituloPagina( pEmpConsInscricaoNEncontr );
      Result := MontaPagina( pEmpConsInscricaoNEncontr, Result );
    end
    else
    begin

      if cds.RecordCount > 1 then
      begin

        //Vários registros

        sTitulo := TituloPagina( pEmpConsInscricoes );

        cdsHTMLColumns.Close;
        cdsHTMLColumns.CreateDataSet;

        IncluiColuna( cEmpConsInscNumInscricao,      2, 'left', '', True );
        IncluiColuna( cEmpConsInscSit,               8, 'left'           );
        IncluiColuna( cEmpConsInscTpContrato,        8, 'left'           );
        IncluiColuna( cEmpConsInscTpEmprestimo,     15, 'left'           );
        IncluiColuna( cEmpConsInscDtInscricao,       4, 'left'           );
        IncluiColuna( cEmpConsInscDataCredito,       4, 'left'           );
        IncluiColuna( cEmpConsInscFormaPagto,       13, 'left'           );
        IncluiColuna( cEmpConsInscFormaRecto,       13, 'left'           );
        IncluiColuna( cEmpConsInscContaBancariaPag,  8, 'left'           );
        IncluiColuna( cEmpConsInscContaBancariaRec,  8, 'left'           );        
        IncluiColuna( cEmpConsInscVlSolicitado,      4, 'right'          );
        IncluiColuna( cEmpConsInscNumeroParcelas,    2, 'right'          );
        IncluiColuna( cEmpConsInscTxJuros,           4, 'right'          );
        IncluiColuna( cEmpConsInscMoeda,             5, 'left'           );
        IncluiColuna( cEmpConsInscViaWeb,            2, 'center',        );

        Result := Result + HTMLTableHeader;

        cds.First;
        while not cds.Eof do
        begin

          PreencheColuna( cEmpConsInscNumInscricao,
           '<a href="JavaScript:document.frmLnkConsultaInscricao.edtIdInscricaoEmptmo.value=' +
           cds.FieldByName('IDINSCRICAOEMPTMO').AsString + '; EnviaForm( document.frmLnkConsultaInscricao )">' +
           AnsiUpperCase( cds.FieldByName('IDINSCRICAOEMPTMO').AsString ) + '</a>' );

          PreencheColuna( cEmpConsInscSit, Situacao( trim( cds.FieldByName('FLGSITUACAO').AsString ) ) );
          PreencheColuna( cEmpConsInscViaWeb, iff(cds.FieldByName('FLGINTERNET').AsString = '0', 'N', 'S') );
          PreencheColuna( cEmpConsInscContaBancariaPag, cds.FieldByName('CONTACORRENTEPAG').AsString );
          PreencheColuna( cEmpConsInscContaBancariaRec, cds.FieldByName('CONTACORRENTEREC').AsString );
          PreencheColuna( cEmpConsInscDtInscricao, FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINSC').AsString ) );
          PreencheColuna( cEmpConsInscDataCredito, FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsString ) );
          PreencheColuna( cEmpConsInscFormaPagto, iff( cds.FieldByName('FLGFORMAPAG').AsString = 'C', 'Contas a Pagar', 'Folha de Pagamento' ) );
          PreencheColuna( cEmpConsInscFormaRecto, iff( cds.FieldByName('FLGFORMAREC').AsString = 'C', 'Contas a Receber', 'Folha de Pagamento' ) );
          PreencheColuna( cEmpConsInscMoeda, cds.FieldByName('MOESIGLA').AsString);
          PreencheColuna( cEmpConsInscNumeroParcelas, cds.FieldByName('NUMPARCELAS').AsString );
          PreencheColuna( cEmpConsInscTxJuros, FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').asFloat ) );
          PreencheColuna( cEmpConsInscTpContrato,  StrToName( cds.FieldByName('TCEDESCRICAO').AsString ) );
          PreencheColuna( cEmpConsInscTpEmprestimo, StrToName( cds.FieldByName('DESCTIPOEMPTMO').AsString ) );
          PreencheColuna( cEmpConsInscVlSolicitado, FormatFloat( '#,##0.00', cds.FieldByName('VLRSOLIC').asFloat ) );

          Result := Result + HTMLTableRow;

          cds.Next;

        end;

        Result := Result + HTMLTableFooter;

        Result := Result + 
         '<form method="POST" name="frmLnkConsultaInscricao"                  ' + CR +
         '   action="../<#nomearqapl>/EmpConsultaInscricao">                  ' + CR +
         '    <#hiddenfields>                                                 ' + CR +
         '    <input type="hidden" name="edtIdInscricaoEmptmo">               ' + CR +
         '</form>                                                             ' + CR ;

        Result := MontaPagina( pEmpConsInscricoes, Result );

      end
      else
      begin

        //Um registro

        sTitulo := TituloPagina( pEmpDadosInscricao );

        //Recupera a inscrição para ter certeza de que não virá zerada
        iIdInscricaoEmptmo := cds.FieldByName('IDINSCRICAOEMPTMO').AsFloat;

        //Recupera o nome da patrocinadora
        cdsAux.Close;
        cdsAux.Data := Pessoa.RecuperaNomePessoa( cds.FieldByName('IDPATRO').AsInteger );
        sPatro := cdsAux.FieldByName('NOME').AsString;

        //Recupera o nome do plano
        cdsAux.Close;
        cdsAux.Data := WebTransfPlano.RecuperaNomePlano( cds.FieldByName('IDPLANOPREV').AsInteger );
        sPlano := cdsAux.FieldByName('NOME').AsString;
        cdsAux.Close;

        if TemAcessoCampo( sTipoUsuario, cEmpConsInscDetNumInscricao, sTituloCampo ) then
          Result := Result +
           '<p class="CABDIV">Inscrição ' + cds.FieldByName('IDINSCRICAOEMPTMO').AsString +' </p>' + CR;

        Result := Result +
         '<table border="0" width="100%" cellpadding="0" cellspacing="0">               ' + CR;

        if TemAcessoCampo( sTipoUsuario, cEmpConsInscDetSit, sTituloCampo ) then
        begin

          Result := Result +
           '  <tr>                                                                     ' + CR +
           '    <td width="20%">                                                       ' + CR +
           '      <p class="DESCCAMPO">                                                ' + CR +
           sTituloCampo                                                                  + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '    <td width="3%">                                                        ' + CR +
           '      <p class="DESCCAMPO">                                                ' + CR +
           '        :                                                                  ' + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '    <td>                                                                   ' + CR +
           '      <p class="CONTCAMPOD">                                               ' + CR +
           Situacao( trim( cds.FieldByName('FLGSITUACAO').AsString ) )                   + CR +
           '      </p>                                                                 ' + CR +
           '    </td>                                                                  ' + CR +
           '  </tr>                                                                    ' + CR ;
        end;

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsInscDetPatro,
         AnsiUpperCase( sPatro ) );

        Result := Result + IncluiCampo( cEmpConsInscDetPlano,
         StrToName( sPlano ) );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsInscDetTpContrato,
         StrToName( cds.FieldByName('TCEDESCRICAO').AsString ) );

        Result := Result + IncluiCampo( cEmpConsInscDetTpEmprestimo,
         StrToName( cds.FieldByName('DESCTIPOEMPTMO').AsString ) );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsInscDetDtInscricao,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATAINSC').AsString ) );

        Result := Result + IncluiCampo( cEmpConsInscDetDataCredito,
         FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATACREDITO').AsString ) );

        Result := Result + IncluiCampo( cEmpConsInscDetFormaPagto, iff( cds.FieldByName('FLGFORMAPAG').AsString = 'C', 'Contas a Pagar', 'Folha de Pagamento' ) );

        if not cds.FieldByName('CONTACORRENTEPAG').IsNull then
          Result := Result + IncluiCampo( cEmpConsInscDetContaBancariaP,
                                          cds.FieldByName('BANCOPAG').AsString + '&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;'+
                                          'Ag.: ' + cds.FieldByName('NUMAGENCIAPAG').AsString + '&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;'+
                                          'Cta.: ' + cds.FieldByName('CONTACORRENTEPAG').AsString);

        Result := Result + IncluiCampo( cEmpConsInscDetFormaRecto,  iff( cds.FieldByName('FLGFORMAREC').AsString = 'C', 'Contas a Receber', 'Folha de Pagamento' ) );

        if not cds.FieldByName('CONTACORRENTEREC').IsNull then
          Result := Result + IncluiCampo( cEmpConsInscDetContaBancariaR,
                                          cds.FieldByName('BANCOREC').AsString + '&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;'+
                                          'Ag.: ' + cds.FieldByName('NUMAGENCIAREC').AsString + '&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;'+
                                          'Cta.: ' + cds.FieldByName('CONTACORRENTEREC').AsString);

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsInscDetVlSolicitado,
         FormatFloat( '#,##0.00', cds.FieldByName('VLRSOLIC').asFloat ) );

        Result := Result + IncluiCampo( cEmpConsInscDetNumParcelas,
         cds.FieldByName('NUMPARCELAS').AsString );

        Result := Result + IncluiCampo( cEmpConsInscDetTxJuros,
         FormatFloat( '#,##0.0000', cds.FieldByName('TXJUROS').asFloat ) );

        Result := Result + IncluiCampo( cEmpConsInscDetMoeda, cds.FieldByName('MOESIGLA').AsString );

        Result := Result + '  <tr height="10"></tr>                                    ' + CR ;

        Result := Result + IncluiCampo( cEmpConsInscDetViaWeb,
                           iff(cds.FieldByName('FLGINTERNET').asString = '0', 'Não', 'Sim'  ) );

        Result := Result +
         '</table>                                                                      ' + CR ;


        //Dados da Simulação
        if TemAcessoCampo( sTipoUsuario, cEmpConsInscDetDadosItens, sTituloCampo ) then
        begin

          cdsAux.Close;
          cdsAux.Data := HistMovInscricao.SelecionaDadosHistMovInscricao( iIdInscricaoEmptmo );

          Result := Result +
           '<BR><BR>                                                                      ' + CR +
           '<p class="CORPO">                                                             ' + CR +
           sTituloCampo                                                                     + CR +
           '</p>                                                                          ' + CR +
           '<HR>                                                                          ' + CR +
           '<table border="0" width="100%" cellpadding="0" cellspacing="0">               ' + CR;

          cdsAux.First;
          while not cdsAux.Eof do
          begin
            Result := Result +
             '  <tr height="18">                                                    ' + CR +
             '    <td width="30%">                                                  ' + CR +
             '      <p class="DESCCAMPO">                                           ' + CR +
             cdsAux.FieldByName('ITEDESCRICAO').AsString                              + CR +
             '      </p>                                                            ' + CR +
             '    </td>                                                             ' + CR +
             '    <td width="3%">                                                   ' + CR +
             '      <p class="DESCCAMPO">                                           ' + CR +
             '        :                                                             ' + CR +
             '      </p>                                                            ' + CR +
             '    </td>                                                             ' + CR +
             '    <td>                                                              ' + CR +
             '      <p class="CONTCAMPO">                                           ' + CR +
             FormatFloat( '#,##0.00', cdsAux.FieldByName('HMIVLRPREVISTO').AsFloat )  + CR +
             '      </p>                                                            ' + CR +
             '    </td>                                                             ' + CR +
             '  </tr>                                                               ' + CR ;

            cdsAux.Next;
          end;

          cdsAux.Close;
        end;

        Result := Result +
         '</table>                                                                      ' + CR;

        //Impressão da Prévia Contratual
        if TemAcessoPagina( sTipoUsuario, pEmpContrInscEmptmoReimp, sTituloCampo ) then
        begin

          //Recupera dados do relatório
          RecuperaConfRelatorio( rInscricaoEmprestimo,
                                 rtContrato,
                                 iIdDataView,
                                 iOrigemCMDV,
                                 iIdReports,
                                 iOrigemCM,
                                 sHTMLFile );

          Result := Result +
           '<BR><BR>                                                                   ' + CR +
           GeraDadosRelatorio( rtContrato,
                               'frmLnkPreviaContratual',
                               iIdReports,
                               iOrigemCM,
                               sHTMLFile,
                               'Inscrição em Empréstimo',
                               WebEmprestimo.RelatorioInscricao( iIdDataView,
                                                                 iOrigemCMDV,
                                                                 iIdInscricaoEmptmo ) )   +
           '<center>                                                                   ' + CR +
           '  <a href="JavaScript:document.frmLnkPreviaContratual.submit();">          ' + CR +
           '    <img src="../imagem/btnContrato.gif" name="btnContrato" border="0"     ' + CR +
           '         onMouseOver="btnContrato.src=''../imagem/btnContrato_s.gif''"     ' + CR +
           '         onMouseOut="btnContrato.src=''../imagem/btnContrato.gif''"></a>   ' + CR +
           '</center>                                                                  ' + CR ;

        end;

        Result := MontaPagina( pEmpDadosInscricao, Result );

      end;

    end;

    cds.Close;
    cdsAux.Close;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaConsultaInscricao}


//Monta a página de Confirmação e de exclusão de inscrição
function PaginaConfirmaExclInscricao( iIdInscricaoEmptmo : extended; flgExclui: Integer ) : string;
begin
  try
    sTitulo := TituloPagina( pEmpExclusaoInscricaoCons );

    if flgExclui = 0 then
    begin
      Result :=
       '<form method="POST" name="frmExcluiInscricao" ' +
       ' action="../<#nomearqapl>/EmpExcluirInscricao">                 ' + CR +
       ' <#hiddenfields> ' +
       ' <input type="hidden" name="edtIdInscricaoEmptmo" value="' + FloatToStr( iIdInscricaoEmptmo ) + '"> ' +
       ' <input type="hidden" name="edtFlgExclui" value="1"> ' +
       '</form>';

      Result := MontaPagina( pEmpExclusaoInscricaoConsConf, Result );
    end
    else
    begin
      InscricaoEmptmo.ExcluiInscricaoEmptmo(iIdInscricaoEmptmo);

      Result := Result +
                       '<CENTER>                                                                             '+Cr+
                       '<BR><BR><BR><BR>                                                                     '+Cr+
                       '  <table border="0" width="600">                                                     '+Cr+
                       '    <tr height="30" valign="top">                                                    '+Cr+
                       '      <td align="center" colspan="2">                                                '+Cr+
                       '        <font face="arial" size="3">                                                 '+Cr+
                       '          <b>A inscrição de empréstimo ' +
                                     FloatToStr(iIdInscricaoEmptmo)+' foi excluída com sucesso.</b> <br><br> '+Cr+
                       '        </font>                                                                      '+Cr+
                       '      </td>                                                                          '+Cr+
                       '    </tr>                                                                            '+Cr+
                       '  </table>                                                                           '+Cr+
                       '  <BR><BR>                                                                           '+Cr+
                       '  <P CLASS="LINK">                                                                   '+Cr+
                       '    <a href="javascript:EnviaForm( document.frmLnkHome );">                              '+Cr+
                       '      Home                                                                           '+Cr+
                       '     </a>                                                                            '+Cr+
                       '  </P>                                                                               '+Cr+
                       '</CENTER>                                                                            '+Cr+
                       '<BR><BR>                                                                              ';

      Result := MontaPagina( pEmpExclusaoInscricaoCons, Result );
    end;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaConfirmaExclInscricao}

//Monta a página de Saldo de Emprestimos
function SaldoEmprestimos( iIdPessoaLocal, iIdTipoEmptmo, iIdTipoContrEmptmo : integer;
 iIdContratoEmptmo : extended; iIDITEMPROVPERDA : integer; iFlgAbonoDiverg : integer; dData : TDateTime; bFlgExcepcional : boolean ) : String;
var
  sTituloCampo : string;
  sData : string;
  i : integer;
  fSaldo : currency;

  cdsTotalizaAbertos,
  cdsContrato, cdsAuxiliar : TCMClientDataSet;

  rContrato    : TDadosContrato;
  vLista       : TListaItem;

begin

  cdsTotalizaAbertos   := TCMClientDataSet.Create( nil );
  cdsContrato          := TCMClientDataSet.Create( nil );
  cdsAuxiliar          := TCMClientDataSet.Create( nil );  //BRUNO AZEVEDO SOL 140310 KINTANA 877933
  
  try

    sData := FormatDateTime( 'dd/mm/yyyy', dData );

    TemAcessoCampo( sTipoUsuario, cEmpConsSaldoContrato, sTituloCampo );

    Result :=
     //BRUNO AZEVEDO SOL 139842 KINTANA 866182
     //'<a name="#SALDO">                                                                             ' + CR +
     '<form method="POST" name="frmLnkSaldo" action="../<#nomearqapl>/EmpConsultaContrato"          ' + CR +
     '   onSubmit="EnviaForm( document.frmLnkSaldo )"  >                                            ' + CR +
     '  <table border="0" width="50%" cellpadding="0" cellspacing="0" class="FORMULARIO">           ' + CR +
     '    <tr>                                                                                      ' + CR +
     '      <td valign="middle" class="DESCCAMPO" width="59%">                                      ' + CR +
     sTituloCampo                                                                                     + CR +
     '      </td>                                                                                   ' + CR +
     '      <td width="3%">                                                                         ' + CR +
     '        :                                                                                     ' + CR +
     '      </td>                                                                                   ' + CR +
     '      <td class="DESCCAMPO" width="38%">                                                      ' + CR +
     //BRUNO AZEVEDO SOL 149267 KINTANA 1065963
     '        <input OnKeyUp="MascaraData( this )" type="text" name="edtDataQuitacao" size="12"                                    ' + CR +
     '               value="' + sData + '" class="TEXT" maxlength="10">                             ' + CR +
     '        <input type="image" name="imgOk" src="../imagem/ok.gif" border="0">                   ' + CR +
     '      </td>                                                                                   ' + CR +
     '    </tr>                                                                                     ' + CR ;

    TemAcessoCampo( sTipoUsuario, cEmpConsSaldoAtual, sTituloCampo );

    cdsContrato.Data := WebEmprestimo.TodosDadosContratos( iIdContratoEmptmo );

    LimpaRegistroContrato( rContrato );
    PreencheDadosContrato( cdsContrato, rContrato );

    if not WebEmprestimo.CalculaItensQuitacao( rContrato,
                                               iIdEmpresaProp,
                                               iIdTipoEmptmo,
                                               iIdTipoContrEmptmo,
                                               3,
                                               iIDITEMPROVPERDA,
                                               dData,
                                               -1,
                                               Now,
                                               bFlgExcepcional,
                                               False,
                                               iFlgAbonoDiverg,
                                               iTipoCliente,
                                               vLista ) then
      raise Exception.Create('Não foi possível calcular o saldo do empréstimo');

      fSaldo := 0;

      for i := 0 to High( vLista ) do
      begin

        if  ( vLista[i].FlgCentraliza = 1 )
         or ( vLista[i].FlgDestacado  = 1 ) then
        begin
          fSaldo := fSaldo + vLista[i].Valor;
        end;

      end;

    //BRUNO AZEVEDO SOL 140310 KINTANA 877933
    fSaldo := (fSaldo); //BRUNO AZEVEDO SOL 149267 KINTANA 1065963
    cdsAuxiliar.Data := WebEmprestimo.Saldo(fSaldo);
    //BRUNO AZEVEDO SOL 140310 KINTANA 877933

    Result := Result +
     '    <tr>                                                                                      ' + CR +
     '      <td class="DESCCAMPO">                                                                  ' + CR +
     sTituloCampo                                                                                     + CR +
     '      </td>                                                                                   ' + CR +
     '      <td>                                                                                    ' + CR +
     '        <p class="DESCCAMPO">                                                                 ' + CR +
     '          :                                                                                   ' + CR +
     '        </p>                                                                                  ' + CR +
     '      </td>                                                                                   ' + CR +
     '      <td class="CONTCAMPO">                                                                  ' + CR +
     cdsAuxiliar.FieldByName('Saldo').AsString                                                        + CR +
     '      </td>                                                                                   ' + CR +
     '    </tr>                                                                                     ' + CR ;


    if TemAcessoCampo( sTipoUsuario, cEmpConsValorEmAberto, sTituloCampo ) then
    begin
      cdsTotalizaAbertos.Data := WebEmprestimo.TotalizaAbertos( iIdContratoEmptmo );

      Result := Result +
       '    <tr>                                                                                    ' + CR +
       '      <td class="DESCCAMPO">                                                                ' + CR +
       sTituloCampo                                                                                   + CR +
       '      </td>                                                                                 ' + CR +
       '      <td>                                                                                  ' + CR +
       '        <p class="DESCCAMPO">                                                               ' + CR +
       '          :                                                                                 ' + CR +
       '        </p>                                                                                ' + CR +
       '      </td>                                                                                 ' + CR +
       '      <td class="CONTCAMPO">                                                                ' + CR +
       FormatFloat( '#,##0.00', cdsTotalizaAbertos.FieldByName('VALOR_TOTAL_ABERTO').AsFloat )    + CR +
       '      </td>                                                                                 ' + CR +
       '    </tr>                                                                                   ' + CR ;

      cdsTotalizaAbertos.Close;
    end;

    Result := Result +
     '  </table>                                                                                  ' + CR +
     '  <table>                                                                                   ' + CR +
     '    <tr>                                                                                    ' + CR +
     '      <td class="DESCCAMPO">                                                                ' + CR +
     '       *FGQC Fundo Garantidor para Quitação de Crédito.                                     ' + CR +
     '      </td>                                                                                 ' + CR +
     '    </tr>                                                                                   ' + CR +
     '    <tr>                                                                                    ' + CR +
     '      <td class="DESCCAMPO">                                                                ' + CR +
     '      SALDO ATUALIZADO = SALDO DEVEDOR + VALORES EM ABERTO ATUALIZADOS PARA A DATA SOLICITADA  ' + CR + //Fanuel Junior SOL158812 Kintana1407372
     '      </td>                                                                                 ' + CR +
     '    </tr>                                                                                   ' + CR +
     '  </table>                                                                                  ' + CR +
     '  <input type="hidden" name="edtIdContratoEmptmo" value="' +FloatToStr(iIdContratoEmptmo)+ '">  ' + CR +
     '  <#hiddenfields>                                                                             ' + CR +
     '</form>                                                                                       ' + CR ;
     //BRUNO AZEVEDO SOL 139842 KINTANA 866182
     //'</a>                                                                                          ' + CR ;

  finally
    cdsTotalizaAbertos.Free;
    cdsContrato.Free;
    cdsAuxiliar.Free;  //BRUNO AZEVEDO SOL 140310 KINTANA 877933
  end;


end; {PaginaEmpSaldoEmprestimos}


//Monta a página de parametrização de Extrato de Empréstimos
//Modo: 0 = Agrupado; 1 = Expandido
function PaginaParamExtratoEmptmo( iModo : integer ) : string;
var
  sTituloCampo : string;
  sCampos, sBotao : string;
  i, iCampo : integer;
  sEsp : string;
  sAction : string;
begin

  try

    if iModo = 0 then
    begin
      sTitulo := TituloPagina( pEmpExtratoAgrEmprestimos );
      sAction := 'EmpExtratoAgrEmprestimos';
    end
    else
    begin
      sTitulo := TituloPagina( pEmpExtratoExpEmprestimos );
      sAction := 'EmpExtratoExpEmprestimos';
    end;

    Result := Result +
     '<form method="POST" name="frmLnkExtratoEmptmo"                                  ' + CR +
     '   action="../<#nomearqapl>/' + sAction + '"                                    ' + CR +
     '   onSubmit="EnviaForm( document.frmLnkExtratoEmptmo )"  >                      ' + CR +
     '  <center>                                                                      ' + CR +
     '    <table border="0" width="500" cellpadding="0" cellspacing="0"               ' + CR +
     '           class="FORMULARIO">                                                  ' + CR ;

    sCampos := '';

    iCampo := 1;

    sEsp := '';
    for i := 1 to 92 do
      sEsp := sEsp + '&nbsp;';

    if TemAcessoCampo( sTipoUsuario, cEmpExtratoParamNumero, sTituloCampo ) then
    begin
      sCampos := sCampos +
       '      <tr>                                                                      ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="150">                      ' + CR +
       sTituloCampo + ':                                                                ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
       '          <input type="text" name="edtIdContratoEmptmo" size="55"               ' + CR +
       '                 class="TEXT" maxlength="12">                                   ' + CR +
       '        </td>                                                                   ' + CR +
       'Campo' + IntToStr( iCampo )                                                       + CR +
       '      </tr>                                                                     ' + CR ;
      inc( iCampo );
    end;

    if not bFlgExtEmptmoAtv then
    begin
      if TemAcessoCampo( sTipoUsuario, cEmpExtratoParamSituacao, sTituloCampo ) then
      begin
        sCampos := sCampos +
         '      <tr>                                                                      ' + CR +
         '        <td class="DESCCAMPO" width="150">                                      ' + CR +
         '          Situação: &nbsp;                                                      ' + CR +
         '        </td>                                                                   ' + CR +
         '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
         '          <select name="cmbFlgSituacao" class="TEXT">                           ' + CR +
         '            <option value="">' + sEsp + '</option>                              ' + CR +
         '            <option value="A">Ativo</option>                                    ' + CR +
         '            <option value="J">Em cobrança judicial</option>                     ' + CR +
         '            <option value="K">Em processo de quitação</option>                  ' + CR +
         '            <option value="Q">Quitado</option>                                  ' + CR +
         '            <option value="C">Cancelado</option>                                ' + CR +
         '            <option value="S">Suspenso</option>                                 ' + CR +
         '            <option value="R">Refinanciado</option>                             ' + CR +
         '            <option value="P">Pendente de Liberação</option>                    ' + CR +
         '          </select>                                                             ' + CR +
         '        </td>                                                                   ' + CR +
         'Campo' + IntToStr( iCampo )                                                       + CR +
         '      </tr>                                                                     ' + CR ;
        inc( iCampo );
      end;
    end;

    if TemAcessoCampo( sTipoUsuario, cEmpExtratoParamTpEmpto, sTituloCampo ) then
    begin

      sCampos := sCampos +
       '      <tr>                                                                      ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="150">                      ' + CR +
       sTituloCampo + ':                                                                ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
       '          <select name="cmbIdTipoEmptmo" class="TEXT">                          ' + CR +
       '            <option value="">' + sEsp + '</option>                              ' + CR ;

      cds.Close;
      cds.Data := WebEmprestimo.TipoEmptmo;
      cds.First;

      while not cds.Eof do
      begin
        sCampos := sCampos +
         '            <option value="' + cds.FieldByName('IDTIPOEMPTMO').AsString + '">' +
         cds.FieldByName('DESCTIPOEMPTMO').AsString + ' </option> ' + CR ;
        cds.Next;
      end;

      sCampos := sCampos +
       '          </select>                                                             ' + CR +
       '        </td>                                                                   ' + CR +
       'Campo' + IntToStr( iCampo )                                                       + CR +
       '      </tr>                                                                     ' + CR ;
      inc( iCampo );
    end;

    if TemAcessoCampo( sTipoUsuario, cEmpExtratoParamTpContrEmptmo, sTituloCampo ) then
    begin
      sCampos := sCampos +
       '      <tr>                                                                      ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="150">                      ' + CR +
       sTituloCampo + ':                                                                ' + CR +
       '        </td>                                                                   ' + CR +
       '        <td valign="middle" class="DESCCAMPO" width="300">                      ' + CR +
       '          <select name="cmbIdTipoContrEmptmo" class="TEXT">                     ' + CR +
       '            <option value="">' + sEsp + '</option>                              ' + CR ;

      cds.Close;
      cds.Data := WebEmprestimo.TipoContrEmptmo;
      cds.First;

      while not cds.Eof do
      begin
        sCampos := sCampos +
         '            <option value="' + cds.FieldByName('IDTIPOCONTREMPTMO').AsString + '">' +
         cds.FieldByName('TCEDESCRICAO').AsString + ' </option> ' + CR ;
        cds.Next;
      end;

      sCampos := sCampos +
       '          </select>                                                             ' + CR +
       '        </td>                                                                   ' + CR +
       'Campo' + IntToStr( iCampo )                                                       + CR +
       '      </tr>                                                                     ' + CR ;
      inc( iCampo );
    end;

    dec( iCampo );

    sBotao :=
     '        <td rowspan="' + IntToStr( iCampo ) + '" valign="bottom" align="center"> ' + CR +
     '          <input type="image" name="imgOk" src="../imagem/ok.gif" border="0">    ' + CR +
     '        </td>                                                                    ' + CR ;

    sCampos := StringReplace( sCampos, 'Campo1', sBotao, [] );

    for i := 2 to iCampo do
      sCampos := StringReplace( sCampos, 'Campo' + IntToStr( i ), '', [] );

    Result := Result + sCampos +
     '    </table>                                                                    ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '    <input type="hidden" name="edtFlgFiltro" value="1">                         ' + CR ;

    if bFlgExtEmptmoAtv then
      Result := Result +
       '    <input type="hidden" name="cmbFlgSituacao" value="A">                     ' + CR ;

    Result := Result +
     '  </center>                                                                     ' + CR +
     '</form>                                                                         ' + CR +
     '<SCRIPT language="JavaScript">                                                  ' + CR +
     '  document.frmLnkExtratoEmptmo.elements[0].focus();                     ' + CR +
     '</script>                                                                       ' + CR ;

    Result := MontaPagina( pEmpParExtratoEmptmo, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end;





end.
