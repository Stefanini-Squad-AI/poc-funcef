unit rOrcxRealConta;
{
----------------------------------------------------------------------------------------
Data      : 27.05.2013
Autor     : Felipe Azevedo dos Santos SOL: 190485 Kintana: 1929913
Pendência : SOL: 190485 Kintana: 1929913
Alteração : Inserção do filtro Imprimir Valores Sem
----------------------------------------------------------------------------------------
Data      : 02.05.2013
Autor     : Marcio Sanches Spinosa SOL: 190485/14344 Kintana: 1993208 
Pendência : SOL: 190485/14344 Kintana: 1993208
Alteração : Ajuste no relatório para evitar o erro de instancia de objeto
----------------------------------------------------------------------------------------
Data      : 30.01.2006
Autor     : Rodolpho da Silva
Pendência : 21638
Alteração : Colocar um total geral de todos os grupos, exibindo a variação também
-----------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------------------
Data      : 30.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 17889 - CBS
Alteração : Exibir variação em percentual no total do grupo.
-----------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlOrcamento, uFuncaoGeral, raCodMod, ppModule,
  daDataModule, TXRB, StdCtrls;

type
  TrptOrcxRealConta = class(TFrmCmReport)
    sqlOrcxRealConta: TCMSqlParams;
    cdsOrcxRealConta: TCMClientDataSet;
    dsOrcxRealConta: TwwDataSource;
    pplOrcxRealConta: TppBDEPipeline;
    pplOrcxRealContappField1: TppField;
    pplOrcxRealContappField2: TppField;
    pplOrcxRealContappField3: TppField;
    pplOrcxRealContappField4: TppField;
    pplOrcxRealContappField5: TppField;
    pplOrcxRealContappField6: TppField;
    pplOrcxRealContappField7: TppField;
    pplOrcxRealContappField8: TppField;
    pplOrcxRealContappField9: TppField;
    pplOrcxRealContappField10: TppField;
    pplOrcxRealContappField11: TppField;
    pplOrcxRealContappField12: TppField;
    pplOrcxRealContappField13: TppField;
    rpOrcxRealConta: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLabel228: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppLabel242: TppLabel;
    ppLabel221: TppLabel;
    ppLabel222: TppLabel;
    ppLabel224: TppLabel;
    ppLabel227: TppLabel;
    ppLabel244: TppLabel;
    ppLabel291: TppLabel;
    ppDetailBand26: TppDetailBand;
    ppDBText115: TppDBText;
    ppDBText114: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel215: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine65: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel216: TppLabel;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppLine67: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine72: TppLine;
    ppLabel243: TppLabel;
    lbTotalOrcPer: TppDBCalc;
    lbTotalRealPer: TppDBCalc;
    lbTotalOrcAcum: TppDBCalc;
    lbTotalRealAcum: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    sqlGrupoVerif: TCMSqlParams;
    cdsGrupoVerif: TCMClientDataSet;
    sqlGrupoOrc: TCMSqlParams;
    cdsGrupoOrc: TCMClientDataSet;
    sqlCResp: TCMSqlParams;
    cdsCResp: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlPPrev: TCMSqlParams;
    cdsPPrev: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    pplbTotVariaOrcado: TppLabel;
    pplbTotVariaRealizado: TppLabel;
    ppShape1: TppShape;
    ppSummaryBand1: TppSummaryBand;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    lbTotGeralOrc: TppDBCalc;
    ppLabel2: TppLabel;
    lbTotGeralReal: TppDBCalc;
    ppShape3: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBCalc3: TppDBCalc;
    lbTotGeralVarPer: TppLabel;
    ppShape4: TppShape;
    ppLabel5: TppLabel;
    lbTotGeralOrcAcum: TppDBCalc;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    lbTotGeralRealAcum: TppDBCalc;
    ppLabel8: TppLabel;
    ppDBCalc6: TppDBCalc;
    lbTotGeralVarAcum: TppLabel;
    ppShape5: TppShape;
    ppLabel9: TppLabel;
    ppDBCalc1: TppDBCalc;
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlOrcxRealContaFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure pplbTotVariaOrcadoPrint(Sender: TObject);
    procedure pplbTotVariaRealizadoPrint(Sender: TObject);
    procedure lbTotGeralVarPerPrint(Sender: TObject);
    procedure lbTotGeralVarAcumPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptOrcxRealConta: TrptOrcxRealConta;

implementation

uses uSistema, uData, uString, uMensErro, uVerificaPreenchimento;
{$R *.DFM}

procedure TrptOrcxRealConta.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria SQL Parametro Exercício
  with CmpRptCM.ParamValues[0].LookupSettings.SQL do begin
    Clear;
    Add('SELECT DISTINCT EXERCICIO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE IDPESSOA = ' + IntToStr(sistema.idEmpresa));
    Add('ORDER BY EXERCICIO');
  end;
  // Cria SQL Parametro Período
  with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;
  // Cria SQL Parametro Centro de Responsabilidade
  with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTRORESPON, NOME');
    Add('FROM CENTRESPON');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ')');
    Add('ORDER BY NOME');
  end;
  // Cria SQL Parametro Centro de Custo
  with CmpRptCM.ParamValues[24].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTROCUSTO, NOME');
    Add('FROM CENTCUST');
    Add('WHERE (IDEMPRESA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('      AND (ATIVO = ''S'')');
    Add('ORDER BY NOME');
  end;
  // Cria SQL Parametro Atividade/Projeto
  with CmpRptCM.ParamValues[25].LookupSettings.SQL do begin
    Clear;
    Add('SELECT UNIDNEGOC, NOME');
    Add('FROM UNIDNEGOCIO');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ')');
    Add('ORDER BY NOME');
  end;
