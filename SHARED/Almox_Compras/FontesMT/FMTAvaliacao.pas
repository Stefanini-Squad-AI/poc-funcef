unit FMTAvaliacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  DBClient, uCMClientDataSet;

type
  TFrmMTAvaliacao = class(TfrmOkCancelar)
    plnGrd: TPanel;
    Panel1: TPanel;
    Grd: TwwDBGrid;
    ds: TwwDataSource;
    dsTipo: TwwDataSource;
    dsCrit: TwwDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    LbForn: TLabel;
    Label3: TLabel;
    LbNota: TLabel;
    GrdCrit: TwwDBGrid;
    Splitter1: TSplitter;
    CdsCrit: TCMClientDataSet;
    CdsTipo: TCMClientDataSet;
    dsDet: TwwDataSource;
    procedure FormShow(Sender: TObject);
    procedure GrdCritKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCritColExit(Sender: TObject);
    procedure CdsCritPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CdsCritNewRecord(DataSet: TDataSet);
    procedure dsTipoDataChange(Sender: TObject; Field: TField);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
     sNomeForn      : String;
     sNota          : String;
     sRecPag        : String[01];
     sNumDocumento  : String;
     iIdNfRecDev    : LongInt;
     iIdPessoa      : LongInt;
     bGravou        : Boolean;
     //
     Procedure GravaAvaliacao;
  end;

var
  FrmMTAvaliacao: TFrmMTAvaliacao;

implementation
                                                    
{$R *.DFM}

procedure TFrmMTAvaliacao.FormShow(Sender: TObject);
begin
  inherited;
  LbForn.Caption := sNomeForn;
  LbNota.Caption := sNota;
  if iIdNfRecDev < 0 Then
     LbNota.Caption := sNumDocumento
  Else
     LbNota.Caption := sNota;

end;

procedure TFrmMTAvaliacao.GrdCritKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if Key In [#13,'0'..'9','.'] Then
     Begin
       dsCrit.DataSet.Edit;
     End;
   If dsCrit.DataSet.FieldByName('DESCCRITAVALIACAO').isNull Then
       dsCrit.DataSet.Delete;
end;

procedure TFrmMTAvaliacao.GrdCritColExit(Sender: TObject);
begin
  inherited;
  If cdsCrit.State <> dsBrowse Then
    Begin
      CdsCrit.Post;
    End;
end;

procedure TFrmMTAvaliacao.CdsCritPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  Action := daAbort;
end;

procedure TFrmMTAvaliacao.CdsCritNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsCrit.Cancel;
end;

procedure TFrmMTAvaliacao.dsTipoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if CdsCrit.State <> DsInactive Then
  Begin
    if CdsCrit.State in [DsEdit,DsInsert] Then  CdsCrit.Post;
    CdsCrit.Filtered      := False;
    CdsCrit.FilterOptions := [foCaseInsensitive];
    CdsCrit.Filter        := 'IDTIPOAVALIACAO = '+IntToStr(CdsTipo.FieldByName('IDTIPOAVALIACAO').asInteger) ;
    CdsCrit.Filtered      := True;
  End;
end;

procedure TFrmMTAvaliacao.GravaAvaliacao;
Var
   iIdAvali : LongInt;
   rTotal   : Double;
   rTotPeso : LongInt;
Begin
  rTotal   := 0;
  rTotPeso := 0;
  iIdAvali := -1;
  Try
     If CdsCrit.Filtered Then
        Begin
           CdsCrit.DisableControls;
           CdsCrit.Filtered      := False;
           CdsCrit.FilterOptions := [];
           CdsCrit.Filter        := '';
        End;
     CdsCrit.First;
     While Not CdsCrit.EOF Do
       Begin
           dsDet.DataSet.Append;
           dsDet.DataSet.FieldByName('IDAVALIACAO').asInteger     := iIdAvali;
           dsDet.DataSet.FieldByName('IDCRITAVALIACAO').asInteger := CdsCrit.FieldByName('IDCRITAVALIACAO').asInteger;
           dsDet.DataSet.FieldByName('NOTA').asFloat              := CdsCrit.FieldByName('NOTA').asFloat;
           dsDet.DataSet.FieldByName('PESO').asInteger            := CdsCrit.FieldByName('PESO').asInteger;
           dsDet.DataSet.Post;
           rTotal   := rTotal +( dsDet.DataSet.FieldByName('NOTA').asFloat * dsDet.DataSet.FieldByName('PESO').asInteger );
           rTotPeso := rTotPeso + dsDet.DataSet.FieldByName('PESO').asInteger;

           CdsCrit.Next;
       End;

       If rTotPeso = 0 Then
          rTotPeso := 1;

       ds.DataSet.Append;
       ds.DataSet.FieldByName('IDAVALIACAO').asInteger := iIdAvali;
       ds.DataSet.FieldByName('NOTA').asFloat          := rTotal/rTotPeso;

       If iIdNFRecDev > 0 Then
          ds.DataSet.FieldByName('IDNFRECEBDEVOL').asInteger := iIdNfRecDev
       Else
          ds.DataSet.FieldByName('CODDOCUMENTO').asString    := sNota;

       dsDet.DataSet.Post;
  Finally
     CdsCrit.EnableControls;
  End;
end;

procedure TFrmMTAvaliacao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
  GravaAvaliacao;
end;

end.
