//Marcus Oliveira 01/2/2007 24363 Removido o owner CM.
unit FCadTipoAplic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwquery, Wwdatsrc, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, wwdbedit, TB97Ctls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdblook, CMDBLookupCombo, TREdit,
  CMProcura, CmEventosCadastro, ImgList;

type
  TfrmCadTipoAplic = class(TfrmCadastroCS)
    dbeDescricao: TwwDBEdit;
    lblDescricao: TLabel;
    dbrFixaVariavel: TDBRadioGroup;
    dbrTipoResgate: TDBRadioGroup;
    qryMoeda: TwwQuery;
    gbReaplicacao: TGroupBox;
    lblMoedaCota: TLabel;
    dblcMoeda: TCMDBLookupCombo;
    qryTipoAplic: TwwQuery;
    lblTipoAplic: TLabel;
    dblcTipoAplic: TCMDBLookupCombo;
    lblPrazoResg: TLabel;
    dbrePrazoResgate: TDBRealEdit;
    lblTxPrev: TLabel;
    dbreJurosPrev: TDBRealEdit;
    qryTipoRD: TwwQuery;
    qryCentroRespon: TwwQuery;
    qryUnidNegocio: TwwQuery;
    qryUnidNegocioUNIDNEGOC: TFloatField;
    qryUnidNegocioNOME: TStringField;
    qryUnidNegocioUNECODIGO: TStringField;
    qryCentroResponCODCENTRORESPON: TStringField;
    qryCentroResponNOME: TStringField;
    qryCentCust: TwwQuery;
    qryCentCustCODCENTROCUSTO: TStringField;
    qryCentCustNOME: TStringField;
    qryTipoRDCODTIPRECDES: TStringField;
    qryTipoRDDESCRICAO: TStringField;
    gbDadosBasicos: TGroupBox;
    lblUnidNegoc: TLabel;
    lblTipoRD: TLabel;
    lblCentroRespon: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcCentCusto: TwwDBLookupCombo;
    lblCentCusto: TLabel;
    cmpContaOrcRec: TCMProcura;
    cmpContaOrcCus: TCMProcura;
    lblContaOrcRec: TLabel;
    lblContaOrcCus: TLabel;
    msContaOrcamen: TMontaSelect;
    qryParamOrc: TwwQuery;
    qryParamOrcIDPLANOORCAMEN: TFloatField;
    qryTipoAplicTIPOAPLICACAO: TFloatField;
    qryTipoAplicDESCRICAO: TStringField;
    qryTIPOAPLICACAO: TFloatField;
    qryDESCRICAO: TStringField;
    qryFIXAVARIAVEL: TStringField;
    qryTIPORESGATE: TStringField;
    qryMOECODIGO: TFloatField;
    qryTXJUROSPREV: TFloatField;
    qryPRAZORESGATEPREV: TFloatField;
    qryTIPOAPLICSUBST: TFloatField;
    qryUNIDNEGOC: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODCENTRORESPON: TStringField;
    qryIDEMPRESA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryRECPAG: TStringField;
    qryCODTIPRECDES: TStringField;
    qryPERCUSTO: TFloatField;
    qryIDCONTAORCREC: TStringField;
    qryIDCONTAORCCUS: TStringField;
    qryIDPLANOORCAMEN: TFloatField;
    dbcbReaplica: TDBCheckBox;
    gbDespesa: TGroupBox;
    lblPercCusto: TLabel;
    dbrePercCusto: TDBRealEdit;
    dbrePercDescRend: TDBRealEdit;
    lblDespRend: TLabel;
    qryPERCUSTOREND: TFloatField;
    qryFLGREAPLICA: TStringField;
    qryCODCORRESP: TStringField;
    Label1: TLabel;
    dbeCodigoCorrespondente: TwwDBEdit;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoAplic: TfrmCadTipoAplic;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema;

{$R *.DFM}

procedure TfrmCadTipoAplic.FormActivate(Sender: TObject);
begin
   inherited;
   qryMoeda.Close;
   qryMoeda.Open;
   //
   qryTipoAplic.Close;
   qryTipoAplic.Open;
   //
   qryUnidNegocio.Close;
   qryUnidNegocio.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryUnidNegocio.Open;
   //
   qryCentCust.Close;
   qryCentCust.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryCentCust.Open;
   //
   qryCentroRespon.Close;
   qryCentroRespon.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryCentroRespon.Open;
   //
   qryTipoRD.Close;
   qryTipoRD.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
   qryTipoRD.Open;
end;

procedure TfrmCadTipoAplic.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then begin
      qry.Close;
      qry.ParamByName('TIPOAPLICACAO').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qry.Open;
   end;
end;

procedure TfrmCadTipoAplic.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbeCodigoCorrespondente.SetFocus;
  qryTIPORESGATE.AsString  := 'U';
  qryFIXAVARIAVEL.AsString := 'F';
  qryFLGREAPLICA.AsString  := 'S';
end;

procedure TfrmCadTipoAplic.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbeCodigoCorrespondente.SetFocus;
  if qryFLGREAPLICA.IsNull then
     qryFLGREAPLICA.AsString  := 'S';
end;

procedure TfrmCadTipoAplic.bbtnConfirmarClick(Sender: TObject);
begin
  If trim(dbeDescricao.Text)='' then begin
     MsgDlg('Obrigatório Preencher a Descrição.','Erro',mtError,[mbOk],0);
     dbeCodigoCorrespondente.SetFocus;
     exit;
  end;
  qryIDPESSOA.AsInteger       := Sistema.IdEmpresa;
  qryRECPAG.AsString          := 'R';
  qryIDPLANOORCAMEN.AsInteger := qryParamOrcIDPLANOORCAMEN.AsInteger;
  if not qryCODCENTROCUSTO.IsNull then
     qryIDEMPRESA.AsInteger := Sistema.IdEmpresa;
  if qryTIPOAPLICACAO.AsInteger <= 0 then
     qryTIPOAPLICACAO.AsInteger := LeUltRegistro(nil,'TIPOAPLICACAO');
  inherited;
  qryTipoAplic.Close;
  qryTipoAplic.Open;
  //
end;

procedure TfrmCadTipoAplic.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('TIPOAPLICACAO').AsInteger := -1;
  qry.Open;
  //
  qryParamOrc.Close;
  qryParamOrc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryParamOrc.Open;
  //
  msContaOrcamen.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = '+IntToStr(qryParamOrcIDPLANOORCAMEN.AsInteger));
  //
end;







end.