end;

procedure TrptOrcxRealConta.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  if Index = 0 then begin
    // Cria SQL Parametro Período Inicial
    with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
      Clear;
      Add('SELECT PERIODO, NOMEPERIODO');
      Add('FROM PERIODOORCAMEN');
      Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
      Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
      Add('ORDER BY PERIODO');
    end;
  end;
end;

procedure TrptOrcxRealConta.CrmRptCMBeforePrint(Sender: TObject);
var rValorDiv : Double;
    sValorDiv : String;
    sGrupos : String;
    bTodos : Boolean;
    sAjusteOrc : string; // Felipe A. dos Santos SOL 190485 KTN 1929913
begin
  sGrupos := '';
  if (trim(CmpRptCM.ParamValues[3].AsString) <> '') or
     (trim(CmpRptCM.ParamValues[4].AsString) <> '') then begin
    cdsGrupoVerif.Close;
    sqlGrupoVerif.Prepare;
    sqlGrupoVerif.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[29].AsInteger;
    sqlGrupoVerif.Open;
    cdsGrupoOrc.Close;
    sqlGrupoOrc.Prepare;
    sqlGrupoOrc.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[29].AsInteger;

    if (trim(CmpRptCM.ParamValues[3].AsString) <> '') then begin
      sqlGrupoOrc.ParamByName('CODGRUPOORCINI').asString :=
                                    Espaco(CmpRptCM.ParamValues[3].AsString,10);
    end else begin
      cdsGrupoVerif.First;
      sqlGrupoOrc.ParamByName('CODGRUPOORCINI').asString :=
                   Espaco(cdsGrupoVerif.FieldByName('CODGRUPOORC').AsString,10);
    end;
    if (trim(CmpRptCM.ParamValues[4].AsString) <> '') then begin
      sqlGrupoOrc.ParamByName('CODGRUPOORCFIM').asString :=
                              Espaco(trim(CmpRptCM.ParamValues[4].AsString),10);
    end else begin
      cdsGrupoVerif.Last;
      sqlGrupoOrc.ParamByName('CODGRUPOORCFIM').asString :=
                   Espaco(cdsGrupoVerif.FieldByName('CODGRUPOORC').AsString,10);
    end;
    sqlGrupoOrc.Open;
    if cdsGrupoOrc.IsEmpty then
      sGrupos := '0';
    cdsGrupoOrc.First;
    while not cdsGrupoOrc.Eof do begin
      if sGrupos = '' then
        sGrupos := cdsGrupoOrc.FieldByName('IDGRUPOORCAMEN').AsString
      else
        sGrupos := sGrupos + ',' +
                   cdsGrupoOrc.FieldByName('IDGRUPOORCAMEN').AsString;
      cdsGrupoOrc.Next;
    end;
  end;
  if CmpRptCM.ParamValues[5].AsFloat = 0 then
    rValorDiv := 1
  else
    rValorDiv := CmpRptCM.ParamValues[5].AsFloat;
  sValorDiv := FuncaoGeral.OraNumero(rValorDiv);
  sqlCResp.Prepare;
  sqlCResp.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
  sqlCResp.ParamByName('CODCENTRORESPON').asString :=
                                         Trim(CmpRptCM.ParamValues[2].AsString);
  sqlCResp.Open;
  sqlCCusto.Prepare;
  sqlCCusto.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
  sqlCCusto.ParamByName('CODCENTROCUSTO').asString :=
                                        Trim(CmpRptCM.ParamValues[24].AsString);
  sqlCCusto.Open;
  sqlAtivProj.Prepare;
  sqlAtivProj.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
  sqlAtivProj.ParamByName('UNIDNEGOC').asInteger :=
                                             CmpRptCM.ParamValues[25].AsInteger;
  sqlAtivProj.Open;
  sqlPPrev.Prepare;
  sqlPPrev.ParamByName('IDPLANOPREV').AsInteger :=
                                             CmpRptCM.ParamValues[26].AsInteger;
  sqlPPrev.Open;
  sqlPatro.Prepare;
  sqlPatro.ParamByName('IDPESSOA').AsInteger :=
                                             CmpRptCM.ParamValues[27].AsInteger;
  sqlPatro.Open;
  sqlGrupoIni.Prepare;
  sqlGrupoIni.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[29].AsInteger;
  sqlGrupoIni.Open;
  cdsGrupoIni.First;
  if (Trim(CmpRptCM.ParamValues[3].AsString) <> '') and
     (CmpRptCM.ParamValues[3].AsString >
     cdsGrupoIni.FieldByName('CODGRUPOORC').AsString) then begin
    bTodos := False;
  end else begin
    cdsGrupoIni.Last;
    if (Trim(CmpRptCM.ParamValues[4].AsString) <> '') and
       (CmpRptCM.ParamValues[4].AsString <
       cdsGrupoIni.FieldByName('CODGRUPOORC').AsString) then begin
      bTodos := False;
    end else begin
      bTodos := True;
    end;
  end;
  cdsGrupoIni.Close;
  ppLabel291.Caption := '';
  if not cdsCCusto.IsEmpty then
    ppLabel291.Caption := 'Centro de Custo: ' +
                          trim(cdsCCusto.FieldByName('NOME').AsString);
  if ppLabel291.Caption <> '' then
    ppLabel291.Caption := ppLabel291.Caption + '   ';
  if not cdsCResp.IsEmpty then
    ppLabel291.Caption := ppLabel291.Caption + 'C.Responsabilidade: ' +
                          trim(cdsCResp.FieldByName('NOME').AsString);
  if ppLabel291.Caption <> '' then
    ppLabel291.Caption := ppLabel291.Caption + '   ';
  if not cdsAtivProj.IsEmpty then
    ppLabel291.Caption := ppLabel291.Caption + 'Atividade/Projeto: ' +
                          trim(cdsAtivProj.FieldByName('NOME').AsString);
  if ppLabel291.Caption <> '' then
    ppLabel291.Caption := ppLabel291.Caption + '   ';
  if not cdsPPrev.IsEmpty then
    ppLabel291.Caption := ppLabel291.Caption + 'Plano Previdenciário: ' +
                          trim(cdsPPrev.FieldByName('NOME').AsString);
  if ppLabel291.Caption <> '' then
    ppLabel291.Caption := ppLabel291.Caption + '   ';
  if not cdsPatro.IsEmpty then
    ppLabel291.Caption := ppLabel291.Caption + 'Patrocinadora: ' +
                          trim(cdsPatro.FieldByName('NOME').AsString);

  if CmpRptCM.ParamValues[5].AsFloat <> 0 then
    ppLabel244.caption := 'Valores por ' + sValorDiv
  else
    ppLabel244.caption := '';
  //Filtra os dados da tela para passar a ordenação correta para o relatório
  if (Trim(CmpRptCM.ParamValues[1].AsString) = '') then begin
    MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
  end else begin
