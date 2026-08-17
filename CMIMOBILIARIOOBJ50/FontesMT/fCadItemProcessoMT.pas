{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

      CADASTRO DE ITENS POR PROCESSO ( MT )

      Módulo          :  Administração Imobiliária
      Autor           :  Daniel Simões
      Data de Término :  25/06/2007

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadItemProcessoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, wwdblook, uCtrlItemProcesso, uCmSqlParams, FCadastroGridMT;

type
  TfrmCadItemProcessoMT = class(TfrmCadastroGridMTImob)
    dblComboRelatorio: TwwDBLookupCombo;
    lblNomeRelatorio: TLabel;
    lblTipoInterno: TLabel;
    dblComboTipoInterno: TwwDBLookupCombo;
    lblMovimentacao: TLabel;
    dblComboMovimentacao: TwwDBLookupCombo;
    cdsBuscaProcesso: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsBuscaProcessoIDREPORTS: TFloatField;
    cdsBuscaProcessoNAME: TStringField;
    cdsTipoInterno: TCMClientDataSet;
    dsTipoInterno: TwwDataSource;
    cdsTipoMovimentacao: TCMClientDataSet;
    dsTipoMovimentacao: TwwDataSource;
    cdsTipoMovimentacaoIDTIPOCUSTORECIMO: TFloatField;
    cdsTipoMovimentacaoDESCCUSTORECIMO: TStringField;
    dsBuscaProcesso: TwwDataSource;
    cdsTipoInternoTIPOINTERNO: TFloatField;
    cdsTipoInternoDESCRICAO: TStringField;
    cdsTipoInternoIDPROCESSOIMOB: TFloatField;
    CdsNOMETIPOINTERNO: TStringField;
    CdsMOVIMENTACAO: TStringField;
    CdsPROCESSO: TStringField;
    CdsTIPOINTERNO2: TFloatField;
    CdsIDPROCESSOIMOB: TFloatField;
    CdsIDREPORTS: TFloatField;
    CdsIDITEMXPROCIMOB: TFloatField;
    CdsIDTIPOCUSTORECIMO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblComboRelatorioChange(Sender: TObject);
    procedure dblComboTipoInternoChange(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }

    CtrlItemProcesso : TCtrlItemProcesso;

    function VerificaPreenchimento: Boolean;

  public
    { Public declarations }

  protected
    procedure FazerRefresh; override;

  end;

var
  frmCadItemProcessoMT: TfrmCadItemProcessoMT;

implementation

uses dBaseDados, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     uSistema, uModuloImobiliario;

{$R *.DFM}

procedure TfrmCadItemProcessoMT.FormCreate(Sender: TObject);
begin
  inherited;

  // Cria e inicializa o CtrlObject do cadastro dos Itens por Processo...
  CtrlItemProcesso := TCtrlItemProcesso.Create(Sistema.IdModulo);
  CtrlItemProcesso.Initialize(dtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True,
                              ComunsImobiliario.MensErroMT);

  { Associa o Cds do CtrlObject ao Cds local para as alterações locais
    refletirem no CtrlObject }
  CtrlItemProcesso.CdsItemProcesso := Cds;

  Cds.Data                 := CtrlItemProcesso.LookupItens(Sistema.IdModulo);
  cdsBuscaProcesso.Data    := CtrlItemProcesso.LookupRelatorio(Sistema.IdModulo);
  cdsTipoMovimentacao.Data := CtrlItemProcesso.LookupMovimentacao(Sistema.IdModulo);
end;

procedure TfrmCadItemProcessoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlItemProcesso );

  inherited;
end;

procedure TfrmCadItemProcessoMT.dblComboRelatorioChange(Sender: TObject);
var iReports : Integer;
begin
  inherited;

  dblComboTipoInterno.Enabled := dblComboRelatorio.Text<>'';
  cdsTipoInterno.Data         := CtrlItemProcesso.LookupTipoInterno(cdsBuscaProcesso.FieldByName('IDREPORTS').AsInteger);
end;

procedure TfrmCadItemProcessoMT.dblComboTipoInternoChange(Sender: TObject);
begin
  inherited;

  dblComboMovimentacao.Enabled := dblComboTipoInterno.Text<>'';
end;

procedure TfrmCadItemProcessoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := CtrlItemProcesso.GravaItemProcesso;
end;

procedure TfrmCadItemProcessoMT.CmeCadastroBeforeConfirma(Sender:TObject; var Accept:Boolean);
begin
  inherited;

  Accept := VerificaPreenchimento;
end;

procedure TfrmCadItemProcessoMT.FazerRefresh;
begin
  // Faz Refresh...
  Cds.Data := CtrlItemProcesso.LookupItens(Sistema.IdModulo);

  inherited;
end;

function TfrmCadItemProcessoMT.VerificaPreenchimento: Boolean;
begin
  Result := False;

  try
    if (dblComboRelatorio.Text='') then
      raise EValidacao.CreateVal('Informe o Relatório',dblComboRelatorio);

    if (dblComboTipoInterno.Text='') then
      raise EValidacao.CreateVal('Informe o Tipo Interno',dblComboTipoInterno);

    if (dblComboMovimentacao.Text='') then
      raise EValidacao.CreateVal('Informe o Tipo de Movimentação',dblComboMovimentacao);
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

end.
