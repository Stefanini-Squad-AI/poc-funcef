//Marcus Oliveira 01/2/2007 24363 Removido o owner CM.
unit FCadTipoAplicacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, CMProcura, wwdblook, DBCtrls, Mask, wwdbedit,
  TREdit, CMDBLookupCombo;

type
  TfrmCadTipoAplicacao = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbeCodigoCorrespondente: TwwDBEdit;
    lblDescricao: TLabel;
    dbeDescricao: TwwDBEdit;
    dbrTipoResgate: TDBRadioGroup;
    dbrFixaVariavel: TDBRadioGroup;
    qryUnidNegocio: TwwQuery;
    qryUnidNegocioNOME: TStringField;
    qryUnidNegocioUNECODIGO: TStringField;
    qryUnidNegocioUNIDNEGOC: TFloatField;
    qryTipoRD: TwwQuery;
    qryTipoRDDESCRICAO: TStringField;
    qryTipoRDCODTIPRECDES: TStringField;
    qryCentroRespon: TwwQuery;
    qryCentroResponNOME: TStringField;
    qryCentroResponCODCENTRORESPON: TStringField;
    qryCentCust: TwwQuery;
    qryCentCustNOME: TStringField;
    qryCentCustCODCENTROCUSTO: TStringField;
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
    qryMoeda: TwwQuery;
    qryDet: TwwQuery;
    upDet: TUpdateSQL;
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
    qryTipoAplic: TwwQuery;
    qryTipoAplicTIPOAPLICACAO: TFloatField;
    qryTipoAplicDESCRICAO: TStringField;
    qryParamOrc: TwwQuery;
    qryParamOrcIDPLANOORCAMEN: TFloatField;
    qryDetIDAPLICACAO: TFloatField;
    qryDetIDCENARIO: TFloatField;
    qryDetMOECODIGO: TFloatField;
    qryDetPRAZORESGATEPREV: TFloatField;
    qryDetTXJUROSPREV: TFloatField;
    qryDetFLGREAPLICA: TStringField;
    qryDetPERCUSTO: TFloatField;
    qryDetPERCUSTOREND: TFloatField;
    qryDetTIPOAPLICSUBST: TFloatField;
    qryDetMOEDESC: TStringField;
    qryDetNOMECENARIO: TStringField;
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
    qryPERCUSTOREND: TFloatField;
    qryFLGREAPLICA: TStringField;
    qryCODCORRESP: TStringField;
    dblcCenario: TCMDBLookupCombo;
    Label2: TLabel;
    qryCenarios: TwwQuery;
    msContaOrcamen: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoAplicacao: TfrmCadTipoAplicacao;

implementation

{$R *.DFM}

uses uSistema,uDataBase,uMensErro;

procedure TfrmCadTipoAplicacao.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.ParamByName('TIPOAPLICACAO').AsInteger := -1;
   qry.Open;

   qryDet.Close;
   qryDet.ParamByName('IDAplicacao').AsFloat:=-1;
   qryDet.Open;

   qryParamOrc.Close;
   qryParamOrc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamOrc.Open;

   msContaOrcamen.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = '+IntToStr(qryParamOrcIDPLANOORCAMEN.AsInteger));
end;

procedure TfrmCadTipoAplicacao.FormActivate(Sender: TObject);
begin
   inherited;
   qryUnidNegocio.Close;
   qryUnidNegocio.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryUnidNegocio.Open;

   qryCentroRespon.Close;
   qryCentroRespon.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryCentroRespon.Open;

   qryTipoRD.Close;
   qryTipoRD.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryTipoRD.Open;

   qryCentCust.Close;
   qryCentCust.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryCentCust.Open;

   qryTipoAplic.Close;
   qryTipoAplic.Open;

   qryMoeda.Close;
   qryMoeda.Open;

   qryCenarios.Close;
   qryCenarios.Open;
end;

procedure TfrmCadTipoAplicacao.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbeCodigoCorrespondente.SetFocus;
   qryTipoResgate.AsString:='U';
   qryFixaVariavel.AsString:='F';
end;

procedure TfrmCadTipoAplicacao.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbeCodigoCorrespondente.SetFocus;
end;

procedure TfrmCadTipoAplicacao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       qry.Close;
       qry.ParamByName('TipoAplicacao').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
       qry.Open;

       qryDet.Close;
       qryDet.ParamByName('IDAplicacao').AsFloat:=StrToInt(MontaSelect.ValoresChave[0]);
       qryDet.Open;
    end;
end;

procedure TfrmCadTipoAplicacao.CmeCadastroDelete(Sender: TObject);
begin
   qryDet.First;
   while not(qryDet.Eof) do qryDet.Delete;
   qryDet.ApplyUpdates;
   inherited;
end;

procedure TfrmCadTipoAplicacao.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in [dsInsert,dsEdit] then
    begin
       if Trim(dbeDescricao.Text)='' then
        begin
           MsgDlg('Obrigatório Preencher a Descrição.','Erro',mtError,[mbOk],0);
           dbeDescricao.SetFocus;
           Exit;
        end;

       if qryTIPOAPLICACAO.AsInteger <= 0 then
          qryTIPOAPLICACAO.AsInteger := LeUltRegistro(nil,'TIPOAPLICACAO');

       qryDet.First;
       while not(qryDet.Eof) do
       begin
          qryDet.Edit;
          qryDetIDAPLICACAO.AsFloat:=qryTIPOAPLICACAO.AsFloat;
          if qryDetTIPOAPLICSUBST.IsNull then qryDetTIPOAPLICSUBST.AsFloat:=qryTIPOAPLICACAO.AsFloat;
          qryDet.Post;
          qryDet.Next;
       end;

       qryIDPESSOA.AsInteger:=Sistema.IdEmpresa;
       qryRECPAG.AsString:='R';
       qryIDPLANOORCAMEN.AsInteger:=qryParamOrcIDPLANOORCAMEN.AsInteger;

       if not(qryCODCENTROCUSTO.IsNull) then qryIDEMPRESA.AsInteger := Sistema.IdEmpresa;

       inherited;
       qryDet.ApplyUpdates;

       qryTipoAplic.Close;
       qryTipoAplic.Open;
    end
   else
    inherited;
end;

procedure TfrmCadTipoAplicacao.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   qryDetFLGREAPLICA.AsString:='S';
end;

procedure TfrmCadTipoAplicacao.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   if qryDetFLGREAPLICA.IsNull then qryDetFLGREAPLICA.AsString:='S';
end;

procedure TfrmCadTipoAplicacao.CmeDetalheConfirma(Sender: TObject);
begin
   if qryDet.State in [dsInsert,dsEdit] then
    begin
       if Trim(dblcMoeda.Text)='' then
        begin
           MsgDlg('Obrigatório Preencher a Moeda.','Erro',mtError,[mbOk],0);
           dblcMoeda.SetFocus;
           Exit;
        end
       else
        if Trim(dblcCenario.Text)='' then
         begin
            MsgDlg('Obrigatório Preencher o Cenário de Aplicação.','Erro',mtError,[mbOk],0);
            dblcCenario.SetFocus;
            Exit;
         end
        else
         begin
            qryDetMOEDESC.AsString:=dblcMoeda.Text;
            qryDetNOMECENARIO.AsString:=dblcCenario.Text;
            inherited;
         end;
    end;
end;

end.
