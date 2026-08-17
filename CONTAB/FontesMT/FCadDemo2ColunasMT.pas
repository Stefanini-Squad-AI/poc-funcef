unit FCadDemo2ColunasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, uCtrlElemBalPatr,ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, uCtrlDemonstrativo,uCtrlElemDemonstrativo,Mask,
  wwdbedit, wwdblook, CMDBLookupCombo, uCMTypes;


type
  TfrmCadDemo2ColunasMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dblkDemonstrativo: TCMDBLookupCombo;
    cboPosicao: TComboBox;
    dblkElemento: TwwDBLookupCombo;
    dbeDescricao: TwwDBEdit;
    wwDBGrid1: TwwDBGrid;
    CdsGrid: TCMClientDataSet;
    dsGrid: TDataSource;
    CdsElemento: TCMClientDataSet;
    CdsDemonstrativo: TCMClientDataSet;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dblkDemonstrativoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkDemonstrativoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private

    iIndice, iSalvaDemo : longint;
    CtrlElemBalPatr   : TCtrlElemBalPatr;
    CtrlDemonstrativo : TCtrlDemonstrativo;
    CtrlElemDemonstrativo : TCtrlElemDemonstrativo;
    procedure AtualizaGrid;
    procedure FazCloseUp;

  public
    { Public declarations }
  end;

var
  frmCadDemo2ColunasMT: TfrmCadDemo2ColunasMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema,
     uModulo,  uFuncaoGeral;

{$R *.DFM}

procedure TfrmCadDemo2ColunasMT.FazCloseUp;
begin
   If dblkDemonstrativo.Text <> '' Then
   Begin
     iSalvaDemo := StrToInt(dblkDemonstrativo.LookUpValue);
     CdsElemento.Data := CtrlElemDemonstrativo.ListElemDemonstrativo(iSalvaDemo,0,0,0);
   End;

   CdsGrid.Data := CtrlElemBalPatr.ListPosicao(StrToInt(dblkDemonstrativo.LookupValue));

   AtualizaGrid;

   cboPosicao.itemIndex := -1;
   cboPosicao.itemIndex := Cds.FieldByName('ELEPOSICAO').AsInteger - 1;

end;


procedure TfrmCadDemo2ColunasMT.AtualizaGrid;
begin
   CdsGrid.First;
   while not CdsGrid.Eof Do
   Begin
     CdsGrid.Edit;
     If CdsGrid.FieldByName('ELEPOSICAO').asInteger <= 30 Then
        CdsGrid.FieldByName('POSICAO').asString := 'Posição #' + IntToStr(CdsGrid.FieldByName('ELEPOSICAO').asInteger) + ' - 1ª Coluna'
     Else
       CdsGrid.FieldByName('POSICAO').asString := 'Posição #' + IntToStr(CdsGrid.FieldByName('ELEPOSICAO').asInteger - 30) + ' - 2ª Coluna';
     CdsGrid.post;
     CdsGrid.next;
   End;
   CdsGrid.First;

end;

procedure TfrmCadDemo2ColunasMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal ***
  CtrlElemBalPatr  := TCtrlElemBalPatr.Create;
  CtrlElemBalPatr.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlElemBalPatr.CdsElemBalPatr := Cds;
  Cds.Data := CtrlElemBalPatr.ListCdsElemBalPatr(-1);

  // *** Instancia a classe demonstrativo ***
  CtrlDemonstrativo := TCtrlDemonstrativo.Create;
  CtrlDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsDemonstrativo.Data := CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,0,True);

  // *** Instancia a classe elementos do demonstrativo ***
  CtrlElemDemonstrativo := TCtrlElemDemonstrativo.Create;
  CtrlElemDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                                   Sistema.ConnectionSide,Sistema.AppRemoteServer,True);


end;

procedure TfrmCadDemo2ColunasMT.dblkDemonstrativoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazCloseUp;
end;

procedure TfrmCadDemo2ColunasMT.dblkDemonstrativoExit(Sender: TObject);
begin
  inherited;
  FazCloseUp;

end;

procedure TfrmCadDemo2ColunasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDemonstrativo.free;
  CtrlElemDemonstrativo.free;
  CtrlElemBalPatr.free;


