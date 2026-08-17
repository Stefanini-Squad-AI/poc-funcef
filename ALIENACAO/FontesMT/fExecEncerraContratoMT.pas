{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
                       CM Soluções Informática

                ENCERRA CONTRATOS COM SALDO 0(ZERO)  (MT)

        Módulo: Alienacao
        Programador Responsável: Daniel Simões
        Iniciado e Finalizado em: 25/07/2006

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 27508
Responsável  : Daniel Simões
Data         : 03/03/2008
Descrição    : Ajustes no Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecEncerraContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mContrato, wwdbdatetimepicker, CMDateTimePicker,
  uSistema, uVerificaPreenchimento, uCtrlEventoImovel, uCtrlContratoImovel,
  CmEventosCadastro, uMensErro, uCtrlParcFinancImov, uCtrlPadroes, mImovel,
  mProposta, Db, DBClient, uCMClientDataSet,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmExecEncerraContratoMT = class(TfrmOkCancelar)
    edtDataEncerramento: TCMDateTimePicker;
    Label2: TLabel;
    meObsEvento: TMemo;
    Label7: TLabel;
    molProposta1: TmolProposta;
    cdsMontaQuery: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoImovel : TCtrlContratoImovel;
    CtrlParcFinancImov : TCtrlParcFinancImov;
    CtrlEventoImovel   : TCtrlEventoImovel;
    CtrlContab         : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    dDataEncerramento  : TDateTime;

    function VerificaPreenchimento: Boolean;
  public
    { Public declarations }
  end;

var
  frmExecEncerraContratoMT: TfrmExecEncerraContratoMT;

implementation

{$R *.DFM}

function TfrmExecEncerraContratoMT.VerificaPreenchimento: Boolean;
begin
  Result := True;

  // Verifica se a data de encerramento não foi selecionada...
  if ( dDataEncerramento = -1 ) then begin
    MsgDlg('Selecione a data de encerramento do contrato!','Informação',mtWarning,[mbOk],0);
    edtDataEncerramento.SetFocus;
    Result := False;
    Exit;
  end;
  // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataEncerramento.Text) then
  begin
    MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
    Result := False;
    Exit;
  end;
  // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

  // Verifica se a data selecionada é menor que a data de assinatura do contrato...
  if ( dDataEncerramento < molProposta1.dDataAssinatura ) then begin
    MsgDlg('Data selecionada é anterior a data de assinatura do contrato!','Informação',mtWarning,[mbOk],0);
    edtDataEncerramento.SetFocus;
    Result := False;
    Exit;
  end;

  // Obriga o preenchimento da observação do evento...
  if meObsEvento.Text = '' then begin
    MsgDlg('É necessário indicar a Observação!','Informação',mtWarning,[mbOk],0);
    meObsEvento.SetFocus;
    Result := False;
    Exit;
  end;
end;

procedure TfrmExecEncerraContratoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContratoImovel := TCtrlContratoImovel.Create(Sistema.IdEmpresa,
                                                   Sistema.IdModulo,
                                                   Sistema.IdUsuario,
                                                   Sistema.IdEspAcesso,
                                                   Sistema.UsaPlanoPatro);

  CtrlParcFinancImov := TCtrlParcFinancImov.Create;
  CtrlEventoImovel   := TCtrlEventoImovel.Create;


  CtrlContratoImovel.InitializeAs(Padroes);
  CtrlParcFinancImov.InitializeAs(Padroes);
  CtrlEventoImovel.InitializeAs(Padroes);
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;

procedure TfrmExecEncerraContratoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContratoImovel);
  FreeAndNil(CtrlParcFinancImov);
  FreeAndNil(CtrlEventoImovel);
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
end;

procedure TfrmExecEncerraContratoMT.molProposta1btnBuscaPropClick(Sender: TObject);
begin
  inherited;
  molProposta1.btnBuscaPropClick(2,True,Sender);
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmExecEncerraContratoMT.bbtnConfirmarClick(Sender: TObject);
var fCalcula, fSaldo, fInad : Double;
begin
  inherited;

  fSaldo   := 0; // Recebe o saldo do contrato...
  fInad    := 0; // Recebe o valor de inadimplência ...
  fCalcula := 0; // fSaldo + fInad ...

  dDataEncerramento := edtDataEncerramento.Date;

  if VerificaPreenchimento then begin

    cdsMontaQuery.Data := CtrlParcFinancImov.LookupInadSintetico(molProposta1.iProposta,dDataEncerramento);

    fSaldo   := CtrlParcFinancImov.CalcSldNova(molProposta1.iProposta,-1,dDataEncerramento);
    fInad    := cdsMontaQuery.FieldByName('TOTDEVIDO').AsFloat;
    fCalcula := fSaldo+fInad;

    if fCalcula>0 then begin
      MsgDlg('Não é possível encerrar esse contrato. Existe saldo devedor!','Informação',mtWarning,[mbOk],0);
      molProposta1.btnLimpaPropClick(Sender);
      Exit;
    end;

    CtrlContratoImovel.EncerraAlienacao(molProposta1.iProposta,dDataEncerramento);

    CtrlEventoImovel.RegistraEvento(-1,
                                    molProposta1.iProposta,
                                    -1,
                                    -1,
                                    Sistema.IdUsuario,
                                    'EC',
                                    'Encerramento Contratual',
                                    meObsEvento.Text,
                                    dDataEncerramento);

    bbtnConfirmar.Enabled := False;

  end;
end;

procedure TfrmExecEncerraContratoMT.molProposta1btnLimpaPropClick(
  Sender: TObject);
begin
  inherited;
  molProposta1.btnLimpaPropClick(Sender);
  bbtnConfirmar.Enabled := False;
end;

end.