//Marcio Sanches Spinosa SOL: 190485/14344 Kintana: 1993208 - Inicio
//    if ( OrcamentoBackMT.DiasNoPeriodo( CmpRptCM.ParamValues[0].AsInteger,
//                                        CmpRptCM.ParamValues[1].AsInteger ) = 0 ) Then
    if ( OrcamentoBackMT.DiasNoPeriodo( CmpRptCM.ParamValues[1].AsInteger,
                                        CmpRptCM.ParamValues[0].AsInteger ) = 0 ) Then
                                        Begin


         MsgDlg('O Período não existe para o Exercício selecionado.','Erro',
             mtError,[mbOk],0);
      with sqlOrcxRealConta do
      begin
        cdsOrcxRealConta.Close;
        Prepare;
        sql.clear;
        sql.add('Select 1 from dual where 1=0');
        open;
      end;
//Marcio Sanches Spinosa SOL: 190485/14344 Kintana: 1993208 - Fim
    end else begin
      ppLabel212.Caption := 'Orçado x Realizado em ' +
                            CmpRptCM.ParamValues[1].AsString + '/' +
                            CmpRptCM.ParamValues[0].AsString;
      with sqlOrcxRealConta do begin
        cdsOrcxRealConta.Close;
        Prepare;
        if CmpRptCM.ParamValues[6].AsInteger = 0 then begin
          ParamByName('SINAL').AsString := 'SUM(DECODE(C.FLGSINALCONTA,' +
            '''P'',NVL(U.VLRORCADOACUM,0),NVL(U.VLRORCADOACUM*-1,0)))/' +
            sValorDiv + ' AS VLRORCADOACUM, SUM(DECODE(C.FLGSINALCONTA,' +
            '''P'',NVL(U.VLRREALIZADOACUM,0),NVL(U.VLRREALIZADOACUM*-1,0)))/' +
            sValorDiv + ' AS VLRREALIZADOACUM, SUM(DECODE(C.FLGSINALCONTA,' +
            '''P'',NVL(U.VLRORCADO,0),NVL(U.VLRORCADO*-1,0)))/' + sValorDiv +
            ' AS VLRORCADO, SUM(DECODE(C.FLGSINALCONTA,''P'',' +
            'NVL(U.VLRREALIZADO,0),NVL(U.VLRREALIZADO*-1,0)))/' + sValorDiv +
            ' AS VLRREALIZADO, (SUM(DECODE(C.FLGSINALCONTA,''P'',' +
            'NVL(U.VLRORCADOACUM,0),NVL(U.VLRORCADOACUM*-1,0))) - ' +
            'SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRREALIZADOACUM,0),' +
            'NVL(U.VLRREALIZADOACUM*-1,0))))/' + sValorDiv + ' AS VARACUM, ' +
            '(SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRORCADO,0),' +
            'NVL(U.VLRORCADO*-1,0)))-SUM(DECODE(C.FLGSINALCONTA,''P'',' +
            'NVL(U.VLRREALIZADO,0),NVL(U.VLRREALIZADO*-1,0))))/' + sValorDiv +
            ' AS VARPER, '
        end else begin
          ParamByName('SINAL').AsString := 'SUM(NVL(U.VLRORCADOACUM,0))/' +
            sValorDiv + ' AS VLRORCADOACUM, SUM(NVL(U.VLRREALIZADOACUM,0))/' +
            sValorDiv + ' AS VLRREALIZADOACUM, SUM(NVL(U.VLRORCADO,0))/' +
            sValorDiv + ' AS VLRORCADO, SUM(NVL(U.VLRREALIZADO,0))/' +
            sValorDiv + ' AS VLRREALIZADO, (SUM(NVL(U.VLRORCADOACUM,0)) - ' +
            'SUM(NVL(U.VLRREALIZADOACUM,0)))/' + sValorDiv + ' AS VARACUM, ' +
            '(SUM(NVL(U.VLRORCADO,0)) - SUM(NVL(U.VLRREALIZADO,0)))/' +
            sValorDiv + ' AS VARPER, ';
        end;
        if Trim(CmpRptCM.ParamValues[11].AsString) <> '' then begin
          ParamByName('PARAMETRO1').AsString := '(SUBSTR(S.IDCONTAORCAMEN,' +
                       IntToStr(CmpRptCM.ParamValues[8].AsInteger) + ',' +
                       IntToStr(CmpRptCM.ParamValues[9].AsInteger) + ') IN (' +
                       QuotedStr( CmpRptCM.ParamValues[11].AsString ) + ')) AND ';
        end else begin
          ParamByName('PARAMETRO1').AsString := '(1 = 1) AND ';
        end;
        if Trim(CmpRptCM.ParamValues[15].AsString) <> '' then begin
          ParamByName('PARAMETRO2').AsString := '(SUBSTR(S.IDCONTAORCAMEN,' +
                      IntToStr(CmpRptCM.ParamValues[12].AsInteger) + ',' +
                      IntToStr(CmpRptCM.ParamValues[13].AsInteger) + ') IN (' +
                      QuotedStr( CmpRptCM.ParamValues[15].AsString ) + ')) AND ';
        end else begin
          ParamByName('PARAMETRO2').AsString := '(1 = 1) AND ';
        end;
        if Trim(CmpRptCM.ParamValues[19].AsString) <> '' then begin
          ParamByName('PARAMETRO3').AsString := '(SUBSTR(S.IDCONTAORCAMEN,' +
                      IntToStr(CmpRptCM.ParamValues[16].AsInteger) + ',' +
                      IntToStr(CmpRptCM.ParamValues[17].AsInteger) + ') IN (' +
                      QuotedStr( CmpRptCM.ParamValues[19].AsString ) + ')) AND ';
        end else begin
          ParamByName('PARAMETRO3').AsString := '(1 = 1) AND ';
        end;
        if Trim(CmpRptCM.ParamValues[23].AsString) <> '' then begin
          ParamByName('PARAMETRO4').AsString := '(SUBSTR(S.IDCONTAORCAMEN,' +
                      IntToStr(CmpRptCM.ParamValues[20].AsInteger) + ',' +
                      IntToStr(CmpRptCM.ParamValues[21].AsInteger) + ') IN (' +
                      QuotedStr( CmpRptCM.ParamValues[13].AsString ) + ')) AND ';
        end else begin
          ParamByName('PARAMETRO4').AsString := '(1 = 1) AND ';

        end;
        if (trim(CmpRptCM.ParamValues[3].AsString) <> '') or
           (trim(CmpRptCM.ParamValues[4].AsString) <> '') then begin
          ParamByName('GRUPO').AsString := '(G.IDGRUPOORCAMEN IN (' + sGrupos +
                                           ')) AND ';
        end else begin
          ParamByName('GRUPO').AsString := '(1 = 1) AND ';
        end;
        if CmpRptCM.ParamValues[7].AsInteger = 0 then begin
          ParamByName('USUARIO').AsString := 'EXISTS (SELECT ' +
                  'UXC.IDPESSOAACESSO FROM PESSOAXCRESP UXC WHERE ' +
                  '(UXC.IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario) +
                  ') AND (UXC.CODCENTRORESPON = C.CODCENTRORESPON) ' +
                  'AND (UXC.IDPESSOA = C.IDPESSOA)  ) AND ';
        end else begin
          ParamByName('USUARIO').AsString := 'EXISTS (SELECT UXC.IDUSUARIO ' +
                  'FROM USCCUSTO UXC WHERE (UXC.IDUSUARIO = ' +
                  IntToStr(Sistema.idUsuario) + ') AND (UXC.IDPESSOA = ' +
                  IntToStr(Sistema.idEmpresa)+ ') AND ' +
                  '(UXC.CODCENTROCUSTO = C.CODCENTROCUSTO) AND ' +
                  '(UXC.IDEMPRESA = C.IDEMPRESA) GROUP BY UXC.IDUSUARIO ) AND ';
        end;
        if not cdsCResp.IsEmpty then begin
          ParamByName('CRESP').AsString := '(C.CODCENTRORESPON LIKE ''' +
                  Trim(CmpRptCM.ParamValues[2].AsString) + '%'') AND ' +
                  '(C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ') AND ';
          bTodos := False;
        end else begin
          ParamByName('CRESP').AsString := '(1 = 1) AND ';
        end;
        if not cdsCCusto.IsEmpty then begin
          ParamByName('CCUSTO').AsString := '(C.CODCENTROCUSTO LIKE ''' +
                  Trim(CmpRptCM.ParamValues[24].AsString) + '%'') AND ' +
                  '(C.IDEMPRESA = ' + IntToStr(Sistema.idEmpresa) + ') AND ';
          bTodos := False;
        end else begin
          ParamByName('CCUSTO').AsString := '(1 = 1) AND ';
        end;
        if not cdsAtivProj.IsEmpty then begin
          ParamByName('ATIVPROJ').AsString := '(C.UNIDNEGOC = ' +
                  IntToStr(CmpRptCM.ParamValues[25].AsInteger) + ') AND  ' +
                  '(C.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ') AND ';
          bTodos := False;
        end else begin
          ParamByName('ATIVPROJ').AsString := '(1 = 1) AND ';
        end;
        if not cdsPPrev.IsEmpty then begin
          ParamByName('PPREV').AsString := '(C.IDPLANOPREV = ' +
                  IntToStr(CmpRptCM.ParamValues[26].AsInteger) + ') AND ';
          bTodos := False;
        end else begin
          ParamByName('PPREV').AsString := '(1 = 1) AND ';
        end;
        if not cdsPatro.IsEmpty then begin
          ParamByName('PATRO').AsString := '(C.IDPATRO = ' +
                  IntToStr(CmpRptCM.ParamValues[27].AsInteger) + ') AND ';
          bTodos := False;
        end else begin
          ParamByName('PATRO').AsString := '(1 = 1) AND ';
        end;
        ParamByName('EXERCICIO').AsInteger := CmpRptCM.ParamValues[1].AsInteger;
        ParamByName('PERIODOINI').AsInteger :=
                                              CmpRptCM.ParamValues[0].AsInteger;

        ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[29].AsInteger;
        ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;

        // Felipe A. Santos SOL 190485 KTN 1929913 - Início
        if CmpRptCM.ParamValues[30].AsString = '' then
           ParamByName('VALORORCADO').AsString := 'ROUND(SUM(S.VLRORCADO + ' +
                                                  '          DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO*-1, 0) + ' +
                                                  '          DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0) ' +
                                                  '          ),2) '
        else if CmpRptCM.ParamValues[30].AsString = 'R' then
           ParamByName('VALORORCADO').AsString := 'ROUND(SUM(S.VLRORCADO + ' +
                                                  '          DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0) ' +
                                                  '),2) '
        else if CmpRptCM.ParamValues[30].AsString = 'S' then
           ParamByName('VALORORCADO').AsString := 'ROUND(SUM(S.VLRORCADO + ' +
                                                  '          DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0) ' +
                                                  '),2) '
        else
           ParamByName('VALORORCADO').AsString := 'ROUND(SUM(NVL(S.VLRORCADO,0)),2) ';

        sAjusteOrc := CmpRptCM.ParamValues[30].AsString;

        if (sAjusteOrc = '') then
           sAjusteOrc := QuotedStr('R') + ',' + QuotedStr('S')
        else if (sAjusteOrc = 'T') then
           sAjusteOrc := QuotedStr('-1');

        ParamByName('FLGTIPOALTER').AsString := sAjusteOrc;
        
        // Felipe A. Santos SOL 190485 KTN 1929913 - Fim

        Open;
      end;

       If ( CmpRptCM.ParamByName( 'PARENTESES' ).AsString = 'P' ) Then Begin

         ppdbText109.DisplayFormat := '#,0.00;(#,0.00)';
         ppdbText110.DisplayFormat := '#,0.00;(#,0.00)';
         ppdbText111.DisplayFormat := '#,0.00;(#,0.00)';
         ppdbText117.DisplayFormat := '#,0.00;(#,0.00)';
         ppdbText118.DisplayFormat := '#,0.00;(#,0.00)';
         ppdbText119.DisplayFormat := '#,0.00;(#,0.00)';
         ppdbText120.DisplayFormat := '#,0.00%;(#,0.00)%';

       End Else Begin

         ppdbText109.DisplayFormat := '#,0.00;-#,0.00';
         ppdbText110.DisplayFormat := '#,0.00;-#,0.00';
         ppdbText111.DisplayFormat := '#,0.00;-#,0.00';
         ppdbText117.DisplayFormat := '#,0.00;-#,0.00';
         ppdbText118.DisplayFormat := '#,0.00;-#,0.00';
         ppdbText119.DisplayFormat := '#,0.00;-#,0.00';
         ppdbText120.DisplayFormat := '#,0.00%;-#,0.00%';
       End;
    end;
  end;
  cdsCResp.Close;
  cdsCCusto.Close;
  cdsAtivProj.Close;
  cdsPPrev.Close;
  cdsPatro.Close;

