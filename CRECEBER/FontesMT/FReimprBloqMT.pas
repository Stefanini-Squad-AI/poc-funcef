{-------------------------------------------------------------------------------
------------------------------ ALTERAÇÕES --------------------------------------
--------------------------------------------------------------------------------

Nº SIG......: 70824
Data........: 13/12/2019
Responsável.: Everson Cunha
Descrição...: Retirar a mensagem que pergunta se deseja ou não gerar novo
              Nosso Número. O sistema deve sempre gerar um novo nosso número
--------------------------------------------------------------------------------
Nº SIG......: 29271
Data........: 03/02/2017
Responsável.: William Santana
Descrição...: Modernização Layout
--------------------------------------------------------------------------------
 31/07/2002
    Migração desta tela para o Modelo 3 Camadas - Fábio Barros

Últimas Atualizações:

17/10/2002 - Revisão da Tela - Fábio Barros
--------------------------------------------------------------------------------}

unit FReimprBloqMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FProcuraCliFor, TEdNum, wwdblook, CMDBLookupCombo, uMensErro,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  CMProcuraSubTipo, ExtCtrls, Db, DBTables, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
  DBClient, uCMClientDataSet,
  uCtrlReimprBloq, uCtrlParamIntegra, uCmSqlParams;

type
  TFrmReimprBloqMT = class(TFrmProcuraCliFor)
    dsSel: TwwDataSource;
    Panel2: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    Label5: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CMDBtpdocto: TCMDBLookupCombo;
    dtnossonum: TEditNum;
    BitBtn1: TBitBtn;
    CMDBportforma: TCMDBLookupCombo;
    CMDBUSUARIO: TCMDBLookupCombo;
    CMDBMODULO: TCMDBLookupCombo;
    GroupBox1: TGroupBox;
    dtemissao: TCMDateTimePicker;
    dtemissaofinal: TCMDateTimePicker;
    Panel3: TPanel;
    cdsDoc: TCMClientDataSet;
    sqlPortForma: TCMSqlParams;
    cdsPortForma: TCMClientDataSet;
    sqlModulo: TCMSqlParams;
    cdsModulo: TCMClientDataSet;
    sqlUsuariLanc: TCMSqlParams;
    cdsUsuariLanc: TCMClientDataSet;
    sqlSel: TCMSqlParams;
    cdsSel: TCMClientDataSet;
    cm: TwwDBGrid;
    cdsSelEMISBLOQ: TStringField;
    cdsSelCODDOCUMENTO: TFloatField;
    cdsSelNODOCUMENTO: TFloatField;
    cdsSelDATAEMISSAO: TDateTimeField;
    cdsSelDATAVENCTO: TDateTimeField;
    cdsSelDATAPROGRAMADA: TDateTimeField;
    cdsSelNOSSONUMERO: TStringField;
    cdsSelVALOR: TFloatField;
    cdsSelRAZAOSOCIAL: TStringField;
    cdsSelDESCRDOCTO: TStringField;
    cdsSelDESCRICAO: TStringField;
    cdsSelNOMEMODULO: TStringField;
    cdsSelCONTROLEREMESSA: TFloatField;
    cdsSelNOMEUSUARIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cmCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    //Início - William Santana - SIG 29271
    procedure DataExit(Sender: TObject);
    function ValidaData: Boolean;
    procedure HabiltaOk;
    procedure cdsSelEMISBLOQChange(Sender: TField);
    procedure cmTitleButtonClick(Sender: TObject; AFieldName: String);
    //Término - William Santana - SIG 29271
    procedure LimpaGrid(Sender: TObject);
    procedure dtnossonumKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    _ReimprBloq : TCtrlReimprBloq;
    sOldSQL     : String;
  public
    { Public declarations }
  end;

var
  FrmReimprBloqMT: TFrmReimprBloqMT;
  bLimpaNossoNum : Boolean;

implementation

uses uDataBase, uSistema, dBaseDados;
{$R *.DFM}


procedure TFrmReimprBloqMT.LimpaGrid;
begin
  sqlSel.SQL.Text := sOldSQL;
  sqlSel.Open;
                            
  bbtnConfirmar.Enabled := False; // William Santana - SIG 29271
