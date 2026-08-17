unit FCadAutxEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TFrmCadAutxEtapa = class(TfrmCadastroCS)
    plnGrp: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnRemover: TSpeedButton;
    btnAdicionar: TSpeedButton;
    Panel1: TPanel;
    grdGrupoSelec: TwwDBGrid;
    grdGrupoDispo: TwwDBGrid;
    qryEtapa: TwwQuery;
    qryEtapaIDTIPOPROCESSO: TFloatField;
    qryEtapaIDTIPOETAPA: TFloatField;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qryIDTIPOETAPA: TFloatField;
    qryIDGRUPOAUTORIZA: TFloatField;
    qryGrp: TwwQuery;
    dsGrp: TwwDataSource;
    updGrp: TUpdateSQL;
    qryGrpIDGRUPOAUTORIZA: TFloatField;
    edProc: TEdit;
    edEtapa: TEdit;
    qryETAPA2: TStringField;
    qryPROC: TStringField;
    qryEtapaNOME: TStringField;
    btnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    qryGrpNOMEGRUPOAUT: TStringField;
    qryIDTIPOPROCESSO: TFloatField;
    qryNOMEGRUPOAUT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    
    Procedure Sel( iProc,iEtapa : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadAutxEtapa : TFrmCadAutxEtapa;
  iIdProc         : LongInt;
  iIdEtapa        : LongInt;
implementation

{$R *.DFM}
Uses uMensErro, UDataBase, uSistema;

Procedure TFrmCadAutxEtapa.Sel(iProc, iEtapa : LongInt );
Begin
    iIdProc  := iProc;
    iIdEtapa := iEtapa;
    
    qry.Close;
    qry.Params[0].AsInteger := iProc;
    qry.Params[1].AsInteger := iEtapa;
    qry.Open;
    
    qryGrp.Close;
    qryGrp.Params[0].AsInteger := iProc;
    qryGrp.Params[1].AsInteger := iEtapa;
    qryGrp.Open;
    If iIdProc > 0 Then
      Begin
        edProc.Text  := MontaSelect.ValoresChave[2];
        edEtapa.Text := MontaSelect.ValoresChave[3];
      End;  
End;

procedure TFrmCadAutxEtapa.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1,-1);
  CmeCadastro.RepetirInsert := False;
end;

procedure TFrmCadAutxEtapa.btnAdicionarClick(Sender: TObject);
begin
  inherited;
   If Not qryGrp.IsEmpty Then
     Begin
        With qry Do
           Begin
             Append;
             FieldByName('IDTIPOPROCESSO').asInteger  := iIdProc;
             FieldByName('IDTIPOETAPA').asInteger     := iIDEtapa;
             FieldByName('IDGRUPOAUTORIZA').asInteger := qryGrp.FieldByName('IDGRUPOAUTORIZA').asInteger;
             FieldByName('NOMEGRUPOAUT').asString     := qryGrp.FieldByName('NOMEGRUPOAUT').asString;
            End;
        qryGrp.Delete;
     End;
end;

procedure TFrmCadAutxEtapa.btnRemoverClick(Sender: TObject);
begin
  inherited;
   If Not qry.IsEmpty Then
     Begin
        With qryGrp Do
           Begin
             Append;
             FieldByName('IDGRUPOAUTORIZA').asInteger := qry.FieldByName('IDGRUPOAUTORIZA').asInteger;
             FieldByName('NOMEGRUPOAUT').asString     := qry.FieldByName('NOMEGRUPOAUT').asString;
            End;
        qry.Delete;
     End;
end;

procedure TFrmCadAutxEtapa.CmeCadastroInsert(Sender: TObject);
Begin
    Inherited;
    If iIdProc > 0 Then
       Begin
           qry.Delete;
           edProc.Text  := MontaSelect.ValoresChave[2];
           edEtapa.Text := MontaSelect.ValoresChave[3];
       End
    Else
      Begin
         MsgDlg('Não há Processo/Etapa selecionados','Erro',mtError,[mbOK],0);
         bbtnCancelar.Click;
      End;

End;

procedure TFrmCadAutxEtapa.CmeCadastroDelete(Sender: TObject);
Begin
    qry.DisableControls;
    qry.First;
    While Not qry.EOF Do
      qry.Delete;
    qry.EnableControls;
    AplicaAlteracoes([qry]);
    sbtnApagar.Down := True;
End;

procedure TFrmCadAutxEtapa.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
        Sel(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));
End;

procedure TFrmCadAutxEtapa.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Sel(iIdProc, iIdEtapa);
end;

procedure TFrmCadAutxEtapa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmCadAutxEtapa.btnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  qryGrp.First;
  While Not qryGrp.EOF Do
     btnAdicionar.Click;
end;

procedure TFrmCadAutxEtapa.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  qry.First;
  While Not qry.EOF Do
     btnRemover.Click;
end;

procedure TFrmCadAutxEtapa.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Try
     StartTransacao;
     if not Sistema.GravaLogOperacoes('Cadastro de Etapas x Grupo de Autorização',False) then Abort;
     CommitTransacao;
  Except
     RollBackTransacao;
  End;

end;

end.
