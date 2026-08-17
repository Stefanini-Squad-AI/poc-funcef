unit FConfigRelatInforme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorio, ppClass, ppBands, ppProd, ppReport, ppComm, ppCache,
  ppDB, ppDBBDE, Db, Menus, ppEndUsr, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, MAHlpBtn, TB97Ctls, TB97Tlbr,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ComCtrls, ppCtrls, ppPrnabl, ppStrtch, ppMemo, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, ppRelatv, ppDBPipe,
  CmEventosCadastro, ImgList;

type
  rPensionista = Record
  Nome : string[29];
  CPF : string[11];
  ValorPensao : real;
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
  Pensionista1 : rPensionista;
  Pensionista2 : rPensionista;
  Pensionista3 : rPensionista;
  Pensionista4 : rPensionista;
end;

type
  TFrmConfigRelatInforme = class(TFrmConfigRelatorio)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtData: TEdit;
    UpDown1: TUpDown;
    grpbxResponsavel: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtNome: TEdit;
    dtdtData: TCMDateTimePicker;
    RptModeloShape1: TppShape;
    RptModeloLine1: TppLine;
    RptModeloLabel1: TppLabel;
    RptModeloLabel2: TppLabel;
    RptModeloLabel3: TppLabel;
    RptModeloLabel4: TppLabel;
    RptModeloLabel5: TppLabel;
    RptModeloShape2: TppShape;
    RptModeloLabel6: TppLabel;
    RptModeloLabel7: TppLabel;
    RptModeloLabel8: TppLabel;
    RptModeloLine2: TppLine;
    RptModeloShape3: TppShape;
    RptModeloShape4: TppShape;
    RptModeloLabel9: TppLabel;
    RptModeloLine3: TppLine;
    RptModeloLabel10: TppLabel;
    RptModeloLabel11: TppLabel;
    RptModeloLabel12: TppLabel;
    RptModeloLabel13: TppLabel;
    RptModeloLabel14: TppLabel;
    RptModeloShape5: TppShape;
    RptModeloLine4: TppLine;
    RptModeloShape6: TppShape;
    RptModeloLine5: TppLine;
    RptModeloShape7: TppShape;
    RptModeloLine6: TppLine;
    RptModeloShape8: TppShape;
    RptModeloLine7: TppLine;
    RptModeloShape9: TppShape;
    RptModeloLine8: TppLine;
    RptModeloLabel15: TppLabel;
    RptModeloLabel16: TppLabel;
    RptModeloLabel17: TppLabel;
    RptModeloLabel18: TppLabel;
    RptModeloLabel19: TppLabel;
    RptModeloLabel20: TppLabel;
    RptModeloLabel21: TppLabel;
    RptModeloShape10: TppShape;
    RptModeloLine9: TppLine;
    RptModeloShape11: TppShape;
    RptModeloLine10: TppLine;
    RptModeloShape12: TppShape;
    RptModeloLine11: TppLine;
    RptModeloShape13: TppShape;
    RptModeloLine12: TppLine;
    RptModeloShape14: TppShape;
    RptModeloLine13: TppLine;
    RptModeloLabel22: TppLabel;
    RptModeloLabel23: TppLabel;
    RptModeloLabel24: TppLabel;
    RptModeloLabel25: TppLabel;
    RptModeloLabel26: TppLabel;
    RptModeloShape15: TppShape;
    RptModeloLine14: TppLine;
    RptModeloShape16: TppShape;
    RptModeloLine15: TppLine;
    RptModeloLabel27: TppLabel;
    RptModeloLabel28: TppLabel;
    RptModeloLabel29: TppLabel;
    RptModeloLabel30: TppLabel;
    RptModeloLabel31: TppLabel;
    RptModeloLabel32: TppLabel;
    RptModeloShape17: TppShape;
    RptModeloLine16: TppLine;
    RptModeloShape18: TppShape;
    RptModeloLine17: TppLine;
    RptModeloLabel33: TppLabel;
    RptModeloLabel34: TppLabel;
    RptModeloShape19: TppShape;
    RptModeloLabel35: TppLabel;
    RptModeloLabel36: TppLabel;
    RptModeloShape20: TppShape;
    RptModeloLine18: TppLine;
    RptModeloLabel37: TppLabel;
    RptModeloLine19: TppLine;
    RptModeloLabel38: TppLabel;
    RptModeloLabel39: TppLabel;
    RptModeloLabel40: TppLabel;
    RptModeloLabel41: TppLabel;
    RptModeloDBText1: TppDBText;
    RptModeloDBText2: TppDBText;
    RptModeloDBText3: TppDBText;
    RptModeloDBText4: TppDBText;
    RptModeloDBText5: TppDBText;
    RptModeloDBText6: TppDBText;
    qryAux: TwwQuery;
    qryAuxCODINFORME: TFloatField;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    meCPF: TMaskEdit;
    RptModeloLabel42: TppLabel;
    rgSistema: TRadioGroup;
    qryDadosTXT: TwwQuery;
    qryAux1: TwwQuery;
    qryAux1CODINFORME: TFloatField;
    qryAux2: TwwQuery;
    qryAux2MATRICULA: TStringField;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    bbtnGeraTxt: TBitBtn;
    prgBarAtuFluxo: TProgressBar;
    qryAux3: TwwQuery;
    qryAux3IDFAVORECIDO: TFloatField;
    qryAux3NUMDOCUMENTO: TStringField;
    qryAux3NOME: TStringField;
    qryAux3IDBENEFIRRF: TFloatField;
    qryAux4: TwwQuery;
    qryAux4IDPESSOA: TFloatField;
    qryAux4TIPO: TStringField;
    qryAux4NOMEBENEF: TStringField;
    qryAux4CPF: TStringField;
    qryAux4ENDEREO: TStringField;
    qryAux4NUMERO: TStringField;
    qryAux4COMPLEMENTO: TStringField;
    qryAux4BAIRRO: TStringField;
    qryAux4NOME: TStringField;
    qryAux4CEP: TStringField;
    qryAux4UF: TStringField;
    qryAux4TELEFONE: TStringField;
    qryAux4TIPO_1: TStringField;
    gbMatricula: TGroupBox;
    edMatricula: TEdit;
    qryAux5: TwwQuery;
    qryAux5IDPESSOA: TFloatField;
    qryAux5NUMDOCUMENTO: TStringField;
    qryAux6: TwwQuery;
    qryAux6IDPESSOA: TFloatField;
    qryAux6NUMDOCUMENTO: TStringField;
    qryDadosTXTIDPESSOA: TFloatField;
    qryDadosTXTTIPO: TStringField;
    qryDadosTXTNOMEBENEF: TStringField;
    qryDadosTXTCPF: TStringField;
    qryDadosTXTCODNATUREZA: TStringField;
    qryDadosTXTDESCRICAO: TStringField;
    qryDadosTXTCODINFORME: TFloatField;
    qryDadosTXTVLR: TFloatField;
    qryAux7: TwwQuery;
    qryAux8: TwwQuery;
    qryEmpresaProp: TwwQuery;
    RptModeloMemo1: TppMemo;
    rgInforme: TRadioGroup;
    qryMatLocFunc: TwwQuery;
    qryPensionista: TwwQuery;
    qryPensionistaIDFAVORECIDO: TFloatField;
    qryPensionistaNUMDOCUMENTO: TStringField;
    qryPensionistaNOME: TStringField;
    qryPensionistaIDBENEFIRRF: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure RptModeloBeforePrint(Sender: TObject);
    procedure bbtnGeraTxtClick(Sender: TObject);
    procedure RptModeloMemo1Print(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    ArquivoTexto : TextFile;
    function  Completa(sNome: String; iTam : integer):String;
    function  CompletaZero(sNome: String; iTam : integer):String;
    procedure LimpaReg(var Func : Funcionario);

  public
    { Public declarations }
    bImpressao : Boolean;
    procedure InsereQryPrincipal; Override;
    procedure AbreQueryDados; Override;
    procedure AbreQueryDadosTxt;
    procedure AbreQueryModelo; Override;
    procedure HabilitaImpressao(bImprime:Boolean); Override;
    procedure GeraInformeFuncef;
    function FormataCPF(CPF : string) : string;
    function strEspacoEsquerda(TamanhoTexto : Integer; Texto : string) : string; //preenche uma string com espaços a direita
  end;

var
  FrmConfigRelatInforme: TFrmConfigRelatInforme;

implementation

{$R *.DFM}

Uses uSistema, uDataBase, uFuncaoGeral, uMensErro, uString;


procedure TFrmConfigRelatInforme.InsereQryPrincipal;
Begin
  Qry.FieldByName('IdCartaCobranca').AsFloat := LeUltRegistro(nil,'CARTACOBRANCA');
  Qry.FieldByName('IDREPORTS').AsInteger     := LeUltRegistro(nil,'REPORTS');
  Qry.FieldByName('ORIGEMCM').AsInteger      := 0;
  Qry.FieldByName('FlgTipoCarta').AsString   := 'F';
End;


Procedure TFrmConfigRelatInforme.HabilitaImpressao(bImprime:Boolean);
Begin
  edtData.Text := '1000';
  inherited;
  if bImpressao then
     edtData.Text := IntToStr(StrToInt(Copy(DateToStr(Date),7,4))-1)
  else
     edtData.Text := '1000';
end;


Procedure TFrmConfigRelatInforme.AbreQueryDados;
var sAno : String;
    iIdPessoa : Double;
Begin
   sAno                     := edtData.text;
   iIdPessoa := -1999;
   //
   qryEmpresaProp.Close;
   qryEmpresaProp.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryEmpresaProp.Open;
   if trim(edMatricula.Text) <> '' then begin
      if rgSistema.ItemIndex = 0 then begin
         qryAux8.Close;
         qryAux8.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
         qryAux8.Open;
         iIdPessoa := qryAux8.FieldByName('IDPESSOA').AsFloat;
      end else begin
         qryAux5.Close;
         qryAux5.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
         qryAux5.Open;
         iIdPessoa := qryAux5IDPESSOA.AsFloat;
      end;
   end;
   if trim(meCPF.Text) <> '' then begin
      qryAux6.Close;
      qryAux6.ParamByName('NUMDOCUMENTO').AsString := trim(meCPF.Text)+'       '                                                       ;
      qryAux6.Open;
      iIdPessoa := qryAux6IDPESSOA.AsFloat;
   end;
   //
   qryAux.Close;
   qryAux.Open;
   QryDados.Close;
   QryDados.SQL.Clear;
   QryDados.SQL.Add('SELECT   P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF,  P.NUMDOCUMENTO AS CPF, ');
   QryDados.SQL.Add('         E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ');
   QryDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, ');
   QryDados.SQL.Add('         EN.LOGRADOURO||'', ''||EN.NUMERO||'', ''||EN.COMPLEMENTO AS ENDEREO, ');
   QryDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   QryDados.SQL.Add('         ES.CODESTADO AS UF, ');
   qryAux.First;
   While not qryAux.EOF do begin
      QryDados.SQL.Add('         DECODE(SIGN(SUM(DECODE(XB.CODINFORME,'+qryAuxCODINFORME.AsString+', VLR, 0 ))),-1,0,SUM(DECODE(XB.CODINFORME,'+qryAuxCODINFORME.AsString+', VLR, 0 ))) AS VLR'+trim(qryAuxCODINFORME.AsString)+',');
      qryAux.Next;
   end;
   QryDados.SQL.Add('         (''-'') AS TELEFONE, (''C'') AS  TIPO  ');
   QryDados.SQL.Add('FROM  PESSOA P,PESSOA E, ENDPESS EN, CIDADES C, ESTADO ES, ');
   QryDados.SQL.Add('      NATURENDIMENTO NAT , ');
   QryDados.SQL.Add('      ( SELECT U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME, ');
   QryDados.SQL.Add('               SUM(U.VLR) AS VLR ');
   QryDados.SQL.Add('        FROM ');
   QryDados.SQL.Add('       ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME, ');
   QryDados.SQL.Add('                SUM(DECODE(I.CODDIRF,''6'',(LI.VLRLANC*-1),DECODE(I.CODDIRF,''7'',(LI.VLRLANC*-1),LI.VLRLANC))) AS VLR ');
   QryDados.SQL.Add('        FROM INFORME I, LANCXINFORME LI, LANCIRRF L ');
   QryDados.SQL.Add('        WHERE (I.IDINFORME = LI.IDINFORME) AND ');
   QryDados.SQL.Add('              (LI.IDLANCIRRF = L.IDLANCIRRF) AND ');
   QryDados.SQL.Add('              (L.CODNATUREZA <> ''8888'') AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('              (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('              (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('        GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME) ');
   QryDados.SQL.Add('   UNION ALL ');
   QryDados.SQL.Add('      (SELECT  UL.IDBENEFIRRF, UL.CODNATUREZA, UL.CODINFORME, ');
   QryDados.SQL.Add('               SUM(UL.VLR) AS VLR ');
   QryDados.SQL.Add('       FROM ');
   QryDados.SQL.Add('          ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   QryDados.SQL.Add('                  SUM(L.VLRBASE) AS VLR ');
   QryDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   QryDados.SQL.Add('              WHERE (I.FLGBASE = ''S'') AND ');
   QryDados.SQL.Add('                    (L.CODNATUREZA <> ''8888'') AND ');
   QryDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   QryDados.SQL.Add('           UNION ALL ');
   QryDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   QryDados.SQL.Add('                  SUM(L.VLRIRRF) AS VLR ');
   QryDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   QryDados.SQL.Add('              WHERE (I.FLGIRRF = ''S'') AND ');
   QryDados.SQL.Add('                    (L.CODNATUREZA <> ''8888'') AND ');
   QryDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   QryDados.SQL.Add('           UNION ALL ');
   QryDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   QryDados.SQL.Add('                  SUM(L.VLRINSS) AS VLR  ');
   QryDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   QryDados.SQL.Add('              WHERE (I.CODDIRF = 4) AND ');
   QryDados.SQL.Add('                    (L.CODNATUREZA <> ''8888'') AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   QryDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA)) UL ');
   QryDados.SQL.Add('        GROUP BY UL.IDBENEFIRRF, UL.CODNATUREZA, ');
   QryDados.SQL.Add('                 UL.CODINFORME)) U ');
   QryDados.SQL.Add('        GROUP BY U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME) XB ');
   QryDados.SQL.Add('WHERE  (P.TIPO = ''F'') AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('    (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('       (P.IDPESSOA = XB.IDBENEFIRRF) AND ');
   QryDados.SQL.Add('       (E.IDPESSOA   = '+IntToStr(Sistema.idEmpresa)+') AND ');
   QryDados.SQL.Add('       (NAT.CODNATUREZA   = XB.CODNATUREZA) AND ');
   QryDados.SQL.Add('       (EN.IDENDERECO(+) = E.IDENDCOMERCIAL) AND ');
   QryDados.SQL.Add('       (EN.IDCIDADES     = C.IDCIDADES(+)) AND ');
   QryDados.SQL.Add('       (ES.IDESTADO(+)    = C.IDESTADO) AND ');
   QryDados.SQL.Add('       (EN.IDPESSOA(+)   = E.IDPESSOA) ');
   QryDados.SQL.Add('GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ');
   QryDados.SQL.Add('         E.NUMDOCUMENTO,  E.RAZAOSOCIAL, ');
   QryDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, ');
   QryDados.SQL.Add('         EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, ');
   QryDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   QryDados.SQL.Add('         ES.CODESTADO ');
   QryDados.SQL.Add('ORDER BY  P.RAZAOSOCIAL, NAT.CODNATUREZA ');
   QryDados.ParamByName('sDataIni').AsString      :='01/01/'+sANO;
   QryDados.ParamByName('sDataFim').AsString      :='31/12/'+sANO;
   QryDados.ParamByName('sNumDocumento').AsString := Copy(qryEmpresaProp.fieldByname('NUMDOCUMENTO').AsString,1,8);
   QryDados.Open;
End;

Procedure TFrmConfigRelatInforme.AbreQueryModelo;
Begin
   QryCadModelo.Close;
   QryCadModelo.Open;
End;

procedure TFrmConfigRelatInforme.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDCARTACOBRANCA').AsFloat := -1;
  qry.Open;
end;

procedure TFrmConfigRelatInforme.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin
     qry.Close;
     qry.ParamByName('IDCARTACOBRANCA').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
     qry.Open;
  end;
end;

procedure TFrmConfigRelatInforme.RptModeloBeforePrint(Sender: TObject);
begin
  inherited;
  RptModeloLabel40.Caption := edtNome.Text;
  RptModeloLabel41.Caption := dtdtData.Text;
  RptModeloLabel42.Caption := edtData.text;
end;

procedure TFrmConfigRelatInforme.bbtnGeraTxtClick(Sender: TObject);
var sCodNatureza, sNomeArquivo, sLinha, sAno : String;
    rIdPessoa : Double;
    iCodAnt, iCount : LongInt;
    k, iNumDig, i, x : Integer;
    bmrk: TBookmark;
Begin
   inherited;

   if SaveDialog1.execute then begin
      sNomeArquivo := savedialog1.filename;
      sAno := edtData.text;
      AssignFile(ArquivoTexto, sNomeArquivo);
      ReWrite(Arquivotexto);
      //
      qryAux1.Close;
      qryAux1.Open;
      //
      QryDadosTXT.Close;
      QryDadosTXT.ParamByName('DataIni').AsString   :='01/01/'+sANO;
      QryDadosTXT.ParamByName('DataFim').AsString   :='31/12/'+sANO;
      QryDadosTXT.ParamByName('IdPessoa').AsInteger :=Sistema.idEmpresa;
      Case rgSistema.ItemIndex Of
         0 : QryDadosTXT.ParamByName('IdModulo').AsInteger := 21;
         1 : QryDadosTXT.ParamByName('IdModulo').AsInteger := 18;
         3 : QryDadosTXT.ParamByName('IdModulo').AsInteger := 10;
       End;
      QryDadosTXT.Open;
      //
      prgBarAtuFluxo.Visible  := True;
      prgBarAtuFluxo.Max      := QryDadosTXT.RecordCount;
      prgBarAtuFluxo.Position := 0;
      //

      //se a geração do informe for para a Funcef eu gero o txt nessa rotina e
      //saio do processo, senão eu sigo no processo para gerar o txt da refer.
      if rgInforme.ItemIndex = 1 then
        Begin
         GeraInformeFuncef;
         CloseFile(ArquivoTexto);
         screen.cursor := crDefault;
         exit;
        end;
       ////////////////////////////////////////////////////////////////////////////


      iCount    := 0;
      //
      //Gera o Cabeçalho do arquivo texto
      if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then
         sLinha  := '+ DJDE JDE=JOB6,JDL=REFPDL,;'
      else
         sLinha  := '+ DJDE JDE=JOB6A,JDL=REFPDL,END;';
      iNumDig := Length(sLinha);
      sLinha  := sLinha + Completa('',80-iNumDig);
      WriteLn(ArquivoTexto, sLinha);
      //
      qryDadosTXT.First;
      While not qryDadosTXT.EOF do begin
         rIdPessoa    := qryDadosTXT.FieldByName('IDPESSOA').AsFloat;
         sCodNatureza := qryDadosTXT.FieldByName('CODNATUREZA').AsString;
         //
         qryAux4.Close;
         qryAux4.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
         qryAux4.Open;
         //
         qryAux3.Close;
         qryAux3.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
         qryAux3.Open;
         //
         Try
            StartTransacao;
            qryAux7.Close;
            qryAux7.ParamByName('IDBENEFIRRF').AsFloat   :=  qryDadosTXTIDPESSOA.AsFloat;
           Case rgSistema.ItemIndex Of
              0 : qryAux7.ParamByName('IdModulo').AsInteger := 21;
              1 : qryAux7.ParamByName('IdModulo').AsInteger := 18;
              3 : qryAux7.ParamByName('IdModulo').AsInteger := 10;
           End;
            qryAux7.ParamByName('CODNATUREZA').AsString  :=  qryDadosTXTCODNATUREZA.AsString;
            qryAux7.ExecSQL;
            CommitTransacao;
         Except
            RollBackTransacao;
         End;
         if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then begin
            qryAux2.Close;
            qryAux2.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
            qryAux2.Open;
            //Grava Início do Texto da Pessoa
            sLinha  := '+ DJDE FORMAT=REFERV,END;';
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
         end;
         bmrk := qryDadosTXT.GetBookmark;
         //
         for k:=1 to 2 do begin
            sLinha  := '11';
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            sLinha  := '21'+Completa('',6)+Copy(qryAux4CPF.AsString,1,3)+'.'+Copy(qryAux4CPF.AsString,4,3)+'.'+Copy(qryAux4CPF.AsString,7,3)+'-'+Copy(qryAux4CPF.AsString,10,2)+Completa('',3)+Completa(Copy(qryAux4NOMEBENEF.AsString,1,36),36);
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then
               sLinha  := '-1'+'BENEFÍCIOS RECEBIDOS DE ENTIDADE DE PREVIDÊNCIA PRIVADA'
            else
               sLinha  := '-1'+qryDadosTXTDESCRICAO.AsString;
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            iCodAnt := 0;
            While (not qryDadosTXT.EOF) and
                  (rIdPessoa    = qryDadosTXT.FieldByName('IDPESSOA').AsFloat) and
                  (sCodNatureza = qryDadosTXT.FieldByName('CODNATUREZA').AsString) do begin
               if k = 1 then
                  prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
               qryAux1.First;
               While not qryAux1.EOF do begin
                  if (qryAux1CODINFORME.AsInteger <= qryDadosTXTCODINFORME.AsInteger) and
                     (qryAux1CODINFORME.AsInteger > iCodAnt) then begin
                     if qryAux1CODINFORME.AsInteger = 301 then
                        sLinha := '32'
                     else
                        if qryAux1CODINFORME.AsInteger = 401 then
                           sLinha := '42'
                        else
                           if qryAux1CODINFORME.AsInteger = 501 then
                              sLinha := '52'
                           else
                              if (qryAux1CODINFORME.AsInteger = 405) or (qryAux1CODINFORME.AsInteger = 406) then
                                 sLinha := '02'
                              else
                                 sLinha := ' 2';
                     sLinha  := sLinha + Completa('',59);
                     if (qryAux1CODINFORME.AsInteger = qryDadosTXTCODINFORME.AsInteger) then
                        sLinha := sLinha + FuncaoGeral.AD(FormatFloat('#,##0.00;(#,##0.00)',qryDadosTXTVLR.AsFloat),14)
                     else
                        sLinha := sLinha + FuncaoGeral.AD(FormatFloat('#,##0.00;(#,##0.00)',0),14);
                     iNumDig := Length(sLinha);
                     sLinha := sLinha + Completa('',80-iNumDig);
                     WriteLn(ArquivoTexto, sLinha);
                  end;
                  qryAux1.Next;
               end;
               iCodAnt := qryDadosTXTCODINFORME.AsInteger;
               qryDadosTXT.Next;
            end;
            qryAux1.First;
            While not qryAux1.EOF do begin
               if (qryAux1CODINFORME.AsInteger > iCodAnt) then begin
                  if qryAux1CODINFORME.AsInteger = 301 then
                     sLinha := '32'
                  else
                     if qryAux1CODINFORME.AsInteger = 401 then
                        sLinha := '42'
                     else
                        if qryAux1CODINFORME.AsInteger = 501 then
                           sLinha := '52'
                        else
                           if (qryAux1CODINFORME.AsInteger = 405) or (qryAux1CODINFORME.AsInteger = 406) then
                              sLinha := '02'
                           else
                              sLinha := ' 2';
                  sLinha  := sLinha + Completa('',59);
                  sLinha := sLinha + FuncaoGeral.AD(FormatFloat('#,##0.00;(#,##0.00)',0),14);
                  iNumDig := Length(sLinha);
                  sLinha := sLinha + Completa('',80-iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
               end;
               qryAux1.Next;
            end;
            //
            if not qryAux3.IsEmpty then begin
               i := 7;
               i := i - qryAux3.RecordCount;
               if i < 0 then i := 0;
               qryAux3.First;
               while (not qryAux3.EOF) and (qryAux3.RecordCount<=7) do begin
                  if qryAux3.RecordCount = 1 then
                     sLinha  := '62'
                  else
                     sLinha  := ' 2';
                  sLinha  := sLinha +qryAux3NUMDOCUMENTO.AsString+' '+ qryAux3NOME.AsString;
                  iNumDig := Length(sLinha);
                  if qryAux3.RecordCount = 7 then begin
                     sLinha  := sLinha + Completa('',80-iNumDig-16);
                     sLinha  := sLinha + Completa(qryAux2MATRICULA.AsString,16);
                  end else begin
                     sLinha  := sLinha + Completa('',80-iNumDig);
                  end;
                  WriteLn(ArquivoTexto, sLinha);
                  qryAux3.Next;
               end;
            end else begin
               i := 6;
               sLinha  := '62';
               iNumDig := Length(sLinha);
               sLinha := sLinha + Completa('',80-iNumDig);
               WriteLn(ArquivoTexto, sLinha);
            end;
            //
            for x:=1 to i do begin
               if (x = i) and ((rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3)) then begin
                  sLinha  := ' 2';
                  iNumDig := Length(sLinha);
                  sLinha  := sLinha + Completa('',80-iNumDig-16);
                  sLinha  := sLinha + Completa(qryAux2MATRICULA.AsString,16);
                  WriteLn(ArquivoTexto, sLinha);
               end else begin
                  sLinha  := ' 2';
                  iNumDig := Length(sLinha);
                  sLinha  := sLinha + Completa('',80-iNumDig);
                  WriteLn(ArquivoTexto, sLinha);
               end;
            end;
            //
            sLinha  := '+1';
            iNumDig := Length(sLinha);
            sLinha := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            if k = 1 then
               qryDadosTXT.GotoBookmark(bmrk)
         end;
         qryDadosTXT.FreeBookmark(bmrk);
         iCount := iCount + 1;
         if (rgSistema.ItemIndex = 1) or (rgSistema.ItemIndex = 3) then begin
            //Grava Final do Texto da Pessoa
            sLinha  := '+ DJDE FORMAT=REFERF,END;';
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            sLinha  := '81';
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            sLinha  := '92      '+qryAux4NOMEBENEF.AsString;
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            sLinha  := ' 2      '+qryAux4ENDEREO.AsString+' '+qryAux4NUMERO.AsString+' '+qryAux4COMPLEMENTO.AsString+' - '+qryAux4BAIRRO.AsString;
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            sLinha  := ' 2      '+qryAux4NOME.AsString+' '+qryAux4CEP.AsString+' '+qryAux4UF.AsString;
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            sLinha  := ' 2';
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
            //
            sLinha  := ' 2';
            sLinha  := sLinha + Completa('',57);
            sLinha  := sLinha + CompletaZero(trim(IntToStr(iCount)),5);
            iNumDig := Length(sLinha);
            sLinha  := sLinha + Completa('',80-iNumDig);
            WriteLn(ArquivoTexto, sLinha);
         end;
      end;
      CloseFile(ArquivoTexto);
      screen.cursor := crDefault;
      MsgDlg('Arquivo Gerado com Sucesso','Aviso',mtWarning,[mbOK],0);
   end;
end;

function  TFrmConfigRelatInforme.Completa(sNome: String; iTam : integer):String;
var i : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := sNome + FuncaoGeral.Spc(iTam - i);
end;

function  TFrmConfigRelatInforme.CompletaZero(sNome: String; iTam : integer):String;
var i, k : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := '';
   for k := 1 to (iTam - i) do
      Result := Result + '0';
   Result := Result + sNome;
end;

procedure TFrmConfigRelatInforme.RptModeloMemo1Print(Sender: TObject);
begin
  inherited;
  RptModeloMemo1.Caption := '';
  RptModeloMemo1.Lines.Clear;
  qryAux3.Close;
  qryAux3.ParamByName('IDPESSOA').AsFloat := QryDados.FieldByName('IDPESSOA').AsFloat;
  qryAux3.Open;
  qryAux3.First;
  While not qryAux3.EOF do begin
     RptModeloMemo1.Lines.Add(qryAux3NUMDOCUMENTO.AsString+' - '+ qryAux3NOME.AsString);
     qryAux3.Next;
  end;
end;


procedure TFrmConfigRelatInforme.GeraInformeFuncef;
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
   sVal602 : string; //Valor de devolução do Pams
   sCodNatureza, CPF, NomeBene : string;
   Pensionista : Array [0..3] of rPensionista;
   Func, Func1 : Funcionario; // funcionarios por página
   ContFunc, i : integer;
begin
  qryEmpresaProp.close;
  qryEmpresaProp.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryEmpresaProp.open;

  qryAux1.Close;
  qryAux1.Open;
  //Abre a mesma qry do relatório.
  //AbreQueryDadosTxt;
  AbreQueryDadosTxt;


  qrydados.First;
  if not qrydados.IsEmpty then
    Begin

      ContFunc := 0;
      qrydados.first;
      while not qrydados.eof do
        Begin
          ContFunc := ContFunc + 1;
          rIdPessoa    := qrydados.FieldByName('IDPESSOA').AsFloat;
          sCodNatureza := qrydados.FieldByName('CODNATUREZA').AsString;
          //traz o endereço do empregado
          qryAux4.Close;
          qryAux4.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          qryAux4.Open;
          //
          qryPensionista.Close;
          qryPensionista.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          qryPensionista.Open;

          qryMatLocFunc.Close;
          qryMatLocFunc.ParamByName('IDPESSOA').AsFloat := rIdPessoa;
          qryMatLocFunc.open;

          CPF := qrydados.fieldByname('CPF').Asstring;
          NomeBene := qrydados.fieldByname('NOMEBENEF').Asstring;

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
          Try
            StartTransacao;
            qryAux7.Close;
            qryAux7.ParamByName('IDBENEFIRRF').AsFloat   :=  qrydados.fieldByname('IDPESSOA').AsFloat;
            Case rgSistema.ItemIndex Of
              0 : qryAux7.ParamByName('IdModulo').AsInteger := 21;
              1 : qryAux7.ParamByName('IdModulo').AsInteger := 18;
              3 : qryAux7.ParamByName('IdModulo').AsInteger := 10;
            end;
             qryAux7.ParamByName('CODNATUREZA').AsString  :=  qrydados.fieldByname('CODNATUREZA').AsString;
             qryAux7.ExecSQL;
             CommitTransacao;
          Except
            RollBackTransacao;
          End;

          //Varre a qrydados enquanto houver informes para o funcionário corrente
          While (not qrydados.EOF) and
                (rIdPessoa    = qrydados.FieldByName('IDPESSOA').AsFloat) do
            Begin
              try
                if (qrydados.fieldByname('VLR301').AsFloat > 0) and (StrToFloat(sVal301) <= 0) then
                    sVal301 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR301').AsFloat);
              except
                sVal301 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR302').AsFloat > 0) and (StrToFloat(sVal302) <= 0) then
                   sVal302 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR302').AsFloat);
              except
                sVal302 :=  '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR303').AsFloat > 0) and (StrToFloat(sVal303) <= 0) then
                   sVal303 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR303').AsFloat);
              except
                  sVal303 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR304').AsFloat > 0) and (StrToFloat(sVal304) <= 0) then
                   sVal304 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR304').AsFloat);
              except
                 sVal304 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR305').AsFloat > 0) and (StrToFloat(sVal305) <= 0) then
                    sVal305 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR305').AsFloat);
              except
                sVal305 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR401').AsFloat > 0) and (StrToFloat(sVal401) <= 0) then
                   sVal401 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR401').AsFloat);
              except
                sVal401 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR402').AsFloat > 0) and (StrToFloat(sVal402) <= 0) then
                   sVal402 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR402').AsFloat);
              except
                sVal402 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR403').AsFloat > 0) and (StrToFloat(sVal403) <= 0) then
                   sVal403 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR403').AsFloat);
              except
                sVal403 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR404').AsFloat > 0) and (StrToFloat(sVal404) <= 0) then
                   sVal404 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR404').AsFloat);
              except
                sVal404 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR405').AsFloat > 0) and (StrToFloat(sVal405) <= 0) then
                   sVal405 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR405').AsFloat);
              except
                sVal405 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR406').AsFloat > 0) and (StrToFloat(sVal406) <= 0) then
                   sVal406 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR406').AsFloat);
              except
                sVal406 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR407').AsFloat > 0) and (StrToFloat(sVal407) <= 0) then
                   sVal407 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR407').AsFloat);
              except
                sVal407 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR501').AsFloat > 0) and (StrToFloat(sVal501) <= 0) then
                   sVal501 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR501').AsFloat);
              except
                sVal501 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR502').AsFloat > 0) and (StrToFloat(sVal502) <= 0) then
                   sVal502 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR502').AsFloat);
              except
                sVal502 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR601').AsFloat > 0) and (StrToFloat(sVal601) <= 0) then
                   sVal601 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR601').AsFloat);
              except
                sVal601 := '0,00';
              end;

              try
                if (qrydados.fieldByname('VLR602').AsFloat > 0) and (StrToFloat(sVal602) <= 0) then
                   sVal602 := FormatFloat('#,##0.00;(#,##0.00)',qrydados.fieldByname('VLR602').AsFloat);
              except
                sVal602 := '0,00';
              end;

              qrydados.Next;
              prgBarAtuFluxo.Position := prgBarAtuFluxo.Position + 1;
            end; //whlie qrydados interno

            qryPensionista.First;
            For i := 0 to 3 do
              Begin
                if not qryPensionista.eof then
                  Begin
                    Pensionista[i].Nome := qryPensionistaNOME.AsString;
                    Pensionista[i].CPF  := Copy(qryPensionistaNUMDOCUMENTO.AsString, 1, 11);
                    qryPensionista.Next;
                  end;
              end;

            case ContFunc of
             1 :
                Begin
                  //limpar o record
                  Func.CPF                    := FormataCPF(CPF);
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
                  Func.Matricula              := qryMatLocFunc.fieldByname('MATRICULA').Asstring;
                  Func.UnidadeLocacao         := qryMatLocFunc.fieldByname('NOME').Asstring;
                  Func.Endereco               := qryAux4.fieldByname('ENDEREO').asstring;
                  Func.Bairro                 := qryAux4.fieldByname('BAIRRO').asstring;
                  Func.Municipio              := qryAux4.fieldByname('NOME').asstring;
                  Func.UF                     := qryAux4.fieldByname('UF').asstring;
                  Func.Cep                    := qryAux4.fieldByname('CEP').asstring;
                  Func.Pams                   := sVal601;
                  Func.DevolucaoPams          := sVal602;
                  Func.Pensionista1.Nome      := Pensionista[0].Nome;
                  Func.Pensionista1.CPF       := Pensionista[0].CPF;
                  Func.Pensionista2.Nome      := Pensionista[1].Nome;
                  Func.Pensionista2.CPF       := Pensionista[1].CPF;
                  Func.Pensionista3.Nome      := Pensionista[2].Nome;
                  Func.Pensionista3.CPF       := Pensionista[2].CPF;
                  Func.Pensionista4.Nome      := Pensionista[3].Nome;
                  Func.Pensionista4.CPF       := Pensionista[3].CPF;
                  Pensionista[0].Nome         := '';
                  Pensionista[0].CPF          := '';
                  Pensionista[1].Nome         := '';
                  Pensionista[1].CPF          := '';
                  Pensionista[2].Nome         := '';
                  Pensionista[2].CPF          := '';
                  Pensionista[3].Nome         := '';
                  Pensionista[3].CPF          := '';
                end;
             2 :
                Begin
                  Func1.CPF                    := FormataCPF(CPF);
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
                  Func1.Matricula              := qryMatLocFunc.fieldByname('MATRICULA').Asstring;
                  Func1.UnidadeLocacao         := qryMatLocFunc.fieldByname('NOME').Asstring;
                  Func1.Endereco               := qryAux4.fieldByname('ENDEREO').asstring;
                  Func1.Bairro                 := qryAux4.fieldByname('BAIRRO').asstring;
                  Func1.Municipio              := qryAux4.fieldByname('NOME').asstring;
                  Func1.UF                     := qryAux4.fieldByname('UF').asstring;
                  Func1.Cep                    := qryAux4.fieldByname('CEP').asstring;
                  Func1.Pams                   := sVal601;
                  Func1.DevolucaoPams          := sVal602;
                  Func1.Pensionista1.Nome      := Pensionista[0].Nome;
                  Func1.Pensionista1.CPF       := Pensionista[0].CPF;
                  Func1.Pensionista2.Nome      := Pensionista[1].Nome;
                  Func1.Pensionista2.CPF       := Pensionista[1].CPF;
                  Func1.Pensionista3.Nome      := Pensionista[2].Nome;
                  Func1.Pensionista3.CPF       := Pensionista[2].CPF;
                  Func1.Pensionista4.Nome      := Pensionista[3].Nome;
                  Func1.Pensionista4.CPF       := Pensionista[3].CPF;
                  Pensionista[0].Nome          := '';
                  Pensionista[0].CPF           := '';
                  Pensionista[1].Nome          := '';
                  Pensionista[1].CPF           := '';
                  Pensionista[2].Nome          := '';
                  Pensionista[2].CPF           := '';
                  Pensionista[3].Nome          := '';
                  Pensionista[3].CPF           := '';
                end;
            end;

            if (ContFunc = 2) or (qryDados.eof) then
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
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.TotalRendimentos)+') show');  //total dos rendimentos(Inclusive férias)
                writeln(ArquivoTexto, '26.6 cm 13.3 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.TotalRendimentos)+') show');  //total dos rendimentos(Inclusive férias)
                writeln(ArquivoTexto, '11.7 cm 12.8 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.Contribuicao)+') show'); //contribuição  previdenciaria
                writeln(ArquivoTexto, '26.6 cm 12.8 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.Contribuicao)+') show'); //contribuição  previdenciaria
                writeln(ArquivoTexto, '11.7 cm 12.3 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.Contribuicao1)+') show');  //contribuição a previdêcia privada
                writeln(ArquivoTexto, '26.6 cm 12.3 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.Contribuicao1)+') show'); //contribuição a previdêcia privada
                writeln(ArquivoTexto, '11.7 cm 11.8 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.PensaoAlimenticia)+') show'); //pensão alimentícia
                writeln(ArquivoTexto, '26.6 cm 11.8 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.PensaoAlimenticia)+') show'); //pensão alimentícia
                writeln(ArquivoTexto, '11.7 cm 11.3 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.ImpostoRenda)+') show'); //imposto retido na fonte
                writeln(ArquivoTexto, '26.6 cm 11.3 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.ImpostoRenda)+') show'); //imposto retido na fonte
                writeln(ArquivoTexto, '11.7 cm 10.15 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.ParcelaIsentaProventos)+') show'); //parcela isenta dos proventos
                writeln(ArquivoTexto, '26.6 cm 10.15 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.ParcelaIsentaProventos)+') show'); //parcela isenta dos proventos
                writeln(Arquivotexto, '11.7 cm 9.6 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.DiariasAjudas)+') show'); //diarias e ajudas
                writeln(ArquivoTexto, '26.6 cm 9.6 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.DiariasAjudas)+') show'); //diarias e ajudas
                writeln(ArquivoTexto, '11.7 cm 9.2 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.PensaoProventos)+') show'); //pensão e proventos
                writeln(ArquivoTexto, '26.6 cm 9.2 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.PensaoProventos)+') show'); //pensão e proventos
                writeln(ArquivoTexto, '11.7 cm 8.6 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.LucroDividendo)+') show'); //lucro e dividendo
                writeln(ArquivoTexto, '26.6 cm 8.6 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.LucroDividendo)+') show'); //lucro e dividendo
                writeln(ArquivoTexto, '11.7 cm 8.05 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.ValoresPagos)+') show'); //Valores pagos
                writeln(ArquivoTexto, '26.6 cm 8.05 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.ValoresPagos)+') show'); //Valores pagos
                writeln(ArquivoTexto, '11.7 cm 7.4 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.Indenizacoes)+') show'); //indenizações
                writeln(ArquivoTexto, '26.6 cm 7.4 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.Indenizacoes)+') show'); //indenizações
                writeln(ArquivoTexto, '11.7 cm 7.0 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.Outros)+') show'); //outros
                writeln(ArquivoTexto, '26.6 cm 7.0 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.Outros)+') show'); //outros
                writeln(ArquivoTexto, '11.7 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.DecimoTerceiro)+') show'); //décimo terceiro salário
                writeln(ArquivoTexto, '26.6 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.DecimoTerceiro)+') show'); //décimo terceiro salário
                writeln(ArquivoTexto, '11.7 cm 5.5 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.Outros2)+') show'); //outros
                writeln(ArquivoTexto, '26.6 cm 5.5 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.Outros2)+') show'); //outros
                writeln(ArquivoTexto, '2.2 cm 4.3 cm moveto');
                writeln(ArquivoTexto, '('+Func.Pensionista1.Nome+ ' '+Func.Pensionista1.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '11.7 cm 4.3 cm moveto');
                writeln(ArquivoTexto, '() show'); // informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '17.2 cm 4.3 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Pensionista1.Nome+ ' '+Func1.Pensionista1.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '26.6 cm 4.3 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '2.2 cm 4 cm moveto'); //
                writeln(ArquivoTexto, '('+Func.Pensionista2.Nome+ ' '+Func.Pensionista2.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '11.7 cm 4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '17.2 cm 4 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Pensionista2.Nome+ ' '+Func1.Pensionista2.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '26.2 cm 4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '2.2 cm 3.7 cm moveto');
                writeln(ArquivoTexto, '('+Func.Pensionista3.Nome+ ' '+Func.Pensionista3.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '11.3 cm 3.7 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '17.2 cm 3.7 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Pensionista3.Nome+ ' '+Func1.Pensionista3.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '26.2 cm 3.7 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '2.2 cm 3.4 cm moveto');
                writeln(ArquivoTexto, '('+Func.Pensionista4.Nome+ ' '+Func.Pensionista4.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '11.3 cm 3.4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '17.2 cm 3.4 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Pensionista4.Nome+ ' '+Func1.Pensionista4.CPF+') show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '26.2 cm 3.4 cm moveto');
                writeln(ArquivoTexto, '() show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '2.2 cm 3.1 cm moveto');
                writeln(ArquivoTexto, '(Pams) show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '11.7 cm 3.1 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.Pams)+') show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '17.2 cm 3.1 cm moveto');
                writeln(ArquivoTexto, '(Pams) show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '26.6 cm 3.1 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.Pams)+') show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '2.2 cm 2.8 cm moveto');
                writeln(ArquivoTexto, '(Devolucao do Pams) show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '11.7 cm 2.8 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func.DevolucaoPams)+') show'); //informações complementares (6) beneficiário2
                writeln(ArquivoTexto, '17.2 cm 2.8 cm moveto');
                writeln(ArquivoTexto, '(Devolucao do Pams) show'); //informações complementares (6) beneficiário1
                writeln(ArquivoTexto, '26.6 cm 2.8 cm moveto');
                writeln(ArquivoTexto, '('+strEspacoEsquerda(10, Func1.DevolucaoPams)+') show'); //informações complementares (6) beneficiário2
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
                writeln(ArquivoTexto, '8.8 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+Func.UF+') show'); //Uf
                writeln(ArquivoTexto, '9.9 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+copy(Func.Cep, 1, 5)+'-'+copy(Func.Cep, 6, 3)+') show'); // cep
                writeln(ArquivoTexto, '16.5 cm 5.95 cm moveto');
                writeln(ArquivoTexto, '('+Func1.Municipio+') show'); //munícipio
                writeln(ArquivoTexto, '23.8 cm 5.95 cm moveto');
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



procedure TFrmConfigRelatInforme.AbreQueryDadosTxt;
var sAno : String;
    iIdPessoa : Double;
Begin
   sAno                     := edtData.text;
   iIdPessoa := -1999;
   //
   qryEmpresaProp.Close;
   qryEmpresaProp.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryEmpresaProp.Open;
   if trim(edMatricula.Text) <> '' then begin
      if rgSistema.ItemIndex = 0 then begin
         qryAux8.Close;
         qryAux8.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
         qryAux8.Open;
         iIdPessoa := qryAux8.FieldByName('IDPESSOA').AsFloat;
      end else begin
         qryAux5.Close;
         qryAux5.ParamByName('MATRICULA').AsString := trim(edMatricula.Text)+'%';
         qryAux5.Open;
         iIdPessoa := qryAux5IDPESSOA.AsFloat;
      end;
   end;
   if trim(meCPF.Text) <> '' then begin
      qryAux6.Close;
      qryAux6.ParamByName('NUMDOCUMENTO').AsString := trim(meCPF.Text)+'       '                                                       ;
      qryAux6.Open;
      iIdPessoa := qryAux6IDPESSOA.AsFloat;
   end;
   //
   qryAux.Close;
   qryAux.Open;
   QryDados.Close;
   QryDados.SQL.Clear;
   QryDados.SQL.Add('SELECT   P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL AS NOMEBENEF,  P.NUMDOCUMENTO AS CPF, ');
   QryDados.SQL.Add('         E.NUMDOCUMENTO AS CGC,  E.RAZAOSOCIAL AS FONTE, ');
   QryDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, ');
   QryDados.SQL.Add('         EN.LOGRADOURO||'', ''||EN.NUMERO||'', ''||EN.COMPLEMENTO AS ENDEREO, ');
   QryDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   QryDados.SQL.Add('         ES.CODESTADO AS UF, ');
   qryAux.First;
   While not qryAux.EOF do begin
      QryDados.SQL.Add('         DECODE(SIGN(SUM(DECODE(XB.CODINFORME,'+qryAuxCODINFORME.AsString+', VLR, 0 ))),-1,0,SUM(DECODE(XB.CODINFORME,'+qryAuxCODINFORME.AsString+', VLR, 0 ))) AS VLR'+trim(qryAuxCODINFORME.AsString)+',');
      qryAux.Next;
   end;
   QryDados.SQL.Add('         (''-'') AS TELEFONE, (''C'') AS  TIPO  ');
   QryDados.SQL.Add('FROM  PESSOA P,PESSOA E, ENDPESS EN, CIDADES C, ESTADO ES, ');
   QryDados.SQL.Add('      NATURENDIMENTO NAT , ');
   QryDados.SQL.Add('      ( SELECT U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME, ');
   QryDados.SQL.Add('               SUM(U.VLR) AS VLR ');
   QryDados.SQL.Add('        FROM ');
   QryDados.SQL.Add('       ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME, ');
   QryDados.SQL.Add('               SUM(DECODE(I.CODDIRF,6,LI.VLRLANC*-1,DECODE(I.CODDIRF,7,LI.VLRLANC*-1,LI.VLRLANC))) AS VLR ');
   QryDados.SQL.Add('        FROM INFORME I, LANCXINFORME LI, LANCIRRF L ');
   QryDados.SQL.Add('        WHERE (I.IDINFORME = LI.IDINFORME) AND ');
   QryDados.SQL.Add('              (LI.IDLANCIRRF = L.IDLANCIRRF) AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('              (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('              (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('        GROUP BY L.IDBENEFIRRF, L.CODNATUREZA, I.CODINFORME) ');
   QryDados.SQL.Add('   UNION ALL ');
   QryDados.SQL.Add('      (SELECT  UL.IDBENEFIRRF, UL.CODNATUREZA, UL.CODINFORME, ');
   QryDados.SQL.Add('               SUM(UL.VLR) AS VLR ');
   QryDados.SQL.Add('       FROM ');
   QryDados.SQL.Add('          ((SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   QryDados.SQL.Add('                  SUM(L.VLRBASE) AS VLR ');
   QryDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   QryDados.SQL.Add('              WHERE (I.FLGBASE = ''S'') AND ');
   QryDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   QryDados.SQL.Add('           UNION ALL ');
   QryDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   QryDados.SQL.Add('                  SUM(L.VLRIRRF) AS VLR ');
   QryDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   QryDados.SQL.Add('              WHERE (I.FLGIRRF = ''S'') AND ');
   QryDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA) ');
   QryDados.SQL.Add('           UNION ALL ');
   QryDados.SQL.Add('          (SELECT L.IDBENEFIRRF, L.CODNATUREZA, MIN(I.CODINFORME) AS CODINFORME, ');
   QryDados.SQL.Add('                  SUM(L.VLRINSS) AS VLR  ');
   QryDados.SQL.Add('              FROM INFORME I, LANCIRRF L ');
   QryDados.SQL.Add('              WHERE (I.CODDIRF = 4) AND ');
   if rgSistema.ItemIndex = 1 then
      QryDados.SQL.Add('                 (L.IDMODULO = 18) AND ');
   if rgSistema.ItemIndex = 0 then
      QryDados.SQL.Add('                 (L.IDMODULO = 21) AND ');
   if rgSistema.ItemIndex = 3 then
      QryDados.SQL.Add('                 (L.IDMODULO = 10) AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('                 (L.IDBENEFIRRF = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('                    (NOT EXISTS (SELECT I.IDLANCIRRF FROM LANCXINFORME I WHERE L.IDLANCIRRF = I.IDLANCIRRF)) AND ');
   QryDados.SQL.Add('                    (L.DATALANCAMENTO BETWEEN TO_DATE(:sDataIni,''DD/MM/YYYY'') AND TO_DATE(:sDataFim,''DD/MM/YYYY'')) AND ');
   QryDados.SQL.Add('                    (SUBSTR(L.NUMDOCUMENTO,1,8) = :sNumDocumento) ');
   QryDados.SQL.Add('              GROUP BY L.IDBENEFIRRF, L.CODNATUREZA)) UL ');
   QryDados.SQL.Add('        GROUP BY UL.IDBENEFIRRF, UL.CODNATUREZA, ');
   QryDados.SQL.Add('                 UL.CODINFORME)) U ');
   QryDados.SQL.Add('        GROUP BY U.IDBENEFIRRF, U.CODNATUREZA, U.CODINFORME) XB ');
   QryDados.SQL.Add('WHERE  (P.TIPO = ''F'') AND ');
   if iIdPessoa <> -1999  then begin
      QryDados.SQL.Add('    (P.IDPESSOA = '+FloatToStr(iIdPessoa)+') AND ');
   end;
   QryDados.SQL.Add('       (P.IDPESSOA = XB.IDBENEFIRRF) AND ');
   QryDados.SQL.Add('       (E.IDPESSOA   = '+IntToStr(Sistema.idEmpresa)+') AND ');
   QryDados.SQL.Add('       (NAT.CODNATUREZA   = XB.CODNATUREZA) AND ');
   QryDados.sql.Add('       (LTRIM(RTRIM(NAT.CODNATUREZA)) = ''0561'') AND ');
   QryDados.SQL.Add('       (EN.IDENDERECO(+) = E.IDENDCOMERCIAL) AND ');
   QryDados.SQL.Add('       (EN.IDCIDADES     = C.IDCIDADES(+)) AND ');
   QryDados.SQL.Add('       (ES.IDESTADO(+)    = C.IDESTADO) AND ');
   QryDados.SQL.Add('       (EN.IDPESSOA(+)   = E.IDPESSOA) ');
   QryDados.SQL.Add('GROUP BY P.IDPESSOA, P.TIPO,  P.RAZAOSOCIAL,  P.NUMDOCUMENTO, ');
   QryDados.SQL.Add('         E.NUMDOCUMENTO,  E.RAZAOSOCIAL, ');
   QryDados.SQL.Add('         NAT.CODNATUREZA,  NAT.DESCRICAO, ');
   QryDados.SQL.Add('         EN.LOGRADOURO,EN.NUMERO,EN.COMPLEMENTO, ');
   QryDados.SQL.Add('         EN.NUMERO,  EN.COMPLEMENTO,  EN.BAIRRO,  C.NOME,  EN.CEP, ');
   QryDados.SQL.Add('         ES.CODESTADO ');
   QryDados.SQL.Add('ORDER BY P.RAZAOSOCIAL, P.IDPESSOA');
   QryDados.ParamByName('sDataIni').AsString      :='01/01/'+sANO;
   QryDados.ParamByName('sDataFim').AsString      :='31/12/'+sANO;
   QryDados.ParamByName('sNumDocumento').AsString := Copy(qryEmpresaProp.fieldByname('NUMDOCUMENTO').AsString,1,8);
   QryDados.Open;
End;

function TFrmConfigRelatInforme.FormataCPF(CPF: string): string;
begin
  Result := Copy(CPF,1,3)+'.'+Copy(CPF,4,3)+'.'+Copy(CPF,7,3)+'-'+Copy(CPF,10,2);
end;

function TFrmConfigRelatInforme.strEspacoEsquerda(TamanhoTexto: Integer;
                                                  Texto: string): string;
var
  numEspacos : integer;
  f          : integer;
  Espacos    : string;
begin
  Espacos := '';
  numEspacos := tamanhoTexto - length(texto);

  for f := 1 to numEspacos do
    Espacos := Espacos + ' ';

  result := Espacos + texto;
end;

procedure TFrmConfigRelatInforme.LimpaReg(var Func: Funcionario);
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
      Func.Pams              := '';
      Func.DevolucaoPams     := '';
      Func.Pensionista1.Nome := '';
      Func.Pensionista1.CPF  := '';
      Func.Pensionista2.Nome := '';
      Func.Pensionista2.CPF  := '';
      Func.Pensionista3.Nome := '';
      Func.Pensionista3.CPF  := '';
      Func.Pensionista4.Nome := '';
      Func.Pensionista4.CPF  := '';
    end;
end;

end.

