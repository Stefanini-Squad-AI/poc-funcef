unit FCadDiasBloqModMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCtrlDiasBloqMod,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, Mask, wwdbedit, Wwdbspin,
  uCMTypes, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadDiasBloqModMT = class(TFrmCadastroMT)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbNumDias: TwwDBSpinEdit;
    Label1: TLabel;
    dblkModulo: TwwDBLookupCombo;
    cdsModulo: TCMClientDataSet;
    edtDataBloq: TCMDateTimePicker;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    CtrlDiasBloqMod :TCtrlDiasBloqMod;
  public
    { Public declarations }
  end;

var
  frmCadDiasBloqModMT: TfrmCadDiasBloqModMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema;

{$R *.DFM}

procedure TfrmCadDiasBloqModMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDiasBloqMod := TCtrlDiasBloqMod.Create;
  CtrlDiasBloqMod.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlDiasBloqMod.CdsDiasBloqMod := Cds;
  Cds.Data := CtrlDiasBloqMod.ListDiasBloqMod(-1,-1);

  cdsModulo.Data := CtrlDiasBloqMod.ListModulos;

  MontaSelect.Filtro.Add('DIASBLOQMOD.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

end;

procedure TfrmCadDiasBloqModMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDiasBloqMod.free;
end;

procedure TfrmCadDiasBloqModMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  Cds.Data := CtrlDiasBloqMod.ListDiasBloqMod(Sistema.IdEmpresa,Cds.FieldByName('IDMODULO').AsFloat);

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlDiasBloqMod.Gravar;

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlDiasBloqMod.Gravar;

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlDiasBloqMod.Gravar;

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin

     If (dblkModulo.Text = '') Then
     Begin
         MsgDlg('Módulo não informado.','Aviso',mtWarning,[mbOk],0);
         if dblkModulo.CanFocus Then
            dblkModulo.SetFocus;
         Accept := False;
     End;

     If (dbNumDias.Text = '') Then
     Begin
         MsgDlg('Número de Dias não Informado.','Aviso',mtWarning,[mbOk],0);
         If dbNumDias.CanFocus Then
            dbNumDias.SetFocus;
         Accept := False;
     End;


     If (dbNumDias.Value < 0) Then
     Begin
         MsgDlg('Número de Dias inválido.','Aviso',mtWarning,[mbOk],0);
         If dbNumDias.CanFocus Then
            dbNumDias.SetFocus;
         Accept := False;
     End;

     If (dbNumDias.Value <> 0) and (edtDataBloq.Text <> '') Then
     Begin
         MsgDlg('Não é possível definir ambos bloqueios. Escolha um nº de dias ou uma data para bloqueio.','Aviso',mtWarning,[mbOk],0);
         If dbNumDias.CanFocus Then
            dbNumDias.SetFocus;
         Accept := False;
     End;

  End;

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlDiasBloqMod.MessageInfo <> '' Then
     MsgDlg(CtrlDiasBloqMod.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlDiasBloqMod.ListDiasBloqMod(-1,-1);

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   if dblkModulo.CanFocus then
      dblkModulo.SetFocus;

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    Cds.Data := CtrlDiasBloqMod.ListDiasBloqMod(Sistema.IdEmpresa,StrToFloat(MontaSelect.ValoresChave[0]))
  End;

end;

procedure TfrmCadDiasBloqModMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  Cds.FieldByName('NUMDIAS').AsFloat := 0;
  dblkModulo.SetFocus;

end;

end.
