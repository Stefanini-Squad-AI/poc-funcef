(*******************************************************************************
 15/03/1999 - 02.05.09
 Limpar a tela após a confirmação da operação e Mostrar mensgens de erro e finalização.
 19/08/1999 - 02.12.06
 Alteração na mensagem de confirmação da operação
 *******************************************************************************)
Unit FAlteraVencMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlParamIntegra,
  wwdbedit, MontaSelect, DBTables, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet, Mask,
  uCtrlAlteraVenc;

Type
  TfrmAlteraVencMT = Class(TfrmOkCancelar)
    pnlSeleciona: TPanel;
    pnlDadosDoc: TPanel;
    lblFornCli: TLabel;
    Label1: TLabel;
    dbeRazaoSocial: TwwDBEdit;
    dbeNoDocumento: TwwDBEdit;
    Label2: TLabel;
    dbeComplDoc: TwwDBEdit;
    dbeVencOri: TCMDateTimePicker;
    Label3: TLabel;
    dbeDataEmis: TCMDateTimePicker;
    Label5: TLabel;
    dbeDataProgram: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    ds: TwwDataSource;
    Label4: TLabel;
    cds: TCMClientDataSet;
    bbtnSeleciona: TBitBtn;
    Procedure bbtnSelecionaClick(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlAlteraVenc: TCtrlAlteraVenc;
    Procedure ProcuraDoc;
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmAlteraVencMT: TfrmAlteraVencMT;

Implementation

Uses uMensErro, uDataBase, uSistema, uFuncaoGeral, dBaseDados;

{$R *.DFM}

Procedure TfrmAlteraVencMT.bbtnSelecionaClick(Sender: TObject);
Begin
  Inherited;
  MontaSelect.Filtro.Add('TIPODOCRECPAG.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 + ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') ' + ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario) + '))');
  MontaSelect.Executar;
  ProcuraDoc;
End;

Procedure TfrmAlteraVencMT.FormActivate(Sender: TObject);
Begin
  Inherited;
  pnlDadosDoc.Enabled := False;
End;

Procedure TfrmAlteraVencMT.ProcuraDoc;
Begin
  Inherited;
  If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
  Begin
    cds.Data := CtrlAlteraVenc.ListDocumento(StrToInt(MontaSelect.ValoresChave[0]), ParamIntegra.RecPag);
    pnlDadosDoc.Enabled := True;
    dbeDataProgram.SetFocus;
  End;
End;

Procedure TfrmAlteraVencMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40031;
    bbtnAjuda.HelpContext := 40031;
  End
  Else
  Begin
// Daniel Simões - 26/01/2006 - Início------------------------------------------
    HelpContext           := 30016;
    bbtnAjuda.HelpContext := 30016;
// Daniel Simões - 26/01/2006 - Fim---------------------------------------------
  End;
  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('((DOCUMENTO.STATUS <> ''2'') OR (DOCUMENTO.STATUS IS NULL))');

  CtrlAlteraVenc := TCtrlAlteraVenc.Create;
  CtrlAlteraVenc.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  cds.Data := CtrlAlteraVenc.ListDocumento(0, ParamIntegra.RecPag);
End;

Procedure TfrmAlteraVencMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  CtrlAlteraVenc.Free;
End;

Procedure TfrmAlteraVencMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  If trim(dbeDataProgram.Text) = '' Then
  Begin
    MsgDlg('Obrigatório preecher a Data Programada', 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  End;
  If dbeDataProgram.Date < cds.FieldByName('DATAEMISSAO').AsDateTime Then
  Begin
    MsgDlg('Data Programada não pode ser menor que a Data de Emissão', 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  End;
  If dbeDataProgram.Date < Date Then
  Begin
    MsgDlg('Data Programada não pode ser menor que a Data de Hoje', 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  End;
  If Not CtrlAlteraVenc.AlteraVencimento(cds.FieldByName('CODDOCUMENTO').AsInteger, cds.FieldByName('DATAPROGRAMADA').AsDateTime,
    Sistema.idEmpresa, Sistema.idModulo, Sistema.idUsuario) Then
  Begin
    MsgDlg(CtrlAlteraVenc.MessageInfo, 'Erro', mtError, [mbOk], 0);
    Exit;
  End;
  cds.Data := CtrlAlteraVenc.ListDocumento(0, ParamIntegra.RecPag);

  MsgDlg('Data Programada Alterada Com Sucesso', 'Aviso', mtInformation, [mbOk], 0);
End;

End.