end;

procedure TFrmReimprBloqMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not _ReimprBloq.GravarReimprBloq(cdsSel.Data, bLimpaNossoNum) then
  begin
    MsgDlg(_ReimprBloq.MessageInfo, 'Erro',mtError,[mbOk],0);
    Exit;
  end
  else
    MsgDlg('Boleto(s) liberado(s) para Reimpressão', 'Sucesso', mtInformation, [mbOk], 0); //Everson Cunha - SIG70824

  CdsSel.Data := _ReimprBloq.ListDocumentos(ParamIntegra.RecPag, Sistema.IDUsuario, Sistema.IDEmpresa,
                 IntToStr(CPForCli.ForCliReg.Id), CMDBMODULO.LookupValue, CMDBtpdocto.LookupValue,
                 dtEmissao.Text, dtEmissaoFinal.Text, dtNossoNum.Text, CMDBportforma.LookupValue,
                 //CMDBTIPOCLI.LookupValue); //William Santana - SIG 29271
                 CMDBUSUARIO.LookupValue); //William Santana - SIG 29271
end;

procedure TFrmReimprBloqMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaGrid(self);
end;

procedure TFrmReimprBloqMT.BitBtn1Click(Sender: TObject);
begin
  inherited;
  //Início - William Santana - SIG 29271
  if not(ValidaData) then
     Exit;
  //Término - William Santana - SIG 29271
    
  //bLimpaNossoNum := False;    //Everson Cunha - SIG70824
  //if MsgDlg('Deseja gerar novo nosso número?', 'Confirmação', MtConfirmation, [mbNo,mbYes], 0) = mrYes then  //Everson Cunha - SIG70824
     bLimpaNossoNum := True;

  cdsSel.Data := _ReimprBloq.ListDocumentos(ParamIntegra.RecPag, Sistema.IDUsuario, Sistema.IDEmpresa,
                 IntToStr(CPForCli.ForCliReg.Id), CMDBMODULO.LookupValue, CMDBtpdocto.LookupValue,
                 dtEmissao.Text, dtEmissaoFinal.Text, dtNossoNum.Text, CMDBportforma.LookupValue,
                 //CMDBTIPOCLI.LookupValue); //William Santana - SIG 29271
                 CMDBUSUARIO.LookupValue); //William Santana - SIG 29271

  //Início - William Santana - SIG 29271
  bbtnConfirmar.Enabled := False;
  if (cdsSel.IsEmpty) then
  MsgDlg('Não existem documentos a exibir utilizando os filtros informados. Favor verifique os filtros e Selecione novamente.',
         'Aviso',mtInformation,[mbOk],0);
  //Término - William Santana - SIG 29271

end;

procedure TFrmReimprBloqMT.FormCreate(Sender: TObject);
begin
  inherited;
  _ReimprBloq := TCtrlReimprBloq.Create;
  _ReimprBloq.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  cdsDoc.Data := _ReimprBloq.ListTipoDoc(ParamIntegra.RecPag, Sistema.IDUsuario);

  sqlPortForma.Open;
  sqlModulo.Open;
  //Início - William Santana - SIG 29271
  //sqlTipoCliente.Open;
  sqlUsuariLanc.Open;

  //Término - William Santana - SIG 29271

  sOldSQL := sqlSel.SQL.Text;

  LimpaGrid(Self);
end;

procedure TFrmReimprBloqMT.cmCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if field.fieldName = 'EMISBLOQ' then
  begin
    ABrush.color := $00BFFFFF;
    AFont.Color  := clBlack;
  end;
end;

procedure TFrmReimprBloqMT.SbAdTodosClick(Sender: TObject);
var
  pos :TBookmark;
begin
  inherited;
  cdsSelEMISBLOQ.OnChange := nil; //William Santana - SIG 29271
  pos := cdsSel.GetBookmark;
  cdsSel.DisableControls;
  cdsSel.First;
  while not cdsSel.EOF do
  begin
    cdsSel.Edit;
    cdsSel.FieldByName('EMISBLOQ').AsString := 'N';
    //cdsSel.Post;  //William Santana - SIG 29271
    cdsSel.Next;
  end;
  cdsSel.GotoBookmark(pos);
  cdsSel.FreeBookmark(pos);
  cdsSel.EnableControls;

  HabiltaOk; //William Santana - SIG 29271
  cdsSelEMISBLOQ.OnChange := cdsSelEMISBLOQChange; //William Santana - SIG 29271
