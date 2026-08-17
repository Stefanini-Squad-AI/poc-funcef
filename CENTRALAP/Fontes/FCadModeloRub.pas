(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000
 - 04/10/2000
   Alteração do "Cadastro de Modelos de RUBS" para "Cadastro de Tipos de Arquivo".
   Inclusão da classificação do Tipo de Arquivo (RUBS, Carta, Etiqueta, Termo);
*******************************************************************************)

unit FCadModeloRub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, Mask, wwdbedit,
  ExtCtrls, DBCtrls, FCadastroCS, CmEventosCadastro, ImgList, urubs,
  Wwdotdot, Wwdbcomb {$IFNDEF Versao05} ,UcmTypes  {$ELSE} ,uComum {$ENDIF};

type
  TFrmCadModeloRub = class(TfrmCadMestreDetalheCS)
    LblRubs: TLabel;
    LblArqTexto: TLabel;
    LblSep: TLabel;
    EdtDescModeloRub: TwwDBEdit;
    EdtNomeArqTxt: TwwDBEdit;
    EdtSepCol: TwwDBEdit;
    SpeedButton1: TSpeedButton;
    qryDESCRUB: TStringField;
    qryNOMETXTRUB: TStringField;
    qrySEPARADORCOLUNAS: TStringField;
    QryListaCampos: TwwQuery;
    Label4: TLabel;
    EdtDescHeader: TwwDBEdit;
    DlgTxt: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    EdtLargura: TwwDBEdit;
    QryCompoTxt: TwwQuery;
    QryCompoTxtCAMPODETALHE: TStringField;
    QryCompoTxtLARGURACOLUNA: TFloatField;
    QryCompoTxtDESCHEADERRUBS: TStringField;
    UpdCompoTxt: TUpdateSQL;
    qryNUMDIASCARTAAVISO: TFloatField;
    EdtDiasCarta: TwwDBEdit;
    LblNunDiasCarta: TLabel;
    DBCheckBox1: TDBCheckBox;
    Bevel1: TBevel;
    QryCompoTxtIDDETALHERUBS: TFloatField;
    qryIDCONFIGRUBS: TFloatField;
    QryCompoTxtIDCONFIGRUBS: TFloatField;
    qryNUMDIASCANCEL: TFloatField;
    EdtDiasCancela: TwwDBEdit;
    LblNumdDiasCancela: TLabel;
    Bevel3: TBevel;
    qryFLGDELIMITALINHA: TStringField;
    Bevel2: TBevel;
    RgTipoArq: TDBRadioGroup;
    qryFLGTIPOARQUIVO: TStringField;
    qrylistecampo1: TwwQuery;
    CmbNomeColuna: TwwDBComboBox;
    qryDetDocs: TwwQuery;
    dslistecampo1: TwwDataSource;
    qryDetDependIRRF: TwwQuery;
    dsDetDependIRRF: TwwDataSource;
    qryDetTelefones: TwwQuery;
    dsDetTelefones: TwwDataSource;
    qryDetDependentes: TwwQuery;
    qryDetBeneficiarios: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmbNomeColuna1Exit(Sender: TObject);
    procedure RgTipoArqChange(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure EdtLarguraExit(Sender: TObject);
  private
    procedure SelecionaFilhos;
  public
    { Public declarations }
  end;

var
  FrmCadModeloRub: TFrmCadModeloRub;

implementation

{$R *.DFM}

Uses uFuncaogeral, uMensErro, uDataBase, FPrincipal, DRubs;

procedure TFrmCadModeloRub.FormCreate(Sender: TObject);
Var
  X:Integer;
begin
  CmbNomeColuna.Items.Clear;

  // Tavares - 21/02/2003
  if dtmRubs.MontaQueryEmissao(-1, QryListeCampo1, qryDetDocs, qryDetDependIRRF, qryDetTelefones, qryDetDependentes, qryDetBeneficiarios ) then
  begin
    For X:=0 To QryListeCampo1.FieldCount - 1 Do
      CmbNomeColuna.Items.Add(QryListeCampo1.Fields[x].FieldName);
  end;
  QryListeCampo1.Close;


  inherited;
end;

Procedure TFrmCadModeloRub.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryIDCONFIGRUBS.AsFloat := LeultRegistro(nil,'CONFIGRUBS');
  qryFLGTIPOARQUIVO.AsString := 'R';
  If EdtDescModeloRub.CanFocus Then EdtDescModeloRub.SetFocus;

  SelecionaFilhos;
End;

Procedure TFrmCadModeloRub.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If EdtDescModeloRub.CanFocus Then EdtDescModeloRub.SetFocus;
End;

Procedure TFrmCadModeloRub.CmeCadastroConfirma(Sender: TObject);
begin
  If CmeCadastro.Operacao In [OpInserir,OpAlterar] Then
    AplicaAlteracoes([qry,QryCompoTxt])
  Else
    AplicaAlteracoes([QryCompoTxt,qry]);

  Inherited;
End;

Procedure TFrmCadModeloRub.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  FechaQry([Qry,QryCompoTxt],false,false);
  Qry.ParamByName('IDCONFIGRUBS').AsFloat := 0;
  Qry.Open;
  QryCompoTxt.ParamByName('IDCONFIGRUBS').AsFloat := 0;
  QryCompoTxt.Open;
End;

procedure TFrmCadModeloRub.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  If CmbNomeColuna.CanFocus Then CmbNomeColuna.SetFocus;
  if not (QryCompoTxt.state = dsInsert) then
    QryCompoTxt.Insert;
  QryCompoTxtIDCONFIGRUBS.AsFloat := QryIDCONFIGRUBS.AsFloat;
  QryCompoTxtIDDETALHERUBS.AsFloat := LeUltRegistro(nil,'DETALHERUBS');
End;

procedure TFrmCadModeloRub.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  If CmbNomeColuna.CanFocus Then CmbNomeColuna.SetFocus;
  if not (QryCompoTxt.state = dsEdit) then
    QryCompoTxt.Edit;
End;

Procedure TFrmCadModeloRub.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := False;

   If Trim(EdtDescModeloRub.text) = '' Then
   Begin
     MsgDlg('Descrição do Modelo Não Pode Estar Em Branco','Composição do Header', mtError, [mbOk],0);
     If EdtDescModeloRub.CanFocus Then EdtDescModeloRub.SetFocus;
     Exit;
   End;

   Accept := True;
End;

Procedure TFrmCadModeloRub.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
   Begin

      with qry Do
      Begin
         If Active Then Close;

         ParamByName('IDCONFIGRUBS').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
         Open;
      End;

      SelecionaFilhos;

   End;
End;

procedure TFrmCadModeloRub.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If DlgTxt.Execute Then
     qryNOMETXTRUB.AsString := DlgTxt.FileName;
end;

procedure TFrmCadModeloRub.bbtnOkDetClick(Sender: TObject);
begin
  If Trim(EdtDescHeader.text) = '' Then
  Begin
    MsgDlg('Descrição do Header Não Pode Estar Em Branco','Composição do Header', mtError, [mbOk],0);
    Exit;
  End;

  If Trim(CmbNomeColuna.text) = '' Then
  Begin
    MsgDlg('Nome da Coluna Não Pode Estar Em Branco','Composição do Detalhe', mtError, [mbOk],0);
    Exit;
  End;

  inherited;
end;

procedure TFrmCadModeloRub.CmbNomeColuna1Exit(Sender: TObject);
begin
  inherited;
  If (QryCompoTxt.State In [DsEdit,DsInsert]) And
     QryCompoTxtDESCHEADERRUBS.IsNull Then
     QryCompoTxtDESCHEADERRUBS.AsString := CmbNomeColuna.Text;
end;

procedure TFrmCadModeloRub.SelecionaFilhos;
Begin
   with QryCompoTxt Do
   Begin
      If Active Then
      Begin
        If UpdatesPending Then CancelUpdates;
        Close;
      End;

      ParamByName('IDCONFIGRUBS').AsFloat := QryIDCONFIGRUBS.AsFloat;
      Open;
   End;
End;

procedure TFrmCadModeloRub.RgTipoArqChange(Sender: TObject);
begin
  inherited;
  LblNunDiasCarta.Enabled := (RgTipoArq.ItemIndex = 0);
  LblNumdDiasCancela.Enabled := LblNunDiasCarta.Enabled;
  EdtDiasCarta.Enabled := LblNunDiasCarta.Enabled;
  EdtDiasCancela.Enabled := LblNunDiasCarta.Enabled;
end;

procedure TFrmCadModeloRub.bbtnConfirmarClick(Sender: TObject);
begin
  FazerVoltarDet;
  inherited;

end;

procedure TFrmCadModeloRub.EdtLarguraExit(Sender: TObject);
begin
  inherited;
  bbtnokdet.setfocus;
end;

end.
