unit FConfigReciboMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorioMT, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppRelatv, ppProd, ppReport, ppComm, ppEndUsr, Menus, uCmSqlParams,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, uCtrlParamIntegra, uModulo, ppPrnabl, ppCtrls, ppVar, ppSubRpt,
  ppRegion, ppStrtch, ppMemo, uCtrlDocumento, uExtensoCM, ppModule,
  raCodMod;

type
  TFrmConfigReciboMT = class(TFrmConfigRelatorioMT)
    GpDocumento: TGroupBox;
    LblNoDoc: TLabel;
    LblForne: TLabel;
    LblData: TLabel;
    BtnSeleciona: TBitBtn;
    MsDoc: TMontaSelect;
    RptModeloHeaderBand1: TppHeaderBand;
    RptModeloLabel1: TppLabel;
    RptModeloLabel2: TppLabel;
    RptModeloImage1: TppImage;
    RptModeloDBText1: TppDBText;
    RptModeloDBText2: TppDBText;
    RptModeloLabel3: TppLabel;
    RptModeloDBText3: TppDBText;
    MemExtenso: TppDBMemo;
    RptModeloRegion1: TppRegion;
    RptModeloLabel4: TppLabel;
    RptModeloSummaryBand1: TppSummaryBand;
    RptModeloLabel5: TppLabel;
    RptModeloDBText4: TppDBText;
    RptModeloDBText5: TppDBText;
    RptModeloDBText6: TppDBText;
    RptModeloDBText7: TppDBText;
    RptModeloDBText8: TppDBText;
    RptModeloDBText9: TppDBText;
    RptModeloDBText10: TppDBText;
    RptModeloDBText11: TppDBText;
    RptModeloDBText12: TppDBText;
    RptModeloDBText13: TppDBText;
    RptModeloDBText14: TppDBText;
    RptModeloLabel6: TppLabel;
    RptModeloLabel7: TppLabel;
    RptModeloLabel8: TppLabel;
    RptModeloLabel9: TppLabel;
    RptModeloLabel10: TppLabel;
    RptModeloCalc1: TppCalc;
    RptModeloLabel11: TppLabel;
    RptModeloLine3: TppLine;
    RptModeloShape1: TppShape;
    RptModeloDBText15: TppDBText;
    RptModeloDBText16: TppDBText;
    RptModeloShape2: TppShape;
    RptModeloLine1: TppLine;
    RptModeloLine2: TppLine;
    RptModeloLine4: TppLine;
    RptModeloLine5: TppLine;
    RptModeloLine6: TppLine;
    RptModeloDBText17: TppDBText;
    ppRateio: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    sqlRateioRecibo: TCMSqlParams;
    cdsRateioRecibo: TCMClientDataSet;
    dsRateioRecibo: TwwDataSource;
    ppRateioRecibo: TppBDEPipeline;
    ppRateioReciboppField1: TppField;
    ppRateioReciboppField2: TppField;
    Extenso: TExtensoCM;
    procedure FormCreate(Sender: TObject);
    procedure SelDados; Override;
    procedure BtnSelecionaClick(Sender: TObject);
    function  TestaImpressao : Boolean; Override;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CdsDadosCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    iCodDocumento : Integer;
    Documento     : TCtrlDocumento;
    function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
  public
    { Public declarations }
  end;

var
  FrmConfigReciboMT: TFrmConfigReciboMT;

implementation

uses uSistema, DBaseDados;

{$R *.DFM}



function TFrmConfigReciboMT.CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;



procedure TFrmConfigReciboMT.FormCreate(Sender: TObject);
begin
  cFlag := 'O';
  MsDoc.Filtro.Add ('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MsDoc.Filtro.Add ('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag + '''');
  MsDoc.Filtro.Add('DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and b.idusuario='+IntToStr(Sistema.IDUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+IntToStr(Sistema.IDUsuario)+'))');
  Documento := TCtrlDocumento.Create;
  Documento.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  inherited;
end;

procedure TFrmConfigReciboMT.SelDados;
var
  rValor: Real;
begin
  inherited;
  sqlDados.Prepare;
  sqlDados.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;
  sqlDados.Open;
  while not CdsDados.eof do
  begin
     Documento.Saldo.CalculaSaldo(iCodDocumento);
     rvalor := Documento.Saldo.Valor;
     Extenso.Valor                   := rValor;
     Extenso.SetaMoedaPadrao;
     Extenso.SetaIdiomaPadrao;
     Extenso.Escreve;
     cdsDados.Edit;
     cdsDados.FieldByName('SALDO').AsFloat := rValor;
     cdsDados.FieldByName('EXTENSO').AsString := Extenso.Extenso;
     cdsDados.Post;
     cdsDados.next;
  end;
  sqlRateioRecibo.Prepare;
  sqlRateioRecibo.ParamByName('pCODDOCUMENTO').AsInteger := CdsDados.FieldByName('CODDOCUMENTO').AsInteger;
  sqlRateioRecibo.Open;
end;

procedure TFrmConfigReciboMT.BtnSelecionaClick(Sender: TObject);
begin
  inherited;
  if (MsDoc.Executar = MrOk) and MsDoc.RetornouValor then
  begin
    LblData.Caption  := 'Data Lancto.: ' + MsDoc.ValoresChave[4];
    LblNoDoc.Caption := 'Nº Doc.:'       + MsDoc.ValoresChave[1] + '  ' + MsDoc.ValoresChave[2];
    LblForne.Caption := 'Razão Social: ' + MsDoc.ValoresChave[3];
    iCodDocumento    := StrToInt(MsDoc.ValoresChave[0]);
  end
  else
  begin
    LblData.Caption  := 'Data Lancto.: ';
    LblNoDoc.Caption := 'Nº Doc.:  ';
    LblForne.Caption := 'Razão Social: ';
    iCodDocumento    := 0;
  end;
end;

function TFrmConfigReciboMT.TestaImpressao: Boolean;
begin
  Result := ((iCodDocumento <> 0) And (Trim(CmbModelo.Text) <> ''));
  if Result then
    Result := Modulo.GravaNumFatura(StrToInt(MsDoc.ValoresChave[0]),StrToInt(MsDoc.ValoresChave[5]),MsDoc.ValoresChave[6],'R','');
end;

procedure TFrmConfigReciboMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  DeRelatorio.SetFocus;
end;

procedure TFrmConfigReciboMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  DeRelatorio.SetFocus;
end;

procedure TFrmConfigReciboMT.CdsDadosCalcFields(DataSet: TDataSet);
var
  rValor: Real;
begin
  inherited;
  Documento.Saldo.CalculaSaldo(iCodDocumento, 0);
  rValor   := Documento.Saldo.Valor;
  Extenso.Valor := rValor;
  Extenso.SetaMoedaPadrao;
  Extenso.SetaIdiomaPadrao;
  Extenso.Escreve;

  cdsDados.Edit;
  cdsDados.FieldByName('SALDO').AsFloat := rValor;
  cdsDados.FieldByName('EXTENSO').AsString := Extenso.Extenso;
  cdsDados.Post;
end;

procedure TFrmConfigReciboMT.FormDestroy(Sender: TObject);
begin
  inherited;
  Documento.Free;
end;

end.