end;

procedure TFrmReimprBloqMT.SbAdInverteClick(Sender: TObject);
var
  pos :TBookmark;
begin
  inherited;
  pos := cdsSel.GetBookmark;
  cdsSel.DisableControls;
  cdsSel.First;
  cdsSelEMISBLOQ.OnChange := nil; //William Santana - SIG 29271
  while not cdsSel.EOF do
  begin
    cdsSel.Edit;
    if cdsSel.FieldByName('EMISBLOQ').AsString = 'S' then
      cdsSel.FieldByName('EMISBLOQ').AsString := 'N'
    else
      cdsSel.FieldByName('EMISBLOQ').AsString := 'S';

    //cdsSel.Post;  //William Santana - SIG 29271
    cdsSel.Next;
  end;
  cdsSel.GotoBookmark(pos);
  cdsSel.FreeBookmark(pos);
  cdsSel.EnableControls;

  HabiltaOk;  //William Santana - SIG 29271
  cdsSelEMISBLOQ.OnChange := cdsSelEMISBLOQChange; //William Santana - SIG 29271

end;

procedure TFrmReimprBloqMT.FormShow(Sender: TObject);
begin
  inherited;
  if CPForCli.CanFocus then  CPForCli.setfocus;
end;

//Início - William Santana - SIG 29271

procedure TFrmReimprBloqMT.DataExit(Sender: TObject);
begin
  inherited;
  if ValidaData then
  else;       
end;

function TFrmReimprBloqMT.ValidaData:Boolean;
begin

 result := True;
 if (dtemissao.Text <> '' ) and (dtemissaofinal.Text <> '' ) then
    if dtemissao.Date > dtemissaofinal.Date then
    begin
     MsgDlg('Preenchimento incorreto do campo Data de Emissão do Documento.', 'Aviso',mtInformation,[mbOk],0);
     result:=False;
    end; 

end;

procedure TFrmReimprBloqMT.cdsSelEMISBLOQChange(Sender: TField);

begin
  inherited;
  HabiltaOk;
end;

procedure TFrmReimprBloqMT.HabiltaOk;
var
  sel : Boolean;
  pos : TBookmark;
begin
  inherited;
  sel := false;
  pos := cdsSel.GetBookmark;
  CdsSel.DisableControls;
  CdsSel.First;
  while not (CdsSel.Eof) do
  begin
    // N = marcado | S = desmarcado
    if (CdsSel.FieldByName('EMISBLOQ').AsString = 'N') and (cdsSel.FieldByName('CODDOCUMENTO').AsString <> '') then
    begin
     sel := True;
     Break;
    end;
    CdsSel.Next;
  end;
  bbtnConfirmar.Enabled := sel;
  cdsSel.GotoBookmark(pos);
  cdsSel.FreeBookmark(pos);
  CdsSel.EnableControls;

end;

procedure TFrmReimprBloqMT.cmTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  vIndice: string;
  vExiste: boolean;
begin
  if cdsSel.IndexFieldNames = AFieldName then
  begin
    vIndice := AnsiUpperCase(AFieldName + '_INV');
 
    try
      cdsSel.IndexDefs.Find(vIndice);
      vExiste := True;
    except
      vExiste := False;
    end;
 
    if not (vExiste) then
    begin
      with cdsSel.IndexDefs.AddIndexDef do
      begin
        Name := vIndice;
        Fields := AFieldName;
        Options := [ixDescending];
      end;
    end;
 
    cdsSel.IndexName := vIndice;
  end
  else
    cdsSel.IndexFieldNames := AFieldName;
end;

procedure TFrmReimprBloqMT.dtnossonumKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not(key in ['0'..'9',#8]) then
   Key := #0; 
end;

//Término - William Santana - SIG 29271    



end.
