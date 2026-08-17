{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
unit FConfigRelatInformeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Mask,
  wwdbedit, wwdblook, CMDBLookupCombo, ExtCtrls, ppPrnabl, ppCtrls,
  ppStrtch, ppMemo, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCtrllConfigRelatInforme, uCtrlGeral, uFuncoesUteis, IvDictio, IvMulti,
  IvEMulti, ppModule, raCodMod;

type
  rPensionista = Record
  Nome : string[29];
  CPF : string[11];
  ValorPensao : string;
  Valor13 : string;
end;

Type Funcionario = Record
  CPF : string;
  Nome : string;
  TotalRendimentos : string;
  Contribuicao : string;
  Contribuicao1 : string;
  PensaoAlimenticia : string;
  ImpostoRenda : string;
  ParcelaIsentaProventos : string;
  DiariasAjudas : string;
  PensaoProventos : string;
  LucroDividendo : string;
  ValoresPagos : string;
  Indenizacoes : string;
  Outros : string;
  DecimoTerceiro : string;
  Outros2 : string;
  Matricula : string;
  UnidadeLocacao : string;
  Pams : string;
  DevolucaoPams : string;
  Endereco : string;
  Bairro : string;
  Municipio : string;
  UF : string;
  Cep : string;
  IrFeriasExigibilidade : string;
  AbonoTribExigibilidade : string;
  CompIrDecJudcial : string;
  Pensionista1 : rPensionista;
  Pensionista2 : rPensionista;
  Pensionista3 : rPensionista;
  Pensionista4 : rPensionista;
end;

type
  TFrmConfigRelatInformeMT = class(TFrmConfigRelatorioMT)
    cdsInforme: TCMClientDataSet;
    sqlInforme: TCMSqlParams;
    cdsMatLocFunc: TCMClientDataSet;
    sqlMatLocFunc: TCMSqlParams;
    cdsDadosTxt: TCMClientDataSet;
    sqlDadosTxt: TCMSqlParams;
    cdsPensionista: TCMClientDataSet;
    sqlPensionista: TCMSqlParams;
    cdsEnd: TCMClientDataSet;
    sqlEnd: TCMSqlParams;
    cdsRubrica: TCMClientDataSet;
    sqlRubrica: TCMSqlParams;
    cdsInforme1: TCMClientDataSet;
    sqlInforme1: TCMSqlParams;
    cdsMatric: TCMClientDataSet;
    sqlMatric: TCMSqlParams;
    cdsFunc: TCMClientDataSet;
    RptModeloLabel42: TppLabel;
    sqlFunc: TCMSqlParams;
    cdsPessoa: TCMClientDataSet;
    RptModeloLabel40: TppLabel;
    RptModeloLabel41: TppLabel;
    sqlPessoa: TCMSqlParams;
    cdsEmpresaProp: TCMClientDataSet;
    sqlEmpresaProp: TCMSqlParams;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtData: TEdit;
    UpDown1: TUpDown;
    RptModeloMemo1: TppMemo;
    grpbxResponsavel: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtNome: TEdit;
    dtdtData: TCMDateTimePicker;
    gbMatricula: TGroupBox;
    edMatricula: TEdit;
    rgSistema: TRadioGroup;
    meCPF: TMaskEdit;
    cdsAux2: TCMClientDataSet;
    sqlAux2: TCMSqlParams;
    prgBarAtuFluxo: TProgressBar;
    bbtnGeraTxt: TBitBtn;
    rgInforme: TRadioGroup;
    sqlPensionista13: TCMSqlParams;
    cdsPensionista13: TCMClientDataSet;
    gbObservacao: TGroupBox;
    Label7: TLabel;
    edtObservacao: TEdit;
    gbRubrica13: TGroupBox;
    Label8: TLabel;
    edtRubrica: TEdit;
    sqllJud: TCMSqlParams;
    sqlJud13: TCMSqlParams;
    cdsJud: TCMClientDataSet;
    cdsJud13: TCMClientDataSet;
    cdsProcJud: TCMClientDataSet;
    sqlProcJud: TCMSqlParams;
    cdsParcIRRF: TCMClientDataSet;
    sqlParcIRRF: TCMSqlParams;
    sqlPessoaFisica: TCMSqlParams;
    cdsPessoafisica: TCMClientDataSet;
    cds13: TCMClientDataSet;
    sql13: TCMSqlParams;
    procedure RptModeloBeforePrint(Sender: TObject);
    procedure RptModeloMemo1Print(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnGeraTxtClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgInformeClick(Sender: TObject);
    procedure edtRubricaKeyPress(Sender: TObject; var Key: Char);
    procedure rgSistemaClick(Sender: TObject);
  private
    ArquivoTexto : TextFile;
    ConfigRelatInforme : TCtrllConfigRelatInforme;


    procedure MontaSqlDados;
    procedure MontaSqlDadosTxt;
    procedure GeraInformeFuncef;
    procedure GeraInformeCBS;
    procedure LimpaReg(var Func : Funcionario);
  public
    bEntrouSeldados : boolean;
  protected
     Procedure SelDados; Override;


  end;

var
  FrmConfigRelatInformeMT: TFrmConfigRelatInformeMT;

implementation

{$R *.DFM}

Uses uSistema, uDataBase, uMensErro, DBaseDados, uFuncaoGeral;

procedure TFrmConfigRelatInformeMT.RptModeloBeforePrint(Sender: TObject);
begin
  inherited;
  RptModeloLabel40.Caption := edtNome.Text;
  RptModeloLabel41.Caption := dtdtData.Text;
  RptModeloLabel42.Caption := edtData.text;
end;

procedure TFrmConfigRelatInformeMT.RptModeloMemo1Print(Sender: TObject);
begin
  inherited;
  RptModeloMemo1.Caption := '';
  RptModeloMemo1.Lines.Clear;
  //Valores normais
  sqlPensionista.prepare;
  sqlPensionista.ParamByName('IDPESSOA').AsFloat := cdsDados.FieldByName('IDPESSOA').AsFloat;
  sqlPensionista.ParamByName('ANOINI').Asstring  := edtData.Text + '/01';
  sqlPensionista.ParamByName('ANOFIM').Asstring  := edtData.Text + '/12';
  sqlPensionista.ParamByName('DATAINI').Asstring := '01/01/'+ edtData.Text;
  sqlPensionista.ParamByName('DATAFIM').Asstring := '31/12'+ edtData.Text;
  sqlPensionista.Open;
  //Valores de 13º
  sqlPensionista13.sql.clear;
  sqlPensionista13.sql.Append('SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR ');
  sqlPensionista13.sql.Append('  FROM HISTRUBSAL H, PESSOA P, RUBRICAINDIV R, PROVDESC PR ');
  sqlPensionista13.sql.Append(' WHERE H.MES BETWEEN :ANOINI AND :ANOFIM ');
  sqlPensionista13.sql.Append('   AND R.IDPESSOA    = :IDPESSOA ');
  sqlPensionista13.sql.Append('   AND H.IDRUBRICA = R.IDRUBRICA ');
  sqlPensionista13.sql.Append('   AND H.IDRUBRICA = PR.IDPROVENTO ');
  sqlPensionista13.sql.Append('   AND PR.CODRUBCLT = ''50018''');
  sqlPensionista13.sql.Append('   AND R.IDFAVORECIDO = P.IDPESSOA ');
  sqlPensionista13.sql.Append('   AND H.IDPESSOA = R.IDPESSOA ');
  sqlPensionista13.sql.Append('   AND PR.DESCRICAO LIKE ''%13%''');
  sqlPensionista13.sql.Append(' GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME ');
  sqlPensionista13.sql.Append(' UNION ');
  sqlPensionista13.sql.Append(' SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR ');
  sqlPensionista13.sql.Append('   FROM PESSOA P, RUBRICAINDIV R, PROVDESC PR, HISTRUBSAL H ');
  sqlPensionista13.sql.Append('  WHERE R.IDPESSOA    = :IDPESSOA ');
  sqlPensionista13.sql.Append('    AND R.IDPESSOA   = H.IDPESSOA ');
  sqlPensionista13.sql.Append('    AND H.DATAPAGAMENTO BETWEEN :DATAINI AND :DATAFIM ');
  if Trim(edtRubrica.text) <> '' then
     sqlPensionista13.sql.Append('    AND H.IDRUBRICA = :IDRUBRICA ')
  else
     sqlPensionista13.sql.Append('    AND H.IDRUBRICA = R.IDRUBRICA ');

  sqlPensionista13.sql.Append('    AND H.IDRUBRICA = PR.IDPROVENTO ');
  sqlPensionista13.sql.Append('    AND R.IDFAVORECIDO = P.IDPESSOA ');
  sqlPensionista13.sql.Append('    AND R.IDFAVORECIDO = H.IDFAVORECIDO ');
  sqlPensionista13.sql.Append('    AND R.FLGPENSAOALIM   = 1 ');
  sqlPensionista13.sql.Append('    AND R.FLGTPRUBMANUT   = 1 ');
  sqlPensionista13.sql.Append('  GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME ');
  sqlPensionista13.sql.Append('  ORDER BY NOME');
  sqlPensionista13.prepare;
  sqlPensionista13.ParamByName('IDPESSOA').AsFloat   := cdsDados.FieldByName('IDPESSOA').AsFloat;
  sqlPensionista13.ParamByName('ANOINI').Asstring    := edtData.Text + '/01';
  sqlPensionista13.ParamByName('ANOFIM').Asstring    := edtData.Text + '/12';
  sqlPensionista13.ParamByName('DATAINI').Asstring     := '01/01/'+ edtData.Text;
  sqlPensionista13.ParamByName('DATAFIM').Asstring     := '31/12'+ edtData.Text;
  if Trim(edtRubrica.text) <> '' then
    sqlPensionista13.ParamByName('IDRUBRICA').Asstring := Trim(edtRubrica.text);
  sqlPensionista13.Open;

  cdsPensionista.First;
  while not cdsPensionista.EOF do
    Begin
      cdsPensionista13.first;
      if not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull then
      if cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) then
         Begin
           cdsPensionista.edit;
           cdsPensionista.FieldByName('VALOR13').AsFloat := cdsPensionista13.FieldByName('VALOR').AsFloat;
           cdsPensionista.post;
           cdsPensionista13.delete;
         end;
      cdsPensionista.next;
    end;

  cdsPensionista13.first;
  while not cdsPensionista13.eof do
    Begin
      cdsPensionista.Insert;
      cdsPensionista.FieldByName('IDFAVORECIDO').Asinteger := cdsPensionista13.FieldByName('IDFAVORECIDO').Asinteger;
      cdsPensionista.FieldByName('NUMDOCUMENTO').Asstring  := cdsPensionista13.FieldByName('NUMDOCUMENTO').Asstring;
      cdsPensionista.FieldByName('NOME').Asstring          := cdsPensionista13.FieldByName('NOME').Asstring;
      cdsPensionista.FieldByName('VALOR').AsFloat          := 0;
      cdsPensionista.FieldByName('VALOR13').AsFloat        := cdsPensionista13.fieldByname('VALOR').AsFloat;
      cdsPensionista.post;
      cdsPensionista13.next;
    end;

  cdsPensionista.First;
  while not cdsPensionista.EOF do
    begin
      RptModeloMemo1.Lines.Add(' '+cdsPensionista.fieldByname('NUMDOCUMENTO').AsString + ' - ' + cdsPensionista.fieldByname('NOME').AsString + '   -   '+ 'Total Ren. Trib.: '+ FormatFloat('#,##0.00;(#,##0.00)', cdsPensionista.fieldByname('VALOR').AsFloat)+ '   -   '+ 'Total 13º : '+ FormatFloat('#,##0.00;(#,##0.00)',cdsPensionista.fieldByname('VALOR13').AsFloat));
      cdsPensionista.Next;
    end;

  sqlProcJud.Prepare;
  sqlProcJud.ParamByName('IDPESSOA').Asinteger := cdsDados.FieldByName('IDPESSOA').Asinteger;
  sqlProcJud.ParamByName('DATAINI').Asstring   := '01/01/'+ edtData.Text;
  sqlProcJud.ParamByName('DATAFIM').Asstring   := '31/12/'+ edtData.Text;
  sqlProcJud.open;

  sqlParcIRRF.Prepare;
  sqlParcIRRF.ParamByName('IDPESSOA').Asinteger := cdsDados.FieldByName('IDPESSOA').Asinteger;
  sqlParcIRRF.ParamByName('DATAINI').Asstring   := '01/01/'+ edtData.Text;
  sqlParcIRRF.ParamByName('DATAFIM').Asstring   := '31/12/'+ edtData.Text;
  sqlParcIRRF.open;

  if (cdsProcJud.fieldByname('VALOR').AsFloat > 0) or (cdsParcIRRF.fieldByname('VALOR').AsFloat > 0) then
    RptModeloMemo1.Lines.Add(' Rendimento com Exigibilidade suspensa : '+ FormatFloat('#,##0.00;(#,##0.00)',cdsProcJud.fieldByname('VALOR').AsFloat) + ' - ' + 'IRRF Depósito judicial : '+ FormatFloat('#,##0.00;(#,##0.00)',cdsParcIRRF.fieldByname('VALOR').AsFloat));

end;

procedure TFrmConfigRelatInformeMT.FormCreate(Sender: TObject);
begin
  //Henrique Massão
  savedialog1.initialdir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  cFlag := 'F';

  ConfigRelatInforme := TCtrllConfigRelatInforme.create;
  ConfigRelatInforme.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  inherited;
end;

procedure TFrmConfigRelatInformeMT.SelDados;
begin
  inherited;
  {
    Sobrescrever a procedure SelDados para abrir o SQLDADOS que é a fonte
    de dados para o relatório.
    Em tempo de desenho clicar acessar a opção OPEN do meno do SQLDADOS para
    abrir o CDSDADOS para habilitar o acesso aos campos da consulta para o
    desenho do relatório.
  }
  if bEntrouSeldados then
     MontaSqlDados;
  bEntrouSeldados := True;


end;

procedure TFrmConfigRelatInformeMT.MontaSqlDados;
var sAno : String;
    iIdPessoa : Double;
    Valor13, ValorSoma, valor305, valor301 : Currency;
Begin
   if Trim(edtData.text) <> '0' then
     sAno := edtData.text
   else
     sAno := intTostr(ExtraiAno(date));

   iIdPessoa := -1999;
   //
   sqlEmpresaProp.Prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   sqlEmpresaProp.Open;
   if trim(edMatricula.Text) <> '' then
     Begin
       if rgSistema.ItemIndex = 0 then
         Begin
           sqlFunc.Prepare;
           sqlFunc.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
           sqlFunc.Open;
           iIdPessoa := cdsFunc.FieldByName('IDPESSOA').AsFloat;
         end
       else
         Begin
           sqlMatric.Prepare;
           sqlMatric.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
           sqlMatric.Open;
           iIdPessoa := cdsMatric.fieldByname('IDPESSOA').AsFloat;
         end;
   end;
   if trim(meCPF.Text) <> '' then
     Begin
       sqlPessoa.prepare;
       sqlPessoa.ParamByName('NUMDOCUMENTO').AsString := trim(meCPF.Text)+'       '                                                       ;
       sqlPessoa.Open;
       iIdPessoa := cdsPessoa.fieldByname('IDPESSOA').AsFloat;
     end;
   //

   sqlInforme.Open;
   sqlDados.SQL.Clear;
   sqlDados.SQL.Add('SELECT   P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF,  P.NUMDOCUMENTO AS CPF, ');
   sqlDados.SQL.Add('         E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ');
   sqlDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL, ');
   sqlDados.SQL.Add('         EN.LOGRADOURO||'', ''||EN.NUMERO||'', ''||EN.COMPLEMENTO AS ENDEREO, ');
   sqlDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   sqlDados.SQL.Add('         ES.CODESTADO AS UF, ');
   cdsinforme.First;
   While not cdsinforme.EOF do
     Begin
      sqlDados.SQL.Add('         DECODE(SIGN(SUM(DECODE(XB.CODINFORME,'+cdsinforme.fieldByname('CODINFORME').AsString+', VLR, 0 ))),-1,0,SUM(DECODE(XB.CODINFORME,'+cdsinforme.fieldByname('CODINFORME').AsString+', VLR, 0 ))) AS VLR'+trim(cdsinforme.fieldByname('CODINFORME').AsString)+',');
      cdsinforme.Next;
     end;
   sqlDados.SQL.Add('         (''-'') AS TELEFONE, (''C'') AS  TIPO  ');
   sqlDados.SQL.Add('FROM  PESSOA P,PESSOA E, ENDPESS EN, CIDADES C, ESTADO ES, ');
   sqlDados.SQL.Add('      NATURENDIMENTO NAT , ');
   sqlDados.SQL.Add('      ( SELECT U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME, ');
   sqlDados.SQL.Add('               SUM(U.VLR) AS VLR ');
   sqlDados.SQL.Add('        FROM ');
   sqlDados.SQL.Add('       ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME, ');
   sqlDados.SQL.Add('                SUM(DECODE(I.CODDIRF,''6'',(LI.VLRLANC*-1),DECODE(I.CODDIRF,''7'',(LI.VLRLANC*-1),DECODE(I.CODDIRF,''13'',(LI.VLRLANC*-1), DECODE(I.CODDIRF,''16'',(LI.VLRLANC*-1), DECODE(I.CODDIRF,''17'',(LI.VLRLANC*-1), LI.VLRLANC)))))) AS VLR ');
   sqlDados.SQL.Add('        FROM INFORME I, LANCXINFORME LI, LANCIRRF L ');
   sqlDados.SQL.Add('        WHERE (I.IDINFORME = LI.IDINFORME) AND ');
   sqlDados.SQL.Add('              (LI.IDLANCIRRF = L.IDLANCIRRF) AND ');
   sqlDados.SQL.Add('              (L.CODNATUREZA <> ''8888'') AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA in (''3223'', ''7416'')) AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('              (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('              (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('        GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME) ');
   sqlDados.SQL.Add('   UNION ALL ');
   sqlDados.SQL.Add('      (SELECT  UL.IDBENEFIRRF, UL.CODNATUREZA, UL.CODINFORME, ');
   sqlDados.SQL.Add('               SUM(UL.VLR) AS VLR ');
   sqlDados.SQL.Add('       FROM ');
   sqlDados.SQL.Add('          ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   sqlDados.SQL.Add('                  SUM(L.VLRBASE) AS VLR ');
   sqlDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   sqlDados.SQL.Add('              WHERE (I.FLGBASE = ''S'') AND ');
   sqlDados.SQL.Add('                    (L.CODNATUREZA <> ''8888'') AND ');
   sqlDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA = ''3223'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   sqlDados.SQL.Add('           UNION ALL ');
   sqlDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   sqlDados.SQL.Add('                  SUM(L.VLRIRRF) AS VLR ');
   sqlDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   sqlDados.SQL.Add('              WHERE (I.FLGIRRF = ''S'') AND ');
   sqlDados.SQL.Add('                    (L.CODNATUREZA <> ''8888'') AND ');
   sqlDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA = ''3223'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   sqlDados.SQL.Add('           UNION ALL ');
   sqlDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   sqlDados.SQL.Add('                  SUM(L.VLRINSS) AS VLR  ');
   sqlDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   sqlDados.SQL.Add('              WHERE (I.CODDIRF = 4) AND ');
   sqlDados.SQL.Add('                    (L.CODNATUREZA <> ''8888'') AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA = ''3223'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   sqlDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA)) UL ');
   sqlDados.SQL.Add('        GROUP BY UL.IDBENEFIRRF, UL.CODNATUREZA, ');
   sqlDados.SQL.Add('                 UL.CODINFORME)) U ');
   sqlDados.SQL.Add('        GROUP BY U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME) XB ');
   sqlDados.SQL.Add('WHERE  (P.TIPO = ''F'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('    (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('       (P.IDPESSOA = XB.IDBENEFIRRF) AND ');
   sqlDados.SQL.Add('       (E.IDPESSOA   = '+IntToStr(Sistema.idEmpresa)+') AND ');
   sqlDados.SQL.Add('       (NAT.CODNATUREZA   = XB.CODNATUREZA) AND ');
   sqlDados.SQL.Add('       (EN.IDENDERECO(+) = E.IDENDCORRESP) AND ');
   sqlDados.SQL.Add('       (EN.IDCIDADES     = C.IDCIDADES(+)) AND ');
   sqlDados.SQL.Add('       (ES.IDESTADO(+)    = C.IDESTADO) AND ');
   sqlDados.SQL.Add('       (EN.IDPESSOA(+)   = E.IDPESSOA) ');
   sqlDados.SQL.Add('GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ');
   sqlDados.SQL.Add('         E.NUMDOCUMENTO,  E.RAZAOSOCIAL, ');
   sqlDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, ');
   sqlDados.SQL.Add('         EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, ');
   sqlDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   sqlDados.SQL.Add('         ES.CODESTADO ');
   sqlDados.SQL.Add('ORDER BY  EN.CEP, P.RAZAOSOCIAL, NAT.CODNATUREZA ');
   sqlDados.prepare;
   sqlDados.ParamByName('sDataIni').AsString      :='01/01/'+sANO;
   sqlDados.ParamByName('sDataFim').AsString      :='31/12/'+sANO;
   sqlDados.ParamByName('sNumDocumento').AsString := Copy(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').AsString,1,8);
   sqlDados.Open;

   while not cdsdados.eof do
     Begin
       if cdsdados.FieldByName('CODNATUREZA').Asstring = '7416' then
         Begin
           valor305 := cdsdados.fieldByname('VLR305').Asfloat;
           valor301 := cdsdados.fieldByname('VLR301').AsFloat;
           cdsdados.Prior;
           cdsdados.edit;
           cdsdados.fieldByname('VLR301').AsFloat := cdsdados.fieldByname('VLR301').AsFloat + valor301;
           cdsdados.fieldByname('VLR305').AsFloat := cdsdados.fieldByname('VLR305').AsFloat + valor305;
           cdsdados.post;
           cdsdados.Next;
           cdsdados.delete;
         end;

       sqlPessoaFisica.Prepare;
       sqlPessoaFisica.ParamByName('IDPESSOA').AsFloat := cdsdados.fieldByname('IDPESSOA').AsFloat;
       sqlPessoaFisica.open;

       if (not cdsPessoafisica.fieldByname('DATANASC').IsNull) and                      //os .25 ficam por conta do ano bisexto que a cada 4 anos tem mais um dia.
                                        ((Date - cdsPessoafisica.fieldByname('DATANASC').AsDateTime) >= (65 * 365.25)) then
          Begin
            sql13.Prepare;
            sql13.ParamByName('IDPESSOA').AsFloat := cdsdados.fieldByname('IDPESSOA').AsFloat;
            sql13.ParamByName('DATAINI').Asstring := '01/01/'+sANO;
            sql13.ParamByName('DATAFIM').Asstring := '31/12/'+sANO;
            sql13.open;
            Valor13 := cds13.fieldByname('VLR').AsFloat;
            if Valor13 >= 1058 then
               ValorSoma := 1058
            else
               ValorSoma := Valor13;

            cdsdados.Edit;
            cdsdados.fieldByname('VLR401').AsFloat := cdsdados.fieldByname('VLR401').AsFloat + ValorSoma;
            cdsdados.post;
          end;

       cdsDados.next;
     end;
   cdsDados.first;
end;

procedure TFrmConfigRelatInformeMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
end;

procedure TFrmConfigRelatInformeMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
end;

procedure TFrmConfigRelatInformeMT.MontaSqlDadosTxt;
var sAno : String;
    iIdPessoa : Double;
Begin
   if Trim(edtData.text) <> '0' then
     sAno := edtData.text
   else
     sAno := intTostr(ExtraiAno(date));

   iIdPessoa := -1999;
   //
   sqlEmpresaProp.prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   sqlEmpresaProp.Open;
   if trim(edMatricula.Text) <> '' then
     Begin
      if rgSistema.ItemIndex = 0 then
        Begin
         sqlFunc.prepare;
         sqlFunc.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
         sqlFunc.Open;
         iIdPessoa := cdsFunc.FieldByName('IDPESSOA').AsFloat;
        end
      else
        Begin
         sqlMatric.prepare;
         sqlMatric.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
         sqlMatric.Open;
         iIdPessoa := cdsMatric.fieldByname('IDPESSOA').AsFloat;
        end;
   end;
   if trim(meCPF.Text) <> '' then
     Begin
       sqlPessoa.prepare;
       sqlPessoa.ParamByName('NUMDOCUMENTO').AsString := trim(meCPF.Text)+'       ';
       sqlPessoa.Open;
       iIdPessoa := cdsPessoa.fieldByname('IDPESSOA').AsFloat;
     end;
   //

   sqlInforme.Open;
   sqlDados.prepare;
   sqlDados.SQL.Clear;
   sqlDados.SQL.Add('SELECT   P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF,  P.NUMDOCUMENTO AS CPF, ');
   sqlDados.SQL.Add('         E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ');
   sqlDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, P.RAZAOSOCIAL,');
   sqlDados.SQL.Add('         EN.LOGRADOURO||'', ''||EN.NUMERO||'', ''||EN.COMPLEMENTO AS ENDEREO, ');
   sqlDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   sqlDados.SQL.Add('         ES.CODESTADO AS UF, ');
   cdsinforme.First;
   While not cdsinforme.EOF do
     Begin
       sqlDados.SQL.Add('         DECODE(SIGN(SUM(DECODE(XB.CODINFORME,'+cdsinforme.fieldByname('CODINFORME').AsString+', VLR, 0 ))),-1,0,SUM(DECODE(XB.CODINFORME,'+cdsinforme.fieldByname('CODINFORME').AsString+', VLR, 0 ))) AS VLR'+trim(cdsinforme.fieldByname('CODINFORME').AsString)+',');
       cdsinforme.Next;
     end;
   sqlDados.SQL.Add('         (''-'') AS TELEFONE, (''C'') AS  TIPO  ');
   sqlDados.SQL.Add('FROM  PESSOA P,PESSOA E, ENDPESS EN, CIDADES C, ESTADO ES, ');
   sqlDados.SQL.Add('      NATURENDIMENTO NAT , ');
   sqlDados.SQL.Add('      ( SELECT U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME, ');
   sqlDados.SQL.Add('               SUM(U.VLR) AS VLR ');
   sqlDados.SQL.Add('        FROM ');
   sqlDados.SQL.Add('       ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME, ');
   sqlDados.SQL.Add('               SUM(DECODE(I.CODDIRF,''6'',(LI.VLRLANC*-1),DECODE(I.CODDIRF,''7'',(LI.VLRLANC*-1),DECODE(I.CODDIRF,''13'',(LI.VLRLANC*-1), DECODE(I.CODDIRF,''16'',(LI.VLRLANC*-1), DECODE(I.CODDIRF,''17'',(LI.VLRLANC*-1), LI.VLRLANC)))))) AS VLR ');
   sqlDados.SQL.Add('        FROM INFORME I, LANCXINFORME LI, LANCIRRF L ');
   sqlDados.SQL.Add('        WHERE (I.IDINFORME = LI.IDINFORME) AND ');
   sqlDados.SQL.Add('              (LI.IDLANCIRRF = L.IDLANCIRRF) AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA in (''3223'', ''7416'')) AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('              (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('              (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('        GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME) ');
   sqlDados.SQL.Add('   UNION ALL ');
   sqlDados.SQL.Add('      (SELECT  UL.IDBENEFIRRF, UL.CODNATUREZA, UL.CODINFORME, ');
   sqlDados.SQL.Add('               SUM(UL.VLR) AS VLR ');
   sqlDados.SQL.Add('       FROM ');
   sqlDados.SQL.Add('          ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   sqlDados.SQL.Add('                  SUM(L.VLRBASE) AS VLR ');
   sqlDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   sqlDados.SQL.Add('              WHERE (I.FLGBASE = ''S'') AND ');
   sqlDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA = ''3223'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   sqlDados.SQL.Add('           UNION ALL ');
   sqlDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   sqlDados.SQL.Add('                  SUM(L.VLRIRRF) AS VLR ');
   sqlDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   sqlDados.SQL.Add('              WHERE (I.FLGIRRF = ''S'') AND ');
   sqlDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA = ''3223'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   sqlDados.SQL.Add('           UNION ALL ');
   sqlDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   sqlDados.SQL.Add('                  SUM(L.VLRINSS) AS VLR  ');
   sqlDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   sqlDados.SQL.Add('              WHERE (I.CODDIRF = 4) AND ');
   if rgSistema.ItemIndex = 1 then
     Begin
       sqlDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
       sqlDados.SQL.Add('                 (L.CODNATUREZA <> ''3223'') AND ');
     end;
   if rgSistema.ItemIndex = 0 then
      sqlDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      sqlDados.SQL.Add('                 (L.CODNATUREZA = ''3223'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   sqlDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   sqlDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   sqlDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA)) UL ');
   sqlDados.SQL.Add('        GROUP BY UL.IDBENEFIRRF, UL.CODNATUREZA, ');
   sqlDados.SQL.Add('                 UL.CODINFORME)) U ');
   sqlDados.SQL.Add('        GROUP BY U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME) XB ');
   sqlDados.SQL.Add('WHERE  (P.TIPO = ''F'') AND ');
   if iIdPessoa <> -1999  then begin
      sqlDados.SQL.Add('    (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   sqlDados.SQL.Add('       (P.IDPESSOA = XB.IDBENEFIRRF) AND ');
   sqlDados.SQL.Add('       (E.IDPESSOA   = '+IntToStr(Sistema.idEmpresa)+') AND ');
   sqlDados.SQL.Add('       (NAT.CODNATUREZA   = XB.CODNATUREZA) AND ');
   sqlDados.sql.Add('       (LTRIM(RTRIM(NAT.CODNATUREZA)) = ''0561'') AND ');
   sqlDados.SQL.Add('       (EN.IDENDERECO(+) = E.IDENDCORRESP) AND ');
   sqlDados.SQL.Add('       (EN.IDCIDADES     = C.IDCIDADES(+)) AND ');
   sqlDados.SQL.Add('       (ES.IDESTADO(+)    = C.IDESTADO) AND ');
   sqlDados.SQL.Add('       (EN.IDPESSOA(+)   = E.IDPESSOA) ');
   sqlDados.SQL.Add('GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ');
   sqlDados.SQL.Add('         E.NUMDOCUMENTO,  E.RAZAOSOCIAL, ');
   sqlDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, ');
   sqlDados.SQL.Add('         EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, ');
   sqlDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   sqlDados.SQL.Add('         ES.CODESTADO ');
   sqlDados.SQL.Add('ORDER BY EN.CEP, P.RAZAOSOCIAL, P.IDPESSOA');
   sqlDados.prepare;
   sqlDados.ParamByName('sDataIni').AsString      :='01/01/'+sANO;
   sqlDados.ParamByName('sDataFim').AsString      :='31/12/'+sANO;
   sqlDados.ParamByName('sNumDocumento').AsString := Copy(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').AsString,1,8);
   sqlDados.Open;
end;

procedure TFrmConfigRelatInformeMT.GeraInformeFuncef;
Var
   rIdPessoa : real;
   //Informes de rendimento
   sVal301, //Total de redimentos
   sVal302, //contribuição previdenciária oficial
   sVal303, //Contribuição à previdência privada
   sVal304, //pensão alimentícia
   sVal305, //Imposto retido na fonte
   sVal401,
   sVal402, //Salário família
   sVal403, //Parcela isenta dos proventos de aposentadoria
   sVal404, //Diárias e ajudas de custo
   sVal405, //Pensão, proventos de aposentadoria
   sVal406, //Lucro e dividendo apurado
   sVal407, //Outros. Demais rendimentos isentos
   sVal501, // Décimo Terceiro salário
   sVal502, //Outros(Valor liquido dos demais Rendimentos sujeitos à tributação exclusiva)
   sVal601, //valor do Pams - não me pergunte o que que é isso...
   sVal602, //Valor de devolução do Pams
   sVal603,
   sVal604,
   sVal605 : string;
   sCodNatureza, CPF, NomeBene : string;
   Pensionista : Array [0..3] of rPensionista;
   Func, Func1 : Funcionario; // funcionarios por página
   ContFunc, i, iModulo : integer;
begin
  sqlEmpresaProp.prepare;
  sqlEmpresaProp.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  sqlEmpresaProp.open;

  sqlinforme1.Open;
  MontaSqlDadostxt;
  prgBarAtuFluxo.Visible  := True;
  prgBarAtuFluxo.Max      := cdsDados.RecordCount;
  prgBarAtuFluxo.Position := 0;
  cdsdados.First;
  if not cdsdados.IsEmpty then
    Begin
      //Gera registro Tipo 3
      {estou usando um while dentro do outro com a mesma tabela sem usar gotobookmark, pois
       eu preciso varrer a qrydados para pegar todos os valores de informes para um determinado
       idpessoa, quando eu já tiver obtido todos os informes eu gero o registro e passo para o próximo
       funcionário.}
      prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
      ContFunc := 0;
      cdsdados.first;
      while not cdsdados.eof do
        Begin
          ContFunc := ContFunc + 1;
          rIdPessoa    := cdsdados.FieldByName('IDPESSOA').AsFloat;
          sCodNatureza := cdsdados.FieldByName('CODNATUREZA').AsString;
          //traz o endereço do empregado
          sqlEnd.prepare;
          sqlEnd.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          sqlEnd.Open;
          //Valores de rendimentos
          sqlPensionista.prepare;
          sqlPensionista.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          sqlPensionista.ParamByName('ANOINI').Asstring  := edtData.Text + '/01';
          sqlPensionista.ParamByName('ANOFIM').Asstring  := edtData.Text + '/12';
          sqlPensionista.ParamByName('DATAINI').Asstring := '01/01/'+ edtData.Text;
          sqlPensionista.ParamByName('DATAFIM').Asstring := '31/12'+ edtData.Text;
          sqlPensionista.Open;
          //Valores de 13º
          sqlPensionista13.sql.clear;
          sqlPensionista13.sql.Append('SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR ');
          sqlPensionista13.sql.Append('  FROM HISTRUBSAL H, PESSOA P, RUBRICAINDIV R, PROVDESC PR ');
          sqlPensionista13.sql.Append(' WHERE H.MES BETWEEN :ANOINI AND :ANOFIM ');
          sqlPensionista13.sql.Append('   AND R.IDPESSOA    = :IDPESSOA ');
          sqlPensionista13.sql.Append('   AND H.IDRUBRICA = R.IDRUBRICA ');
          sqlPensionista13.sql.Append('   AND H.IDRUBRICA = PR.IDPROVENTO ');
          sqlPensionista13.sql.Append('   AND PR.CODRUBCLT = ''50018''');
          sqlPensionista13.sql.Append('   AND R.IDFAVORECIDO = P.IDPESSOA ');
          sqlPensionista13.sql.Append('   AND H.IDPESSOA = R.IDPESSOA ');
          sqlPensionista13.sql.Append('   AND PR.DESCRICAO LIKE ''%13%''');
          sqlPensionista13.sql.Append(' GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME ');
          sqlPensionista13.sql.Append(' UNION ');
          sqlPensionista13.sql.Append(' SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR ');
          sqlPensionista13.sql.Append('   FROM PESSOA P, RUBRICAINDIV R, PROVDESC PR, HISTRUBSAL H ');
          sqlPensionista13.sql.Append('  WHERE R.IDPESSOA    = :IDPESSOA ');
          sqlPensionista13.sql.Append('    AND R.IDPESSOA   = H.IDPESSOA ');
          sqlPensionista13.sql.Append('    AND H.DATAPAGAMENTO BETWEEN :DATAINI AND :DATAFIM ');
          if Trim(edtRubrica.text) <> '' then
             sqlPensionista13.sql.Append('    AND H.IDRUBRICA = :IDRUBRICA ')
          else
             sqlPensionista13.sql.Append('    AND H.IDRUBRICA = R.IDRUBRICA ');
          sqlPensionista13.sql.Append('    AND H.IDRUBRICA = PR.IDPROVENTO ');
          sqlPensionista13.sql.Append('    AND R.IDFAVORECIDO = P.IDPESSOA ');
          sqlPensionista13.sql.Append('    AND R.IDFAVORECIDO = H.IDFAVORECIDO ');
          sqlPensionista13.sql.Append('    AND R.FLGPENSAOALIM   = 1 ');
          sqlPensionista13.sql.Append('    AND R.FLGTPRUBMANUT   = 1 ');
          sqlPensionista13.sql.Append('  GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME ');
          sqlPensionista13.sql.Append('  ORDER BY NOME');
          sqlPensionista13.prepare;
          sqlPensionista13.ParamByName('IDPESSOA').AsFloat   := cdsDados.FieldByName('IDPESSOA').AsFloat;
          sqlPensionista13.ParamByName('ANOINI').Asstring    := edtData.Text + '/01';
          sqlPensionista13.ParamByName('ANOFIM').Asstring    := edtData.Text + '/12';
          sqlPensionista13.ParamByName('DATAINI').Asstring     := '01/01/'+ edtData.Text;
          sqlPensionista13.ParamByName('DATAFIM').Asstring     := '31/12'+ edtData.Text;
          if Trim(edtRubrica.text) <> '' then
            sqlPensionista13.ParamByName('IDRUBRICA').Asstring := Trim(edtRubrica.text);
          sqlPensionista13.Open;


          sqlMatLocFunc.prepare;
          sqlMatLocFunc.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          sqlMatLocFunc.open;

          CPF := cdsdados.fieldByname('CPF').Asstring;
          NomeBene := cdsdados.fieldByname('NOMEBENEF').Asstring;

          //zera variáveis que armazenam os valores dos informes
          sVal301 := '0,00';
          sVal302 := sVal301;
          sVal303 := sVal301;
          sVal304 := sVal301;
          sVal305 := sVal301;
          sVal401 := sVal301;
          sVal402 := sVal301;
          sVal403 := sVal301;
          sVal404 := sVal301;
          sVal405 := sVal301;
          sVal406 := sVal301;
          sVal407 := sVal301;
          sVal501 := sVal301;
          sVal502 := sVal301;
          sVal601 := sVal301;
          sVal602 := sVal301;
          sVal603 := sVal301;
          sVal604 := sVal301;
          sVal605 := sVal301;
          Case rgSistema.ItemIndex Of
            0 : iModulo := 21;
            1 : iModulo := 18;
            3 : iModulo := 10;
          end;

          if not ConfigRelatInforme.AtualizaLancIRRF(cdsdados.fieldByname('IDPESSOA').AsInteger, iModulo,
                                                     cdsdados.fieldByname('CODNATUREZA').AsString) then
             Begin
               MsgDlg('Erro ao atualizar dados.','Erro',mtWarning,[mbOK],0);
               exit;
             end;

          //Varre a qrydados enquanto houver informes para o funcionário corrente
          While (not cdsdados.EOF) and
                (rIdPessoa    = cdsdados.FieldByName('IDPESSOA').AsFloat) do
            Begin
              try
                if (cdsdados.fieldByname('VLR301').AsFloat > 0) and (StrToFloat(sVal301) <= 0) then
                    sVal301 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR301').AsFloat);
              except
                sVal301 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR302').AsFloat > 0) and (StrToFloat(sVal302) <= 0) then
                   sVal302 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR302').AsFloat);
              except
                sVal302 :=  '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR303').AsFloat > 0) and (StrToFloat(sVal303) <= 0) then
                   sVal303 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR303').AsFloat);
              except
                  sVal303 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR304').AsFloat > 0) and (StrToFloat(sVal304) <= 0) then
                   sVal304 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR304').AsFloat);
              except
                 sVal304 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR305').AsFloat > 0) and (StrToFloat(sVal305) <= 0) then
                    sVal305 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR305').AsFloat);
              except
                sVal305 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR401').AsFloat > 0) and (StrToFloat(sVal401) <= 0) then
                   sVal401 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR401').AsFloat);
              except
                sVal401 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR402').AsFloat > 0) and (StrToFloat(sVal402) <= 0) then
                   sVal402 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR402').AsFloat);
              except
                sVal402 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR403').AsFloat > 0) and (StrToFloat(sVal403) <= 0) then
                   sVal403 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR403').AsFloat);
              except
                sVal403 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR404').AsFloat > 0) and (StrToFloat(sVal404) <= 0) then
                   sVal404 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR404').AsFloat);
              except
                sVal404 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR405').AsFloat > 0) and (StrToFloat(sVal405) <= 0) then
                   sVal405 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR405').AsFloat);
              except
                sVal405 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR406').AsFloat > 0) and (StrToFloat(sVal406) <= 0) then
                   sVal406 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR406').AsFloat);
              except
                sVal406 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR407').AsFloat > 0) and (StrToFloat(sVal407) <= 0) then
                   sVal407 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR407').AsFloat);
              except
                sVal407 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR501').AsFloat > 0) and (StrToFloat(sVal501) <= 0) then
                   sVal501 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR501').AsFloat);
              except
                sVal501 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR502').AsFloat > 0) and (StrToFloat(sVal502) <= 0) then
                   sVal502 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR502').AsFloat);
              except
                sVal502 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR601').AsFloat > 0) and (StrToFloat(sVal601) <= 0) then
                   sVal601 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR601').AsFloat);
              except
                sVal601 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR602').AsFloat > 0) and (StrToFloat(sVal602) <= 0) then
                   sVal602 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR602').AsFloat);
              except
                sVal602 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR603').AsFloat > 0) and (StrToFloat(sVal603) <= 0) then
                   sVal603 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR603').AsFloat);
              except
                sVal603 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR604').AsFloat > 0) and (StrToFloat(sVal604) <= 0) then
                   sVal604 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR604').AsFloat);
              except
                sVal604 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR605').AsFloat > 0) and (StrToFloat(sVal605) <= 0) then
                   sVal605 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR605').AsFloat);
              except
                sVal605 := '0,00';
              end;

              cdsdados.Next;
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
            end; //whlie qrydados interno

            cdsPensionista.First;
            For i := 0 to 3 do
              Begin
                if not cdsPensionista.eof then
                  Begin
                    Pensionista[i].Nome := cdsPensionista.fieldByname('NOME').AsString;
                    Pensionista[i].CPF  := Copy(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString, 1, 11);
                    Pensionista[i].ValorPensao := FormatFloat('#,##0.00;(#,##0.00)',cdsPensionista.fieldByname('VALOR').AsFloat);
                    cdsPensionista13.first;
                    if not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull then
                    if cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) then
                       Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)',cdsPensionista13.fieldByname('VALOR').AsFloat)
                    else
                       Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)',0);

                    cdsPensionista.Next;
                  end;
              end;

            case ContFunc of
             1 :
                Begin
                  //limpar o record
                  Func.CPF                    := ConfigRelatInforme.FormataCPF(CPF);
                  Func.Nome                   := NomeBene;
                  Func.TotalRendimentos       := sVal301;
                  Func.Contribuicao           := sVal302;
                  Func.Contribuicao1          := sVal303;
                  Func.PensaoAlimenticia      := sVal304;
                  Func.ImpostoRenda           := sVal305;
                  Func.ParcelaIsentaProventos := sVal401;
                  Func.DiariasAjudas          := sVal402;
                  Func.PensaoProventos        := sVal403;
                  Func.LucroDividendo         := sVal404;
                  Func.ValoresPagos           := sVal405;
                  Func.Indenizacoes           := sVal406;
                  Func.Outros                 := sVal407;
                  Func.DecimoTerceiro         := sVal501;
                  Func.Outros2                := sVal502;
                  Func.Matricula              := cdsMatLocFunc.fieldByname('MATRICULA').Asstring;
                  Func.UnidadeLocacao         := cdsMatLocFunc.fieldByname('NOME').Asstring;
                  Func.Endereco               := cdsEnd.fieldByname('ENDEREO').asstring;
                  Func.Bairro                 := cdsEnd.fieldByname('BAIRRO').asstring;
                  Func.Municipio              := cdsEnd.fieldByname('NOME').asstring;
                  Func.UF                     := cdsEnd.fieldByname('UF').asstring;
                  Func.Cep                    := cdsEnd.fieldByname('CEP').asstring;
                  Func.Pams                   := sVal601;
                  Func.DevolucaoPams          := sVal602;
                  Func.IrFeriasExigibilidade  := sVal605;
                  Func.AbonoTribExigibilidade := sVal604;
                  Func.CompIrDecJudcial       := sVal603;
                  Func.Pensionista1.Nome      := Pensionista[0].Nome;
                  Func.Pensionista1.CPF       := Pensionista[0].CPF;
                  Func.Pensionista1.ValorPensao:= Pensionista[0].ValorPensao;
                  Func.Pensionista1.Valor13   := Pensionista[0].Valor13;
                  Func.Pensionista2.Nome      := Pensionista[1].Nome;
                  Func.Pensionista2.CPF       := Pensionista[1].CPF;
                  Func.Pensionista2.ValorPensao:= Pensionista[1].ValorPensao;
                  Func.Pensionista2.Valor13   := Pensionista[1].Valor13;
                  Func.Pensionista3.Nome      := Pensionista[2].Nome;
                  Func.Pensionista3.CPF       := Pensionista[2].CPF;
                  Func.Pensionista3.ValorPensao:= Pensionista[2].ValorPensao;
                  Func.Pensionista3.Valor13   := Pensionista[2].Valor13;
                  Func.Pensionista4.Nome      := Pensionista[3].Nome;
                  Func.Pensionista4.CPF       := Pensionista[3].CPF;
                  Func.Pensionista4.ValorPensao:= Pensionista[3].ValorPensao;
                  Func.Pensionista4.Valor13   := Pensionista[3].Valor13;
                  Pensionista[0].Nome         := '';
                  Pensionista[0].CPF          := '';
                  Pensionista[0].ValorPensao  := '';
                  Pensionista[0].Valor13      := '';
                  Pensionista[1].Nome         := '';
                  Pensionista[1].CPF          := '';
                  Pensionista[1].ValorPensao  := '';
                  Pensionista[1].Valor13      := '';
                  Pensionista[2].Nome         := '';
                  Pensionista[2].CPF          := '';
                  Pensionista[2].ValorPensao  := '';
                  Pensionista[2].Valor13      := '';
                  Pensionista[3].Nome         := '';
                  Pensionista[3].CPF          := '';
                  Pensionista[3].ValorPensao  := '';
                  Pensionista[3].Valor13      := '';
                end;
             2 :
                Begin
                  Func1.CPF                    := ConfigRelatInforme.FormataCPF(CPF);
                  Func1.Nome                   := NomeBene;
                  Func1.TotalRendimentos       := sVal301;
                  Func1.Contribuicao           := sVal302;
                  Func1.Contribuicao1          := sVal303;
                  Func1.PensaoAlimenticia      := sVal304;
                  Func1.ImpostoRenda           := sVal305;
                  Func1.ParcelaIsentaProventos := sVal401;
                  Func1.DiariasAjudas          := sVal402;
                  Func1.PensaoProventos        := sVal403;
                  Func1.LucroDividendo         := sVal404;
                  Func1.ValoresPagos           := sVal405;
                  Func1.Indenizacoes           := sVal406;
                  Func1.Outros                 := sVal407;
                  Func1.DecimoTerceiro         := sVal501;
                  Func1.Outros2                := sVal502;
                  Func1.Matricula              := cdsMatLocFunc.fieldByname('MATRICULA').Asstring;
                  Func1.UnidadeLocacao         := cdsMatLocFunc.fieldByname('NOME').Asstring;
                  Func1.Endereco               := cdsEnd.fieldByname('ENDEREO').asstring;
                  Func1.Bairro                 := cdsEnd.fieldByname('BAIRRO').asstring;
                  Func1.Municipio              := cdsEnd.fieldByname('NOME').asstring;
                  Func1.UF                     := cdsEnd.fieldByname('UF').asstring;
                  Func1.Cep                    := cdsEnd.fieldByname('CEP').asstring;
                  Func1.IrFeriasExigibilidade  := sVal605;
                  Func1.AbonoTribExigibilidade := sVal604;
                  Func1.CompIrDecJudcial       := sVal603;
                  Func1.Pams                   := sVal601;
                  Func1.DevolucaoPams          := sVal602;
                  Func1.Pensionista1.Nome       := Pensionista[0].Nome;
                  Func1.Pensionista1.CPF        := Pensionista[0].CPF;
                  Func1.Pensionista1.ValorPensao:= Pensionista[0].ValorPensao;
                  Func1.Pensionista1.Valor13    := Pensionista[0].Valor13;
                  Func1.Pensionista2.Nome       := Pensionista[1].Nome;
                  Func1.Pensionista2.CPF        := Pensionista[1].CPF;
                  Func1.Pensionista2.ValorPensao:= Pensionista[1].ValorPensao;
                  Func1.Pensionista2.Valor13    := Pensionista[1].Valor13;
                  Func1.Pensionista3.Nome       := Pensionista[2].Nome;
                  Func1.Pensionista3.CPF        := Pensionista[2].CPF;
                  Func1.Pensionista3.ValorPensao:= Pensionista[2].ValorPensao;
                  Func1.Pensionista3.Valor13    := Pensionista[2].Valor13;
                  Func1.Pensionista4.Nome       := Pensionista[3].Nome;
                  Func1.Pensionista4.CPF        := Pensionista[3].CPF;
                  Func1.Pensionista4.ValorPensao:= Pensionista[3].ValorPensao;
                  Func1.Pensionista4.Valor13    := Pensionista[3].Valor13;
                  Pensionista[0].Nome          := '';
                  Pensionista[0].CPF           := '';
                  Pensionista[0].ValorPensao   := '';
                  Pensionista[0].Valor13       := '';
                  Pensionista[1].Nome          := '';
                  Pensionista[1].CPF           := '';
                  Pensionista[1].ValorPensao   := '';
                  Pensionista[1].Valor13       := '';
                  Pensionista[2].Nome          := '';
                  Pensionista[2].CPF           := '';
                  Pensionista[2].ValorPensao   := '';
                  Pensionista[2].Valor13       := '';
                  Pensionista[3].Nome          := '';
                  Pensionista[3].CPF           := '';
                  Pensionista[3].ValorPensao   := '';
                  Pensionista[3].Valor13       := '';
                end;
            end;

            if (ContFunc = 2) or (cdsDados.eof) then
              Begin
                //Layout do informe - Cabeçalho  - impressora xerox
                writeln(ArquivoTexto, '%!PS');
                writeln(ArquivoTexto, '%XRXrequirements:duplex');
                writeln(ArquivoTexto, '/cm {72 mul 2.545 div} def');
                writeln(ArquivoTexto, '(/var/spool/xerox/Comprovante-2002.cdr_dir/Comprovante-2002.cdr.p00000001.tif) GetTiff');
                writeln(ArquivoTexto, '/Courier 7 selectfont');
                writeln(ArquivoTexto, '595 0 translate');
                writeln(ArquivoTexto, '90 rotate');
                writeln(ArquivoTexto, '2.6 cm 17.0 cm moveto');
                writeln(ArquivoTexto, '(FUNDACAO DOS ECONOMIARIOS FEDERAIS) show');
                writeln(ArquivoTexto, '10.6 cm 17.0 cm moveto');
                writeln(ArquivoTexto, '(00.436.923/0001-90) show');
                writeln(ArquivoTexto, '17.6 cm 17.0 cm moveto');
                writeln(ArquivoTexto, '(FUNDACAO DOS ECONOMIARIOS FEDERAIS) show');
                writeln(ArquivoTexto, '25.3 cm 17.0 cm moveto');
                writeln(ArquivoTexto, '(00.436.923/0001-90) show');
                writeln(ArquivoTexto, '2.6 cm 16.5 cm moveto');
                writeln(ArquivoTexto, '(ASA NORTE) show');
                writeln(ArquivoTexto, '17.6 cm 16.5 cm moveto');
                writeln(ArquivoTexto, '(ASA NORTE) show');
                writeln(ArquivoTexto, '2.6 cm 16.0 cm moveto');
                writeln(ArquivoTexto, '(BRASILIA) show');
                writeln(ArquivoTexto, '9.1 cm 16.0 cm moveto');
                writeln(ArquivoTexto, '(DF) show');
                writeln(ArquivoTexto, '10.6 cm 16.0 cm moveto');
                writeln(ArquivoTexto, '(( XX61 ) 329-1700) show');
                writeln(ArquivoTexto, '17.6 cm 16.0 cm moveto');
                writeln(ArquivoTexto, '(BRASILIA) show');
                writeln(ArquivoTexto, '24.0 cm 16.0 cm moveto');
                writeln(ArquivoTexto, '(DF) show');
                writeln(ArquivoTexto, '25.4 cm 16.0 cm moveto');
                writeln(ArquivoTexto, '(( XX61 ) 329-1700) show');
                //Layout do informe - impressora Xerox
                ContFunc := 0; //zera o contador de funcionários
                writeln(ArquivoTexto, '2.0 cm 14.85 cm moveto');
                writeln(ArquivoTexto, '('+Func.CPF+') show'); //CPF do empregado
                writeln(ArquivoTexto, '5.6 cm 14.85 cm moveto');
                writeln(ArquivoTexto, '('+Func.Nome+') show');       //Nome do empregado
                writeln(ArquivoTexto, '16.8 cm 14.85 cm moveto');
                writeln(ArquivoTexto, '('+Func1.CPF+') show'); //CPF do empregado
                writeln(ArquivoTexto, '20.4 cm 14.85 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Nome+') show');  //Nome do empregado
                writeln(ArquivoTexto, '2.6 cm 14.3 cm moveto');
                writeln(arquivoTexto, '(ASSALARIADO) show');  //natureza do rendimento
                writeln(ArquivoTexto, '17.6 cm 14.3 cm moveto');
                writeln(ArquivoTexto, '(ASSALARIADO) show');  //natureza do rendimento
                writeln(ArquivoTexto, '11.7 cm 13.3 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.TotalRendimentos)+') show');  //total dos rendimentos(Inclusive férias)
                writeln(ArquivoTexto, '26.6 cm 13.3 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.TotalRendimentos)+') show');  //total dos rendimentos(Inclusive férias)
                writeln(ArquivoTexto, '11.7 cm 12.8 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.Contribuicao)+') show'); //contribuição  previdenciaria
                writeln(ArquivoTexto, '26.6 cm 12.8 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.Contribuicao)+') show'); //contribuição  previdenciaria
                writeln(ArquivoTexto, '11.7 cm 12.3 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.Contribuicao1)+') show');  //contribuição a previdêcia privada
                writeln(ArquivoTexto, '26.6 cm 12.3 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.Contribuicao1)+') show'); //contribuição a previdêcia privada
                writeln(ArquivoTexto, '11.7 cm 11.8 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.PensaoAlimenticia)+') show'); //pensão alimentícia
                writeln(ArquivoTexto, '26.6 cm 11.8 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.PensaoAlimenticia)+') show'); //pensão alimentícia
                writeln(ArquivoTexto, '11.7 cm 11.3 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.ImpostoRenda)+') show'); //imposto retido na fonte
                writeln(ArquivoTexto, '26.6 cm 11.3 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.ImpostoRenda)+') show'); //imposto retido na fonte
                writeln(ArquivoTexto, '11.7 cm 10.15 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.ParcelaIsentaProventos)+') show'); //parcela isenta dos proventos
                writeln(ArquivoTexto, '26.6 cm 10.15 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.ParcelaIsentaProventos)+') show'); //parcela isenta dos proventos
                writeln(Arquivotexto, '11.7 cm 9.6 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.DiariasAjudas)+') show'); //diarias e ajudas
                writeln(ArquivoTexto, '26.6 cm 9.6 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.DiariasAjudas)+') show'); //diarias e ajudas
                writeln(ArquivoTexto, '11.7 cm 9.2 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.PensaoProventos)+') show'); //pensão e proventos
                writeln(ArquivoTexto, '26.6 cm 9.2 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.PensaoProventos)+') show'); //pensão e proventos
                writeln(ArquivoTexto, '11.7 cm 8.6 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.LucroDividendo)+') show'); //lucro e dividendo
                writeln(ArquivoTexto, '26.6 cm 8.6 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.LucroDividendo)+') show'); //lucro e dividendo
                writeln(ArquivoTexto, '11.7 cm 8.05 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.ValoresPagos)+') show'); //Valores pagos
                writeln(ArquivoTexto, '26.6 cm 8.05 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.ValoresPagos)+') show'); //Valores pagos
                writeln(ArquivoTexto, '11.7 cm 7.4 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.Indenizacoes)+') show'); //indenizações
                writeln(ArquivoTexto, '26.6 cm 7.4 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.Indenizacoes)+') show'); //indenizações
                writeln(ArquivoTexto, '11.7 cm 7.0 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.Outros)+') show'); //outros
                writeln(ArquivoTexto, '26.6 cm 7.0 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.Outros)+') show'); //outros
                writeln(ArquivoTexto, '11.7 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.DecimoTerceiro)+') show'); //décimo terceiro salário
                writeln(ArquivoTexto, '26.6 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.DecimoTerceiro)+') show'); //décimo terceiro salário
                writeln(ArquivoTexto, '11.7 cm 5.5 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.Outros2)+') show'); //outros
                writeln(ArquivoTexto, '26.6 cm 5.5 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func1.Outros2)+') show'); //outros
                writeln(ArquivoTexto, '1.5 cm 4.3 cm moveto');
                if Trim(Func.Pensionista1.Nome) <> '' then
                   writeln(ArquivoTexto, '('+Func.Pensionista1.Nome+ ' '+Func.Pensionista1.CPF+ ' Total Ren.: '+Func.Pensionista1.ValorPensao + ' 13. '+Func.Pensionista1.Valor13 +') show') //informações complementares (6) beneficiário1
                else
                   writeln(ArquivoTexto, '('+Func.Pensionista1.Nome+ ' '+Func.Pensionista1.CPF+ ' '+Func.Pensionista1.ValorPensao + ' '+Func.Pensionista1.Valor13 +') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '11.7 cm 4.3 cm moveto');
                writeln(ArquivoTexto, '() show'); // informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '16.8 cm 4.3 cm moveto');
                if Trim(Func1.Pensionista1.Nome) <> '' then
                   writeln(ArquivoTexto, '('+Func1.Pensionista1.Nome+ ' '+Func1.Pensionista1.CPF+' Total Ren.: '+Func1.Pensionista1.ValorPensao + ' 13. '+Func1.Pensionista1.Valor13+') show') //informações complementares (6) beneficiário1
                else
                   writeln(ArquivoTexto, '('+Func1.Pensionista1.Nome+ ' '+Func1.Pensionista1.CPF+' '+Func1.Pensionista1.ValorPensao + ' '+Func1.Pensionista1.Valor13+') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '26.6 cm 4.3 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '1.5 cm 4 cm moveto'); //
                if Trim(Func.Pensionista2.Nome) <> '' then
                   writeln(ArquivoTexto, '('+Func.Pensionista2.Nome+ ' '+Func.Pensionista2.CPF+' Total Ren.: '+ Func.Pensionista2.ValorPensao + ' 13.  '+ Func.Pensionista2.Valor13+') show') //informações complementares (6) beneficiário1
                else
                   writeln(ArquivoTexto, '('+Func.Pensionista2.Nome+ ' '+Func.Pensionista2.CPF+' '+ Func.Pensionista2.ValorPensao + ' '+ Func.Pensionista2.Valor13+') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '11.7 cm 4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '16.8 cm 4 cm moveto');
                if Trim(Func1.Pensionista2.Nome) <> '' then
                   writeln(ArquivoTexto, '('+Func1.Pensionista2.Nome+ ' '+Func1.Pensionista2.CPF+' Total Ren.: '+ Func1.Pensionista2.ValorPensao + ' 13. '+ Func1.Pensionista2.Valor13+') show') //informações complementares (6) beneficiário1
                else
                   writeln(ArquivoTexto, '('+Func1.Pensionista2.Nome+ ' '+Func1.Pensionista2.CPF+' '+ Func1.Pensionista2.ValorPensao + ' '+ Func1.Pensionista2.Valor13+') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '26.2 cm 4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '1.5 cm 3.7 cm moveto');
                if Trim(Func.Pensionista3.Nome) <> '' then
                  writeln(ArquivoTexto, '('+Func.Pensionista3.Nome+ ' '+Func.Pensionista3.CPF+' Total Ren.: '+ Func.Pensionista3.ValorPensao + ' 13. '+ Func.Pensionista3.Valor13+ ') show') //informações complementares (6) beneficiário1
                else
                  writeln(ArquivoTexto, '('+Func.Pensionista3.Nome+ ' '+Func.Pensionista3.CPF+' '+ Func.Pensionista3.ValorPensao + ' '+ Func.Pensionista3.Valor13+ ') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '11.3 cm 3.7 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '16.55 cm 3.7 cm moveto');
                if Trim(Func1.Pensionista3.Nome) <> '' then
                   writeln(ArquivoTexto, '('+Func1.Pensionista3.Nome+ ' '+Func1.Pensionista3.CPF+' Total Ren.: '+ Func1.Pensionista3.ValorPensao + ' 13. '+ Func1.Pensionista3.Valor13 +') show') //informações complementares (6) beneficiário1
                else
                   writeln(ArquivoTexto, '('+Func1.Pensionista3.Nome+ ' '+Func1.Pensionista3.CPF+' '+ Func1.Pensionista3.ValorPensao + ' '+ Func1.Pensionista3.Valor13 +') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '26.2 cm 3.7 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '1.5 cm 3.4 cm moveto');
                if Trim(Func.Pensionista4.Nome) <> '' then
                   writeln(ArquivoTexto, '('+Func.Pensionista4.Nome+ ' '+Func.Pensionista4.CPF+' Total Ren.: '+ Func.Pensionista4.ValorPensao + ' 13. '+ Func.Pensionista4.Valor13 + ') show') //informações complementares (6) beneficiário1
                else
                   writeln(ArquivoTexto, '('+Func.Pensionista4.Nome+ ' '+Func.Pensionista4.CPF+' '+ Func.Pensionista4.ValorPensao + ' '+ Func.Pensionista4.Valor13 + ') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '11.3 cm 3.4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '16.55 cm 3.4 cm moveto');
                if Trim(Func1.Pensionista4.Nome) <> '' then
                   writeln(ArquivoTexto, '('+Func1.Pensionista4.Nome+ ' '+Func1.Pensionista4.CPF+' Total Ren.: '+ Func1.Pensionista4.ValorPensao + ' 13. '+ Func1.Pensionista4.Valor13 + ') show') //informações complementares (6) beneficiário1
                else
                   writeln(ArquivoTexto, '('+Func1.Pensionista4.Nome+ ' '+Func1.Pensionista4.CPF+' '+ Func1.Pensionista4.ValorPensao + ' '+ Func1.Pensionista4.Valor13 + ') show'); //informações complementares (6) beneficiário1

                writeln(ArquivoTexto, '26.2 cm 3.4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '11.7 cm 3.8 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10, Func.IrFeriasExigibilidade)+') show');
                writeln(ArquivoTexto, '26.6 cm 3.8 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func1.IrFeriasExigibilidade)+') show');
                writeln(ArquivoTexto, '11.7 cm 3.5 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func.AbonoTribExigibilidade)+') show');
                writeln(ArquivoTexto, '26.6 cm 3.5 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func1.AbonoTribExigibilidade)+') show');
                writeln(ArquivoTexto, '11.7 cm 3.2 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func.CompIrDecJudcial)+') show');
                writeln(ArquivoTexto, '26.6 cm 3.2 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func1.CompIrDecJudcial)+') show');
                writeln(ArquivoTexto, '11.7 cm 2.9 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func.Pams)+') show');
                writeln(ArquivoTexto, '26.6 cm 2.9 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func1.Pams)+') show');
                writeln(ArquivoTexto, '11.7 cm 2.6 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func.DevolucaoPams)+') show');
                writeln(ArquivoTexto, '26.6 cm 2.6 cm moveto');
                writeln(ArquivoTexto, '('+configRelatInforme.strEspacoEsquerda(10,Func1.DevolucaoPams)+') show');
                writeln(ArquivoTexto, '2.6 cm 1.5 cm moveto');
                writeln(ArquivoTexto, '('+edtNome.text+') show'); //nome do responsável
                writeln(ArquivoTexto, '11.7 cm 1.5 cm moveto');
                writeln(ArquivoTexto, '('+dtdtdata.text+') show');  //data de geração
                writeln(ArquivoTexto, '17.6 cm 1.5 cm moveto');
                writeln(ArquivoTexto, '('+edtNome.text+') show'); //nome do responsável
                writeln(ArquivoTexto, '26.6 cm 1.5 cm moveto');
                writeln(ArquivoTexto, '('+dtdtdata.text+') show');  //data de geração
                writeln(ArquivoTexto, 'showpage');
                writeln(ArquivoTexto, '(/var/spool/xerox/Comprovante-2002.cdr_dir/Comprovante-2002.cdr.p00000002.tif) GetTiff');
                writeln(ArquivoTexto, '/Courier 7 selectfont');
                writeln(ArquivoTexto, '595 0 translate');
                writeln(ArquivoTexto, '90 rotate');
                writeln(ArquivoTexto, '10.9 cm 11.55 cm moveto');
                writeln(ArquivoTexto, '('+edtData.text+') show');
                writeln(ArquivoTexto, '25.8 cm 11.55 cm moveto');
                writeln(ArquivoTexto, '('+edtData.text+') show');
                writeln(ArquivoTexto, '1.6 cm 7.95 cm moveto');
                writeln(ArquivoTexto, '('+Func.Nome+') show');       //Nome do empregado
                writeln(ArquivoTexto, '10.8 cm 7.95 cm moveto');
                writeln(ArquivoTexto, '('+Func.Matricula+') show'); //matricula do empregado
                writeln(ArquivoTexto, '16.5 cm 7.95 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Nome+') show');       //Nome do empregado
                writeln(ArquivoTexto, '25.8 cm 7.95 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Matricula+') show'); //matricula do empregado
                writeln(ArquivoTexto, '1.6 cm 7.3 cm moveto');
                writeln(ArquivoTexto, '('+Func.UnidadeLocacao+') show'); //unidade de alocaçào
                writeln(ArquivoTexto, '10.8 cm 7.3 cm moveto');
                writeln(ArquivoTexto, '() show'); //código de alocação
                writeln(ArquivoTexto, '16.5 cm 7.3 cm moveto');
                writeln(ArquivoTexto, '('+Func1.UnidadeLocacao+') show'); //unidade de alocaçào
                writeln(ArquivoTexto, '25.8 cm 7.3 cm moveto');
                writeln(ArquivoTexto, '() show'); //código de alocação
                writeln(ArquivoTexto, '1.6 cm 6.65 cm moveto');
                writeln(ArquivoTexto, '('+Func.Endereco+') show'); //endereço
                writeln(ArquivoTexto, '9.9 cm 6.65 cm moveto');
                writeln(ArquivoTexto, '('+Func.Bairro+') show'); // Bairro
                writeln(ArquivoTexto, '16.5 cm 6.65 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Endereco+') show'); //endereço
                writeln(ArquivoTexto, '24.9 cm 6.65 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Bairro+') show'); // Bairro
                writeln(ArquivoTexto, '1.6 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+Func.Municipio+') show'); //munícipio
                writeln(ArquivoTexto, '9.0 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+Func.UF+') show'); //Uf
                writeln(ArquivoTexto, '9.9 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+copy(Func.Cep, 1, 5)+'-'+copy(Func.Cep, 6, 3)+') show'); // cep
                writeln(ArquivoTexto, '16.5 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Municipio+') show'); //munícipio
                writeln(ArquivoTexto, '24.0 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+Func1.UF+') show'); //Uf
                writeln(ArquivoTexto, '24.9 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+copy(Func1.Cep, 1, 5)+'-'+copy(Func1.Cep, 6, 3)+') show'); // cep
                writeln(ArquivoTexto, 'showpage');
                LimpaReg(Func);
                LimpaReg(Func1);
              end;
        end; //while
    end
  else
    Begin
      MsgDlg('Não há dados a serem gerados.','Aviso',mtWarning,[mbOK],0);
      exit;
    end;
    MsgDlg('Arquivo Gerado com Sucesso','Aviso',mtWarning,[mbOK],0);
end;

procedure TFrmConfigRelatInformeMT.LimpaReg(var Func: Funcionario);
begin
  with Func do
    Begin
      CPF                    := '';
      Nome                   := '';
      TotalRendimentos       := '';
      Contribuicao           := '';
      Contribuicao1          := '';
      PensaoAlimenticia      := '';
      ImpostoRenda           := '';
      ParcelaIsentaProventos := '';
      DiariasAjudas          := '';
      PensaoProventos        := '';
      LucroDividendo         := '';
      ValoresPagos           := '';
      Indenizacoes           := '';
      Outros                 := '';
      DecimoTerceiro         := '';
      Outros2                := '';
      Matricula              := '';
      UnidadeLocacao         := '';
      Endereco               := '';
      Bairro                 := '';
      Municipio              := '';
      UF                     := '';
      Cep                    := '';
      Pams                   := '';
      DevolucaoPams          := '';
      Pensionista1.Nome      := '';
      Pensionista1.CPF       := '';
      Pensionista2.Nome      := '';
      Pensionista2.CPF       := '';
      Pensionista3.Nome      := '';
      Pensionista3.CPF       := '';
      Pensionista4.Nome      := '';
      Pensionista4.CPF       := '';
    end;
end;

procedure TFrmConfigRelatInformeMT.bbtnGeraTxtClick(Sender: TObject);
var sCodNatureza, sNomeArquivo, sLinha, sAno : String;
    rIdPessoa : Double;
    iCodAnt, iCount : LongInt;
    k, iNumDig, i, x : Integer;
    bmrk: TBookmark;
    iModulo : integer;
    bDecJudicial : Boolean; //Indica se já foi gravado no arquivo a informação de decição judicial
Begin
   inherited;

   if SaveDialog1.execute then
     Begin
       sNomeArquivo := savedialog1.filename;
       sAno := edtData.text;
       AssignFile(ArquivoTexto, sNomeArquivo);
       ReWrite(Arquivotexto);
       sqlinforme1.Open;

       Case rgInforme.ItemIndex of
         0 :
            Begin
              bDecJudicial := False;
              sqlDadosTXT.prepare;
              sqlDadosTXT.ParamByName('DataIni').AsString   := '01/01/'+sANO;
              sqlDadosTXT.ParamByName('DataFim').AsString   := '31/12/'+sANO;
              sqlDadosTXT.ParamByName('IdPessoa').AsInteger := Sistema.idEmpresa;
              Case rgSistema.ItemIndex Of
                 0 : sqlDadosTXT.ParamByName('IdModulo').AsInteger := 21;
                 1 : sqlDadosTXT.ParamByName('IdModulo').AsInteger := 18;
                 3 : sqlDadosTXT.ParamByName('IdModulo').AsInteger := 10;
               End;
              sqlDadosTXT.Open;
              prgBarAtuFluxo.Visible  := True;
              prgBarAtuFluxo.Max      := cdsDadosTXT.RecordCount;
              prgBarAtuFluxo.Position := 0;
            end;
         1 :
            Begin
               //geração do informe para a Funcef.
               GeraInformeFuncef;
               CloseFile(ArquivoTexto);
               exit;
            end;
         2 :
            Begin
              //geração do informe para a CBS
              GeraInformeCBS;
              CloseFile(ArquivoTexto);
              exit;
            end;
       end; //fim do case

       iCount    := 0;
       //Gera o Cabeçalho do arquivo texto Refer
       if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then
          sLinha  := '+ DJDE JDE=JOB6,JDL=REFPDL,;'
       else
          sLinha  := '+ DJDE JDE=JOB6A,JDL=REFPDL,END;';
       iNumDig := Length(sLinha);
       sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
       WriteLn(ArquivoTexto, sLinha);
       cdsDadosTXT.First;
       While not cdsDadosTXT.EOF do
         Begin
           rIdPessoa    := cdsDadosTXT.FieldByName('IDPESSOA').AsFloat;
           sCodNatureza := cdsDadosTXT.FieldByName('CODNATUREZA').AsString;
           sqlEnd.prepare;
           sqlEnd.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
           sqlEnd.Open;

           sqlRubrica.prepare;
           sqlRubrica.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
           sqlRubrica.Open;

           //VERIFICA SE EXISTE DECISÃO JUDICIAL PARA ESSE BENEFICIÁRIO
           sqllJud.Prepare;
           sqllJud.ParamByName('IDPESSOA').Asinteger := cdsDadostxt.FieldByName('IDPESSOA').Asinteger;
           sqllJud.ParamByName('DATAINI').Asstring    := '01/01/'+ edtData.Text;
           sqllJud.ParamByName('DATAFIM').AsString   := '31/12/'+ edtData.Text;
           sqllJud.open;
           sqlJud13.Prepare;
           sqlJud13.ParamByName('IDPESSOA').Asinteger := cdsDadostxt.FieldByName('IDPESSOA').Asinteger;
           sqlJud13.ParamByName('DATAINI').Asstring    := '01/01/'+ edtData.Text;
           sqlJud13.ParamByName('DATAFIM').Asstring   := '31/12/'+ edtData.Text;
           sqlJud13.open;

           cdsJud.First;
           while not cdsJud.EOF do
             Begin
               cdsJud13.first;
               if cdsJud13.Locate('IDBENEFIRRF', VarArrayOf([cdsJud.fieldByname('IDBENEFIRRF').Asstring]), [loPartialKey]) then
                  Begin
                    cdsJud.edit;
                    cdsJud.FieldByName('VALOR13').AsFloat := cdsJud13.FieldByName('VALOR').AsFloat;
                    cdsJud.post;
                    cdsJud13.delete;
                  end;
               cdsJud.next;
             end;
           // Fim da pegada da Deciçào Judicial


           Case rgSistema.ItemIndex Of
              0 : iModulo := 21;
              1 : iModulo := 18;
              3 : iModulo := 10;
           End;

           if not ConfigRelatInforme.AtualizaLancIRRF(cdsdadosTxt.fieldByname('IDPESSOA').AsInteger, iModulo,
                                                     cdsdadosTxt.fieldByname('CODNATUREZA').AsString) then
             Begin
               MsgDlg('Erro ao atualizar dados.','Erro',mtWarning,[mbOK],0);
               exit;
             end;

           if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then
             Begin
               sqlAux2.prepare;
               sqlAux2.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
               sqlAux2.Open;
               //Grava Início do Texto da Pessoa
               sLinha  := '+ DJDE FORMAT=REFERV,END;';
               iNumDig := Length(sLinha);
               sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
               WriteLn(ArquivoTexto, sLinha);
             end;
           bmrk := cdsDadosTXT.GetBookmark;
           for k:=1 to 2 do begin
              sLinha  := '11';
              iNumDig := Length(sLinha);
              sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
              WriteLn(ArquivoTexto, sLinha);
              sLinha  := '21'+ConfigRelatInforme.Completa('',6)+Copy(cdsEnd.fieldByname('CPF').AsString,1,3)+'.'+Copy(cdsEnd.fieldByname('CPF').AsString,4,3)+'.'+Copy(cdsEnd.fieldByname('CPF').AsString,7,3)+'-'+Copy(cdsEnd.fieldByname('CPF').AsString,10,2)+ConfigRelatInforme.Completa('',3)+ConfigRelatInforme.Completa(Copy(cdsEnd.fieldByname('NOMEBENEF').AsString,1,36),36);
              iNumDig := Length(sLinha);
              sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
              WriteLn(ArquivoTexto, sLinha);
              //
              if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then
                 sLinha  := '-1'+'BENEFICIOS RECEBIDOS DE ENTIDADE DE PREVIDENCIA PRIVADA'
              else
                 sLinha  := '-1'+cdsDadosTxt.fieldByname('DESCRICAO').AsString;
              iNumDig := Length(sLinha);
              sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
              WriteLn(ArquivoTexto, sLinha);
              iCodAnt := 0;
              While (not cdsDadosTXT.EOF) and
                    (rIdPessoa    = cdsDadosTXT.FieldByName('IDPESSOA').AsFloat) and
                    (sCodNatureza = cdsDadosTXT.FieldByName('CODNATUREZA').AsString) do
                Begin


                  if k = 1 then
                    prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
                  cdsinforme1.First;
                  While not cdsinforme1.EOF do
                    Begin
                      if (cdsinforme1.fieldByname('CODINFORME').AsInteger <= cdsDadosTXT.fieldByname('CODINFORME').AsInteger) and
                         (cdsinforme1.fieldByname('CODINFORME').AsInteger > iCodAnt) then
                         Begin
                           if cdsinforme1.fieldByname('CODINFORME').AsInteger = 301 then
                              sLinha := '32'
                           else
                             if cdsinforme1.fieldByname('CODINFORME').AsInteger = 401 then
                                sLinha := '42'
                             else
                               if cdsinforme1.fieldByname('CODINFORME').AsInteger = 501 then
                                  sLinha := '52'
                               else
                                  if (cdsinforme1.fieldByname('CODINFORME').AsInteger = 405) or (cdsinforme1.fieldByname('CODINFORME').AsInteger = 406) then
                                     sLinha := '02'
                                  else
                                     sLinha := ' 2';
                       sLinha  := sLinha + ConfigRelatInforme.Completa('',59);
                       if (cdsinforme1.fieldByname('CODINFORME').AsInteger = cdsDadosTXT.fieldByname('CODINFORME').AsInteger) then
                          sLinha := sLinha + FuncaoGeral.AD(FormatFloat('#,##0.00;(#,##0.00)',cdsDadosTXT.fieldByname('VLR').AsFloat),14)
                       else
                          sLinha := sLinha + FuncaoGeral.AD(FormatFloat('#,##0.00;(#,##0.00)',0),14);
                       iNumDig := Length(sLinha);
                       sLinha := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
                       WriteLn(ArquivoTexto, sLinha);
                    end;
                    cdsinforme1.Next;
                 end;
                 iCodAnt := cdsDadosTXT.fieldByname('CODINFORME').AsInteger;
                 cdsDadosTXT.Next;
              end;
             cdsinforme1.First;
             While not cdsinforme1.EOF do begin
                if (cdsinforme1.fieldByname('CODINFORME').AsInteger > iCodAnt) then
                  Begin
                    if cdsinforme1.fieldByname('CODINFORME').AsInteger = 301 then
                      sLinha := '32'
                    else
                      if cdsinforme1.fieldByname('CODINFORME').AsInteger = 401 then
                         sLinha := '42'
                      else
                         if cdsinforme1.fieldByname('CODINFORME').AsInteger = 501 then
                            sLinha := '52'
                         else
                            if (cdsinforme1.fieldByname('CODINFORME').AsInteger = 405) or (cdsinforme1.fieldByname('CODINFORME').AsInteger = 406) then
                               sLinha := '02'
                            else
                               sLinha := ' 2';
                   sLinha  := sLinha + ConfigRelatInforme.Completa('',59);
                   sLinha := sLinha + FuncaoGeral.AD(FormatFloat('#,##0.00;(#,##0.00)',0),14);
                   iNumDig := Length(sLinha);
                   sLinha := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
                   WriteLn(ArquivoTexto, sLinha);
                end;
                cdsinforme1.Next;
             end;

             if not cdsRubrica.IsEmpty then
               Begin
                 i := 7;
                 i := i - cdsRubrica.RecordCount;
                 if i < 0 then i := 0;
                 cdsRubrica.First;
                 while (not cdsRubrica.EOF) and (cdsRubrica.RecordCount<=7) do
                   Begin
                     if cdsRubrica.RecordCount = 1 then
                        sLinha  := '62'
                     else
                        sLinha  := ' 2';
                     sLinha  := sLinha +cdsRubrica.fieldByname('NUMDOCUMENTO').AsString+' '+ cdsRubrica.fieldByname('NOME').AsString;
                     iNumDig := Length(sLinha);
                     if cdsRubrica.RecordCount = 7 then
                       Begin
                         sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig-16);
                         sLinha  := sLinha + ConfigRelatInforme.Completa(cdsAux2.fieldByname('MATRICULA').AsString,16);
                      end
                     else
                      Begin
                        sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
                      end;
                    WriteLn(ArquivoTexto, sLinha);
                    cdsRubrica.Next;
                 end;
               end
             else
               Begin
                 i := 6;
                 sLinha  := '62';
                 iNumDig := Length(sLinha);
                 sLinha := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
                 WriteLn(ArquivoTexto, sLinha);
               end;

             for x:=1 to i do begin
                if (x = i) and ((rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3)) then begin
                   sLinha  := ' 2';
                   iNumDig := Length(sLinha);
                   sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig-16);
                   sLinha  := sLinha + ConfigRelatInforme.Completa(cdsAux2.fieldByname('MATRICULA').AsString,16);
                   WriteLn(ArquivoTexto, sLinha);
                end else begin
                   if (not bDecJudicial) and (not cdsJud.IsEmpty) then
                      Begin
                        sLinha  := ' 2';
                        SLinha  := 'Proc.Jud. '+ cdsJud.fieldByname('NUMEROPROCESSO').AsString + ' - ' + cdsJud.fieldByname('DATAINICIO').AsString + '   -   '+  cdsJud.fieldByname('CODVARA').Asstring +'-'+ cdsJud.fieldByname('NOMEVARA').asstring + ' - '+ 'IRRF : '+ FormatFloat('#,##0.00;(#,##0.00)',cdsJud.fieldByname('VALOR').AsFloat) + ' - Total 13º ' + FormatFloat('#,##0.00;(#,##0.00)',cdsJud.fieldByname('VALOR13').AsFloat);
                        iNumDig := Length(sLinha);
                        sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
                        WriteLn(ArquivoTexto, sLinha);
                        bDecJudicial := True;
                      end
                   else
                      Begin
                        sLinha  := ' 2';
                        iNumDig := Length(sLinha);
                        sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
                        WriteLn(ArquivoTexto, sLinha);
                      end;
                end;
             end;

             bDecJudicial := False;
             sLinha  := '+1';
             iNumDig := Length(sLinha);
             sLinha := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);

             if k = 1 then
                cdsDadosTXT.GotoBookmark(bmrk)
          end;
          cdsDadosTXT.FreeBookmark(bmrk);
          iCount := iCount + 1;
          if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then begin
             //Grava Final do Texto da Pessoa
             sLinha  := '+ DJDE FORMAT=REFERF,END;';
             iNumDig := Length(sLinha);
             sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);

             sLinha  := '81';
             iNumDig := Length(sLinha);
             sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);

             sLinha  := '92      '+cdsEnd.fieldByname('NOMEBENEF').AsString;
             iNumDig := Length(sLinha);
             sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);

             sLinha  := ' 2      '+cdsEnd.fieldByname('ENDEREO').AsString+' '+cdsEnd.fieldByname('NUMERO').AsString+' '+cdsEnd.fieldByname('COMPLEMENTO').AsString+' - '+cdsEnd.fieldByname('BAIRRO').AsString;
             iNumDig := Length(sLinha);
             sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);

             sLinha  := ' 2      '+cdsEnd.fieldByname('NOME').AsString+' '+cdsEnd.fieldByname('CEP').AsString+' '+cdsEnd.fieldByname('UF').AsString;
             iNumDig := Length(sLinha);
             sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);

             sLinha  := ' 2';
             iNumDig := Length(sLinha);
             sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);

             sLinha  := ' 2';
             sLinha  := sLinha + ConfigRelatInforme.Completa('',57);
             sLinha  := sLinha + ConfigRelatInforme.CompletaZero(trim(IntToStr(iCount)),5);
             iNumDig := Length(sLinha);
             sLinha  := sLinha + ConfigRelatInforme.Completa('',80-iNumDig);
             WriteLn(ArquivoTexto, sLinha);
          end;
       end;
       CloseFile(ArquivoTexto);
       screen.cursor := crDefault;
       MsgDlg('Arquivo Gerado com Sucesso','Aviso',mtWarning,[mbOK],0);
    end;
