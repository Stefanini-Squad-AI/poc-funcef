unit FWizRenumPlanil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Menus, wwriched, Db, Wwdatsrc,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamContab, usistema,
  uCtrlPadroes, uCtrlPeriodo, fProgressoDuplo, uMensErro;

type
  TFrmWizRenumPlanil = class(TfrmWizardMT)
    Panel1: TPanel;
    DbChkRenum: TDBCheckBox;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    meErros: TwwDBRichEdit;
    PopupMenu1: TPopupMenu;
    Salvar1: TMenuItem;
    Imprimir1: TMenuItem;
    SaveDialog1: TSaveDialog;
    CdsPeriodos: TCMClientDataSet;
    sqlPeriodos: TCMSqlParams;
    DsPeriodo: TwwDataSource;
    cdsParamContab: TCMClientDataSet;
    DsParamContab: TwwDataSource;
    Panel5: TPanel;
    DbgPeriodo: TwwDBGrid;
    Panel6: TPanel;
    spdbCheck: TSpeedButton;
    spdbUnCheck: TSpeedButton;
    CdsPeriodosFLGSEQUENCE: TStringField;
    CdsPeriodosPERNUMERO: TFloatField;
    CdsPeriodosPEREXERCICIO: TFloatField;
    CdsPeriodosPERDATINI: TDateTimeField;
    CdsPeriodosPERDATFIM: TDateTimeField;
    CdsPeriodosPERNOME: TStringField;
    CdsPeriodosPERPLANIL: TFloatField;
    CdsPeriodosPERBLOINT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure DbgPeriodoDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Progresso(vParam: array of Variant);
    procedure spdbCheckClick(Sender: TObject);
    procedure spdbUnCheckClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure DbgPeriodoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    CtrlParamContab :TCtrlParamContab;
    CtrlPeriodo :TCtrlPeriodo;
    iOrdem : integer;
  public
    { Public declarations }
  end;

var
  FrmWizRenumPlanil: TFrmWizRenumPlanil;

implementation

{$R *.DFM}

procedure TFrmWizRenumPlanil.FormCreate(Sender: TObject);
begin
  inherited;
  iOrdem := 0;
  CtrlParamContab := TCtrlParamContab.Create;
  CtrlParamContab.InitializeAs(Padroes);

  CtrlParamContab.CdsParamContab := CdsParamContab;
  CdsParamContab.Data := CtrlParamContab.ListParamContab(Sistema.IdEmpresa);
  cdsParamContab.Edit;

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);
  CtrlPeriodo.Progresso := Progresso;

  DbChkRenum.Enabled := cdsParamContab.fieldByName('FLGPLNSEQUENCE').asString = 'N';
end;

procedure TFrmWizRenumPlanil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlParamContab.Free;
  CtrlPeriodo.Free;
end;

