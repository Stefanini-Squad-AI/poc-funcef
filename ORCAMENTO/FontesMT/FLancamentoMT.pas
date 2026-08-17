unit FLancamentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, wwdbedit, TREdit,
  uCtrlLancamentoorc, uCtrlPlanilhaContabil, uCtrlContaOrcamentaria, uCMTypes;

type
  TfrmLancamentoMT = class(TFrmCadastroMT)
    lblCodigoConta: TLabel;
    dbrCodigoConta: TDBRealEdit;
    lblNome: TLabel;
    lblDataIni: TLabel;
    Label1: TLabel;
    dbrValor: TDBRealEdit;
    Label3: TLabel;
    dblcPlanilha: TwwDBLookupCombo;
    bbtnBuscaConta: TBitBtn;
    dbeDataRef: TCMDateTimePicker;
    cdsPlanilhaContabil: TCMClientDataSet;
    MontaSelectConta: TMontaSelect;
    cdsContaOrcamentaria: TCMClientDataSet;
    dbeNomeConta: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    function NomeConta: string;
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlLancamentoorc: TCtrlLancamentoorc;
    CtrlPlanilhaContabil: TCtrlPlanilhaContabil;
    CtrlContaOrcamentaria: TCtrlContaOrcamentaria;
  public
    { Public declarations }
  end;

var
  frmLancamentoMT: TfrmLancamentoMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados, uModulo;


procedure TfrmLancamentoMT.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('LANCAMENTOORC.IDPESSOA = ' +
                         IntToStr(Sistema.idEmpresa));
  CtrlLancamentoorc := TCtrlLancamentoorc.Create;
  CtrlPlanilhaContabil := TCtrlPlanilhaContabil.Create;
  CtrlContaOrcamentaria := TCtrlContaOrcamentaria.Create;
  CtrlLancamentoorc.Initialize( DtmBaseDados.dbBaseDados, True,
                                Sistema.ConnectionType,   Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlPlanilhaContabil.Initialize( DtmBaseDados.dbBaseDados, True,
                                   Sistema.ConnectionType,   Sistema.ConnectionSide,
                                   Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlContaOrcamentaria.Initialize( DtmBaseDados.dbBaseDados, True,
                             Sistema.ConnectionType,   Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,  True, nil, nil, False );

  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlLancamentoorc.CdsLancamentoorc := cds;
  cds.Data := CtrlLancamentoorc.Procurar(-1);
  cdsPlanilhaContabil.Data := CtrlPlanilhaContabil.ListaPlanilhaContabil;
end;

procedure TfrmLancamentoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbeDataRef.SetFocus;
end;

procedure TfrmLancamentoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := False;
  //Faz a verificação do preenchimento dos campos
  If (dbrCodigoConta.Value = 0) Then Begin
    MsgDlg('Código da Conta não informado.','Erro',mtError,[mbOk],0);
    dbrCodigoConta.SetFocus;
    exit;
  End;
  If ( Trim( dbeDataRef.Text ) = '' ) Then Begin
    MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOk],0);
    dbeDataRef.SetFocus;
    exit;
  End;
  If (dbrValor.Value = 0) Then Begin
    MsgDlg('Valor do Lançamento não informado.','Erro',mtError,[mbOk],0);
    dbrValor.SetFocus;
    exit;
  End;
  //Completa o código do plano orçamentario
  cds.FieldByName('IDPLANOORCAMEN').AsInteger := Modulo.iPlanoOrc;
  cds.FieldByName('IDPESSOA').AsFloat := Sistema.idEmpresa;

  Accept := True;
  Inherited;
end;

procedure TfrmLancamentoMT.CmeCadastroFind(Sender: TObject);
begin
  Inherited;
  If MontaSelect.RetornouValor Then Begin
    cds.Data := CtrlLancamentoorc.Procurar
                                  (StrtoFloat(MontaSelect.ValoresChave[0]));
    dbeNomeConta.text := NomeConta;
  End;
end;

procedure TfrmLancamentoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlLancamentoOrc.AplicaOperacaoLancamentoOrc;
end;

procedure TfrmLancamentoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlLancamentoOrc.AplicaOperacaoLancamentoOrc;
end;

procedure TfrmLancamentoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlLancamentoOrc.AplicaOperacaoLancamentoOrc;
end;

procedure TfrmLancamentoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //Inherited;
  cds.Data := CtrlLancamentoorc.Procurar
                                (cds.FieldByName('IDLANCAMENTOORC').AsFloat);
end;

procedure TfrmLancamentoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  Inherited;
  If OrigemAbortConfirma <> OaBeforeConfirma Then Begin
    MsgDlg('Ocorreu o seguinte erro : ' + CtrlLancamentoorc.MessageInfo,
           'Aviso',mtError,[mbOK],0);
  End;
end;

procedure TfrmLancamentoMT.sbtnInserirClick(Sender: TObject);
begin
  Inherited;
  dbeDataRef.SetFocus;
end;

procedure TfrmLancamentoMT.sbtnAlterarClick(Sender: TObject);
begin
  Inherited;
  dbeDataRef.SetFocus;
end;

function TfrmLancamentoMT.NomeConta: string;
begin
  inherited;
  //Preenche o nome da conta
  with cdsContaOrcamentaria do begin
    Data := CtrlContaOrcamentaria.ListaContaOrcamentaria(Modulo.iPlanoOrc,
                                  cds.FieldByName('IDCONTAORCAMEN').AsString);
    Result := FieldByName('NOMECONTAORCAMEN').asString;
  end;
end;

procedure TfrmLancamentoMT.bbtnBuscaContaClick(Sender: TObject);
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if (MontaSelectConta.ValoresChave.Count > 0) and
     (MontaSelectConta.ValoresChave[1] <> '') then begin
    dbrCodigoConta.value := StrToFloat(MontaSelectConta.ValoresChave[1]);
    dbeNomeConta.text    := MontaSelectConta.ValoresChave[2];
  end;
end;

procedure TfrmLancamentoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbeNomeConta.text := '';
  bbtnBuscaConta.SetFocus;
end;

procedure TfrmLancamentoMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   dbeNomeConta.text := '';
end;

procedure TfrmLancamentoMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  dbeNomeConta.text := '';
end;

end.