end;

procedure TFrmConfigRelatInformeMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Begin
      sql.prepare;
      sql.ParamByName('IDCARTACOBRANCA').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
      sql.Open;
    end;
end;

procedure TFrmConfigRelatInformeMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ConfigRelatInforme.free;
end;

procedure TFrmConfigRelatInformeMT.GeraInformeCBS;
Var
  sVal31, //Total de redimentos
  sVal32, //contribuição previdenciária oficial
  sVal33, //Contribuição à previdência privada
  sVal34, //pensão alimentícia
  sVal35, //Imposto retido na fonte
  sVal41, //Pensão Alimentícia
  sVal42, //Salário família
  sVal43, //Parcela isenta dos proventos de aposentadoria
  sVal44, //Diárias e ajudas de custo
  sVal45, //Pensão, proventos de aposentadoria
  sVal46, //Lucro e dividendo apurado
  sVal47, //Outros. Demais rendimentos isentos
  sVal51, // Décimo Terceiro salário
  sVal52, //Outros(Valor liquido dos demais Rendimentos sujeitos à tributação exclusiva)
  sVal61, //valor do Pams - não me pergunte o que que é isso...
  sVal62, //Valor de devolução do Pams
  sVal63,
  sVal64,
  sVal65,
  CPF, NomeBene, CodNatureza : string;
  rIdPessoa  : Real;
  i : integer;
  Pensionista : Array [0..3] of rPensionista;
