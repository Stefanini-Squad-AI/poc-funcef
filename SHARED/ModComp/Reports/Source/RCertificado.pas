{****************************************************************************************
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: CrmRptCMBeforePrint
//**************************************************************************************}
//Nº SOL...........: 220597
//Nº KINTANA.......: 2053165
//Data da Alteração: 22/11/2013
//Responsável......: Thiago Melo
//Descrição........: A funcionalidade certificado apresenta erros em sua formatação.
//***************************************************************************************
//Nº SOL...........: 116913
//Nº KINTANA.......: 559041
//Data da Alteração: 26/07/2012
//Responsável......: Marcio Sanches Spinosa
//Descrição........: Alteração na emissão do certificado, mudança de layout e campos
//***************************************************************************************
unit RCertificado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, uCmRptManager, TXComp, CmParamReport, ppCtrls,
  ppPrnabl, ppBands, ppCache, ppVar, ppStrtch, ppMemo, ppSubRpt, IvDictio, IvMulti,
  TXRB, ppModule, raCodMod, ppParameter, Wwquery, StdCtrls;

type
  TRptCertificado = class(TFrmCmReport)
    rpCertificado: TppReport;
    ppCertificado: TppBDEPipeline;
    dsCertificado: TwwDataSource;
    CdsCertificado: TCMClientDataSet;
    sqlCertificado: TCMSqlParams;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    rpCertificadoLblEmpresa: TppLabel;
    rpTabCursosCalc2: TppSystemVariable;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel3: TppLabel;
    ppLabel15: TppLabel;
    ppImage1: TppImage;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    rpCertificadoSmryBnd: TppSummaryBand;
    rpCertificadoAtualizado: TppReport;
    ppParameterList1: TppParameterList;
    ppCertificadoAtualizado: TppBDEPipeline;
    dsCertificadoAtualizado: TwwDataSource;
    cdsCertificadoAtualizado: TCMClientDataSet;
    sqlCertificadoAtualizado: TCMSqlParams;
    edt1: TEdit;
    lbl1: TLabel;
    edt2: TEdit;
    ppDetailBand3: TppDetailBand;
    ppShape3: TppShape;
    ppDBText16: TppDBText;
    ppLabel28: TppLabel;
    LineAssinatura1: TppLine;
    lblAssinatura1: TppLabel;
    ppLabel30: TppLabel;
    ppImage3: TppImage;
    ppLabel31: TppLabel;
    ppDBText17: TppDBText;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDBText18: TppDBText;
    ppLabel34: TppLabel;
    ppDBText19: TppDBText;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    lblDia: TppLabel;
    ppLabel38: TppLabel;
    lblMes: TppLabel;
    ppLabel40: TppLabel;
    lblAno: TppLabel;
    ppDBText20: TppDBText;
    ppLabel42: TppLabel;
    ppDBText21: TppDBText;
    lblCargo1: TppLabel;
    lblImgAssinatura1: TppImage;
    lblImgAssinatura2: TppImage;
    LineAssinatura2: TppLine;
    lblAssinatura2: TppLabel;
    lblCargo2: TppLabel;
    lblImgAssinatura3: TppImage;
    LineAssinatura3: TppLine;
    lblAssinatura3: TppLabel;
    lblCargo3: TppLabel;
    lblImgAssinatura4: TppImage;
    LineAssinatura4: TppLine;
    lblAssinatura4: TppLabel;
    lblCargo4: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    lblLocal: TppLabel;
    ppLabel54: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    mmVerso2: TppMemo;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    mmVerso: TppMemo;
    ppGroupFooterBand3: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpCertificadoSmryBndAfterPrint(Sender: TObject);
    procedure CdsCertificadoAfterScroll(DataSet: TDataSet);
    function  TamanhoStringRelatorio(Texto : string; edtText : TppDBText) : Integer;
    function  TamanhoStringRelatorioLabel(Texto : string; edtLabel : TppLabel) : Integer;
    function  TamanhoTopRelatorio(pNovoTamanho : integer; pTopLinha : integer) : Integer;
    function  TamanhoTopRelatorioAssinatura(pNovoTamanho : integer; pTopLinha : integer): Integer;
    procedure ConfigurarLabel();
    procedure ConfigurarLabelAssinatura();
    procedure ppDBText16Print(Sender: TObject);
    procedure ppDBText20Print(Sender: TObject);
    procedure lblAssinatura1Print(Sender: TObject);
    procedure lblAssinatura2Print(Sender: TObject);
    procedure lblAssinatura3Print(Sender: TObject);
    procedure lblAssinatura4Print(Sender: TObject);
    procedure lblCargo1Print(Sender: TObject);
    procedure lblCargo2Print(Sender: TObject);
    procedure lblCargo3Print(Sender: TObject);
    procedure lblCargo4Print(Sender: TObject);
    procedure ppDBText17Print(Sender: TObject);
    procedure lblLocalPrint(Sender: TObject);
    procedure ppDBText18Print(Sender: TObject);
    procedure ppDBText21Print(Sender: TObject);
    procedure ppDBText19Print(Sender: TObject);
    procedure lblDiaPrint(Sender: TObject);
    procedure lblMesPrint(Sender: TObject);
    procedure lblAnoPrint(Sender: TObject);
  private


  public
    sPessoasInscritas, sCurso, sEntid, sInstrutor, sIdCurso, sIdEntid,
    sIdInstrutor, sIniPlan, sFimPlan, sIniReal, sFimReal, sDataIni, sDataFim, SdataCalendario: string;
    sLocal          : string;
    sIdTurma        : string;    // Edilaine - SOL 137268-7062 / KTN 1497173
    pQtdeAssinatura : Integer;

  end;

var
  RptCertificado: TRptCertificado;

implementation

uses uSistema, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCertificado.CrmRptCMBeforePrint(Sender: TObject);
var pintMes : string;
    pStrMes : string;
    sData   : TDateTime;
    Qry     : TwwQuery;
begin
  inherited;
//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041 - INICIO
//  frmAguarde.Min := 0;
//  frmAguarde.Pos := 0;
//  frmAguarde.Mostra('Certificado de Conclusão');

//  rpCertificadoLblEmpresa.Caption := Sistema.NomeEmpresa;
//  rpCertificadoLblEmpresa.Caption := Sistema.NomeEmpresa;

//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041 - FIM


    sData := StrToDateTime(SdataCalendario);//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041 - INICIO
    pintMes := FormatDateTime('mm', sData);
    case StrToInt(pintMes) of
      1 : pStrMes := 'Janeiro';
      2 : pStrMes := 'Fevereiro';
      3 : pStrMes := 'Março';
      4 : pStrMes := 'Abril';
      5 : pStrMes := 'Maio';
      6 : pStrMes := 'Junho';
      7 : pStrMes := 'Julho';
      8 : pStrMes := 'Agosto';
      9 : pStrMes := 'Setembro';
      10: pStrMes := 'Outubro';
      11: pStrMes := 'Novembro';
      12: pStrMes := 'Dezembro';
    end;

    lblDia.Caption := FormatDateTime('dd', sData);
    lblMes.Caption := pStrMes;
    lblAno.Caption := FormatDateTime('yyyy', sData);
    lblLocal.Caption := sLocal;

//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041 - FIM
//  with (sqlCertificado.SQL) do //  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
  with (sqlCertificadoAtualizado.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Selecionar Empregados
    Add('  P.IDPESSOA AS IDPESSOA,');
    Add('  P.NOME AS FUNCIONARIO,');
    Add('  P.NUMDOCUMENTO AS CPF,'); //  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    // Edilaine - SOL 137268-7062 / KTN 1497173
    //Add('  CR.DESCRICAO AS CURSO,'); //  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    Add('  T.DESCRICAO AS CURSO,');
    // Edilaine - SOL 137268-7062 / KTN 1497173 - fim
    Add('  CR.IDCURSO, ');  //  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    //Add('(H.DUR_PRAT + H.DUR_TEOR) AS DURACAO,');     // Edilaine - SOL 137268-7062 / KTN 1497173 - comentado
    Add('  T.CARGAHORA AS DURACAO,');                   // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('  ''0'' || RTRIM(UPPER(P.NOME)) AS IDENT,');
    Add('  F.MATRICULA,');
    Add('  ' +QuotedStr(sCurso)+ ' AS DESCRICAO,');
    Add('  ' +QuotedStr(sEntid)+ ' AS ENTIDADE,');
    Add('  ' +QuotedStr(sInstrutor)+ ' AS INSTRUTOR,');
    Add('  ' +QuotedStr(sDataIni)+ ' AS DATAINI,');
    Add('  ' +QuotedStr(sDataFim)+ ' AS DATAFIM,');
    Add('  RTRIM(PJ.NOME) || '' - '' || RTRIM(CC.NOME) AS ENDSETOR,');
    Add('  C.TITULO AS CARGO,');
    Add('  H.LOCALCURSO AS LOCAL,');
    Add('  H.DATAHORA,');
    Add('  H.INSTRUTORES,');
    Add('  H.IDTURMA');    // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('FROM');
    Add('  PESSOA P, PESSOA PJ, HSTTRN H, TURMA T,');           // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('  FUNCIONARIO F, CENTCUST CC, CARGO C, CURSO CR ');
    Add('WHERE');
    Add('  (H.IDCURSO         = ' +sIdCurso+ ') AND');

    if (sIdTurma <> '') then                            // Edilaine - SOL 137268-7062 / KTN 1497173
      Add('  (H.IDTURMA       = ' +sIdTurma+ ') AND');  // Edilaine - SOL 137268-7062 / KTN 1497173

    if (sEntid <> '') then
      Add('  (H.IDENTIDINSTR    = ' +sIdEntid+ ') AND');

    if (sInstrutor <> '') then
      Add('  (H.IDINSTRUTOR     = ' +sIdInstrutor+ ') AND');

     {// Edilaine - SOL 137268-7062 / KTN 1497173
    if (sIniPlan <> '') then
      Add('  (H.DATPLINI        = TO_DATE(' +QuotedStr(sIniPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLINI       IS NULL) AND');

    if (sFimPlan <> '') then
      Add('  (H.DATPLFIM        = TO_DATE(' +QuotedStr(sFimPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLFIM       IS NULL) AND');
    } // Edilaine - SOL 137268-7062 / KTN 1497173 - fim

    if (sIniReal <> '') then
      Add('  (H.DATREINI        = TO_DATE(' +QuotedStr(sIniReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREINI       IS NULL) AND');

    if (sFimReal <> '') then
      Add('  (H.DATREFIM        = TO_DATE(' +QuotedStr(sFimReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREFIM       IS NULL) AND');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('  (F.IDESTAB        IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

    if (CmpRptCM.ParamByName('Todos').asInteger = 1) then
    begin
      if (sPessoasInscritas <> '') then
        Add('  (H.IDPESSOA       IN (' +sPessoasInscritas+ ')) AND')
      else
        Add('  (H.IDPESSOA        = -1) AND');
    end
    else
        Add('  (H.IDPESSOA       IN (' +sPessoasInscritas+ ')) AND') ;



    Add('  (H.IDPESSOA        = P.IDPESSOA) AND');
    Add('  (H.IDPESSOA        = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND ');
    Add('  (T.IDTURMA         = H.IDTURMA) AND ');    // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('  (CR.IDCURSO        = H.IDCURSO)');
    // Selecionar Candidatos
    Add('UNION');
    Add('(');
    Add('SELECT');
    Add('  P.IDPESSOA AS IDPESSOA,');
    Add('  P.NOME AS FUNCIONARIO,');
    Add('  P.NUMDOCUMENTO AS CPF,');//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    // Edilaine - SOL 137268-7062 / KTN 1497173
    //Add('  CR.DESCRICAO AS CURSO,');   //  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    Add('  T.DESCRICAO AS CURSO,');
    // Edilaine - SOL 137268-7062 / KTN 1497173 - fim
    Add('  CR.IDCURSO, ');  //  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    //Add('(H.DUR_PRAT + H.DUR_TEOR) AS DURACAO,');         // Edilaine - SOL 137268-7062 / KTN 1497173 - comentado
    Add('  T.CARGAHORA AS DURACAO,');                        // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('  ''1'' || RTRIM(UPPER(P.NOME)) AS IDENT,');
    Add('  TO_CHAR(F.IDPESSOA) AS MATRICULA,');
    Add('  ' +QuotedStr(sCurso)+ ' AS DESCRICAO,');
    Add('  ' +QuotedStr(sEntid)+ ' AS ENTIDADE,');
    Add('  ' +QuotedStr(sInstrutor)+ ' AS INSTRUTOR,');
    Add('  ' +QuotedStr(sDataIni)+ ' AS DATAINI,');
    Add('  ' +QuotedStr(sDataFim)+ ' AS DATAFIM,');
    Add('  RTRIM(EP.LOGRADOURO) || '' '' || TO_CHAR(EP.NUMERO) || '' '' ||');
    Add('  RTRIM(EP.COMPLEMENTO) || '' '' || RTRIM(EP.BAIRRO) || '' '' || RTRIM(EP.CEP) ||');
    Add('  '' '' || RTRIM(CI.NOME) || '' '' || RTRIM(EP.CODESTADO) || ' +
      QuotedStr(Translate(' - Tel: '))+ ' ||');
    Add('  RTRIM(TELEFONE.DDI) || TELEFONE.DDD || '' '' || TELEFONE.NUMERO AS ENDSETOR,');
    Add('  C.TITULO AS CARGO,');
    Add('  H.LOCALCURSO AS LOCAL,');
    Add('  H.DATAHORA,');
    Add('  H.INSTRUTORES,');
    Add('  H.IDTURMA');    // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('FROM');
    Add('  PESSOA P, HSTTRN H, CANDIDAT F, ENDPESS EP, CIDADES CI, CARGO C, CURSO CR, TURMA T,');  // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('  (SELECT');
    Add('     TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT');
    Add('        MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM');
    Add('        TELENDPESS');
    Add('      GROUP BY');
    Add('        IDENDERECO) ENDER');
    Add('   WHERE');
    Add('     (ENDER.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    Add('WHERE');
    Add('  (H.IDCURSO          = ' +sIdCurso+ ') AND');

    if (sIdTurma <> '') then                            // Edilaine - SOL 137268-7062 / KTN 1497173
      Add('  (T.IDTURMA       = ' +sIdTurma+ ') AND');  // Edilaine - SOL 137268-7062 / KTN 1497173

    if (sEntid <> '') then
      Add('  (H.IDENTIDINSTR     = ' +sIdEntid+ ') AND');

    if (sInstrutor <> '') then
      Add('  (H.IDINSTRUTOR      = ' +sIdInstrutor+ ') AND');

    {// Edilaine - SOL 137268-7062 / KTN 1497173
    if (sIniPlan <> '') then
      Add('  (H.DATPLINI         = TO_DATE(' +QuotedStr(sIniPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLINI        IS NULL) AND');

    if (sFimPlan <> '') then
      Add('  (H.DATPLFIM         = TO_DATE(' +QuotedStr(sFimPlan)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATPLFIM        IS NULL) AND');
    } // Edilaine - SOL 137268-7062 / KTN 1497173 - fim

    if (sIniReal <> '') then
      Add('  (H.DATREINI         = TO_DATE(' +QuotedStr(sIniReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREINI        IS NULL) AND');

    if (sFimReal <> '') then
      Add('  (H.DATREFIM         = TO_DATE(' +QuotedStr(sFimReal)+ ',''DD/MM/YYYY'')) AND')
    else
      Add('  (H.DATREFIM        IS NULL) AND');

    if (CmpRptCM.ParamByName('Todos').asInteger = 1) then
    begin
      if (sPessoasInscritas <> '') then
        Add('  (H.IDPESSOA        IN (' +sPessoasInscritas+ ')) AND')
      else
        Add('  (H.IDPESSOA         = -1) AND');
    end
    else
       Add('  (H.IDPESSOA        IN (' +sPessoasInscritas+ ')) AND');

    Add('  (H.IDPESSOA         = P.IDPESSOA) AND');
    Add('  (H.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (P.IDPESSOA         = EP.IDPESSOA(+)) AND');
    Add('  (P.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND');
    Add('  (EP.IDCIDADES       = CI.IDCIDADES(+)) AND');
    Add('  (P.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+)) AND');
    Add('  (T.IDTURMA          = H.IDTURMA(+)) AND ');    // Edilaine - SOL 137268-7062 / KTN 1497173
    Add('  (F.IDCARGO          = C.IDCARGO) AND ');//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    Add('  (CR.IDCURSO         = H.IDCURSO) ');//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
    Add(')');
    Add('ORDER BY 2');
    SaveToFile(ExtractFilePath(Application.ExeName) + 'qry.txt');
  end;
//  sqlCertificado.Open;
//  frmAguarde.Max := CdsCertificado.RecordCount;

//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041 - INICIO
  sqlCertificadoAtualizado.Open;



    Qry := TwwQuery.Create(nil);
    Qry.DatabaseName := 'BaseDados';
    qry.Close;
    Qry.SQL.Clear;
    // Edilaine - SOL 137268-7062 / KTN 1497173
    //Qry.sql.Add('SELECT OBSERVACAO FROM CURSO WHERE IDCURSO = :PIDCURSO');
    //Qry.Params.ParamByName('PIDCURSO').DataType := ftInteger;
    //Qry.Params.ParamByName('PIDCURSO').Value := cdsCertificadoAtualizado.FieldByName('IDCURSO').AsInteger;

    Qry.sql.Add('SELECT CONTEUDO FROM TURMA WHERE IDTURMA = :PIDTURMA');
    Qry.Params.ParamByName('PIDTURMA').DataType := ftInteger;
    Qry.Params.ParamByName('PIDTURMA').Value := cdsCertificadoAtualizado.FieldByName('IDTURMA').AsInteger;
    Qry.Open;

    mmVerso.Lines.Add(Qry.Fields[0].AsString);
    mmVerso2.Lines.Add(Qry.Fields[0].AsString);
    // Edilaine - SOL 137268-7062 / KTN 1497173 - fim

//    ppDbtext16.Font.Size := TamanhoStringRelatorio(cdsCertificadoAtualizado.FieldByName('FUNCIONARIO').Asstring, ppDbtext16);

//  frmAguarde.Max := cdsCertificadoAtualizado.RecordCount;

  FreeAndNil(Qry);
//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041 - FIM

end;

procedure TRptCertificado.CdsCertificadoAfterScroll(DataSet: TDataSet);
begin
//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
//  frmAguarde.Pos := frmAguarde.Pos + 1;
//  frmAguarde.Update;
//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
end;

procedure TRptCertificado.rpCertificadoSmryBndAfterPrint(Sender: TObject);
begin
//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
//  frmAguarde.Apaga;
//  frmAguarde.Close;
//  MARCIO SANCHES SPINOSA SOL: 116913 KINTANA: 559041
end;

function TRptCertificado.TamanhoStringRelatorio(Texto : string; edtText : TppDBText) : Integer;
var iLabel, iEdit : Integer;
begin
  lbl1.Caption := Texto;
  iLabel := 0;
  iEdit  := 0;
  iEdit := edtText.spWidth;
  iLabel := lbl1.ClientWidth;

  while iLabel > iEdit do
  begin
    lbl1.Font.Size := lbl1.Font.Size - 1;
    iLabel := lbl1.Width;
  end;

  Result := lbl1.Font.Size;
end;

procedure TRptCertificado.ppDBText16Print(Sender: TObject);
begin
 ConfigurarLabel;
 //Thiago Melo SOL 220597 Kintana 2053165
 //ppDBText16.Font.Size := TamanhoStringRelatorio(ppDBText16.Text, ppDBText16);
 //ppDBText16.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine14.spTop);
 //Thiago Melo SOL 220597 Kintana 2053165
end;
procedure TRptCertificado.ppDBText20Print(Sender: TObject);
begin
 ConfigurarLabel;
 //Thiago Melo SOL 220597 Kintana 2053165
 //ppDBText20.Font.Size := TamanhoStringRelatorio(ppDBText20.Text, ppDBText20);
 //ppDBText20.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine16.spTop);
 //Thiago Melo SOL 220597 Kintana 2053165
end;

function TRptCertificado.TamanhoTopRelatorio(pNovoTamanho : integer; pTopLinha : integer): Integer;
var iLabel, iEdit : Integer;
begin
 Result := pTopLinha - pNovoTamanho;
end;

function TRptCertificado.TamanhoTopRelatorioAssinatura(pNovoTamanho : integer; pTopLinha : integer): Integer;
var iLabel, iEdit : Integer;
begin
 Result := pTopLinha + pNovoTamanho;
end;

procedure TRptCertificado.ConfigurarLabel;
begin
   lbl1.Font.Size := 18;
   lbl1.Height    := 30;
end;

procedure TRptCertificado.lblAssinatura1Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblAssinatura1.Font.Size := TamanhoStringRelatorioLabel(lblAssinatura1.Text, lblAssinatura1);
 lblAssinatura1.Top       := TamanhoTopRelatorio(lbl1.Height, lblCargo1.spTop);
end;

function TRptCertificado.TamanhoStringRelatorioLabel(Texto: string;
  edtLabel: TppLabel): Integer;
var iLabel, iEdit : Integer;
begin
  lbl1.Caption := Texto;
  iLabel := 0;
  iEdit  := 0;
  iEdit := edtLabel.spWidth;
  iLabel := lbl1.ClientWidth;

  while iLabel > iEdit do
  begin
    lbl1.Font.Size := lbl1.Font.Size - 1;
    iLabel := lbl1.Width;
  end;

  Result := lbl1.Font.Size;
end;

procedure TRptCertificado.lblAssinatura2Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblAssinatura2.Font.Size := TamanhoStringRelatorioLabel(lblAssinatura2.Text, lblAssinatura2);
 lblAssinatura2.Top       := TamanhoTopRelatorio(lbl1.Height, lblCargo2.spTop);
end;

procedure TRptCertificado.lblAssinatura3Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblAssinatura3.Font.Size := TamanhoStringRelatorioLabel(lblAssinatura3.Text, lblAssinatura3);
 lblAssinatura3.Top       := TamanhoTopRelatorio(lbl1.Height, lblCargo3.spTop);
end;

procedure TRptCertificado.lblAssinatura4Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblAssinatura4.Font.Size := TamanhoStringRelatorioLabel(lblAssinatura4.Text, lblAssinatura4);
 lblAssinatura4.Top       := TamanhoTopRelatorio(lbl1.Height, lblCargo4.spTop);
end;

procedure TRptCertificado.lblCargo1Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblCargo1.Font.Size := TamanhoStringRelatorioLabel(lblCargo1.Text, lblCargo1);

end;

procedure TRptCertificado.lblCargo2Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblCargo2.Font.Size := TamanhoStringRelatorioLabel(lblCargo2.Text,lblCargo2);

end;

procedure TRptCertificado.lblCargo3Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblCargo3.Font.Size := TamanhoStringRelatorioLabel(lblCargo3.Text, lblCargo3);

end;

procedure TRptCertificado.lblCargo4Print(Sender: TObject);
begin
 ConfigurarLabelAssinatura;
 lblCargo4.Font.Size := TamanhoStringRelatorioLabel(lblCargo4.Text, lblCargo4);

end;

procedure TRptCertificado.ConfigurarLabelAssinatura;
begin
   lbl1.Font.Size := 13;
   lbl1.Height    := 21;
end;


procedure TRptCertificado.ppDBText17Print(Sender: TObject);
begin
// ConfigurarLabel;
// ppDBText17.Font.Size := TamanhoStringRelatorio(ppDBText17.Text, ppDBText17);
// ppDBText17.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine15.spTop);
end;

procedure TRptCertificado.lblLocalPrint(Sender: TObject);
begin
 ConfigurarLabel;
 //Thiago Melo SOL 220597 Kintana 2053165
 //lblLocal.Font.Size := TamanhoStringRelatorioLabel(lblLocal.Caption, lblLocal);
 //lblLocal.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine20.spTop);
 //Thiago Melo SOL 220597 Kintana 2053165
end;

procedure TRptCertificado.ppDBText18Print(Sender: TObject);
begin
 ConfigurarLabel;
 //Thiago Melo SOL 220597 Kintana 2053165
 //ppDBText18.Font.Size := TamanhoStringRelatorio(ppDBText18.Text, ppDBText18);
 //ppDBText18.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine17.spTop);
 //Thiago Melo SOL 220597 Kintana 2053165
end;

procedure TRptCertificado.ppDBText21Print(Sender: TObject);
begin
 ConfigurarLabel;
 //Thiago Melo SOL 220597 Kintana 2053165
 //ppDBText21.Font.Size := TamanhoStringRelatorio(ppDBText21.Text, ppDBText21);
 //ppDBText21.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine18.spTop);
 //Thiago Melo SOL 220597 Kintana 2053165
end;

procedure TRptCertificado.ppDBText19Print(Sender: TObject);
begin
 ConfigurarLabel;
 //Thiago Melo SOL 220597 Kintana 2053165
 //ppDBText19.Font.Size := TamanhoStringRelatorio(ppDBText19.Text, ppDBText19);
 //ppDBText19.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine19.spTop);;
 //Thiago Melo SOL 220597 Kintana 2053165
end;

procedure TRptCertificado.lblDiaPrint(Sender: TObject);
begin
 ConfigurarLabel;
 //lblDia.Font.Size := TamanhoStringRelatorioLabel(lblDia.Caption, lblDia);  //Thiago Melo SOL 220597 Kintana 2053165
// lblDia.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine20.spTop);
end;

procedure TRptCertificado.lblMesPrint(Sender: TObject);
begin
 ConfigurarLabel;
 //lblMes.Font.Size := TamanhoStringRelatorioLabel(lblMes.Caption, lblMes);  //Thiago Melo SOL 220597 Kintana 2053165
// lblMes.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine20.spTop);
end;

procedure TRptCertificado.lblAnoPrint(Sender: TObject);
begin
 ConfigurarLabel;
 //Thiago Melo SOL 220597 Kintana 2053165
 //lblAno.Font.Size := TamanhoStringRelatorioLabel(lblAno.Caption, lblAno);
 //lblAno.Top       := TamanhoTopRelatorio(lbl1.Height, ppLine20.spTop);
 //Thiago Melo SOL 220597 Kintana 2053165
end;

end.
