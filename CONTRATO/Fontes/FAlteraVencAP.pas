{--------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina ......: criação do Formulário
SOL..........: 65757
Kintana......: 523339
Data.........: 06/08/2011
Responsável..: Helen V. Bianchi
Descrição....: criação do Formulário
--------------------------------------------------------------------------------
}
Unit FAlteraVencAP;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  uCtrlParamIntegra, wwdbedit, MontaSelect, DBTables, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet, Mask,
  uCtrlAlteraVenc, uDiasUteis, uCtrlFinanc, uMensErro, uDataBase, uSistema,
  uFuncaoGeral, dBaseDados;

Type
  TfrmAlteraVencAP = Class(TfrmOkCancelar)
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
    ds: TwwDataSource;
    Label4: TLabel;
    cds: TCMClientDataSet;
    bbtnSeleciona: TBitBtn;
    MontaSelect: TMontaSelect;
    cdsMedicao: TCMClientDataSet;
    dsMedicao: TwwDataSource;
    Procedure bbtnSelecionaClick(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

  private
    CtrlAlteraVenc: TCtrlAlteraVenc;
    CtrlFinanc    : TCtrlFinanc;
    CtrlDiasUteis : TDiasUteis;
    Procedure ProcuraDoc;
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmAlteraVencAP: TfrmAlteraVencAP;
  dDataVenc: tDateTime;
Implementation

{$R *.DFM}

Procedure TfrmAlteraVencAP.bbtnSelecionaClick(Sender: TObject);
Begin
  Inherited;
  MontaSelect.Executar;
  ProcuraDoc;
End;

Procedure TfrmAlteraVencAP.FormActivate(Sender: TObject);
Begin
  Inherited;
  pnlDadosDoc.Enabled := False;
End;

Procedure TfrmAlteraVencAP.ProcuraDoc;
Begin
  Inherited;
  If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[1] <> '') Then
  Begin
    cds.Data            := CtrlAlteraVenc.ListDocumento(StrToInt(MontaSelect.ValoresChave[1]), ParamIntegra.RecPag);
    pnlDadosDoc.Enabled := True;
    dDataVenc           := dbeVencOri.Date;
    dbeDataProgram.SetFocus;
  End;
End;