end;

procedure TrptOrcxRealConta.sqlOrcxRealContaFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'SINAL') or (sParamName = 'PARAMETRO1') or
     (sParamName = 'PARAMETRO2') or (sParamName = 'PARAMETRO3') or
     (sParamName = 'PARAMETRO4') or (sParamName = 'GRUPO') or
     (sParamName = 'USUARIO') or (sParamName = 'CRESP') or
     (sParamName = 'CCUSTO') or (sParamName = 'ATIVPROJ') or
     (sParamName = 'PPREV') or (sParamName = 'PATRO')  or
     (sParamName = 'VALORORCADO') // Felipe A. Santos SOL 190485 KTN 1929913
  then
    sNewValue := sOldValue;
end;




procedure TrptOrcxRealConta.pplbTotVariaOrcadoPrint(Sender: TObject);
var
   rTotalReal,rTotalOrc: extended;
begin
  inherited;
  rTotalReal := lbTotalRealPer.Value;
  rTotalOrc  := lbTotalOrcPer.Value;

  if rTotalReal = 0 then
     rTotalReal := 1;
  if rTotalOrc = 0 then
     rTotalOrc := 1;

  if ((rTotalReal <> 1) and (rTotalOrc <> 1)) then
     pplbTotVariaOrcado.Caption := FormatFloat('#,##0.00%;(#,##0.00%)', ((1 - (rTotalReal / rTotalOrc)) * 100))
  else
     pplbTotVariaOrcado.Caption := '0,00%'
