unit FFluxo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, DBCtrls, TB97Tlwn, fcLabel, Grids,
  Wwdbigrd, Wwdbgrid, CmEventosCadastro, ImgList;

type
  TFrmFluxo = class(TfrmCadastroCS)
    Label1: TLabel;
    EdProc: TEdit;
    qryEtapa: TwwQuery;
    qryAndamento: TwwQuery;
    dsEtapa: TwwDataSource;
    plnAndxEtp: TPanel;
    plnEtapa: TPanel;
    Panel1: TPanel;
    grdEtapa: TwwDBGrid;
    Splitter2: TSplitter;
    plnFluxo: TPanel;
    qryEtapaIDTIPOPROCESSO: TFloatField;
    qryEtapaIDTIPOETAPA: TFloatField;
    qryAndamentoIDANDAMENTO: TFloatField;
    qryAndamentoNOME: TStringField;
    Panel3: TPanel;
    qryIDTIPOPROCESSO: TFloatField;
    qryIDTIPOETAPA: TFloatField;
    qryIDANDAMENTO: TFloatField;
    qryIDETAPAANT: TFloatField;
    qryANDAMENTO2: TStringField;
    plnBtn: TPanel;
    sbtnInsDet: TSpeedButton;
    sbtnAltDet: TSpeedButton;
    sbtnExcluiDet: TSpeedButton;
    GrdFluxo: TwwDBGrid;
    plnDet: TPanel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    dblcAndamento: TCMDBLookupCombo;
    dblcEtapa: TCMDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    qryEtapaAnt: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    qryEtapaNOME: TStringField;
    qryEtapaAntNOME: TStringField;
    qryETAPAANTES: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dsEtapaDataChange(Sender: TObject; Field: TField);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
  
    Procedure Sel( n : LongInt );
    Procedure BtnDet( b : Boolean );

    { Public declarations }
  end;

var
  FrmFluxo    : TFrmFluxo;
  iIdProc     : LongInt;
implementation

{$R *.DFM}

Uses uMensErro, uDatabase, DbaseDados;

procedure TFrmFluxo.Sel( n : LongInt );
Begin
   iIdProc := n;
   qryEtapa.Close;
   qryEtapa.Params[0].AsInteger := n;
   qryEtapa.Open;
   
   qryEtapaAnt.Close;
   qryEtapaAnt.Params[0].AsInteger := n;
   qryEtapaAnt.Open;
   
   qry.Close;
   qry.Params[0].AsInteger := n;
   qry.Open;
   
   EdProc.Text         := MontaSelect.ValoresChave[1];
   sbtnAlterar.Enabled := True;
 End;

procedure TFrmFluxo.FormCreate(Sender: TObject);
begin
  inherited;
   iIdProc := -1;
   qry.Close;
   qry.Params[0].AsInteger := -1;
   qry.Open;
   
   qryAndamento.Open;
   plnDet.SendToBack;
end;

Procedure TFrmFluxo.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
    inherited;
    sbtnAlterar.Enabled := Trim(EdProc.Text) <> '';
    pnlFundo.Enabled    := True;
    plnBtn.Enabled      := sbtnAlterar.Down;
End;

procedure TFrmFluxo.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    qry.Cancel;
End;

procedure TFrmFluxo.CmeCadastroDelete(Sender: TObject);
Begin
   qry.DisableControls;
   If qry.Filtered Then
      Begin
         qry.Filtered      := False;
         qry.FilterOptions := [];
         qry.Filter        := '';
      End;
   qry.First;
   While Not qry.EOF Do
      qry.Delete;
   qry.EnableControls;
   AplicaAlteracoes([qry]);
   sbtnApagar.Down := True;
End;
Procedure TFrmFluxo.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    if MontaSelect.RetornouValor Then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
End;

Procedure TFrmFluxo.CmeCadastroConfirma(Sender: TObject);
Begin
    Inherited;
    sbtnAlterar.Down := False;
End;

procedure TFrmFluxo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  EdProc.Clear;
end;

Procedure TFrmFluxo.BtnDet( b : Boolean );
Begin
   plnBtn.Enabled   := b;
   plnDet.Enabled   := Not b;
   plnEtapa.Enabled := b;
   if Not plnBtn.Enabled Then
     plnDet.BringToFront
   Else
     plnDet.SendToBack;
End;

procedure TFrmFluxo.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  qry.Append;
  BtnDet( False );
end;

procedure TFrmFluxo.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  qry.Edit;
  BtnDet( False );
end;

procedure TFrmFluxo.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  If MsgDlg('Confirma a exclusão','Confirmação',mtConfirmation,[mbOK,mbCancel],0) = mrOk Then
     qry.Delete;
 sbtnExcluiDet.Down := False;
end;

procedure TFrmFluxo.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcAndamento.Text) = '' Then
     Begin
          MsgDlg('Andamento não preenchido','Erro',mtConfirmation,[mbOK],0);
          dblcAndamento.SetFocus;
     End
  Else
  If Trim(dblcEtapa.Text) = '' Then
     Begin
          MsgDlg('Etapa não preenchido','Erro',mtConfirmation,[mbOK],0);
          dblcEtapa.SetFocus;
     End
  Else
     Begin
        qry.FieldByName('IDTIPOPROCESSO').AsInteger := iIdProc;
        qry.FieldByName('IDTIPOETAPA').AsInteger    := qryEtapa.FieldByName('IDTIPOETAPA').AsInteger;
        qry.FieldByName('ANDAMENTO').AsString       := dblcAndamento.Text;
        qry.FieldByName('ETAPAANTES').AsString      := dblcEtapa.Text;
        qry.Post;
        If sbtnInsDet.Down Then
           qry.Append
        Else
           Begin
              BtnDet( True );
              sbtnInsDet.Down :=  False;
              sbtnAltDet.Down :=  False;
           End;
     End;
end;

procedure TFrmFluxo.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  qry.Cancel;
  BtnDet( True );
  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
end;

procedure TFrmFluxo.dsEtapaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
 If qryEtapa.State <> DsInactive Then
    Begin
     if qry.State in [DsEdit,DsInsert] Then
        qry.Post;
     qry.Filtered      := False;
     qry.FilterOptions := [foCaseInsensitive];
     qry.Filter        := 'IDTIPOETAPA = '+IntToStr(qryEtapa.FieldByName('IDTIPOETAPA').asInteger) ;
     qry.Filtered      := True;
    End;
end;

procedure TFrmFluxo.bbtnConfirmarClick(Sender: TObject);
begin
 If qry.Filtered Then
   Begin
      qry.DisableControls;
      qry.Filtered      := False;
      qry.FilterOptions := [];
      qry.Filter        := '';
   End;
  inherited;
  qry.EnableControls;
  qryEtapa.First;
end;

end.