Procedure TfrmAlteraVencAP.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    // Mesmo Help Context do Contas a Receber
    HelpContext           := 40031;
    bbtnAjuda.HelpContext := 40031;
  End
  Else
  Begin
    HelpContext           := 30016;
    bbtnAjuda.HelpContext := 30016;
  End;
    MontaSelect.Filtro.Add('CONTRATOCONTR.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +
                           'AND CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                           'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');

  CtrlAlteraVenc := TCtrlAlteraVenc.Create;
  CtrlAlteraVenc.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlFinanc     := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
  CtrlFinanc.InitializeAs(ParamIntegra);
  CtrlDiasUteis:=TDiasUteis.Create;
  CtrlDiasUteis.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  cds.Data       := CtrlAlteraVenc.ListDocumento(0, ParamIntegra.RecPag);
End;

Procedure TfrmAlteraVencAP.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  FreeAndNil(CtrlAlteraVenc);
  FreeAndNil(CtrlFinanc);
  FreeAndNil(CtrlDiasUteis);
End;

Procedure TfrmAlteraVencAP.bbtnConfirmarClick(Sender: TObject);
var dDtBloqueioDoisDias, dtBloqueio : TdateTime;
Begin
  Inherited;



    //Verifica se o código do documento está preenchido
    If (cds.FieldByName('CODDOCUMENTO').AsFloat) = 0 Then
  Begin
    MsgDlg('Código do Documento não informado, impossível excluir', 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  End;

  cdsMedicao.Close;
  cdsMedicao.Data :=CtrlAlteraVenc.VerificaMedicao(cds.FieldByName('CODDOCUMENTO').AsFloat,Sistema.IdEmpresa);


  //Verifica se o campo está preenchido
  If trim(dbeDataProgram.Text) = '' Then
  Begin
    MsgDlg('Obrigatório preecher a Data Programada', 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  End;

  //Verifica se a nova data é menor que a data de Emissão/Lançamento
  If dbeDataProgram.Date < cds.FieldByName('DATAEMISSAO').AsDateTime Then
  Begin
    MsgDlg('A nova Data de Vencimento não pode ser menor que a Data de Emissão', 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  End;

  //Verifica se a nova data digitada é um dia útil
  if not(CtrlDiasUteis.DiaUtil(Sistema.IdEmpresa,dbeDataProgram.Date,True,True,False)) then
  begin
      if MsgDlg('A Data de Vencimento não é Dia Útil, confirma mesmo assim?',
      'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      begin
          FuncaoGeral.TiraIcone;
          dbeDataProgram.SetFocus;
          exit;
      end;
  end;


  //Verifica se o usuário está com a disponibilidade liberada na Tesouraria:
  //Caso não tenha:
  //Verifica se a data cadastradas é maior que dois dias úteis a partir da data do bloqueio
  if not (CtrlAlteraVenc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,dDataVenc))then
  begin
         MsgDlg('A disponibilidade está bloqueada e o usuário não possui autorização para executar lançamentos.', 'Erro', mtError, [mbOk], 0);
         FuncaoGeral.TiraIcone;
         dbeDataProgram.SetFocus;
         exit;
  end;

  //Verifica se a nova data de vencimento também é maior que dois dias a partir de bloqueio
  if not (CtrlAlteraVenc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,dbeDataProgram.DateTime))then
  begin
     MsgDlg('A disponibilidade está bloqueada e o usuário não possui autorização para executar lançamentos.', 'Erro', mtError, [mbOk], 0);
     FuncaoGeral.TiraIcone;
     dbeDataProgram.SetFocus;
     exit;
  end;

  //Verifica se o Documento já foi baixado
  if not CtrlAlteraVenc.validaOperacao(cds.FieldByName('CODDOCUMENTO').AsFloat) then
  begin
    MsgDlg(CtrlAlteraVenc.MessageInfo, 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  end;

  //Verifica se a Medição já foi Estornada
    if not CtrlAlteraVenc.verificaEstorno(cds.FieldByName('CODDOCUMENTO').AsFloat) then
  begin
    MsgDlg(CtrlAlteraVenc.MessageInfo, 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  end;

  if (cdsMedicao.FieldByName('FLGESTORNADO').AsInteger= 1) then
  begin
    MsgDlg('Não é possível alterar Medição estornada','Atenção',mtInformation,[mbOK],0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    Exit;
  end;

  //Verifica se não existem lançamento já baixados
  if not CtrlAlteraVenc.verificaLancamentosBaixa(cds.FieldByName('CODDOCUMENTO').AsFloat) then
  begin
    MsgDlg(CtrlAlteraVenc.MessageInfo, 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  end;

  if not CtrlAlteraVenc.verificaEnglobamento(cds.FieldByName('CODDOCUMENTO').AsFloat) then
  begin
    MsgDlg(CtrlAlteraVenc.MessageInfo, 'Erro', mtError, [mbOk], 0);
    FuncaoGeral.TiraIcone;
    dbeDataProgram.SetFocus;
    exit;
  end;


  //O Procedimento abaixo confirma se a alteração deve ser feito e aplica as
  //alterações no banco de dados
  if MsgDlg('Confirma a Alteração da Data Programada e a Data de Vencimento ?','Confirma',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
      If Not CtrlAlteraVenc.AlteraVencimentoProg(cds.FieldByName('CODDOCUMENTO').AsInteger, cds.FieldByName('DATAPROGRAMADA').AsDateTime,
        Sistema.idEmpresa, Sistema.idModulo, Sistema.idUsuario) Then
      Begin
        MsgDlg(CtrlAlteraVenc.MessageInfo, 'Erro', mtError, [mbOk], 0);
        Exit;
      End;
      cds.Data := CtrlAlteraVenc.ListDocumento(0, ParamIntegra.RecPag);
      MsgDlg('Data Programada Alterada Com Sucesso', 'Aviso', mtInformation, [mbOk], 0);
  end;
End;

procedure TfrmAlteraVencAP.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    cds.Data            := CtrlAlteraVenc.ListDocumento(cds.FieldByName('CODDOCUMENTO').asinteger, ParamIntegra.RecPag);
end;

End.