end;




procedure TrptOrcxRealConta.pplbTotVariaRealizadoPrint(Sender: TObject);
var
   rTotalReal,rTotalOrc: extended;
begin
  inherited;
  rTotalReal := lbTotalRealAcum.Value;
  rTotalOrc  := lbTotalOrcAcum.Value;

  if rTotalReal = 0 then
     rTotalReal := 1;
  if rTotalOrc = 0 then
     rTotalOrc := 1;

  if ((rTotalReal <> 1) and (rTotalOrc <> 1)) then
     pplbTotVariaRealizado.Caption := FormatFloat('#,##0.00%;(#,##0.00%)', ((1 - (rTotalReal / rTotalOrc)) * 100))
  else
     pplbTotVariaRealizado.Caption := '0,00%';

end;




procedure TrptOrcxRealConta.lbTotGeralVarPerPrint(Sender: TObject);
var
   rTotalReal,rTotalOrc, rValor: extended;
begin
  inherited;
  rTotalReal := lbTotGeralReal.Value;
  rTotalOrc  := lbTotGeralOrc.Value;

  if rTotalReal = 0 then
     rTotalReal := 1;
  if rTotalOrc = 0 then
     rTotalOrc := 1;

  if ((rTotalReal <> 1) and (rTotalOrc <> 1)) then
  begin
     rValor := (rTotalReal * 100 / rTotalOrc);
     if (rTotalOrc - rTotalReal) < 0 then
        rValor := (rValor - 100) * -1;

     lbTotGeralVarPer.Caption := FormatFloat('#,##0.00%;(#,##0.00%)', rValor);
  end
  else
     lbTotGeralVarPer.Caption := '0,00%';

end;




procedure TrptOrcxRealConta.lbTotGeralVarAcumPrint(Sender: TObject);
var
   rTotalReal,rTotalOrc, rValor: extended;
begin
  inherited;
  rTotalReal := lbTotGeralRealAcum.Value;
  rTotalOrc  := lbTotGeralOrcAcum.Value;

  if rTotalReal = 0 then
     rTotalReal := 1;
  if rTotalOrc = 0 then
     rTotalOrc := 1;

  if ((rTotalReal <> 1) and (rTotalOrc <> 1)) then
  begin
     rValor := (rTotalReal * 100 / rTotalOrc);
     if (rTotalOrc - rTotalReal) < 0 then
        rValor := (rValor - 100) * -1;

     lbTotGeralVarAcum.Caption := FormatFloat('#,##0.00%;(#,##0.00%)',rValor);
  end
  else
     lbTotGeralVarAcum.Caption := '0,00%';
end;


end.
