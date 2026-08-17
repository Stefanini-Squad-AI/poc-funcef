unit FCadTiposAplicMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, CMProcura, wwdblook,
  DBCtrls, Mask, wwdbedit, TREdit, CMDBLookupCombo, DBTables, Wwquery,
  FCadastroMT,uCtrlTiposAplic, Provider, uCtrlListTercFinanc 
  {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
  TFrmCadTiposAplicMT = class(TFrmCadastroMT)
    dbeCodigoCorrespondente: TwwDBEdit;
    Label1: TLabel;
    lblDescricao: TLabel;
    dbeDescricao: TwwDBEdit;
    dbrTipoResgate: TDBRadioGroup;
    dbrFixaVariavel: TDBRadioGroup;
    gbDadosBasicos: TGroupBox;
    lblUnidNegoc: TLabel;
    lblTipoRD: TLabel;
    lblCentroRespon: TLabel;
    lblCentCusto: TLabel;
    lblContaOrcRec: TLabel;
    lblContaOrcCus: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcCentCusto: TwwDBLookupCombo;
    cmpContaOrcRec: TCMProcura;
    cmpContaOrcCus: TCMProcura;
    gbReaplicacao: TGroupBox;
    lblMoedaCota: TLabel;
    lblTipoAplic: TLabel;
    lblPrazoResg: TLabel;
    lblTxPrev: TLabel;
    dblcMoeda: TCMDBLookupCombo;
    dblcTipoAplic: TCMDBLookupCombo;
    dbrePrazoResgate: TDBRealEdit;
    dbreJurosPrev: TDBRealEdit;
    dbcbReaplica: TDBCheckBox;
    gbDespesa: TGroupBox;
    lblPercCusto: TLabel;
    lblDespRend: TLabel;
    dbrePercCusto: TDBRealEdit;
    dbrePercDescRend: TDBRealEdit;
    msContaOrcamen: TMontaSelect;
    cdsMoedas: TCMClientDataSet;
    cdsTiposAplicAux: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsTipoRD: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblcCentCustoChange(Sender: TObject);
  private
    { Private declarations }
    CtrlTiposAplic : TCtrlTiposAplic;
    CtrlListTerceiros : TCtrlListTercFinanc;

  public
    { Public declarations }
  end;

var
  FrmCadTiposAplicMT: TFrmCadTiposAplicMT;

implementation

uses dBaseDados, uSistema, uMensErro;

{$R *.DFM}

procedure TFrmCadTiposAplicMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa Ctrl de Tipos de Aplicação
   CtrlTiposAplic:=TCtrlTiposAplic.Create;
   CtrlTiposAplic.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds
   Cds.Data:=CtrlTiposAplic.ListTipoAplicacao(-1,-1); //vazio
   CtrlTiposAplic.CdsTiposAplic:=Cds;

   //Carrega Cds de Unidades de Negócio
   cdsTiposAplicAux.Data:=CtrlTiposAplic.ListTipoAplicacao(Sistema.IdEmpresa,0);

   //Inicializa Ctrl de List de Terceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega Cds de Unidades de Negócio
   cdsUnidNeg.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa, 0,'A','');
   //Carrega Cds de Tipo de Recebimento/Desembolso
   cdsTipoRD.Data:=CtrlListTerceiros.ListTipoRD(Sistema.IdEmpresa,'R','A');
   //Carrega Cds de Centro de Responsabilidade
   cdsCentroRespon.Data:=CtrlListTerceiros.ListCentroRespon(Sistema.IdEmpresa,'A','S','');
   //Carrega Cds de Centro de Custo
   cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCusto(Sistema.IdEmpresa,'A','S');
   //Carrega CdsMoedas
   cdsMoedas.Data:=CtrlListTerceiros.ListMoeda(0,True);
   //Inclui filtro no MontaSelect
   MontaSelect.Filtro.Add('(TIPOAPLICACAO.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') ');
end;

procedure TFrmCadTiposAplicMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlTiposAplic.Free;
   CtrlListTerceiros.Free;
   inherited;
end;

procedure TFrmCadTiposAplicMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
   cds.FieldByName('TIPORESGATE').AsString:='U';
   cds.FieldByName('FIXAVARIAVEL').AsString:='F';
   dbeCodigoCorrespondente.SetFocus;
end;

procedure TFrmCadTiposAplicMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       Cds.Close;
       Cds.Data:=CtrlTiposAplic.ListTipoAplicacao(Sistema.IdEmpresa,
                                                  StrToFloat(MontaSelect.ValoresChave[0]));
    end;
end;

procedure TFrmCadTiposAplicMT.dblcCentCustoChange(Sender: TObject);
begin
   inherited;
   if not(cds.State in [dsInsert,dsEdit]) then Exit;
   if Trim(dblcCentCusto.Text)<>'' then
      cds.FieldByName('IDEMPRESA').AsFloat:=Sistema.IdEmpresa
   else
      cds.FieldByName('IDEMPRESA').Clear;
end;

procedure TFrmCadTiposAplicMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   if Trim(dbeDescricao.Text)='' then
    begin
       MsgDlg('Obrigatório Preencher a Descrição.','Erro',mtError,[mbOk],0);
       dbeDescricao.SetFocus;
    end
   else
    inherited;
end;

procedure TFrmCadTiposAplicMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlTiposAplic.AplicaAtualTiposAplic;
end;

procedure TFrmCadTiposAplicMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlTiposAplic.AplicaAtualTiposAplic;
end;

procedure TFrmCadTiposAplicMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlTiposAplic.AplicaAtualTiposAplic;
end;

procedure TFrmCadTiposAplicMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(CtrlTiposAplic.MessageInfo,'Erro',mtError,[mbOk],0);
end;

end.
