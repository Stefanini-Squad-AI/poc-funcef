{------------------------------------------------------------------------------
  Autor  : Antonio Marcos (amf)
  Data   : 29.08.2007
  Pend.  : 26224
  Descr. : Não estava exibindo as informações da observação ao se clicar no item da solicitação.
--------------------------------------------------------------------------------}

unit FRADConsultaSoliComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TREdit,
  wwdblook, Mask, wwdbedit, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  DBClient, uCMClientDataSet, Db, DBTables, CmEventosCadastro, Wwquery,
  Wwdatsrc, uCtrlRADConsModulos, uCtrlPadroes, TB97Tlwn;

type
  TfrmRADConsultaSoliComp = class(TfrmSairAjuda)
    pnlMestre: TPanel;
    DbrgDestino: TDBRadioGroup;
    DbrgAtendida: TDBRadioGroup;
    PnlDatas: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbdteNecessidade: TCMDateTimePicker;
    dbdteEmissao: TCMDateTimePicker;
    Panel1: TPanel;
    Label12: TLabel;
    lbAlmoxDestino: TLabel;
    dbedSeqSoliComp: TwwDBEdit;
    EdAlmoxaDestino: TEdit;
    grp: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    dblcAtiv: TwwDBLookupCombo;
    GpDotOrc: TGroupBox;
    ReResOrc: TRealEdit;
    Panel2: TPanel;
    Label3: TLabel;
    EdValorTotal: TRealEdit;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    dsPatro: TwwDataSource;
    dsPrograma: TwwDataSource;
    dsPlano: TwwDataSource;
    cdsPatro: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    cdsAlmoxOrigem: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    cdsCRespon: TCMClientDataSet;
    cdsUnid: TCMClientDataSet;
    cdsSoliComp: TCMClientDataSet;
    cdsItemSoli: TCMClientDataSet;
    cdsParamCompras: TCMClientDataSet;
    cdsAlmoxCompras: TCMClientDataSet;
    dbgrdDet: TwwDBGrid;
    cdsPlano: TCMClientDataSet;
    twObs: TToolWindow97;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBRichEdit1: TDBRichEdit;
    procedure DbrgDestinoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FIdProcesso: integer;
    iNumSoliComp: integer;
    iCodCusteio: integer;
    iCodAlmox: integer;
    RADConsultaCompras: TCtrlRADConsultaCompras;
    function CalculaValorTotal: Real;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelecionarItensSoliCompras;
    procedure SetIdProcesso(const Value: integer);
  public
    { Public declarations }
    property IdProcesso: integer read FIdProcesso write SetIdProcesso;
    procedure SelecionarSolicitacaoCompras;
  end;

var
  frmRADConsultaSoliComp: TfrmRADConsultaSoliComp;

implementation
Uses  USistema, UDataBase, UAutorizacao, DBaseDados,
      UMensErro,uFuncaoGeral,//uOrcamento,
      {uIntegraBack,}uString;

{$R *.DFM}

procedure TfrmRADConsultaSolicomp.DbrgDestinoChange(Sender: TObject);
begin
  inherited;
  If DbrgDestino.Value = 'C' Then
  Begin
    lbAlmoxDestino.Caption:= 'Centro Custo Destino:';
//    EdAlmoxaDestino.Text:= Modulo.sDescCCusto;
  end
  else
  Begin
    lbAlmoxDestino.Caption:= 'Almoxarifado Destino:';
//    EdAlmoxaDestino.Text:= Modulo.sAlmoxaUsuario;
  end;
end;


Function TfrmRADConsultaSolicomp.CalculaValorTotal: Real;
var
  rValorTotal: extended;
Begin
  rValorTotal:= 0;
  If not cdsItemSoli.IsEmpty Then
  Begin
    cdsItemSoli.DisableControls;
    cdsItemSoli.First;
    While not cdsItemSoli.Eof do
    Begin
      rValorTotal:= rValorTotal + cdsItemSoli.FieldByName('ValorTotal').AsFloat;
      cdsItemSoli.Next;
    end;
    cdsItemSoli.EnableControls;
  end;
  Result:= rValorTotal;
  EdValorTotal.Value:= rValorTotal;
end;

procedure TfrmRADConsultaSolicomp.FormCreate(Sender: TObject);
begin
  inherited;
  RADConsultaCompras := TCtrlRADConsultaCompras.Create;
  RADConsultaCompras.InitializeAs(Padroes);

  //amf 08.12.2006 23860 obtém os dados do almoxarifado.
  cdsAlmoxOrigem.Data := RADConsultaCompras.SelectAlmox(Sistema.IdUsuario, Sistema.IdEmpresa);
  iCodCusteio         := cdsAlmoxOrigem.FieldByName('CODCUSTEIO').AsInteger;
  iCodAlmox           := cdsAlmoxOrigem.FieldByName('CODALMOXARIFADO').AsInteger;

  cdsPlano.Data    := RADConsultaCompras.SelectPlanoPrevContabil;
  cdsPatro.Data    := RADConsultaCompras.SelectPatrocinadora;
  cdsPrograma.Data := RADConsultaCompras.SelectPrograma;

  cdsParamCompras := TCMClientDataSet.Create(Self);

  cdsAlmoxCompras.Data := RADConsultaCompras.SelectAlmoxOrigem(Sistema.IdEmpresa, iCodAlmox);

  cdsArtigo.Data := RADConsultaCompras.SelectArtigo(Sistema.IdUsuario, Sistema.IdEmpresa);

  cdsCRespon.Data := RADConsultaCompras.SelectCRespon(Sistema.idUsuario, Sistema.IdEmpresa);

  cdsUnid.Data    := RadConsultaCompras.SelectUnidadeNegocio(Sistema.IdEmpresa);

  EdAlmoxaDestino.Text:= cdsAlmoxOrigem.FieldByName('DESCALMOX').AsString;
end;

procedure TfrmRADConsultaSolicomp.SelecionarSolicitacaoCompras;
begin
  iNumSolicomp := RADConsultaCompras.GetNumSolicitacaoCompra(FIdProcesso);
  cdsSoliComp.Data := RADConsultaCompras.SelectSolicitacaoCompras(iNumSoliComp);
  if (iNumSoliComp > 0) then
  begin
    if (not cdsSoliComp.FieldByName('IDRESERVAORCAMEN').AsInteger > 0) then
        ReResOrc.Value   := RADConsultaCompras.GetIdNumReserva(cdsSoliComp.FieldByName('IDRESERVAORCAMEN').AsInteger,0, Sistema.IdEmpresa)
    else
        ReResOrc.Value   := 0;

    SelecionarItensSoliCompras;
  end;
end;


procedure TfrmRADConsultaSolicomp.SelecionarItensSoliCompras;
begin
  cdsItemSoli.Data := RADConsultaCompras.SelectItemSolicitacaoCompras(iNumSoliComp, iCodCusteio);
  TFloatField(cdsItemSoli.FieldByName('ValorUn')).DisplayFormat    := '#,##0.00';
  TFloatField(cdsItemSoli.FieldByName('ValorTotal')).DisplayFormat := '#,##0.00';
  CalculaValorTotal;
end;


procedure TfrmRADConsultaSolicomp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(RADConsultaCompras);
   inherited;
end;


procedure TfrmRADConsultaSoliComp.SetIdProcesso(const Value: integer);
begin
  FIdProcesso := Value;
end;

procedure TfrmRADConsultaSoliComp.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  twObs.Show;
end;

procedure TfrmRADConsultaSoliComp.BitBtn1Click(Sender: TObject);
begin
  inherited;
  twObs.Hide; 
end;

end.
