unit FProcxEtapaxObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, CmEventosCadastro,
  ImgList;

type
  TFrmProcxEtapaxObj = class(TfrmCadastroCS)
    plnGrp: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    btnRemover: TSpeedButton;
    btnAdicionar: TSpeedButton;
    Panel1: TPanel;
    grdGrupoSelec: TwwDBGrid;
    grdGrupoDispo: TwwDBGrid;
    Label1: TLabel;
    Label4: TLabel;
    BtnSobe: TSpeedButton;
    BtnDesce: TSpeedButton;
    qryObj: TwwQuery;
    dsObj: TwwDataSource;
    updObj: TUpdateSQL;
    qryIDTIPOETAPA: TFloatField;
    qryIDTIPOPROCESSO: TFloatField;
    qryIDOBJETO: TFloatField;
    qryORDEM: TFloatField;
    qryDESCOBJETO: TStringField;
    qryObjIDOBJETO: TFloatField;
    qryObjIDMODULO: TFloatField;
    qryObjDESCOBJETO: TStringField;
    qryObjNOMEOBJETO: TStringField;
    Label5: TLabel;
    edProc: TEdit;
    edEtipo: TEdit;
    edSitema: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
  
    Procedure Sel( IdProc,IdEtapa,IdModulo : LongInt );

  public
    { Public declarations }
  end;

var
  FrmProcxEtapaxObj : TFrmProcxEtapaxObj;
  IidProc           : LongInt;
  IidEtapa          : LongInt;
  IidModulo         : LongInt;
implementation

{$R *.DFM}

Uses uSistema, uMensErro, uDataBase;

Procedure TFrmProcxEtapaxObj.Sel( IdProc,IdEtapa,IdModulo : LongInt );
Begin
   IidProc   := IdProc;
   IidEtapa  := IdEtapa;
   IidModulo := IdModulo;
   qry.Close;
   qry.ParamByName('pIDTPPROC').AsInteger  := IdProc;
   qry.ParamByName('pIDTPETAPA').AsInteger := IdEtapa;
   qry.Open;
   
   qryObj.Close;
   qryObj.ParamByName('pIDPROC').AsInteger    := IdProc;
   qryObj.ParamByName('pIDETAPA').AsInteger   := IdEtapa;
   qryObj.ParamByName('pIDMODULO').AsInteger  := IdModulo;
   qryObj.Open;
End;

procedure TFrmProcxEtapaxObj.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
       Begin
        Sel(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[2]));
        edProc.Text   := MontaSelect.ValoresChave[3];
        edEtipo.Text  := MontaSelect.ValoresChave[4];
        edSitema.Text := MontaSelect.ValoresChave[5];
       End
    Else
       Begin
          edProc.Clear;
          edEtipo.Clear;
          edSitema.Clear;
       End;
End;

procedure TFrmProcxEtapaxObj.CmeCadastroInsert(Sender: TObject);
Begin
    Inherited;
    If iIdProc > 0 Then
       Begin
           qry.Delete;
       End
    Else
      Begin
         MsgDlg('Não há Processo/Etapa selecionados','Erro',mtError,[mbOK],0);
         bbtnCancelar.Click;
      End;

End;

procedure TFrmProcxEtapaxObj.CmeCadastroDelete(Sender: TObject);
Begin
    qry.DisableControls;
    qry.First;
    While Not qry.EOF Do
      qry.Delete;
    qry.EnableControls;
    AplicaAlteracoes([qry]);
    sbtnApagar.Down := True;
End;


procedure TFrmProcxEtapaxObj.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1,-1,-1);
  CmeCadastro.RepetirInsert := False;
end;

procedure TFrmProcxEtapaxObj.btnAdicionarClick(Sender: TObject);
begin
  inherited;
   If Not qryObj.IsEmpty Then
     Begin
        With qry Do
           Begin
              Append;
              FieldByName('IDTIPOPROCESSO').asInteger  := iIdProc;
              FieldByName('IDTIPOETAPA').asInteger     := iIDEtapa;
              FieldByName('IDOBJETO').asInteger        := qryObj.FieldByName('IDOBJETO').asInteger;
              FieldByName('DESCOBJETO').asString       := qryObJ.FieldByName('DESCOBJETO').asString;
              Post;
            End;
        qryObj.Delete;
     End;
end;

procedure TFrmProcxEtapaxObj.btnRemoverClick(Sender: TObject);
begin
  inherited;
   If Not qry.IsEmpty Then
     Begin
        With qryObj Do
           Begin
              Append;
              FieldByName('IDOBJETO').asInteger  := qry.FieldByName('IDOBJETO').asInteger;
              FieldByName('DESCOBJETO').asString := qry.FieldByName('DESCOBJETO').asString;
              Post;
            End;
        qry.Delete;
     End;
end;

procedure TFrmProcxEtapaxObj.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnCancelar.Click;
end;

procedure TFrmProcxEtapaxObj.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Try
     StartTransacao;
     if not Sistema.GravaLogOperacoes('Cadastro de Processos/Etapas x Objetos R.A.D.',False) then Abort;
     CommitTransacao;
  Except
     RollBackTransacao;
  End;
end;

end.