begin
  MontaSqlDadostxt;
  prgBarAtuFluxo.Visible  := True;
  prgBarAtuFluxo.Max      := cdsDados.RecordCount;
  prgBarAtuFluxo.Position := 0;
  cdsdados.First;
  if not cdsdados.IsEmpty then
    Begin
      prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
      //Cabeçalho do Arquivo
      writeln(Arquivotexto, '%!');
      writeln(Arquivotexto, '(;) SETDBSEP');
      writeln(Arquivotexto, '600 SETBUFSIZE');
      writeln(Arquivotexto, '(cedulac.dbm) STARTDBM');
      write(ArquivoTexto, 'SEED;NOMECONTRIB;LOGRADOURO;NUMERO;COMPLEMENTO;BAIRRO;CIDADE;CODESTADO;CEP;CGCCBS;TELCBS;NOMECBS;ENDERECOCBS;ANOCALEND;CPFCONTRIB;NOMECCONTRIB;NATUREND;MATRICULA;VAL31;VAL32;VAL33;VAL34;VAL35;VAL41;VAL42;VAL43;VAL44;VAL45;VAL46;VAL47;VAL51;VAL52;VAL61;');
      writeln(ArquivoTexto, 'VAL62;VAL63;VAL64;VAL65;VAL66;VAL67;VAL68;EMPRESA;DATA;OBSERVACAO');
      cdsdados.first;
      //While principal
      while not cdsdados.eof do
        Begin
          sVal31 := '0,00';
          sVal32 := '0,00';
          sVal33 := '0,00';
          sVal34 := '0,00';
          sVal35 := '0,00';
          sVal41 := '0,00';
          sVal42 := '0,00';
          sVal43 := '0,00';
          sVal44 := '0,00';
          sVal45 := '0,00';
          sVal46 := '0,00';
          sVal47 := '0,00';
          sVal51 := '0,00';
          sVal52 := '0,00';
          sVal61 := '0,00';
          sVal62 := '0,00';
          sVal63 := '0,00';
          sVal64 := '0,00';
          sVal65 := '0,00';
          rIdPessoa   := cdsdados.FieldByName('IDPESSOA').AsFloat;
          CPF         := cdsdados.fieldByname('CPF').Asstring;
          NomeBene    := cdsdados.fieldByname('NOMEBENEF').Asstring;
          CodNatureza := cdsdados.fieldByname('CODNATUREZA').Asstring + ' - '+ cdsdados.fieldByname('DESCRICAO').Asstring;

          //Matricula do funcionáro
          sqlMatLocFunc.prepare;
          sqlMatLocFunc.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          sqlMatLocFunc.open;

          //Valores de rendimentos
          sqlPensionista.prepare;
          sqlPensionista.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          sqlPensionista.ParamByName('ANOINI').Asstring  := edtData.Text + '/01';
          sqlPensionista.ParamByName('ANOFIM').Asstring  := edtData.Text + '/12';
          sqlPensionista.ParamByName('DATAINI').Asstring := '01/01/'+ edtData.Text;
          sqlPensionista.ParamByName('DATAFIM').Asstring := '31/12'+ edtData.Text;
          sqlPensionista.Open;
          //Valores de 13º
          sqlPensionista13.sql.clear;
          sqlPensionista13.sql.Append('SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR ');
          sqlPensionista13.sql.Append('  FROM HISTRUBSAL H, PESSOA P, RUBRICAINDIV R, PROVDESC PR ');
          sqlPensionista13.sql.Append(' WHERE H.MES BETWEEN :ANOINI AND :ANOFIM ');
          sqlPensionista13.sql.Append('   AND R.IDPESSOA    = :IDPESSOA ');
          sqlPensionista13.sql.Append('   AND H.IDRUBRICA = R.IDRUBRICA ');
          sqlPensionista13.sql.Append('   AND H.IDRUBRICA = PR.IDPROVENTO ');
          sqlPensionista13.sql.Append('   AND PR.CODRUBCLT = ''50018''');
          sqlPensionista13.sql.Append('   AND R.IDFAVORECIDO = P.IDPESSOA ');
          sqlPensionista13.sql.Append('   AND H.IDPESSOA = R.IDPESSOA ');
          sqlPensionista13.sql.Append('   AND PR.DESCRICAO LIKE ''%13%''');
          sqlPensionista13.sql.Append(' GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME ');
          sqlPensionista13.sql.Append(' UNION ');
          sqlPensionista13.sql.Append(' SELECT R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME, SUM(H.VALORPROVENTO) AS VALOR ');
          sqlPensionista13.sql.Append('   FROM PESSOA P, RUBRICAINDIV R, PROVDESC PR, HISTRUBSAL H ');
          sqlPensionista13.sql.Append('  WHERE R.IDPESSOA    = :IDPESSOA ');
          sqlPensionista13.sql.Append('    AND R.IDPESSOA   = H.IDPESSOA ');
          sqlPensionista13.sql.Append('    AND H.DATAPAGAMENTO BETWEEN :DATAINI AND :DATAFIM ');
          if Trim(edtRubrica.text) <> '' then
             sqlPensionista13.sql.Append('    AND H.IDRUBRICA = :IDRUBRICA ')
          else
             sqlPensionista13.sql.Append('    AND H.IDRUBRICA = R.IDRUBRICA ');

          sqlPensionista13.sql.Append('    AND H.IDRUBRICA = PR.IDPROVENTO ');
          sqlPensionista13.sql.Append('    AND R.IDFAVORECIDO = P.IDPESSOA ');
          sqlPensionista13.sql.Append('    AND R.IDFAVORECIDO = H.IDFAVORECIDO ');
          sqlPensionista13.sql.Append('    AND R.FLGPENSAOALIM   = 1 ');
          sqlPensionista13.sql.Append('    AND R.FLGTPRUBMANUT   = 1 ');
          sqlPensionista13.sql.Append('  GROUP BY R.IDFAVORECIDO, P.NUMDOCUMENTO, P.NOME ');
          sqlPensionista13.sql.Append('  ORDER BY NOME');
          sqlPensionista13.prepare;
          sqlPensionista13.ParamByName('IDPESSOA').AsFloat   := cdsDados.FieldByName('IDPESSOA').AsFloat;
          sqlPensionista13.ParamByName('ANOINI').Asstring    := edtData.Text + '/01';
          sqlPensionista13.ParamByName('ANOFIM').Asstring    := edtData.Text + '/12';
          sqlPensionista13.ParamByName('DATAINI').Asstring     := '01/01/'+ edtData.Text;
          sqlPensionista13.ParamByName('DATAFIM').Asstring     := '31/12'+ edtData.Text;
          if Trim(edtRubrica.text) <> '' then
            sqlPensionista13.ParamByName('IDRUBRICA').Asstring := Trim(edtRubrica.text);
          sqlPensionista13.Open;

          cdsPensionista.First;
            For i := 0 to 3 do
              Begin
                if not cdsPensionista.eof then
                  Begin
                    Pensionista[i].Nome := cdsPensionista.fieldByname('NOME').AsString;
                    Pensionista[i].CPF  := ConfigRelatInforme.FormataCPF(Copy(cdsPensionista.fieldByname('NUMDOCUMENTO').AsString, 1, 11));
                    Pensionista[i].ValorPensao := FormatFloat('#,##0.00;(#,##0.00)',cdsPensionista.fieldByname('VALOR').AsFloat);
                    cdsPensionista13.first;
                    if not cdsPensionista13.fieldByname('IDFAVORECIDO').isnull then
                    if cdsPensionista13.Locate('IDFAVORECIDO', VarArrayOf([cdsPensionista.fieldByname('IDFAVORECIDO').Asstring]), [loPartialKey]) then
                       Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)',cdsPensionista13.fieldByname('VALOR').AsFloat)
                    else
                       Pensionista[i].Valor13 := FormatFloat('#,##0.00;(#,##0.00)',0);

                    cdsPensionista.Next;
                  end;
              end;


          sqlEnd.prepare;
          sqlEnd.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          sqlEnd.Open;

          //este while serve para pegar todos os valores de rendimentos do funcionário
          //pois na query vem 1 valor por linha separado por código
          while (not cdsdados.EOF) and
                (rIdPessoa = cdsdados.FieldByName('IDPESSOA').AsFloat) do
            Begin
              try
                if (cdsdados.fieldByname('VLR1').AsFloat > 0) and (StrToFloat(sVal31) <= 0) then
                    sVal31 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR31').AsFloat);
              except
                sVal31 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR2').AsFloat > 0) and (StrToFloat(sVal32) <= 0) then
                   sVal32 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR32').AsFloat);
              except
                sVal32 :=  '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR3').AsFloat > 0) and (StrToFloat(sVal33) <= 0) then
                   sVal33 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR33').AsFloat);
              except
                  sVal33 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR4').AsFloat > 0) and (StrToFloat(sVal34) <= 0) then
                   sVal34 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR4').AsFloat);
              except
                 sVal34 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR5').AsFloat > 0) and (StrToFloat(sVal35) <= 0) then
                    sVal35 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR5').AsFloat);
              except
                sVal35 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR41').AsFloat > 0) and (StrToFloat(sVal41) <= 0) then
                   sVal41 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR41').AsFloat);
              except
                sVal41 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR42').AsFloat > 0) and (StrToFloat(sVal42) <= 0) then
                   sVal42 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR42').AsFloat);
              except
                sVal42 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR43').AsFloat > 0) and (StrToFloat(sVal43) <= 0) then
                   sVal43 := FormatFloat('#,##0.00;(#,##0.00)', cdsdados.fieldByname('VLR43').AsFloat);
              except
                sVal43 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR44').AsFloat > 0) and (StrToFloat(sVal44) <= 0) then
                   sVal44 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR44').AsFloat);
              except
                sVal44 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR45').AsFloat > 0) and (StrToFloat(sVal45) <= 0) then
                   sVal45 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR45').AsFloat);
              except
                sVal45 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR46').AsFloat > 0) and (StrToFloat(sVal46) <= 0) then
                   sVal46 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR46').AsFloat);
              except
                sVal46 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR47').AsFloat > 0) and (StrToFloat(sVal47) <= 0) then
                   sVal47 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR47').AsFloat);
              except
                sVal47 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR51').AsFloat > 0) and (StrToFloat(sVal51) <= 0) then
                   sVal51 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR51').AsFloat);
              except
                sVal51 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR52').AsFloat > 0) and (StrToFloat(sVal52) <= 0) then
                   sVal52 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR52').AsFloat);
              except
                sVal52 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR61').AsFloat > 0) and (StrToFloat(sVal61) <= 0) then
                   sVal61 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR61').AsFloat);
              except
                sVal61 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR62').AsFloat > 0) and (StrToFloat(sVal62) <= 0) then
                   sVal62 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR62').AsFloat);
              except
                sVal62 := '0,00';
              end;

              try
                if (cdsdados.fieldByname('VLR63').AsFloat > 0) and (StrToFloat(sVal62) <= 0) then
                   sVal63 := FormatFloat('#,##0.00;(#,##0.00)',cdsdados.fieldByname('VLR63').AsFloat);
              except
                sVal63 := '0,00';
              end;
              cdsdados.Next;
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
            end;

          //Corpo do Txt
          write(Arquivotexto, Trim(cdsEnd.fieldByname('NUMSEED').asstring) + ';');
          write(ArquivoTexto, Trim(NomeBene) +';');
          write(ArquivoTexto, Trim(cdsEnd.fieldByname('ENDEREO').asstring) + ';');
          write(ArquivoTexto, Trim(cdsEnd.fieldByname('NUMERO').asstring)+';');
          write(ArquivoTexto, Trim(cdsEnd.fieldByname('COMPLEMENTO').asstring)+';');
          write(ArquivoTexto, Trim(cdsEnd.fieldByname('BAIRRO').asstring)+';');
          write(ArquivoTexto, Trim(cdsEnd.fieldByname('NOME').asstring)+';');
          write(ArquivoTexto, Trim(cdsEnd.fieldByname('UF').asstring)+';');
          write(ArquivoTexto, Trim(cdsEnd.fieldByname('CEP').asstring)+';');
          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('NUMDOCUMENTO').asstring)+';');
          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('TELEFONE').asstring)+';');
          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('RAZAOSOCIAL').asstring)+';');
          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('ENDEREO').asstring)+ ', '+
                              Trim(cdsEmpresaProp.fieldByname('NUMERO').asstring)+ ', '+
                              Trim(cdsEmpresaProp.fieldByname('COMPLEMENTO').asstring)+ ' - '+
                              Trim(cdsEmpresaProp.fieldByname('BAIRRO').asstring)+ ' - CEP.: '+
                              Trim(cdsEmpresaProp.fieldByname('CEP').asstring)+ ' - '+
                              Trim(cdsEmpresaProp.fieldByname('CIDADE').asstring)+ ' - '+
                              Trim(cdsEmpresaProp.fieldByname('UF').asstring)+';');
          write(ArquivoTexto, edtData.text +';');
          write(ArquivoTexto, Trim(CPF)+';');
          write(ArquivoTexto, Trim(NomeBene)+';');
          write(ArquivoTexto, Trim(CodNatureza)+';');
          write(ArquivoTexto, Trim(cdsMatLocFunc.fieldByname('MATRICULA').Asstring)+';');
          write(ArquivoTexto, sVal31 +';');
          write(ArquivoTexto, sVal32 +';');
          write(ArquivoTexto, sVal33 +';');
          write(ArquivoTexto, sVal34 +';');
          write(ArquivoTexto, sVal35 +';');
          write(ArquivoTexto, sVal41 +';');
          write(ArquivoTexto, sVal42 +';');                      
          write(ArquivoTexto, sVal43 +';');
          write(ArquivoTexto, sVal44 +';');
          write(ArquivoTexto, sVal45 +';');
          write(ArquivoTexto, sVal46 +';');
          write(ArquivoTexto, sVal47 +';');
          write(ArquivoTexto, sVal51 +';');
          write(ArquivoTexto, sVal52 +';');
          write(ArquivoTexto, 'AAP/VR - UNIMED  '+ sVal61 +';');
          write(ArquivoTexto, 'Plano Saúde CSN-Fator Moderador  '+ sVal62 +';');
          write(ArquivoTexto, 'Bradesco Seguros-CSN  '+ sVal63 +';');
          write(ArquivoTexto, Trim(Pensionista[0].Nome + ' '+ Pensionista[0].CPF + ' '+ Pensionista[0].ValorPensao) +';'); //VLR64
          write(ArquivoTexto, Trim(Pensionista[1].Nome + ' '+ Pensionista[1].CPF + ' '+ Pensionista[1].ValorPensao)  +';'); //VLR65
          write(ArquivoTexto, Trim(Pensionista[2].Nome + ' '+ Pensionista[2].CPF + ' '+ Pensionista[2].ValorPensao)  +';'); //VLR66
          write(ArquivoTexto, Trim(Pensionista[3].Nome + ' '+ Pensionista[3].CPF + ' '+ Pensionista[3].ValorPensao)  +';'); //VLR67
          write(ArquivoTexto, ';'); //VLR68
          write(ArquivoTexto, Trim(cdsEmpresaProp.fieldByname('RAZAOSOCIAL').asstring) +';');
          write(ArquivoTexto, dtdtdata.text+';');
          writeln(ArquivoTexto, Trim(edtObservacao.text));

        end; //while principal
    end
  else
    Begin
      MsgDlg('Não há dados a serem gerados.','Aviso',mtWarning,[mbOK],0);
      exit;
    end;
    prgBarAtuFluxo.Position := 0;
    MsgDlg('Arquivo Gerado com Sucesso','Aviso',mtWarning,[mbOK],0);
end;

procedure TFrmConfigRelatInformeMT.rgInformeClick(Sender: TObject);
begin
  inherited;
  if rgInforme.ItemIndex = 2 then
     gbObservacao.Visible := True
  else
     gbObservacao.Visible := False;
end;

procedure TFrmConfigRelatInformeMT.edtRubricaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not ((key in ['0'..'9']) or (key in [#9, #16, #27, #8])) then
     Begin
       key := #0;
     end;
end;

procedure TFrmConfigRelatInformeMT.rgSistemaClick(Sender: TObject);
begin
  inherited;
  if rgSistema.ItemIndex = 1 then
     gbRubrica13.Visible := True
  else
     gbRubrica13.Visible := False;
end;

END.

