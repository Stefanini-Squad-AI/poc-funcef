unit FAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, DBTables, Db, Wwdatsrc, wwQuery, Grids, Wwdbigrd,
  Wwdbgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Outline;

type
  TFrmAvaliacao = class(TfrmOkCancelar)
    plnGrd: TPanel;
    Panel1: TPanel;
    Grd: TwwDBGrid;
    qryTipo: TwwQuery;
    dsTipo: TwwDataSource;
    qryCrit: TwwQuery;
    dsDet: TwwDataSource;
    qryDet: TwwQuery;
    upDet: TUpdateSQL;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    LbForn: TLabel;
    Label3: TLabel;
    LbNota: TLabel;
    GrdCrit: TwwDBGrid;
    dsCrit: TwwDataSource;
    qryCritIDCRITAVALIACAO: TFloatField;
    qryCritDESCCRITAVALIACAO: TStringField;
    qryCritPESO: TFloatField;
    qryCritNOTA: TFloatField;
    qryTipoIDTIPOAVALIACAO: TFloatField;
    qryTipoDESCTIPOAVALIACAO: TStringField;
    updCrit: TUpdateSQL;
    qryCritIDTIPOAVALIACAO: TFloatField;
    qryDetIDAVALIACAO: TFloatField;
    qryDetIDCRITAVALIACAO: TFloatField;
    qryDetPESO: TFloatField;
    qryDetNOTA: TFloatField;
    qry: TwwQuery;
    ds: TwwDataSource;
    upd: TUpdateSQL;
    qryIDAVALIACAO: TFloatField;
    qryIDNFRECEBDEVOL: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryNOTA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure GrdCritDblClick(Sender: TObject);
    procedure GrdCritKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCritColExit(Sender: TObject);
    procedure qryCritPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryCritNewRecord(DataSet: TDataSet);
    procedure dsTipoDataChange(Sender: TObject; Field: TField);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
      Procedure GravaAvali;
  public
    { Public declarations }
    sNomeForn      : String;
    sNota          : String;
    sRecPag        : String[01];
    sNumDocumento  : String;
    iIdNfRecDev    : LongInt;
   iIdPessoa       : LongInt;
   bGravou         : Boolean;
  end;
var
  FrmAvaliacao : TFrmAvaliacao;
implementation

{$R *.DFM}
Uses uDataBase,uMensErro;

procedure TFrmAvaliacao.FormCreate(Sender: TObject);
begin
  inherited;
  bGravou := True;
end;

procedure TFrmAvaliacao.GrdCritDblClick(Sender: TObject);
begin
  inherited;
  QryCrit.Edit;
end;

procedure TFrmAvaliacao.GrdCritKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if Key In [#13,'0'..'9','.'] Then
     Begin
       QryCrit.Edit;
     End;
   If qryCrit.FieldByName('DESCCRITAVALIACAO').isNull Then
       qryCrit.Delete;
end;

procedure TFrmAvaliacao.GrdCritColExit(Sender: TObject);
begin
  inherited;
  If QryCrit.State <> dsBrowse Then
    Begin
      QryCrit.Post;
    End;
end;

procedure TFrmAvaliacao.qryCritPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  Action := daAbort;
end;

procedure TFrmAvaliacao.qryCritNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryCrit.cancel;
end;

procedure TFrmAvaliacao.dsTipoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if qryCrit.State <> DsInactive Then
  Begin
    if qryCrit.State in [DsEdit,DsInsert] Then  qryCrit.Post;
    qryCrit.Filtered      := False;
    qryCrit.FilterOptions := [foCaseInsensitive];
    qryCrit.Filter        := 'IDTIPOAVALIACAO = '+IntToStr(qryTipo.FieldByName('IDTIPOAVALIACAO').asInteger) ;
    qryCrit.Filtered      := True;
  End;
end;

procedure TFrmAvaliacao.GravaAvali;
Var
   iIdAvali : LongInt;
   rTotal   : Double;
   rTotPeso : LongInt;
Begin
  rTotal   := 0;
  rTotPeso := 0;
  iIdAvali := LeUltRegistro(nil,'AVALAICAO');
  If qryCrit.Filtered Then
     Begin
        qryCrit.DisableControls;
        qryCrit.Filtered      := False;
        qryCrit.FilterOptions := [];
        qryCrit.Filter        := '';
     End;
  qryCrit.First;
  While Not qryCrit.EOF Do
    Begin
        qryDet.Append;
        qryDet.FieldByName('IDAVALIACAO').asInteger     := iIdAvali;
        qryDet.FieldByName('IDCRITAVALIACAO').asInteger := qryCrit.FieldByName('IDCRITAVALIACAO').asInteger;
        qryDet.FieldByName('NOTA').asFloat              := qryCrit.FieldByName('NOTA').asFloat;
        qryDet.FieldByName('PESO').asInteger            := qryCrit.FieldByName('PESO').asInteger;
        qryDet.Post;
        rTotal   := rTotal +( qryDet.FieldByName('NOTA').asFloat * qryDet.FieldByName('PESO').asInteger );
        rTotPeso := rTotPeso + qryDet.FieldByName('PESO').asInteger;
        qryCrit.Next;
    End;
      If rTotPeso = 0 then  rTotPeso := 1;
      qry.Append;
      qry.FieldByName('IDAVALIACAO').asInteger     := iIdAvali;
      qry.FieldByName('NOTA').asFloat              := rTotal/rTotPeso;
      If iIdNFRecDev > 0 Then
         qry.FieldByName('IDNFRECEBDEVOL').asInteger := iIdNfRecDev
      Else
         qry.FieldByName('CODDOCUMENTO').asString  := sNota;
      qry.Post;
    qryCrit.CancelUpdates;
    AplicaAlteracoes([qry,qryDet]);
    qryCrit.EnableControls;
End;

procedure TFrmAvaliacao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bGravou := True;
  Try
     GravaAvali;
     MsgDlg('Avaliação Realizada comsucesso','Informação',mtInformation,[mbOK],0);
  Except
      MsgDlg('Erro na gravação da Avaliação','Erro',mtError,[mbOK],0);
      Raise;
  End;
end;

procedure TFrmAvaliacao.bbtnSairClick(Sender: TObject);
begin
  inherited;
  If Not bGravou Then
    bbtnConfirmar.Click;
end;

procedure TFrmAvaliacao.FormShow(Sender: TObject);
begin
  inherited;
  LbForn.Caption := sNomeForn;
  LbNota.Caption := sNota;
  if iIdNfRecDev < 0 Then
     LbNota.Caption := sNumDocumento
  Else
     LbNota.Caption := sNota;

  qryCrit.Open;
  qryDet.Open;
  qry.Open;
end;

end.
