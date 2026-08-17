unit uWebExtResPer;

interface

uses SysUtils, DModAutoAtendimento, uConstPaginasCampos, JclSysUtils, httpapp,
      uCMClientDataSet, uCtrlFuncoesAA;

//Monta a página de parâmetros do extrato de reserva por período
function PaginaExtResPer( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

//Monta o extrato de reserva por período
function PaginaImpExtResPer( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

//Monta o extrato de reserva por período
function DadosExtrato( iIdPessoaLocal : integer;
                       sTipoExtrato,
                       sMesMensal,
                       sAnoMensal,
                       sMesTrimestral,
                       sAnoTrimestral,
                       sAnoConsolidado : string ) : String;

//Gera o cabeçalho dos extratos
function Cabecalho : String;

//Extrato mensal
function ExtMensal( iIdPessJur,
                    iIdPlanoPrev,
                    iIdPessoaLocal,
                    iSeqProposta : integer;
                    sMes : string ) : string;

//Extrato trimestral
function ExtTrimestral( iIdPessJur,
                        iIdPlanoPrev,
                        iIdPessoaLocal,
                        iSeqProposta : integer;
                        sMes : string ) : string;

//Extrato consolidado
function ExtConsolidado( iIdPessJur,
                         iIdPlanoPrev,
                         iIdPessoaLocal,
                         iSeqProposta : integer;
                         sAno : string ) : string;


implementation

//Monta a página de parâmetros do extrato de reserva por período
function PaginaExtResPer( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

  function ComboMes( sNomeCampo : string ) : string;
  var
    iMes : integer;
  begin
    iMes := StrToInt( FormatDateTime( 'mm', Now ) );

    Result :=
       ' <select size="1" name="' + sNomeCampo + '" class="CORPO">                               ' + CR +
       '   <option ' + Iff( ( iMes =  1 ), 'selected', '' ) + ' value= ''1''>Janeiro   </option> ' + CR +
       '   <option ' + Iff( ( iMes =  2 ), 'selected', '' ) + ' value= ''2''>Fevereiro </option> ' + CR +
       '   <option ' + Iff( ( iMes =  3 ), 'selected', '' ) + ' value= ''3''>Março     </option> ' + CR +
       '   <option ' + Iff( ( iMes =  4 ), 'selected', '' ) + ' value= ''4''>Abril     </option> ' + CR +
       '   <option ' + Iff( ( iMes =  5 ), 'selected', '' ) + ' value= ''5''>Maio      </option> ' + CR +
       '   <option ' + Iff( ( iMes =  6 ), 'selected', '' ) + ' value= ''6''>Junho     </option> ' + CR +
       '   <option ' + Iff( ( iMes =  7 ), 'selected', '' ) + ' value= ''7''>Julho     </option> ' + CR +
       '   <option ' + Iff( ( iMes =  8 ), 'selected', '' ) + ' value= ''8''>Agosto    </option> ' + CR +
       '   <option ' + Iff( ( iMes =  9 ), 'selected', '' ) + ' value= ''9''>Setembro  </option> ' + CR +
       '   <option ' + Iff( ( iMes = 10 ), 'selected', '' ) + ' value=''10''>Outubro   </option> ' + CR +
       '   <option ' + Iff( ( iMes = 11 ), 'selected', '' ) + ' value=''11''>Novembro  </option> ' + CR +
       '   <option ' + Iff( ( iMes = 12 ), 'selected', '' ) + ' value=''12''>Dezembro  </option> ' + CR +
       ' </select>                                                                               ' + CR ;
  end;

begin

  try

    sTitulo := TituloPagina( pExtResPer );

    //Se a janela é de impressão...
    if trim( Request.ContentFields.Values['edtImprime'] ) = 'S' then
      //Se não deve ser abrir outra janela...
      if not( bFlgJanelaRelat ) then
      begin
        Result := DadosExtrato( iIdPessoaLocal, 
                                Request.ContentFields.Values['rbTipoExtrato'],
                                Request.ContentFields.Values['cmbMesMensal'],
                                Request.ContentFields.Values['edtAnoMensal'],
                                Request.ContentFields.Values['cmbMesTrimestral'],
                                Request.ContentFields.Values['edtAnoTrimestral'],
                                Request.ContentFields.Values['edtAnoConsolidado'] );
        exit;
      end;

    sJavaScript :=
     ' function SelTipo( iTipo )                                                      ' + CR +
     ' {                                                                              ' + CR +
     '  eval("divMensal.style.display=''none''");                                     ' + CR +
     '  eval("divTrimestral.style.display=''none''");                                 ' + CR +
     '  eval("divConsolidado.style.display=''none''");                                ' + CR +
     '  if( iTipo == 1 ) { eval("divMensal.style.display=''''");      }               ' + CR +
     '  if( iTipo == 2 ) { eval("divTrimestral.style.display=''''");  }               ' + CR +
     '  if( iTipo == 3 ) { eval("divConsolidado.style.display=''''"); }               ' + CR +
     ' }                                                                              ' + CR +
     ' function Confirma( )                                                           ' + CR +
     ' {                                                                              ' + CR +
     '   if( frmLnkParamExtResPer.rbTipoExtrato[0].checked )                          ' + CR +
     '   { if ( frmLnkParamExtResPer.edtAnoMensal.value == '''' )                     ' + CR +
     '     {                                                                          ' + CR +
     '       alert(''O campo "Ano" deve estar preenchido.'');                         ' + CR +
     '       frmLnkParamExtResPer.edtAnoMensal.focus();                               ' + CR +
     '       exit;                                                                    ' + CR +
     '     } }                                                                        ' + CR +
     '   if( frmLnkParamExtResPer.rbTipoExtrato[1].checked )                          ' + CR +
     '   { if ( frmLnkParamExtResPer.edtAnoTrimestral.value == '''' )                 ' + CR +
     '     {                                                                          ' + CR +
     '       alert(''O campo "Ano" deve estar preenchido.'');                         ' + CR +
     '       frmLnkParamExtResPer.edtAnoTrimestral.focus();                           ' + CR +
     '       exit;                                                                    ' + CR +
     '     } }                                                                        ' + CR +
     '   if( frmLnkParamExtResPer.rbTipoExtrato[2].checked )                          ' + CR +
     '   { if ( frmLnkParamExtResPer.edtAnoConsolidado.value == '''' )                ' + CR +
     '     {                                                                          ' + CR +
     '       alert(''O campo "Ano" deve estar preenchido.'');                         ' + CR +
     '       frmLnkParamExtResPer.edtAnoConsolidado.focus();                          ' + CR +
     '       exit;                                                                    ' + CR +
     '     } }                                                                        ' + CR +
     '   EnviaForm( document.frmLnkParamExtResPer );                                  ' + CR +
     ' }                                                                              ' + CR ;

    Result :=
     '<center>                                                                        ' + CR +
     '  <form method="POST" name="frmLnkParamExtResPer"                               ' + CR +
     '   action="../<#nomearqapl>/ExtResPer">                                         ' + CR +
     '    <table border="0" width="55%" cellpadding="0" cellspacing="0"               ' + CR +
     '           class="FORMULARIO">                                                  ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td class="DESCCAMPO" width="30%">                                      ' + CR +
     '          <DIV class="CABBOXFORM">Tipo do extrato</DIV>                         ' + CR +
     '        </td>                                                                   ' + CR +
     '        <td class="DESCCAMPO">                                                  ' + CR +
     '          <DIV class="CABBOXFORM">Período</DIV>                                 ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td class="DESCCAMPO">                                                  ' + CR +
     '          <input type="radio" name="rbTipoExtrato" class="TEXT" checked         ' + CR +
     '            value="1" onClick="JavaScript:SelTipo(1);">Mensal                   ' + CR +
     '        </td>                                                                   ' + CR +
     '        <td class="DESCCAMPO">                                                  ' + CR +
     '          <div id="divMensal">                                                  ' + CR +
     '            Mês: &nbsp;                                                         ' + CR +
     ComboMes( 'cmbMesMensal' )                                                         + CR +
     '            &nbsp; &nbsp; Ano: &nbsp;                                           ' + CR +
     '            <input type="text" name="edtAnoMensal" size="4" class="TEXT"        ' + CR +
     '               maxlength="4" value="' + FormatDateTime( 'yyyy', Now ) + '">     ' + CR +
     '          </div>                                                                ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td class="DESCCAMPO">                                                  ' + CR +
     '          <input type="radio" name="rbTipoExtrato" class="TEXT"                 ' + CR +
     '            value="2" onClick="JavaScript:SelTipo(2);">Trimestral               ' + CR +
     '        </td>                                                                   ' + CR +
     '        <td class="DESCCAMPO">                                                  ' + CR +
     '          <div id="divTrimestral" style="display: ''none''">                    ' + CR +
     '            Até o mês: &nbsp;                                                   ' + CR +
     ComboMes( 'cmbMesTrimestral' )                                                     + CR +
     '            &nbsp; &nbsp; Ano: &nbsp;                                           ' + CR +
     '            <input type="text" name="edtAnoTrimestral" size="4" class="TEXT"    ' + CR +
     '               maxlength="4" value="' + FormatDateTime( 'yyyy', Now ) + '">     ' + CR +
     '          </div>                                                                ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td class="DESCCAMPO">                                                  ' + CR +
     '          <input type="radio" name="rbTipoExtrato" class="TEXT"                 ' + CR +
     '            value="3" onClick="JavaScript:SelTipo(3);">Consolidado              ' + CR +
     '        </td>                                                                   ' + CR +
     '        <td class="DESCCAMPO">                                                  ' + CR +
     '          <div id="divConsolidado" style="display: ''none''">                   ' + CR +
     '            Ano: &nbsp;                                                         ' + CR +
     '            <input type="text" name="edtAnoConsolidado" size="4" class="TEXT"   ' + CR +
     '               maxlength="4" value="' + FormatDateTime( 'yyyy', Now ) + '">     ' + CR +
     '          </div>                                                                ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '      <tr>                                                                      ' + CR +
     '        <td colspan="2" align="center">                                         ' + CR +
     '          <a href="JavaScript:Confirma();">                                     ' + CR +
     '           <img src="../imagem/btnConfirmar.gif" name="btnConfirmar" border="0" ' + CR +
     '            onMouseOver="btnConfirmar.src=''../imagem/btnConfirmar_s.gif''"     ' + CR +
     '            onMouseOut="btnConfirmar.src=''../imagem/btnConfirmar.gif''"></a>   ' + CR +
     '        </td>                                                                   ' + CR +
     '      </tr>                                                                     ' + CR +
     '    </table>                                                                    ' + CR +
     '    <#hiddenfields>                                                             ' + CR +
     '    <input type="hidden" name="edtImprime" value="S">                           ' + CR +
     '  </form>                                                                       ' + CR +
     '<center>                                                                        ' + CR ;

    //Se a janela é de impressão...
    if trim( Request.ContentFields.Values['edtImprime'] ) = 'S' then
      Result := Result +
       '<form method="POST" name="frmOutraJanela" target="_blank"                     ' + CR +
       ' action="../<#nomearqapl>/ImpExtResPer">                                      ' + CR +
       '  <input type="hidden" name="edtTipoExtrato"     value="' + Request.ContentFields.Values['rbTipoExtrato']     + '"> ' + CR +
       '  <input type="hidden" name="edtMesMensal2"      value="' + Request.ContentFields.Values['cmbMesMensal']      + '"> ' + CR +
       '  <input type="hidden" name="edtAnoMensal2"      value="' + Request.ContentFields.Values['edtAnoMensal']      + '"> ' + CR +
       '  <input type="hidden" name="edtMesTrimestral2"  value="' + Request.ContentFields.Values['cmbMesTrimestral']  + '"> ' + CR +
       '  <input type="hidden" name="edtAnoTrimestral2"  value="' + Request.ContentFields.Values['edtAnoTrimestral']  + '"> ' + CR +
       '  <input type="hidden" name="edtAnoConsolidado2" value="' + Request.ContentFields.Values['edtAnoConsolidado'] + '"> ' + CR +
       '  <#hiddenfields>                                                             ' + CR +
       '</form>                                                                       ' + CR +
       '<SCRIPT language="JavaScript">                                                ' + CR +
       '  frmOutraJanela.submit();                                                    ' + CR +
       '</script>                                                                     ' + CR ;

    Result := MontaPagina( pExtResPer, Result );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaExtResPer}


//Monta o extrato de reserva por período
function PaginaImpExtResPer( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
begin

  try

    sTitulo := TituloPagina( pExtResPer );

    Result := DadosExtrato( iIdPessoaLocal,
                            Request.ContentFields.Values['edtTipoExtrato'],
                            Request.ContentFields.Values['edtMesMensal2'],
                            Request.ContentFields.Values['edtAnoMensal2'],
                            Request.ContentFields.Values['edtMesTrimestral2'],
                            Request.ContentFields.Values['edtAnoTrimestral2'],
                            Request.ContentFields.Values['edtAnoConsolidado2'] );

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {PaginaImpExtResPer}


//Monta o extrato de reserva por período
function DadosExtrato( iIdPessoaLocal : integer; 
                       sTipoExtrato,
                       sMesMensal,
                       sAnoMensal,
                       sMesTrimestral,
                       sAnoTrimestral,
                       sAnoConsolidado : string ) : String;
var
  iTipo : integer;
  sMesLocal, sAnoLocal : string;
  cdsPessoa : TCMClientDataSet;
begin

  cdsPessoa := TCMClientDataSet.Create( nil );
  try

    cdsPessoa.Data := WebDadosCadastrais.DadosExtrato( iIdPessoa, 33 );

    iTipo := StrToInt( sTipoExtrato );

    if iTipo = 1 then
    begin

      Result := '<HTML><HEAD><TITLE>Extrato de Reserva [Mensal]</TITLE></HEAD><BODY>' +
                Cabecalho;

      sAnoLocal := sAnoMensal;
      if StrToIntDef( sAnoLocal, 0 ) < 100 then
        sAnoLocal := '20' + FormatFloat( '00', StrToIntDef( sAnoLocal, 0 ) );
      sMesLocal := sAnoLocal + '/' + FormatFloat( '00', StrToIntDef( sMesMensal, 0 ) );

      Result := Result + ExtMensal( cdsPessoa.FieldByName('IDPESSJUR').AsInteger,
                                    cdsPessoa.FieldByName('IDPLANOPREV').AsInteger,
                                    iIdPessoaLocal,
                                    cdsPessoa.FieldByName('SEQPROPOSTA').AsInteger,
                                    sMesLocal );
    end;


    if iTipo = 2 then
    begin

      Result := '<HTML><HEAD><TITLE>Extrato de Reserva [Trimestral]</TITLE></HEAD><BODY>' +
                Cabecalho;

      sAnoLocal := sAnoTrimestral;
      if StrToIntDef( sAnoLocal, 0 ) < 100 then
        sAnoLocal := '20' + FormatFloat( '00', StrToIntDef( sAnoLocal, 0 ) );
      sMesLocal := sAnoLocal + '/' + FormatFloat( '00', StrToIntDef( sMesTrimestral, 0 ) );

      Result := Result + ExtTrimestral( cdsPessoa.FieldByName('IDPESSJUR').AsInteger,
                                        cdsPessoa.FieldByName('IDPLANOPREV').AsInteger,
                                        iIdPessoaLocal,
                                        cdsPessoa.FieldByName('SEQPROPOSTA').AsInteger,
                                        sMesLocal );
    end;


    if iTipo = 3 then
    begin

      Result := '<HTML><HEAD><TITLE>Extrato de Reserva [Consolidado]</TITLE></HEAD><BODY>' +
                Cabecalho;

      sAnoLocal := sAnoConsolidado;
      if StrToIntDef( sAnoLocal, 0 ) < 100 then
        sAnoLocal := '20' + FormatFloat( '00', StrToIntDef( sAnoLocal, 0 ) );

      Result := Result + ExtConsolidado( cdsPessoa.FieldByName('IDPESSJUR').AsInteger,
                                         cdsPessoa.FieldByName('IDPLANOPREV').AsInteger,
                                         iIdPessoaLocal,
                                         cdsPessoa.FieldByName('SEQPROPOSTA').AsInteger,
                                         sAnoLocal );
    end;

    Result := Result + '</BODY></HTML>'; 

    
  finally
    cdsPessoa.Free;
  end;

end; {DadosExtrato}


//Gera o cabeçalho dos extratos
function Cabecalho : String;
var
  cdsFundacao : TCMClientDataSet;
begin
  cdsFundacao := TCMClientDataSet.Create( nil );
  try

    cdsFundacao.Data := ExtratoReserva.BuscaFundacao( iIdEmpresaProp );

    Result :=
     '<CENTER>                                                                 ' + CR +
     '  <TABLE border="0" cellspacing="2" cellpadding="4" width="730"          ' + CR +
     '         style="border-style: solid; border-width: thin">                ' + CR +
     '    <TR>                                                                 ' + CR +
     '      <TD>                                                               ' + CR +
     '        <TABLE border="0" cellspacing="0" cellpadding="0" width="100%"   ' + CR +
     '               style="border-bottom-style: double; border-width: medium; ' + CR +
     '                      border-bottom-color: black">                       ' + CR +          
     '          <TR>                                                           ' + CR +
     '            <TD width="100" valign="top">                                ' + CR +
     '              <img border="0" width="100" src="./Imagem?idimagem='         +
     cdsFundacao.FieldByName('IDIMAGEM').AsString + '">                        ' + CR +
     '            </TD>                                                        ' + CR +
     '            <TD width="10" valign="middle">                              ' + CR +
     '            </TD>                                                        ' + CR +
     '            <TD valign="middle">                                         ' + CR +
     '              <font style="font-family: Arial; font-size: 18px"><b>      ' + CR +
     cdsFundacao.FieldByName('NOME').AsString                                    + CR +
     '              </b></font>                                                ' + CR +
     '              <BR>                                                       ' + CR +
     '              <font style="font-family: Arial; font-size: 13px"><b>      ' + CR +
     cdsFundacao.FieldByName('RAZAOSOCIAL').AsString                             + CR +
     '              </b></font>                                                ' + CR +
     '              <BR><BR>                                                   ' + CR +
     '              <font style="font-family: Arial; font-size: 12px">         ' + CR +
     cdsFundacao.FieldByName('LOGRADOURO').AsString                              + CR +
     '              </font>                                                    ' + CR +
     '              <BR>                                                       ' + CR +
     '              <font style="font-family: Arial; font-size: 12px">CEP      ' + CR +
     cdsFundacao.FieldByName('CEP').AsString                                     + CR +
     '              </font>                                                    ' + CR +
     '            </TD>                                                        ' + CR +
     '          </TR>                                                          ' + CR +
     '        </TABLE>                                                         ' + CR ;

  finally
    cdsFundacao.Free;
  end;
end; {Cabecalho}


//Extrato mensal
function ExtMensal( iIdPessJur,
                    iIdPlanoPrev,
                    iIdPessoaLocal,
                    iSeqProposta : integer;
                    sMes : string ) : string;
var
  cds : TCMClientDataSet;
  sNomeConta_Ant,
  sAnoMesAnt,
  sDiaAnt,
  sDataLanc : string;
  dSaldoCotas,
  dValorCota,
  dSaldoCotasTotal : double;
begin

  cds := TCMClientDataSet.Create( nil );
  try
    cds.Data := ExtratoReserva.EmiteExtratoReservaMensal( sMes,
                                                          iIdPessJur,
                                                          iIdPlanoPrev,
                                                          iIdPessoaLocal,
                                                          iSeqProposta,
                                                          False,
                                                          0,
                                                          '',
                                                          '' );

    Result :=
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD width="40%" align="left"                                        ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Nome:&nbsp;&nbsp;' + cds.FieldByName('PARTICIPANTE').AsString       + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" align="left"                                        ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Matrícula:&nbsp;&nbsp;' + cds.FieldByName('MATRICULA').AsString     + CR +
     '      </TD>                                                               ' + CR +
     '      <TD align="right"                                                   ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Data:&nbsp;&nbsp;' + FormatDateTime( 'dd/mm/yyyy', Now )            + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD style="font-family: Arial; font-size: 16px; font-weight: bold"  ' + CR +
     '          align="center" colspan="4" valign="middle">                     ' + CR +
     '        Extrato de Conta - Participante                                   ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD width="30%">                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="40%" style="font-family: Arial; font-size: 13px;         ' + CR +
     '                             font-weight: bold" align="center">           ' + CR +
     '        Extrato para Simples Conferência                                  ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="5%">                                                     ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" align="center" style="font-family: Arial;           ' + CR +
     '          border-color: black; border-width: 1px; border-style: solid;    ' + CR +
     '          font-size: 13px; font-weight: bold; background: CCCCCC">        ' + CR +
     '        Mês Ref.:&nbsp;&nbsp;' + cds.FieldByName('MESREFERENCIA').AsString  + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  <BR><BR>                                                                ' + CR ;

    sNomeConta_Ant := '';
    cds.First;
    dSaldoCotas      := 0;
    dSaldoCotasTotal := 0;
    while not cds.Eof do
    begin

      if sNomeConta_Ant <> cds.FieldByName('NOME_CONTA').AsString then
      begin

        dSaldoCotas := cds.FieldByName('SALDOANTCOTA').AsFloat;

        Result := Result +
         '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
         '    <TR height="20">                                                      ' + CR +
         '      <TD style="font-family: Arial; font-size: 12px; font-weight: bold"  ' + CR +
         '          align="left" width="55%" valign="middle">                       ' + CR +
         '        <u>'+ cds.FieldByName('NOME_CONTA').AsString + '</u>              ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD align="center" style="font-family: Arial;                       ' + CR +
         '          border-color: black; border-width: 1px; border-style: solid;    ' + CR +
         '          font-size: 11px; font-weight: bold; background: CCCCCC">        ' + CR +
         '        Saldo anterior (cotas) em '                                         + CR ;

        sAnoMesAnt := ExtratoReserva.SAnoMesAnterior( sMes );
        if Copy(sAnoMesAnt,6,2) = '01'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '02'  then sDiaAnt := '28' else
        if Copy(sAnoMesAnt,6,2) = '03'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '04'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '05'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '06'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '07'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '08'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '09'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '10'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '11'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '12'  then sDiaAnt := '31';

        Result := Result + sDiaAnt + '/' + Copy( sAnoMesAnt, 6, 2 ) + '/' + Copy( sAnoMesAnt, 1, 4 );

        Result := Result                                                                   +
         ':&nbsp;&nbsp; '                                                             + CR +
         FormatFloat( '#,##0.000000', cds.FieldByName('SALDOANT').AsFloat )           + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR +
         '  </TABLE>                                                                ' + CR +
         '  <BR>                                                                    ' + CR +
         '  <p align="right">                                                       ' + CR +
         '  <TABLE border="0" cellspacing="0" cellpadding="0" width="700"           ' + CR +
         '   style="border-style: solid; border-color: black; border-width: 1px">   ' + CR +
         '    <TR height="18">                                                      ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="17%" valign="middle">                       ' + CR +
         '        &nbsp;Data de Lançamento                                          ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="36%" valign="middle">                       ' + CR +
         '        &nbsp;Descrição                                                   ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="20%" valign="middle">                      ' + CR +
         '        Quantidade de cotas&nbsp;                                         ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="15%" valign="middle">                      ' + CR +
         '        Valor da cota&nbsp;                                               ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          background: CCCCCC"                                             ' + CR +
         '          align="right" width="12%" valign="middle">                      ' + CR +
         '        R$&nbsp;                                                          ' + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR ;
      end;

      Result := Result +
       '    <TR>                                                                  ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="left" valign="middle">                                   ' + CR +
       '        &nbsp;                                                            ' +
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATA_LANCAMENTO').AsString ) + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="left" valign="middle">                                   ' + CR +
       '        &nbsp;                                                            ' +
       cds.FieldByName('DESCRICAO').AsString                                        + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="right" valign="middle">                                  ' + CR +
       '        &nbsp;                                                            ' +
       FormatFloat( '#,##0.000000', cds.FieldByName('QUANT_COTA').AsFloat )         + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="right" valign="middle">                                  ' + CR +
       '        &nbsp;                                                            ' +
       FormatFloat( '#,##0.000000', cds.FieldByName('VALOR_DA_COTA').AsFloat )      + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px"                     ' + CR +
       '          align="right" valign="middle">                                  ' + CR +
       '        &nbsp;                                                            ' +
       FormatFloat( '#,##0.00', cds.FieldByName('VALOR_EM_REAL').AsFloat )          + CR +
       '&nbsp;                                                                    ' + CR +
       '      </TD>                                                               ' + CR +
       '    </TR>                                                                 ' + CR ;


      sDataLanc        := cds.FieldByName('DATA_LANCAMENTO').AsString;
      dValorCota       := cds.FieldByName('VALOR_DA_COTA').AsFloat;
      dSaldoCotas      := dSaldoCotas + cds.FieldByName('QUANT_COTA').AsFloat;

      sNomeConta_Ant := cds.FieldByName('NOME_CONTA').AsString;
      cds.Next;

      if ( sNomeConta_Ant <> cds.FieldByName('NOME_CONTA').AsString ) or
         ( cds.Eof ) then
      begin
        Result := Result +
         '  </TABLE>                                                                ' + CR +
         '  <TABLE border="0" cellspacing="0" cellpadding="0" width="700">          ' + CR +
         '    <TR height="3px"><TD></TD></TR>                                       ' + CR +
         '  </TABLE>                                                                ' + CR +
         '  <TABLE border="0" cellspacing="0" cellpadding="0" width="700"           ' + CR +
         '   style="border-style: solid; border-color: black; border-width: 2px">   ' + CR +
         '    <TR>                                                                  ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="17%" valign="middle">                       ' + CR +
         '        &nbsp;&nbsp;&nbsp;SALDO                                           ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="36%" valign="middle">                       ' + CR +
         '        &nbsp;Data da Cota                                                ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="20%" valign="middle">                      ' + CR +
         '        Quantidade de cotas&nbsp;                                         ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="15%" valign="middle">                      ' + CR +
         '        Valor da cota&nbsp;                                               ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          background: CCCCCC"                                             ' + CR +
         '          align="right" width="12%" valign="middle">                      ' + CR +
         '        R$&nbsp;                                                          ' + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR +
         '    <TR>                                                                  ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" valign="middle">                                   ' + CR +
         '        &nbsp;&nbsp;&nbsp;ATUAL                                           ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px"                                        ' + CR +
         '          align="left" valign="middle">                                   ' + CR +
         '        &nbsp;                                                            ' +
         FormataDataHora( 'dd/mm/yyyy', sDataLanc )                                   + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px"                                        ' + CR +
         '          align="right" valign="middle">                                  ' + CR +
         FormatFloat( '#,##0.000000', dSaldoCotas )                                   + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px"                                        ' + CR +
         '          align="right" valign="middle">                                  ' + CR +
         '        &nbsp;                                                            ' +
         FormatFloat( '#,##0.000000', dValorCota )                                    + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px"                     ' + CR +
         '          align="right" valign="middle">                                  ' + CR +
         FormatFloat('#,##0.00', dSaldoCotas * dValorCota )                           + CR +
         '&nbsp;                                                                    ' + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR +
         '  </TABLE>                                                                ' + CR +
         '  </p>                                                                    ' + CR +
         '  <BR><BR>                                                                ' + CR ;

        dSaldoCotasTotal := dSaldoCotasTotal + dSaldoCotas;         
      end;

    end;


    Result := Result +
     '  <BR>                                                                    ' + CR +
     '  <p align="right">                                                       ' + CR +
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="700"           ' + CR +
     '   style="border-style: outset">                                          ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: inset; background: CCCCCC"                  ' + CR +
     '          align="left" width="17%" valign="middle">                       ' + CR +
     '        &nbsp;&nbsp;&nbsp;SALDO                                           ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="left" width="36%" valign="middle">                       ' + CR +
     '        &nbsp;Data da Cota                                                ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="right" width="20%" valign="middle">                      ' + CR +
     '        Quantidade de cotas&nbsp;                                         ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="right" width="15%" valign="middle">                      ' + CR +
     '        Valor da cota&nbsp;                                               ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          background: CCCCCC"                                             ' + CR +
     '          align="right" width="12%" valign="middle">                      ' + CR +
     '        R$&nbsp;                                                          ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="left" valign="middle">                                   ' + CR +
     '        &nbsp;&nbsp;&nbsp;TOTAL                                           ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="left" valign="middle">                                   ' + CR +
     '        &nbsp;                                                            ' +
     FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATA_LANCAMENTO').AsString ) + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     FormatFloat( '#,##0.000000', dSaldoCotasTotal )                              + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     '        &nbsp;                                                            ' +
     FormatFloat( '#,##0.000000', cds.FieldByName('VALOR_DA_COTA').AsFloat )      + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px"                     ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     FormatFloat('#,##0.00',dSaldoCotasTotal*cds.FieldByName('VALOR_DA_COTA').AsFloat)+CR+
     '&nbsp;                                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  </p>                                                                    ' + CR +
     '      <BR><BR><BR><BR>                                                    ' + CR +
     '      <p align="center" style="font-family: Arial; font-weight: bold;     ' + CR +
     '                               font-size: 12px">                          ' + CR +
     '        PROJEÇÃO BENEFÍCIO SALDADO EM                                     ' + CR +
     FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATA_LANCAMENTO').AsString ) + CR +
     '      <BR>                                                                ' + CR +
     '      </p>                                                                ' + CR +
     '      <p align="left">                                                    ' + CR +
     '      <TABLE border="0" cellspacing="2" cellpadding="3" width="370"       ' + CR +
     '             style="background: CCCCCC">                                  ' + CR +
     '        <TR>                                                              ' + CR +
     '          <TD width="70%" style="font-family: Arial; font-size: 11px;     ' + CR +
     '                     font-weight: bold; background: CCCCCC">              ' + CR +
     '            Valor do Benefício Saldado aos '                                + CR +
     cds.FieldByName('IDADEBSALDADO').AsString + ' anos                         ' + CR +
     '          </TD>                                                           ' + CR +
     '          <TD style="font-family: Arial; font-size: 11px;                 ' + CR +
     '                     font-weight: bold; background: CCCCCC">              ' + CR +
     'R$ ' + FormatFloat('#,##0.00', cds.FieldByName('BSALDADO').AsFloat)         + CR +
     '          </TD>                                                           ' + CR +
     '        </TR>                                                             ' + CR +
     '      </TABLE>                                                            ' + CR +
     '      </p>                                                                ' + CR +
     '      <p align="center" style="font-family: Arial; font-weight: bold;     ' + CR +
     '                               font-size: 12px">                          ' + CR +
     '        ATENÇÃO: Esta informação está sujeita a confirmação da FCRT.      ' + CR +
     '      <BR>                                                                ' + CR +
     '      </p>                                                                ' + CR +
     '    </TD>                                                                 ' + CR +
     '  </TR>                                                                   ' + CR +
     '</TABLE>                                                                  ' + CR ;

    cds.Close;

  finally
    cds.Free;
  end;

end; {ExtMensal}


//Extrato trimestral
function ExtTrimestral( iIdPessJur,
                        iIdPlanoPrev,
                        iIdPessoaLocal,
                        iSeqProposta : integer;
                        sMes : string ) : string;
var
  cds : TCMClientDataSet;
  sNomeConta_Ant,
  sDiaAnt,
  sAnoMesAnt,
  sDataLanc : string;
  dValorCota,
  dSaldoCotas,
  dSaldoCotasTotal : double;
begin

  cds := TCMClientDataSet.Create( nil );
  try
    cds.Data := ExtratoReserva.EmiteExtratoReservaTrimestral( sMes,
                                                              iIdPessJur,
                                                              iIdPlanoPrev,
                                                              iIdPessoaLocal,
                                                              iSeqProposta,
                                                              False,
                                                              0,
                                                              '',
                                                              '' );

    Result :=
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD width="40%" align="left"                                        ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Nome:&nbsp;&nbsp;' + cds.FieldByName('PARTICIPANTE').AsString       + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" align="left"                                        ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Matrícula:&nbsp;&nbsp;' + cds.FieldByName('MATRICULA').AsString     + CR +
     '      </TD>                                                               ' + CR +
     '      <TD align="right"                                                   ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Data:&nbsp;&nbsp;' + FormatDateTime( 'dd/mm/yyyy', Now )            + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD style="font-family: Arial; font-size: 16px; font-weight: bold"  ' + CR +
     '          align="center" colspan="4" valign="middle">                     ' + CR +
     '        Extrato de Conta - Participante                                   ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD width="30%">                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="40%" style="font-family: Arial; font-size: 13px;         ' + CR +
     '                             font-weight: bold" align="center">           ' + CR +
     '        Posição no Trimestre Civil                                        ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="5%">                                                     ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" style="font-family: Arial; font-size: 13px;         ' + CR +
     '                             font-weight: bold" align="center">           ' + CR +
     '        Referência                                                        ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD width="30%">                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="40%" style="font-family: Arial; font-size: 13px;         ' + CR +
     '                             font-weight: bold" align="center">           ' + CR +
     '        Extrato para Simples Conferência                                  ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="5%">                                                     ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" align="center" style="font-family: Arial;           ' + CR +
     '          border-color: black; border-width: 1px; border-style: solid;    ' + CR +
     '          font-size: 13px; font-weight: bold; background: CCCCCC">        ' + CR +
     cds.FieldByName('TRIMESTRE').AsString                                        + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  <BR><BR>                                                                ' + CR ;

    sNomeConta_Ant := '';
    cds.First;
    dSaldoCotasTotal := 0;
    dSaldoCotas      := 0;
    while not cds.Eof do
    begin

      if sNomeConta_Ant <> cds.FieldByName('NOME_CONTA').AsString then
      begin

        dSaldoCotas := cds.FieldByName('SALDOANTCOTA').AsFloat;

        Result := Result +
         '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
         '    <TR height="20">                                                      ' + CR +
         '      <TD style="font-family: Arial; font-size: 12px; font-weight: bold"  ' + CR +
         '          align="left" width="60%" valign="middle">                       ' + CR +
         '        <u>'+ cds.FieldByName('NOME_CONTA').AsString + '</u>              ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD align="center" style="font-family: Arial;                       ' + CR +
         '          border-color: black; border-width: 1px; border-style: solid;    ' + CR +
         '          font-size: 11px; font-weight: bold; background: CCCCCC">        ' + CR +
         '        Saldo anterior (cotas) em '                                         + CR ;

        sAnoMesAnt := ExtratoReserva.SAnoMesAnterior( sMes );
        sAnoMesAnt := ExtratoReserva.SAnoMesAnterior( sAnoMesAnt );
        sAnoMesAnt := ExtratoReserva.SAnoMesAnterior( sAnoMesAnt );
        if Copy(sAnoMesAnt,6,2) = '01'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '02'  then sDiaAnt := '28' else
        if Copy(sAnoMesAnt,6,2) = '03'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '04'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '05'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '06'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '07'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '08'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '09'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '10'  then sDiaAnt := '31' else
        if Copy(sAnoMesAnt,6,2) = '11'  then sDiaAnt := '30' else
        if Copy(sAnoMesAnt,6,2) = '12'  then sDiaAnt := '31';

        Result := Result + sDiaAnt + '/' + Copy( sAnoMesAnt, 6, 2 ) + '/' + Copy( sAnoMesAnt, 1, 4 );

        Result := Result                                                                   +
         ':&nbsp;&nbsp; '                                                             + CR +
         FormatFloat( '#,##0.000000', cds.FieldByName('SALDOANT').AsFloat )           + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR +
         '  </TABLE>                                                                ' + CR +
         '  <BR>                                                                    ' + CR +
         '  <p align="right">                                                       ' + CR +
         '  <TABLE border="0" cellspacing="0" cellpadding="0" width="700"           ' + CR +
         '   style="border-style: solid; border-color: black; border-width: 1px">   ' + CR +
         '    <TR height="18">                                                      ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="17%" valign="middle">                       ' + CR +
         '        &nbsp;Data de Lançamento                                          ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="36%" valign="middle">                       ' + CR +
         '        &nbsp;Descrição                                                   ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="20%" valign="middle">                      ' + CR +
         '        Quantidade de cotas&nbsp;                                         ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="15%" valign="middle">                      ' + CR +
         '        Valor da cota&nbsp;                                               ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          background: CCCCCC"                                             ' + CR +
         '          align="right" width="12%" valign="middle">                      ' + CR +
         '        R$&nbsp;                                                          ' + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR ;
      end;

      Result := Result +
       '    <TR>                                                                  ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="left" valign="middle">                                   ' + CR +
       '        &nbsp;                                                            ' +
       FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATA_LANCAMENTO').AsString ) + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="left" valign="middle">                                   ' + CR +
       '        &nbsp;                                                            ' +
       cds.FieldByName('DESCRICAO').AsString                                        + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="right" valign="middle">                                  ' + CR +
       '        &nbsp;                                                            ' +
       FormatFloat( '#,##0.000000', cds.FieldByName('QUANT_COTA').AsFloat )         + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px"                                        ' + CR +
       '          align="right" valign="middle">                                  ' + CR +
       '        &nbsp;                                                            ' +
       FormatFloat( '#,##0.000000', cds.FieldByName('VALOR_DA_COTA').AsFloat )      + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px"                     ' + CR +
       '          align="right" valign="middle">                                  ' + CR +
       '        &nbsp;                                                            ' +
       FormatFloat( '#,##0.00', cds.FieldByName('VALOR_EM_REAL').AsFloat )          + CR +
       '&nbsp;                                                                    ' + CR +
       '      </TD>                                                               ' + CR +
       '    </TR>                                                                 ' + CR ;


      sDataLanc        := cds.FieldByName('DATA_LANCAMENTO').AsString;
      dValorCota       := cds.FieldByName('VALOR_DA_COTA').AsFloat;
      dSaldoCotas      := dSaldoCotas + cds.FieldByName('QUANT_COTA').AsFloat;

      sNomeConta_Ant := cds.FieldByName('NOME_CONTA').AsString;
      cds.Next;

      if ( sNomeConta_Ant <> cds.FieldByName('NOME_CONTA').AsString ) or
         ( cds.Eof ) then
      begin
        Result := Result +
         '  </TABLE>                                                                ' + CR +
         '  <BR>                                                                    ' + CR +
         '  <TABLE border="0" cellspacing="0" cellpadding="0" width="700"           ' + CR +
         '   style="border-style: solid; border-color: black; border-width: 2px">   ' + CR +
         '    <TR>                                                                  ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="17%" valign="middle">                       ' + CR +
         '        &nbsp;&nbsp;&nbsp;SALDO                                           ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" width="36%" valign="middle">                       ' + CR +
         '        &nbsp;Data da Cota                                                ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="20%" valign="middle">                      ' + CR +
         '        Quantidade de cotas&nbsp;                                         ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="right" width="15%" valign="middle">                      ' + CR +
         '        Valor da cota&nbsp;                                               ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          background: CCCCCC"                                             ' + CR +
         '          align="right" width="12%" valign="middle">                      ' + CR +
         '        R$&nbsp;                                                          ' + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR +
         '    <TR>                                                                  ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
         '          align="left" valign="middle">                                   ' + CR +
         '        &nbsp;&nbsp;&nbsp;ATUAL                                           ' + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px"                                        ' + CR +
         '          align="left" valign="middle">                                   ' + CR +
         '        &nbsp;                                                            ' +
         FormataDataHora( 'dd/mm/yyyy', sDataLanc )                                   + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px"                                        ' + CR +
         '          align="right" valign="middle">                                  ' + CR +
         FormatFloat( '#,##0.000000', dSaldoCotas )                                   + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
         '          border-right-style: solid; border-right-color: black;           ' + CR +
         '          border-right-width: 1px"                                        ' + CR +
         '          align="right" valign="middle">                                  ' + CR +
         '        &nbsp;                                                            ' +
         FormatFloat( '#,##0.000000', dValorCota )                                    + CR +
         '      </TD>                                                               ' + CR +
         '      <TD style="font-family: Arial; font-size: 11px"                     ' + CR +
         '          align="right" valign="middle">                                  ' + CR +
         FormatFloat( '#,##0.00', dSaldoCotas * dValorCota )                          + CR +
         '&nbsp;                                                                    ' + CR +
         '      </TD>                                                               ' + CR +
         '    </TR>                                                                 ' + CR +
         '  </TABLE>                                                                ' + CR +
         '  </p>                                                                    ' + CR +
         '  <BR><BR>                                                                ' + CR ;

        dSaldoCotasTotal := dSaldoCotasTotal + dSaldoCotas;
      end;

    end;


    Result := Result +
     '  <BR>                                                                    ' + CR +
     '  <p align="right">                                                       ' + CR +
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="700"           ' + CR +
     '   style="border-style: outset">                                          ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: inset; background: CCCCCC"                  ' + CR +
     '          align="left" width="17%" valign="middle">                       ' + CR +
     '        &nbsp;&nbsp;&nbsp;SALDO                                           ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="left" width="36%" valign="middle">                       ' + CR +
     '        &nbsp;Data da Cota                                                ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="right" width="20%" valign="middle">                      ' + CR +
     '        Quantidade de cotas&nbsp;                                         ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="right" width="15%" valign="middle">                      ' + CR +
     '        Valor da cota&nbsp;                                               ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          background: CCCCCC"                                             ' + CR +
     '          align="right" width="12%" valign="middle">                      ' + CR +
     '        R$&nbsp;                                                          ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="left" valign="middle">                                   ' + CR +
     '        &nbsp;&nbsp;&nbsp;TOTAL                                           ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="left" valign="middle">                                   ' + CR +
     '        &nbsp;                                                            ' +
     FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATA_LANCAMENTO').AsString ) + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     FormatFloat( '#,##0.000000', dSaldoCotasTotal )                              + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     '        &nbsp;                                                            ' +
     FormatFloat( '#,##0.000000', cds.FieldByName('VALOR_DA_COTA').AsFloat )      + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px"                     ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     FormatFloat('#,##0.00',dSaldoCotasTotal*cds.FieldByName('VALOR_DA_COTA').AsFloat)+CR+
     '&nbsp;                                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  </p>                                                                    ' + CR +
     '      <BR><BR><BR><BR>                                                    ' + CR +
     '      <p align="center" style="font-family: Arial; font-weight: bold;     ' + CR +
     '                               font-size: 12px">                          ' + CR +
     '        PROJEÇÃO BENEFÍCIO SALDADO EM                                     ' + CR +
     FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATA_LANCAMENTO').AsString ) + CR +
     '      <BR>                                                                ' + CR +
     '      </p>                                                                ' + CR +
     '      <p align="left">                                                    ' + CR +
     '      <TABLE border="0" cellspacing="2" cellpadding="3" width="370"       ' + CR +
     '             style="background: CCCCCC">                                  ' + CR +
     '        <TR>                                                              ' + CR +
     '          <TD width="70%" style="font-family: Arial; font-size: 11px;     ' + CR +
     '                     font-weight: bold; background: CCCCCC">              ' + CR +
     '            Valor do Benefício Saldado aos '                                + CR +
     cds.FieldByName('IDADEBSALDADO').AsString + ' anos                         ' + CR +
     '          </TD>                                                           ' + CR +
     '          <TD style="font-family: Arial; font-size: 11px;                 ' + CR +
     '                     font-weight: bold; background: CCCCCC">              ' + CR +
     'R$ ' + FormatFloat('#,##0.00', cds.FieldByName('BSALDADO').AsFloat)         + CR +
     '          </TD>                                                           ' + CR +
     '        </TR>                                                             ' + CR +
     '      </TABLE>                                                            ' + CR +
     '      </p>                                                                ' + CR +
     '      <p align="center" style="font-family: Arial; font-weight: bold;     ' + CR +
     '                               font-size: 12px">                          ' + CR +
     '        ATENÇÃO: Esta informação está sujeita a confirmação da FCRT.      ' + CR +
     '      <BR>                                                                ' + CR +
     '      </p>                                                                ' + CR +
     '    </TD>                                                                 ' + CR +
     '  </TR>                                                                   ' + CR +
     '</TABLE>                                                                  ' + CR ;

    cds.Close;

  finally
    cds.Free;
  end;

end; {ExtTrimestral}


//Extrato consolidado
function ExtConsolidado( iIdPessJur,
                         iIdPlanoPrev,
                         iIdPessoaLocal,
                         iSeqProposta : integer;
                         sAno : string ) : string;
var
  cds : TCMClientDataSet;
  dSaldoCotas : double;
begin

  cds := TCMClientDataSet.Create( nil );
  try
    cds.Data := ExtratoReserva.EmiteExtratoReservaConsolidado( sAno,
                                                               iIdPessJur,
                                                               iIdPlanoPrev,
                                                               iIdPessoaLocal,
                                                               iSeqProposta,
                                                               False,
                                                               0,
                                                               '',
                                                               '',
                                                               False );

    Result :=
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD width="40%" align="left"                                        ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Nome:&nbsp;&nbsp;' + cds.FieldByName('PARTICIPANTE').AsString       + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" align="left"                                        ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Matrícula:&nbsp;&nbsp;' + cds.FieldByName('MATRICULA').AsString     + CR +
     '      </TD>                                                               ' + CR +
     '      <TD align="right"                                                   ' +
     '          style="font-family: Arial; font-size: 12px; font-weight: bold"> ' + CR +
     '        Data:&nbsp;&nbsp;' + FormatDateTime( 'dd/mm/yyyy', Now )            + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%">         ' + CR +
     '    <TR height="30">                                                      ' + CR +
     '      <TD style="font-family: Arial; font-size: 16px; font-weight: bold"  ' + CR +
     '          align="center" colspan="4" valign="middle">                     ' + CR +
     '        Extrato de Conta Consolidado                                      ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD width="30%">                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="40%" style="font-family: Arial; font-size: 13px;         ' + CR +
     '                             font-weight: bold" align="center">           ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="5%">                                                     ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" style="font-family: Arial; font-size: 13px;         ' + CR +
     '                             font-weight: bold" align="center">           ' + CR +
     '        Referência                                                        ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR height="20">                                                      ' + CR +
     '      <TD width="30%">                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="40%" style="font-family: Arial; font-size: 13px;         ' + CR +
     '                             font-weight: bold" align="center">           ' + CR +
     '        Extrato para Simples Conferência                                  ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="5%">                                                     ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" align="center" style="font-family: Arial;           ' + CR +
     '          border-color: black; border-width: 1px; border-style: solid;    ' + CR +
     '          font-size: 13px; font-weight: bold; background: CCCCCC">        ' + CR +
     cds.FieldByName('ANO').AsString                                              + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR height="55" valign="bottom">                                      ' + CR +
     '      <TD width="30%">                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="40%">                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="5%">                                                     ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD width="25%" align="left" style="font-family: Arial;             ' + CR +
     '          font-size: 13px; font-weight: bold">                            ' + CR +
     '        Saldo anterior em                                                 ' + CR +
     '        <TABLE border="0" cellspacing="0" cellpadding="0" width="100%"    ' + CR +
     '               style="border-color: black; border-width: 1px;             ' + CR +
     '               border-style: solid">                                      ' + CR +
     '          <TR>                                                            ' + CR +
     '            <TD width="50%" style="font-family: Arial; font-size: 11px;   ' + CR +
     '                font-weight: bold; background: CCCCCC" align="right">     ' + CR +
     '              Cotas                                                       ' + CR +
     '            </TD>                                                         ' + CR +
     '            <TD style="font-family: Arial; font-size: 11px;               ' + CR +
     '                font-weight: bold; background: CCCCCC" align="right">     ' + CR +
     '              R$                                                          ' + CR +
     '            </TD>                                                         ' + CR +
     '          </TR>                                                           ' + CR +
     '          <TR>                                                            ' + CR +
     '            <TD style="font-family: Arial; font-size: 12px;               ' + CR +
     '                font-weight: bold" align="right">                         ' + CR +
     FormatFloat( '#,##0.000000', cds.FieldByName('SALDOANTCOTA').AsFloat )       + CR +
     '            </TD>                                                         ' + CR +
     '            <TD style="font-family: Arial; font-size: 12px;               ' + CR +
     '                font-weight: bold" align="right">                         ' + CR +
     FormatFloat( '#,##0.00', cds.FieldByName('SALDOANT').AsFloat )               + CR +
     '            </TD>                                                         ' + CR +
     '          </TR>                                                           ' + CR +
     '        </TABLE>                                                          ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  <BR>                                                                    ' + CR +
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%"          ' + CR +
     '   style="border-style: solid; border-color: black; border-width: 1px">   ' + CR +
     '    <TR height="20">                                                      ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; border-right-color: black;           ' + CR +
     '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
     '          align="left" width="14%" valign="middle" rowspan="2">           ' + CR +
     '        &nbsp;Mês Referência                                              ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; border-right-color: black;           ' + CR +
     '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
     '          align="left" width="30%" valign="middle" rowspan="2">           ' + CR +
     '        &nbsp;Descrição                                                   ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; border-right-color: black;           ' + CR +
     '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
     '          align="right" width="14%" valign="middle" rowspan="2">          ' + CR +
     '        Em cotas&nbsp;                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; border-right-color: black;           ' + CR +
     '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
     '          align="right" width="14%" valign="middle" rowspan="2">          ' + CR +
     '        R$&nbsp;                                                          ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-bottom-style: solid; border-bottom-color: black;         ' + CR +
     '          border-bottom-width: 1px; background: CCCCCC"                   ' + CR +
     '          width="14%" valign="middle" colspan="2" align="center">         ' + CR +
     '        Saldo de Conta                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR height="20">                                                      ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; border-right-color: black;           ' + CR +
     '          border-right-width: 1px; background: CCCCCC"                    ' + CR +
     '          align="right" width="14%" valign="middle">                      ' + CR +
     '        Em cotas&nbsp;                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          background: CCCCCC" align="right" width="14%" valign="middle">  ' + CR +
     '        R$&nbsp;                                                          ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR ;

    dSaldoCotas := cds.FieldByName('SALDOANTCOTA').AsFloat;
    cds.First;
    while not cds.Eof do
    begin

      Result := Result +
       '    <TR>                                                                  ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px; border-top-style: solid;               ' + CR +
       '          border-top-color: black; border-top-width: 1px" align="left"    ' + CR +
       '          width="14%" valign="middle" rowspan="2">&nbsp;                  ' + CR +
       cds.FieldByName('MESREFERENCIA').AsString                                    + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px; border-top-style: solid;               ' + CR +
       '          border-top-color: black; border-top-width: 1px"                 ' + CR +
       '          align="left" width="30%" valign="middle">                       ' + CR +
       '        &nbsp;Contribuição Participante                                   ' + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px; border-top-style: solid;               ' + CR +
       '          border-top-color: black; border-top-width: 1px" align="right"   ' + CR +
       '          width="14%" valign="middle">                                    ' + CR +
       FormatFloat( '#,##0.000000', cds.FieldByName('QUANT_COTA_PART').AsFloat )    + CR +
       '      &nbsp;</TD>                                                         ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px; border-top-style: solid;               ' + CR +
       '          border-top-color: black; border-top-width: 1px"                 ' + CR +
       '          align="right" width="14%" valign="middle">                      ' + CR +
       FormatFloat( '#,##0.00', cds.FieldByName('VALOR_EM_REAL_PART').AsFloat )     + CR +
       '      &nbsp;</TD>                                                         ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px; border-top-style: solid;               ' + CR +
       '          border-top-color: black; border-top-width: 1px" align="right"   ' + CR +
       '          width="14%" valign="middle" rowspan="2">                        ' + CR +
       FormatFloat( '#,##0.000000', cds.FieldByName('QUANT_COTA_TOTAL').AsFloat )   + CR +
       '      &nbsp;</TD>                                                         ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-top-style: solid; border-top-color: black;               ' + CR +
       '          border-top-width: 1px" align="right" width="14%" valign="middle"' + CR +
       '          rowspan="2">                                                    ' + CR +
       FormatFloat( '#,##0.00', cds.FieldByName('VALOR_EM_REAL_TOTAL').AsFloat )    + CR +
       '      &nbsp;</TD>                                                         ' + CR +
       '    </TR>                                                                 ' + CR +
       '    <TR>                                                                  ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px" align="left" width="30%"               ' + CR +
       '          valign="middle">                                                ' + CR +
       '        &nbsp;Contribuição Patrocinadora                                  ' + CR +
       '      </TD>                                                               ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px" align="right" width="14%"              ' + CR +
       '          valign="middle">                                                ' + CR +
       FormatFloat( '#,##0.000000', cds.FieldByName('QUANT_COTA_PATRO').AsFloat )   + CR +
       '      &nbsp;</TD>                                                         ' + CR +
       '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
       '          border-right-style: solid; border-right-color: black;           ' + CR +
       '          border-right-width: 1px" align="right" width="14%"              ' + CR +
       '          valign="middle">                                                ' + CR +
       FormatFloat( '#,##0.00', cds.FieldByName('VALOR_EM_REAL_PATRO').AsFloat )    + CR +
       '      &nbsp;</TD>                                                         ' + CR +
       '    </TR>                                                                 ' + CR ;

      dSaldoCotas := dSaldoCotas + cds.FieldByName('QUANT_COTA_TOTAL').AsFloat;

      cds.Next;

    end;


    Result := Result +
     '  </TABLE>                                                                ' + CR +    
     '  <BR>                                                                    ' + CR +
     '  <TABLE border="0" cellspacing="0" cellpadding="0" width="100%"          ' + CR +
     '   style="border-style: outset">                                          ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: inset; background: CCCCCC"                  ' + CR +
     '          align="left" width="14%" valign="middle">                       ' + CR +
     '        &nbsp;&nbsp;&nbsp;SALDO                                           ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="left" width="44%" valign="middle">                       ' + CR +
     '        &nbsp;Data da Cota                                                ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="right" width="14%" valign="middle">                      ' + CR +
     '        Valor da cota&nbsp;                                               ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="right" width="14%" valign="middle">                      ' + CR +
     '        Qtde. de cotas&nbsp;                                              ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          background: CCCCCC"                                             ' + CR +
     '          align="right" width="14%" valign="middle">                      ' + CR +
     '        Valor em R$&nbsp;                                                 ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '    <TR>                                                                  ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px; font-weight: bold;  ' + CR +
     '          border-right-style: solid; background: CCCCCC"                  ' + CR +
     '          align="left" valign="middle">                                   ' + CR +
     '        &nbsp;&nbsp;&nbsp;TOTAL                                           ' + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="left" valign="middle">                                   ' + CR +
     '        &nbsp;                                                            ' +
     FormataDataHora( 'dd/mm/yyyy', cds.FieldByName('DATA_LANCAMENTO').AsString ) + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     FormatFloat( '#,##0.000000', cds.FieldByName('VALOR_DA_COTA').AsFloat )      + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px;                     ' + CR +
     '          border-right-style: solid"                                      ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     '        &nbsp;                                                            ' +
     FormatFloat( '#,##0.000000', dSaldoCotas )                                   + CR +
     '      </TD>                                                               ' + CR +
     '      <TD style="font-family: Arial; font-size: 11px"                     ' + CR +
     '          align="right" valign="middle">                                  ' + CR +
     FormatFloat('#,##0.00',dSaldoCotas*cds.FieldByName('VALOR_DA_COTA').AsFloat) + CR +
     '&nbsp;                                                                    ' + CR +
     '      </TD>                                                               ' + CR +
     '    </TR>                                                                 ' + CR +
     '  </TABLE>                                                                ' + CR +
     '  <BR>                                                                    ' + CR +
     '  <p align="center" style="font-family: Arial; font-weight: bold;         ' + CR +
     '                           font-size: 12px">                              ' + CR +
     '    ATENÇÃO: Esta informação está sujeita a confirmação da FCRT.          ' + CR +
     '  <BR>                                                                    ' + CR +
     '    </TD>                                                                 ' + CR +
     '  </TR>                                                                   ' + CR +
     '</TABLE>                                                                  ' + CR ;

    cds.Close;

  finally
    cds.Free;
  end;

end; {ExtConsolidado}



end.