end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    iSalvaDemo := StrToInt(MontaSelect.ValoresChave[1]);
    iIndice    := StrToInt(MontaSelect.ValoresChave[0]);

    Cds.Data := CtrlElemBalPatr.ListCdsElemBalPatr(iIndice);

    {*** preenche grid *** }
    CdsGrid.Data := CtrlElemBalPatr.ListPosicao(iSalvaDemo);
    AtualizaGrid;
    CdsElemento.Data := CtrlElemDemonstrativo.ListElemDemonstrativo(StrToInt(MontaSelect.ValoresChave[1]),0,0,0);
  End;

  cboPosicao.itemIndex := Cds.FieldByName('ELEPOSICAO').asInteger - 1;

end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   iSalvaDemo := 0;
   iIndice    := -1;
   dblkDemonstrativo.text := '';
   dblkElemento.text := '';
   cboPosicao.itemIndex := -1;
   CdsGrid.Close;
   dbeDescricao.Text := '';


end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dblkDemonstrativo.CanFocus Then
      dblkDemonstrativo.SetFocus;

end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  cboPosicao.Text := '';
  cboPosicao.itemIndex := -1;


end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=  CtrlElemBalPatr.Gravar;

end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
   CdsGrid.Data := CtrlElemBalPatr.ListPosicao(iSalvaDemo);
   AtualizaGrid;
end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
 accept :=  CtrlElemBalPatr.Gravar;

end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=  CtrlElemBalPatr.Gravar;

end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;

   If Cds.State in [dsEdit, dsInsert] Then
   Begin

       If dblkDemonstrativo.text = '' Then
       Begin
          MsgDlg('Demonstrativo não selecionado.','Aviso',mtWarning,[mbOk],0);
          dblkDemonstrativo.SetFocus;
          Accept := false;
       End;

       If dblkElemento.text = '' Then
       Begin
          MsgDlg('Elemento do Demonstrativo não selecionado.','Aviso',mtWarning,[mbOk],0);
          dblkElemento.SetFocus;
          Accept := false;
       End;

       If cboPosicao.itemindex < 0 Then
       Begin
          MsgDlg('Posição do Elemento não preenchida.','Aviso',mtWarning,[mbOk],0);
          cboPosicao.SetFocus;
          Accept := false;
       End;
       
       Cds.FieldByName('ELEPOSICAO').AsInteger  := cboPosicao.itemIndex + 1;
   End;
end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDDEMONSTRATIVO').AsInteger := iSalvaDemo;

end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  Cds.Data := CtrlElemBalPatr.ListCdsElemBalPatr(Cds.FieldByName('IDELEMBALPATR').asFloat);

  {*** preenche grid *** }
  CdsGrid.Data := CtrlElemBalPatr.ListPosicao(CdsGrid.FieldByName('IDDEMONSTRATIVO').asFloat);
  AtualizaGrid;
  CdsElemento.Data := CtrlElemDemonstrativo.ListElemDemonstrativo(CdsElemento.FieldByName('IDDEMONSTRATIVO').asFloat,0,0,0);

end;

procedure TfrmCadDemo2ColunasMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlElemBalPatr.MessageInfo <> '' Then
     MsgDlg(CtrlElemBalPatr.MessageInfo,'Erro',mtError,[mbOK],0);

end;




procedure TfrmCadDemo2ColunasMT.sbtnAlterarClick(Sender: TObject);
begin
  if Cds.FieldByName('IDDEMONSTRATIVO').AsInteger < 0 then
  begin
     MsgDlg('Este tipo de Elemento de Demonstrativo é um padrão SPC e não pode ser alterado!','Aviso',mtWarning,[mbOk],0);
     sbtnAlterar.Down := False;
  end
  else
     inherited;

end;




procedure TfrmCadDemo2ColunasMT.sbtnApagarClick(Sender: TObject);
begin
  if Cds.FieldByName('IDDEMONSTRATIVO').AsInteger < 0 then
  begin
     MsgDlg('Este tipo de Elemento de Demonstrativo é um padrão SPC e não pode ser excluído!','Aviso',mtWarning,[mbOk],0);
     sbtnApagar.Down := False;
  end
  else
     inherited;
end;

end.
