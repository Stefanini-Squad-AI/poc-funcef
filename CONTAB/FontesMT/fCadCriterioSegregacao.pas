unit fCadCriterioSegregacao;

interface
{------------------------------------------------------------------------------
Desenvolvedor: Marcus Oliveira
Data: 16/10/2006
Pendência: 23500 - Remover os capos Histórico Padrão e Ordem de Calculo.

------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 09/12/03
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Criação da tela para Critério de Rateio.
                 o critério para segregação é vinculado a uma
                 conta contábil x data de cotação para determinar um percentual
                 para segregação do patrimônio.
------------------------------------------------------------------------------}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, StdCtrls, Mask, wwdbedit, Db, uCmSqlParams,
  MontaSelect, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Wwdbspin, wwdblook, 
  dBaseDados, uSistema, uMensErroMT, uMensErro, uVerificaPreenchimento,
  uCtrlSegregacao, uCtrlListTerceiros, uCtrlHistoContab;

type
  TfrmCadCriterioSegregacao = class(TfrmCadastroGridMTImob)
    CdsDESCRICAO: TStringField;
    CdsORDEM: TFloatField;
    CdsFLGTIPOSEGREGA: TStringField;
    CdsFLGTIPOCOTACAO: TStringField;
    edtDescricao: TwwDBEdit;
    Label1: TLabel;
    rdgTipoSegrega: TDBRadioGroup;
    rdgTipoCotacao: TDBRadioGroup;
    CdsIDSEGREGACRITER: TFloatField;
    CdsHITCODHIST: TStringField;
    CdsIDPESSOA: TFloatField;
    CdsTIPCODIGO: TStringField;
    CdsTipoOper: TCMClientDataSet;
    Label10: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    CdsTIPCODIGO_1: TStringField;
    CdsTIPDESCRICAO: TStringField;
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);

  protected
    procedure FazerRefresh; override;

  private
    { Private declarations }
    CtrlSegregacao   : TCtrlSegregacao;
    CtrlLisTerceiros : TCtrlListTerceiros;
    CtrlHistoContab  : TCtrlHistoContab;
    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
  end;

var
  frmCadCriterioSegregacao: TfrmCadCriterioSegregacao;

implementation

{$R *.DFM}

{ TfrmCadCriterioSegregacao }

procedure TfrmCadCriterioSegregacao.FazerRefresh;
begin
  inherited;
  Cds.Data := CtrlSegregacao.ListaSegregaCriter;

end;

procedure TfrmCadCriterioSegregacao.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsIDPESSOA.AsInteger := Sistema.IdEmpresa;
  Accept := CtrlSegregacao.GravaSegregaCriter;

end;

procedure TfrmCadCriterioSegregacao.FormCreate(Sender: TObject);
begin
  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                       MensErroMT.MensErroMT);
  CtrlSegregacao.GetParams (Sistema.IdEmpresa);
  CtrlSegregacao.CdsSegregaCriter := Cds;

  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.InitializeAs(CtrlSegregacao);

  CtrlLisTerceiros := TCtrlListTerceiros.Create;
  CtrlLisTerceiros.InitializeAs(CtrlSegregacao);

  CdsTipoOper.Data  := CtrlLisTerceiros.ListTipoOper(True);

  FazerRefresh ;
  inherited;
end;

procedure TfrmCadCriterioSegregacao.CmeCadastroEdit(Sender: TObject);
begin
  Cds.Data := CtrlSegregacao.ListaSegregaCriter(CdsIDSEGREGACRITER.AsInteger);

  inherited;
end;

procedure TfrmCadCriterioSegregacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil ( CtrlSegregacao );
  inherited;
end;

procedure TfrmCadCriterioSegregacao.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

procedure TfrmCadCriterioSegregacao.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlSegregacao.GravaSegregaCriter;
end;

function TfrmCadCriterioSegregacao.VerificaPreenchimento: boolean;
begin
  Result := False;
  try

    if edtDescricao.Text = '' then
      raise EValidacao.CreateVal('Informe a descrição do Critério para Segregação!', edtDescricao);

    if dblkTipoOper.Text = '' then
      raise EValidacao.CreateVal('Informe o Tipo de Operação do Critério para Segregação!', dblkTipoOper);

    if rdgTipoSegrega.ItemIndex = -1 then
      raise EValidacao.CreateVal('Informe o Tipo do Critério para Segregação!', rdgTipoSegrega);

    if rdgTipoCotacao.ItemIndex = -1 then
      raise EValidacao.CreateVal('Informe o Tipo de Cálculo do Critério para Segregação!', rdgTipoCotacao);

  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmCadCriterioSegregacao.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  if cds.State in dsEditModes then begin
    Accept := VerificaPreenchimento;
  end;
end;

end.