procedure TFrmWizRenumPlanil.btnContinuarClick(Sender: TObject);
begin
  if not DbChkRenum.Checked then
    MsgDlg('Não é possível prosseguir sem a ativação do parâmetro. Clique no box "Ativar".','Erro', mtError,[mbOk],0)
  else
  begin
     If (DbChkRenum.Enabled = True) and
        (MsgDlg('A ativação deste parâmetro é irreversível.' + #13 + 'Deseja realmente ativá-lo?', 'Aviso', mtConfirmation, [mbYes, mbNo],0)= mrNo) Then
      abort
    else
    begin
      CtrlParamContab.Gravar;
      inherited;
      cdsPeriodos.data := ctrlPeriodo.ListPeriodo(sistema.IdEmpresa, tbpSoNaoBloq, 0, 0, true);
      DbgPeriodo.ReadOnly := false;
      spdbCheck.Enabled := true;
      spdbUnCheck.Enabled := true;
      btnConfirmar.Enabled := true;
      btnVoltar.Enabled := true;
      bbtnSair.Enabled := true;
      if PagControle.ActivePageIndex = 1 then
      begin
        if CdsParamContab.State = dsEdit then
        begin
          CdsParamContab.Post;
        end;
        meErros.Lines.Clear;
      end;
    end;
  end;
end;

procedure TFrmWizRenumPlanil.btnVoltarClick(Sender: TObject);
begin
  inherited;
  DbChkRenum.Enabled := cdsParamContab.fieldByName('FLGPLNSEQUENCE').asString = 'N';
end;

procedure TFrmWizRenumPlanil.DbgPeriodoDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
  if (CdsPeriodos.Active) then
  begin
    DbgPeriodo.Canvas.Font.Color := clBlack;
    if ( CdsPeriodos.RecNo mod 2 ) = 0 then
      DbgPeriodo.Canvas.Brush.Color := $EEEEEE
    else
      DbgPeriodo.Canvas.Brush.Color := clWhite;

    DbgPeriodo.DefaultDrawDataCell( Rect, Field, State );
  end;
end;


procedure TFrmWizRenumPlanil.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  meErros.Lines.Clear;
  DbgPeriodo.ReadOnly := true;
  btnConfirmar.Enabled := false;
  btnVoltar.Enabled := false;
  bbtnSair.Enabled := false;
  spdbCheck.Enabled := false;
  spdbUnCheck.Enabled := false;

  if CtrlPeriodo.MigraMetodoSequenciaPNL(cdsPeriodos.data, sistema.IdEmpresa, sistema.IdModulo, sistema.IdUsuario) then
    showMessage(CtrlPeriodo.MessageInfo);

  cdsPeriodos.data := ctrlPeriodo.ListPeriodo(sistema.IdEmpresa, tbpSoNaoBloq, 0, 0, true);
  btnVoltar.Enabled := true;
  bbtnSair.Enabled := true;
  DbgPeriodo.ReadOnly := false;
  btnConfirmar.Enabled := not cdsPeriodos.IsEmpty;
  spdbCheck.Enabled := true;
  spdbUnCheck.Enabled := true;

end;


procedure TFrmWizRenumPlanil.Progresso(vParam: array of Variant);
begin
//  Legenda do FormProgresso
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

//   vParam[2] :  Mínimo de Registros  (em cima)
//   vParam[3] :  Total de Registros   (em cima)
//   vParam[4] :  Registro Atual       (em cima)
//   vParam[5] :  Legenda              (em cima)

//   vParam[6] :  Mínimo de Registros  (em baixo)
//   vParam[7] :  Total de Registros   (em baixo)
//   vParam[8] :  Registro Atual       (em baixo)
//   vParam[9] :  Legenda              (em baixo)
//   vParam(10]:  Retorno de mensagem/resultado

   case vParam[1] of
      // -------------------------------------------------------------------------------------------
      0:
      begin
         frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5],  // Legenda  (de cima)
                                                    vParam[9],  // Legenda  (de baixo)
                                                    vParam[2],  // Mínimo   (de cima)
                                                    vParam[6],  // Mínimo   (de baixo)
                                                    vParam[3],  // Máximo   (de cima)
                                                    vParam[7],  // Máximo   (de baixo)
                                                    True,      // Botão Visivel
                                                    True       // Botão Habilitado
                                                   );

      end;
      // -------------------------------------------------------------------------------------------
      1:
      begin
         frmProgressoDuplo.Legenda  := vParam[5];
         frmProgressoDuplo.Legenda2 := vParam[9];
         frmProgressoDuplo.Max2     := vParam[7];
         frmProgressoDuplo.AndaFormProgressoDuplo(vParam[4], vParam[8]);
      end;
      // -------------------------------------------------------------------------------------------
      2:
      begin
         frmProgressoDuplo.EscondeFormProgressoDuplo;

      end;
      // -------------------------------------------------------------------------------------------
   end;

   if Trim(vParam[10]) <> '' then
      meErros.Lines.Add(vParam[10]);


   Application.ProcessMessages;
   CtrlPeriodo.bCancelaRenum := frmprogressoDuplo.Cancelou;
   if CtrlPeriodo.bCancelaRenum then
   begin
     DbgPeriodo.ReadOnly := false;
     spdbCheck.Enabled := true;
     spdbUnCheck.Enabled := true;
     btnConfirmar.Enabled := true;
     btnVoltar.Enabled := true;
     bbtnSair.Enabled := true;

     meErros.Lines.Text := '****** Processo cancelado pelo usuário *****';
   end;

end;


procedure TFrmWizRenumPlanil.spdbCheckClick(Sender: TObject);
begin
  inherited;
  CdsPeriodos.DisableControls;
  CdsPeriodos.First;
  while not CdsPeriodos.Eof do
  begin
    CdsPeriodos.Edit;
    CdsPeriodos.fieldByName('FLGSEQUENCE').asString := 'S';
    CdsPeriodos.Post;
    CdsPeriodos.Next;
  end;
  CdsPeriodos.First;
  CdsPeriodos.EnableControls;
end;

procedure TFrmWizRenumPlanil.spdbUnCheckClick(Sender: TObject);
begin
  inherited;
  CdsPeriodos.DisableControls;
  CdsPeriodos.First;
  while not CdsPeriodos.Eof do
  begin
    CdsPeriodos.Edit;
    CdsPeriodos.fieldByName('FLGSEQUENCE').asString := 'N';
    CdsPeriodos.Post;
    CdsPeriodos.Next;
  end;
  CdsPeriodos.First;
  CdsPeriodos.EnableControls;
end;

procedure TFrmWizRenumPlanil.Salvar1Click(Sender: TObject);
begin
  inherited;
  meErros.PlainText := true;
  saveDialog1.Execute;
  if trim(saveDialog1.FileName) <> '' then
    meErros.Lines.saveToFile(saveDialog1.FileName);

end;

procedure TFrmWizRenumPlanil.Imprimir1Click(Sender: TObject);
begin
  inherited;
  meErros.Print('');
end;


procedure TFrmWizRenumPlanil.DbgPeriodoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var bcheck: boolean;
    i, currRec : integer;
begin
  inherited;
  currRec := CdsPeriodos.Recno;
  i := CdsPeriodos.Recno;
  bcheck := CdsPeriodos.fieldByName('FLGSEQUENCE').asString <> 'S';
  CdsPeriodos.DisableControls;
  while i <= CdsPeriodos.RecordCount do
  begin
    CdsPeriodos.Edit;

    if bcheck then
      CdsPeriodos.fieldByName('FLGSEQUENCE').asString := 'S'
    else
      CdsPeriodos.fieldByName('FLGSEQUENCE').asString := 'N';

    CdsPeriodos.Post;
    CdsPeriodos.next;
    inc(i);
  end;//while
  CdsPeriodos.Recno := currRec;
  CdsPeriodos.EnableControls;
end;


end.

