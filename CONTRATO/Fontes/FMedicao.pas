unit FMedicao;

//ATENÇÃO
//ATENÇÃO --- no updDet o Modify está com a mesma query do Insert
//ATENÇÃO

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, Mask, TREdit, CMDateTimePicker, DBCtrls, wwdbedit,
  wwdbdatetimepicker, CmEventosCadastro, ImgList, DBGrids, uCMTypes;

type
  ELancDocError = Exception;
    TFrmMedicao = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    qryContrato: TwwQuery;
    updDet: TUpdateSQL;
    Label5: TLabel;
    dblcContrato: TwwDBLookupCombo;
    qryIDMEDICAO: TFloatField;
    qryIDCONTRATO: TFloatField;
    qryItem: TwwQuery;
    qryObjeto: TwwQuery;
    qryCalcValor: TwwQuery;
    Label7: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label8: TLabel;
    dblcObjeto: TwwDBLookupCombo;
    Label2: TLabel;
    dbQuantidade: TDBRealEdit;
    Label3: TLabel;
    reValor: TRealEdit;
    Label1: TLabel;
    dbValorTotal: TDBRealEdit;
    qryCalcValorVALORUNITARIOOBJETO: TFloatField;
    qryCalcValorINTERVALO: TFloatField;
    qryCalcValorFREQUENCIA: TStringField;
    qryCalcValorNUMPARCELAS: TFloatField;
    qryObjetoIDOBJETO: TFloatField;
    qryObjetoIDPESSOA: TFloatField;
    qryObjetoCODARTIGO: TStringField;
    qryObjetoNOMEOBJETO: TStringField;
    qryObjetoTIPOOBJETO: TStringField;
    qryContratoNOMECONTRATO: TStringField;
    qryContratoIDCONTRATO: TFloatField;
    qryContratoIDPESSOA: TFloatField;
    qryItemIDITEM: TFloatField;
    qryItemIDPESSOA: TFloatField;
    qryItemNOME_ITEM: TStringField;
    qryItemTIPOCOBRANCA: TStringField;
    qryDadosContrato: TwwQuery;
    qryDadosContratoCODCENTRORESPON: TStringField;
    qryDadosContratoUNIDNEGOC: TFloatField;
    qryDadosContratoTIPOCONTRATO: TStringField;
    qryDadosContratoCODPORTFORMA: TFloatField;
    qryDadosContratoIDFORCLI: TFloatField;
    qryDadosContratoCODTIPDOC: TFloatField;
    qryDadosContratoMOECODIGO: TFloatField;
    qryDadosContratoDATAINICIOCOBR: TDateTimeField;
    qryDadosContratoCODTIPRECDES: TStringField;
    qryDadosContratoRECPAG: TStringField;
    qryDadosContratoCODSUBCONTA: TFloatField;
    qryDadosContratoPLACONTA: TStringField;
    Label9: TLabel;
    Label4: TLabel;
    qryCalcValorDATAINICIOCOBR: TDateTimeField;
    edDataVenc: TCMDateTimePicker;
    edCompl: TEdit;
    Label10: TLabel;
    Label6: TLabel;
    qryDadosCli: TwwQuery;
    qryDadosCliCODSUBCONTA: TFloatField;
    qryDadosCliCONTACCLIENTE: TStringField;
    qryDadosCliCODCENTROCUSTO: TStringField;
    qryDadosCliRAZAOSOCIAL: TStringField;
    qryRateioCC: TwwQuery;
    qryRateioCCCODCENTROCUSTO: TStringField;
    qryRateioCCIDEMPRESA: TFloatField;
    qryRateioCCPERCRATEIOCONTR: TFloatField;
    qryDadosContratoOBSERVACAO: TStringField;
    qryDadosContratoCODCONTRATOEMPR: TStringField;
    qryDadosFor: TwwQuery;
    qryDadosForCODSUBCONTA: TFloatField;
    qryDadosForCONTACFORN: TStringField;
    qryDadosForCODCENTROCUSTO: TStringField;
    qryDadosForRAZAOSOCIAL: TStringField;
    qryDadosContratoIDCONTRATO: TFloatField;
    qryDadosContratoIDITEM: TFloatField;
    qryDadosContratoIDOBJETO: TFloatField;
    edDataMEdicao: TCMDateTimePicker;
    qryAuxFuncao: TwwQuery;
    qryParc: TwwQuery;
    updParc: TUpdateSQL;
    lblFormaPG: TLabel;
    dblcFormaPG: TwwDBLookupCombo;
    qryFormaPG: TwwQuery;
    qryFormaPGCODFORMA: TFloatField;
    qryFormaPGDESCRICAO: TStringField;
    qryContratoTIPOCONTRATO: TStringField;
    qryAuxMedicao: TwwQuery;
    qryAuxMedicaoMAXDATAPREV: TDateTimeField;
    reNumDoc: TEdit;
    qryDadosContratoIDPATRO: TFloatField;
    qryDadosContratoIDPLANOPREV: TFloatField;
    qryDadosContratoIDPROGRAMA: TFloatField;
    MemoObservacao: TMemo;
    Label11: TLabel;
    MSMedicao: TMontaSelect;
    qryMestreAux: TwwQuery;
    qryMestreAuxIDMEDICAO: TFloatField;
    qryMestreAuxIDCONTRATO: TFloatField;
    qryDetAux: TwwQuery;
    qryDetAuxIDMEDICAO: TFloatField;
    qryDetAuxIDCONTRATO: TFloatField;
    qryDetAuxIDPROJETO: TFloatField;
    qryDetAuxIDATIVIDADE: TFloatField;
    qryDetAuxIDITEM: TFloatField;
    qryDetAuxIDOBJETO: TFloatField;
    qryDetAuxIDPESSOA: TFloatField;
    qryDetAuxDATAPREVMEDICAO: TDateTimeField;
    qryDetAuxDATAMEDICAO: TDateTimeField;
    qryDetAuxMEDICAOAPROVADA: TStringField;
    qryDetAuxQTDEMEDICAO: TFloatField;
    qryDetAuxVALORMEDICAO: TFloatField;
    qryDetAuxQTDEPREVISTA: TFloatField;
    qryDetAuxVALORPREVISTO: TFloatField;
    qryDetAuxNUMPARCELAS: TFloatField;
    qryDetAuxFREQUENCIA: TStringField;
    qryDetAuxINTERVALO: TFloatField;
    qryDetAuxNOME_ITEM: TStringField;
    qryDetAuxNOMEOBJETO: TStringField;
    qryDetAuxOBS: TMemoField;
    qryDetAuxDESCRICAO: TStringField;
    qryMedDocum: TwwQuery;
    qryMedDocumIDMEDICAO: TFloatField;
    qryMedDocumIDPARCELAMEDICAO: TFloatField;
    qryMedDocumDATAPREVISTAVENC: TDateTimeField;
    qryMedDocumIDPESSOA: TFloatField;
    qryMedDocumVALORPREVISTO: TFloatField;
    qryMedDocumCODDOCUMENTO: TFloatField;
    qryMedDocumNODOCUMENTO: TFloatField;
    qryMedDocumCOMPLDOCUMENTO: TStringField;
    qryMedDocumCODFORMA: TFloatField;
    qryMedDocumPLNCODIGO: TFloatField;
    qryMedDocumDATALANCTO: TDateTimeField;
    qryMedDocumOPERACAO: TStringField;
    qryParcDel: TwwQuery;
    qryDetDel: TwwQuery;
    qryendPess: TwwQuery;
    qryendPessIDESTADO: TFloatField;
    qryendPessCODESTADO: TStringField;
    qryendPessIDCIDADES: TFloatField;
    qryendPessIDPAIS: TFloatField;
    MsContaCor: TMontaSelect;
    GpConta: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    BtnBuscaContaCor: TSpeedButton;
    edtBanco: TEdit;
    edtAgencia: TEdit;
    edtConta: TEdit;
    edtDescTipoConta: TEdit;
    qryContratoIDFORCLI: TFloatField;
    dbValorUnitario: TDBRealEdit;
    QryContaCor: TwwQuery;
    QryContaCorDESCTIPOCONTA: TStringField;
    QryContaCorCONTACORRENTE: TStringField;
    QryContaCorNUMBANCO: TStringField;
    QryContaCorNUMAGENCIA: TStringField;
    QryContaCorTIPOCONTA: TStringField;
    QryContaCorIDCBANCARIA: TFloatField;
    QryContaCorNOMEAGENCIA: TStringField;
    QryContaCorNOMEBANCO: TStringField;
    qrySetaContrato: TwwQuery;
    qrySetaContratoNOMECONTRATO: TStringField;
    qrySetaContratoIDCONTRATO: TFloatField;
    qrySetaContratoIDPESSOA: TFloatField;
    qrySetaContratoTIPOCONTRATO: TStringField;
    qrySetaContratoIDFORCLI: TFloatField;
    qryAlteradores: TwwQuery;
    qryNumApG: TwwQuery;
    qryNumApGNUMAPGR: TFloatField;
    qryAlteradoresVALOR: TFloatField;
    qryAlteradoresCODALTERADOR: TFloatField;
    qryAlteradoresDEBCRE: TStringField;
    qryAlteradoresVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresHISTORICOCOMPL: TStringField;
    qryAtualizaNumApG: TwwQuery;
    upRateioCC: TUpdateSQL;
    qryRateioCCDIVISOR: TFloatField;
    dsRateioCC: TDataSource;
    btnRateioDif: TButton;
    qryRateioCCIDITEM: TFloatField;
    qryRateioCCIDOBJETO: TFloatField;
    qryRateioCCIDPROGRAMA: TFloatField;
    dbeObservacao: TwwDBEdit;
    Label12: TLabel;
    qryAuxDoc: TwwQuery;
    qryAuxDocIDMEDICAO: TFloatField;
    qryParcRealDel: TwwQuery;
    qryParcReal: TwwQuery;
    updParcReal: TUpdateSQL;
    qryParcRealIDPARCELA: TFloatField;
    qryParcRealIDCONTRATO: TFloatField;
    qryParcRealPLNCODIGO: TFloatField;
    qryParcRealIDITEM: TFloatField;
    qryParcRealIDOBJETO: TFloatField;
    qryParcRealIDPESSOA: TFloatField;
    qryParcRealCODDOCUMENTO: TFloatField;
    qryParcRealIDMEDICAO: TFloatField;
    qryParcRealIDPARCELAMEDICAO: TFloatField;
    qryParcRealDATAVENCPARCELA: TDateTimeField;
    qryParcRealDATAREALPARCELA: TDateTimeField;
    qryParcRealQTDEPARCELA: TFloatField;
    qryParcRealVALOROBJPARCELA: TFloatField;
    qryParcRealVLRMOEDACORRENTE: TFloatField;
    qryParcRealNUMNOTAFISCAL: TFloatField;
    qryParcRealOBSERVACAO: TStringField;
    qryParcIDMEDICAO: TFloatField;
    qryParcIDPARCELAMEDICAO: TFloatField;
    qryParcDATAPREVISTAVENC: TDateTimeField;
    qryParcIDPESSOA: TFloatField;
    qryParcVALORPREVISTO: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcNODOCUMENTO: TFloatField;
    qryParcCOMPLDOCUMENTO: TStringField;
    qryParcCODFORMA: TFloatField;
    qryParcOBS: TMemoField;
    qryParcIDCBANCARIA: TFloatField;
    qryParcNUMBANCO: TStringField;
    qryParcNUMAGENCIA: TStringField;
    qryParcCONTACORRENTE: TStringField;
    qryParcTIPOCONTA: TStringField;
    qryParcDESCTIPOCONTA: TStringField;
    qryDetIDMEDICAO: TFloatField;
    qryDetIDCONTRATO: TFloatField;
    qryDetIDPROJETO: TFloatField;
    qryDetIDATIVIDADE: TFloatField;
    qryDetIDITEM: TFloatField;
    qryDetIDOBJETO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetDATAPREVMEDICAO: TDateTimeField;
    qryDetDATAMEDICAO: TDateTimeField;
    qryDetMEDICAOAPROVADA: TStringField;
    qryDetQTDEMEDICAO: TFloatField;
    qryDetVALORMEDICAO: TFloatField;
    qryDetQTDEPREVISTA: TFloatField;
    qryDetVALORPREVISTO: TFloatField;
    qryDetNUMPARCELAS: TFloatField;
    qryDetFREQUENCIA: TStringField;
    qryDetINTERVALO: TFloatField;
    qryDetOBSERVACAO: TStringField;
    qryDetNOME_ITEM: TStringField;
    qryDetNOMEOBJETO: TStringField;
    qryDetVALORUNITARIOOBJETO: TFloatField;
    qryInclusaoMed: TwwQuery;
    tbsObsContrato: TTabSheet;
    DBObservacao: TDBMemo;
    dsContr: TDataSource;
    qryContratoOBSERVACAO: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure dblcContratoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcObjetoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbQuantidadeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure reNumDocKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBuscaContaCorClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure dblcContratoChange(Sender: TObject);
    procedure btnRateioDifClick(Sender: TObject);
    procedure edDataMEdicaoChange(Sender: TObject);
    procedure edDataVencChange(Sender: TObject);
  private
    { Private declarations }
    //
    Procedure Sel( N : Real);
    Procedure SelFilhos( N : Real);
    Procedure SelMestreAux( N : Real);
    Procedure SelFilhosAux( N : Real);
    Procedure LancCapCar;
    Procedure ExcluiCapCar;
    procedure LimpaCampos;
  public
    { Public declarations }
    Procedure SetaFiltroMs(iIdForCli:Real);
    procedure SetaContaPreferencial(iContrato : LongInt );
  end;

var
  FrmMedicao: TFrmMedicao;
  ParcIDCBANCARIA : Integer = 0;

implementation

{$R *.DFM}

Uses USistema, uMensErro, uDataBase, dBasedados, uModulo,
     uDocumento, uFuncaoGeral, uImpostoRetido, uLancContab,
     uIntegraBack, UDiasUteis, FCadastroCS, FRateios; 

procedure TFrmMedicao.FormCreate(Sender: TObject);
begin
  inherited;
  ImpostoRetido := TImpostoRetido.Create;
  edtDescTipoConta.Text:='';
  //
  MsContaCor.Larguras.Add('15');
  MsContaCor.Mascaras.Add(' ');
  MsContaCor.SensivelACaixa.Add('N');
  MsContaCor.TipodeDado.Add('C');
  MsContaCor.Descricao.Add('Tipo de Conta');
  MsContaCor.Colunas.Add('DECODE(CONTABANCARIA.TIPOCONTA,''1'',''Conta Corrente'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''2'',''Cartão Salário'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA');
  //
  MsContaCor.CamposChave.Add('DECODE(CONTABANCARIA.TIPOCONTA,''1'',''Conta Corrente'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''2'',''Cartão Salário'','+
                         'DECODE(CONTABANCARIA.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA');
  //
  MontaSelect.Filtro.Add('CONTRATOCONTR.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +
                         'AND CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                         'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
  //
  MSMedicao.Filtro.Add('CONTRATOCONTR.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +
                       'AND CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                       'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
  //
  qryendPess.Close;
  qryendPess.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryendPess.Open;
  //
  qryContrato.Close;
  qryContrato.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
  qryContrato.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryContrato.Open;
  //
  Sel( -1 );
  SelFilhos( -1 );
end;

Procedure TFrmMedicao.Sel( N : Real);
begin
   qry.Close;
   qry.ParamByName('IDMEDICAO').AsFloat := n;
   qry.Open;
   //
   qrySetaContrato.Close;
   qrySetaContrato.ParamByName('IDCONTRATO').AsFloat := qryIDCONTRATO.AsFloat;
   qrySetaContrato.Open;

end;

Procedure TFrmMedicao.SelFilhos( N : Real);
begin
   qryDet.Close;
   qryDet.ParamByName('IDPESSOA').AsFloat  := Sistema.IdEmpresa;
   qryDet.ParamByName('IDMEDICAO').AsFloat := n;
   qryDet.Open;
   //
   qryParc.Close;
   qryParc.ParamByName('IDMEDICAO').asFloat   := qryDetIDMEDICAO.asFloat;
   qryParc.Open;
   //
   qryItem.Close;
   qryItem.ParamByName('IDEMPRESA').AsFloat  := Sistema.IdEmpresa;
   qryItem.ParamByName('IDCONTRATO').AsFloat := qryDetIDCONTRATO.AsFloat;
   qryItem.Open;
   //
   qryObjeto.Close;
   qryObjeto.ParamByName('IDEMPRESA').AsFloat  := Sistema.IdEmpresa;
   qryObjeto.ParamByName('IDCONTRATO').AsFloat := qryDetIDCONTRATO.AsFloat;
   qryObjeto.ParamByName('IDITEM').AsFloat     := qryDetIDITEM.AsFloat;
   qryObjeto.Open;
   //
   qryCalcValor.Close;
   qryCalcValor.ParamByName('IDCONTRATO').AsFloat := qryDetIDCONTRATO.AsFloat;
   qryCalcValor.ParamByName('IDITEM').AsFloat     := qryDetIDITEM.AsFloat;
   qryCalcValor.ParamByName('IDOBJETO').AsFloat   := qryDetIDOBJETO.AsFloat;
   qryCalcValor.Open;
end;

Procedure TFrmMedicao.SelMestreAux( N : Real);
begin
   qryMestreAux.Close;
   qryMestreAux.ParamByName('IDMEDICAO').AsFloat := n;
   qryMestreAux.Open;
end;

Procedure TFrmMedicao.SelFilhosAux( N : Real);
begin
   qryDetAux.Close;
   qryDetAux.ParamByName('IDPESSOA').AsFloat  := Sistema.IdEmpresa;
   qryDetAux.ParamByName('IDMEDICAO').AsFloat := n;
   qryDetAux.Open;
   //
   qryParc.Close;
   qryParc.ParamByName('IDMEDICAO').asFloat   := qryDetAuxIDMEDICAO.asFloat;
   qryParc.Open;
   //
   qryItem.Close;
   qryItem.ParamByName('IDEMPRESA').AsFloat  := Sistema.IdEmpresa;
   qryItem.ParamByName('IDCONTRATO').AsFloat := qryDetAuxIDCONTRATO.AsFloat;
   qryItem.Open;
   //
   qryObjeto.Close;
   qryObjeto.ParamByName('IDEMPRESA').AsFloat  := Sistema.IdEmpresa;
   qryObjeto.ParamByName('IDCONTRATO').AsFloat := qryDetAuxIDCONTRATO.AsFloat;
   qryObjeto.ParamByName('IDITEM').AsFloat     := qryDetAuxIDITEM.AsFloat;
   qryObjeto.Open;
   //
   qryCalcValor.Close;
   qryCalcValor.ParamByName('IDCONTRATO').AsFloat := qryDetAuxIDCONTRATO.AsFloat;
   qryCalcValor.ParamByName('IDITEM').AsFloat     := qryDetAuxIDITEM.AsFloat;
   qryCalcValor.ParamByName('IDOBJETO').AsFloat   := qryDetAuxIDOBJETO.AsFloat;;
   qryCalcValor.Open;
end;

procedure TFrmMedicao.CmeCadastroFind(Sender: TObject);
begin
    Inherited;
    if MontaSelect.RetornouValor then
       begin
          Sel(StrToFloat(MontaSelect.ValoresChave[0]));
          SelFilhos(StrToFloat(MontaSelect.ValoresChave[0]));

          if Not qryDet.IsEmpty then
             begin
                qryFormaPG.Close;
                qryFormaPG.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
                if MontaSelect.ValoresChave[1]= 'A' then
                   qryFormaPG.ParamByName('RECPAG').AsString := 'R'
                else
                   qryFormaPG.ParamByName('RECPAG').AsString := 'P';
                qryFormaPG.Open;
                //
                dblcContrato.LookupValue := qryDetIDCONTRATO.AsString;
                edDataMedicao.Date       := qryDetDATAMEDICAO.asDateTime;
                reNumDoc.Text            := qryParcNODOCUMENTO.AsString;
                edCompl.Text             := qryParcCOMPLDOCUMENTO.AsString;
                edDataVenc.Date          := qryParcDATAPREVISTAVENC.asDateTime;
                dblcFormaPG.LookupValue  := qryParcCODFORMA.AsString;
                MemoObservacao.Text      := qryParcOBS.AsString;

                //Traz dados da conta do cliente
                SetaContaPreferencial(StrToInt(qryDetIDCONTRATO.AsString));
                ParcIDCBANCARIA          := qryParcIDCBANCARIA.AsInteger;
             end;
       end;
end;

procedure TFrmMedicao.CmeCadastroInsert(Sender: TObject);
begin
   MSMedicao.Executar;
   if MSMedicao.RetornouValor then  //Busca uma medicao que ja exista na insercao
    begin
       SelMestreAux(StrToFloat(MSMedicao.ValoresChave[0]));
       SelFilhosAux(StrToFloat(MSMedicao.ValoresChave[0]));
       if not(qryDetAux.IsEmpty) then
        begin
           qryFormaPG.Close;
           qryFormaPG.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
           if MSMedicao.ValoresChave[1]= 'A' then
              qryFormaPG.ParamByName('RECPAG').AsString := 'R'
           else
              qryFormaPG.ParamByName('RECPAG').AsString := 'P';
           qryFormaPG.Open;

           dblcContrato.LookupValue := qryDetAuxIDCONTRATO.AsString;
           SetaContaPreferencial(qryDetAuxIDCONTRATO.AsInteger); //só para abrir a query
           dblcFormaPG.LookupValue  := qryParcCODFORMA.AsString;
           MemoObservacao.Text      := qryParcOBS.AsString; //ou qryDetAuxOBS.AsString;
           dblcItem.LookupValue     := qryDetAuxIDITEM.AsString;
           dblcObjeto.LookupValue   := qryDetAuxIDOBJETO.AsString;

           ParcIDCBANCARIA          := qryParcIDCBANCARIA.AsInteger;
           qryCalcValor.Close;
           qryCalcValor.ParamByName('IDCONTRATO').AsInteger  := StrToInt(dblcContrato.LookupValue);
           qryCalcValor.ParamByName('IDITEM').AsInteger      := StrToInt(dblcItem.LookupValue);
           qryCalcValor.ParamByName('IDOBJETO').AsInteger    := StrToInt(dblcObjeto.LookupValue);
           qryCalcValor.Open;
           dbValorUnitario.Value := qryCalcValorVALORUNITARIOOBJETO.AsFloat;

           qryDadosContrato.Close;
           qryDadosContrato.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
           qryDadosContrato.ParamByName('IDITEM').AsInteger     := StrToInt(dblcItem.LookupValue);
           qryDadosContrato.ParamByName('IDOBJETO').AsInteger   := StrToInt(dblcObjeto.LookupValue);
           qryDadosContrato.Open;
        end;
       Inherited;
       qryMestreAux.First;
       qry.Insert;
       qryMestreAux.Next;
       qryIDCONTRATO.AsInteger := qryMestreAuxIDCONTRATO.AsInteger;
       //
       qryDetAux.First;
       qryDet.Insert;
       qryDetIDCONTRATO.AsInteger := qryDetAuxIDCONTRATO.AsInteger;
       qryDetIDITEM.AsInteger     := qryDetAuxIDITEM.AsInteger;
       qryDetIDOBJETO.AsInteger   := qryDetAuxIDOBJETO.AsInteger;
       qryDetIDPESSOA.AsInteger   := qryDetAuxIDPESSOA.AsInteger;
       qryDetNOME_ITEM.AsString   := qryItemNOME_ITEM.AsString;
       qryDetNOMEOBJETO.AsString  := qryObjetoNOMEOBJETO.AsString;
       qryDet.Post;
    end
   else
    begin
       Inherited;
       SelFilhos(-1);
       reNumDoc.Clear;
       edCompl.Clear;
       dblcContrato.Clear;
       edDataMedicao.Clear;
       edDataVenc.Clear;
       dblcFormaPG.Clear;
       dbValorUnitario.Clear;
       //reValor.Clear;
       MemoObservacao.Clear;
       ParcIDCBANCARIA := 0;
       edtBanco.Clear;
       edtAgencia.Clear;
       edtConta.Clear;
       edtDescTipoConta.Clear;
    end;
   dblcContrato.Enabled := True;
   dblcContrato.SetFocus;
end;

procedure TFrmMedicao.CmeCadastroEdit(Sender: TObject);
begin
   Inherited;
   dblcContrato.Enabled := False;
end;

procedure TFrmMedicao.CmeCadastroDelete(Sender: TObject);
begin
  try
    StartTransacao;
    ExcluiCapCar;
    CommitTransacao;
    MsgDlg('Documento Excluído Com Sucesso','Aviso',mtInformation,[mbOk],0);
    LimpaCampos;
    CmeCadastro.Find(Self);
  except
    RollBackTransacao;
    MsgDlg('Exclusão Não Efetuada','Erro',mtError,[mbOk],0);
    raise;
  end;
end;

procedure  TFrmMedicao.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Var
   iICodDocumento,iCodSubConta : Longint;
   iPlano : Integer ;
   iPlaconta,iCodcentroCusto,sRecPag : String;
begin
   Accept := True;
   if Trim(reNumDoc.Text) = '' then
      begin
         MsgDlg('Obrigatório preencher o Número do Documento','Atenção',mtWarning,[mbOk],0);
         reNumDoc.SetFocus;
         Accept := False;
      end
   else
   if Trim(dblcContrato.Text) = '' then
      begin
         MsgDlg('Obrigatório preencher o Contrato ','Atenção',mtWarning,[mbOk],0);
         dblcContrato.SetFocus;
         Accept := False;
      end
   else
   if Trim(edDataMEdicao.Text) = '' then
      begin
         MsgDlg('Obrigatório preencher a data medição ','Atenção',mtWarning,[mbOk],0);
         edDataMEdicao.SetFocus;
         Accept := False;
      end
   else
   if Trim(edDataVenc.Text) = '' then
      begin
         MsgDlg('Obrigatório preencher a data vencimento','Atenção',mtWarning,[mbOk],0);
         edDataVenc.SetFocus;
         Accept := False;
      end;
   if qryDet.IsEmpty then
      begin
         MsgDlg('Obrigatório preencher algum item de Medição','Atenção',mtWarning,[mbOk],0);
         Accept := False;
      end;
   if Not DiasUteis.DiaUtil(edDataVenc.Date,qryendPessIDCIDADES.AsInteger,qryendPessIDPAIS.AsInteger,
                        qryendPessCODESTADO.AsString,True,False,False) then
      if MsgDlg('A Data de Vencimento não é Dia Útil, confirma mesmo assim?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
         begin
            edDataVenc.SetFocus;
            Accept := False;
         end;
   // Testa se esse documento já não existe
   sRecPag := qryFormaPG.ParamByName('RECPAG').AsString;
   if qry.State in [dsInsert] then
   if Documento.ValidaNumDoc(nil,sRecPag,qryDadosContratoIDFORCLI.AsInteger,
                             StrToFloat(reNumDoc.Text),edCompl.Text,
                             iICodDocumento,iCodSubConta,iPlano,
                             iPlaconta,iCodcentroCusto) then
      begin
        showmessage('Já existe este documento.');
        Accept := False;
      end;
end;

procedure TFrmMedicao.CmeCadastroConfirma(Sender: TObject);
begin
   qryAlteradores.Close;
   qryAlteradores.ParamByName('CodDocumento').AsFloat:=-100;
   qryAlteradores.Open;
   //
   qryNumApG.Close;
   qryNumApG.ParamByName('CodDocumento').AsFloat:=-100;
   qryNumApG.Open;
   
   if qry.State in [dsEdit] then  // ALTERACAO
    begin
       if qryDet.State in dsEditModes then qryDet.Cancel;
        try
           try
              StartTransacao;
              //
              qryAlteradores.Close;
              qryAlteradores.ParamByName('CodDocumento').AsFloat:=qryParcCODDOCUMENTO.AsFloat;
              qryAlteradores.Open;
              //
              qryNumApG.Close;
              qryNumApG.ParamByName('CodDocumento').AsFloat:=qryParcCODDOCUMENTO.AsFloat;
              qryNumApG.Open;
              //
              qryParcReal.Close;
              qryParcReal.Open;
              //
              ExcluiCapCar;
              LancCapCar;
              //
              CommitTransacao;
              //
              qryParcReal.Close;
              qryAlteradores.Close;
              qryNumApG.Close;
           except
              RollbackTransacao;
              raise;
           end;
        finally;
           qry.Cancel;
           if sbtnInserir.Down then SelFilhos(-1);
        end;
    end;

   if qry.State in [dsInsert] then     // INCLUSAO
    begin
       if qryDet.State in dsEditModes then qryDet.Cancel;
       try
          try
             StartTransacao;
             //
             qryParcReal.Close;
             qryParcReal.Open;
             //
             LancCapCar;
             CommitTransacao;
          except
             RollbackTransacao;
             raise;
          end;
       finally;
          qry.Cancel;
          if sbtnInserir.Down then SelFilhos(-1);
       end;
    end;
   inherited;
end;

procedure TFrmMedicao.CmeDetalheInsert(Sender: TObject);
begin
   Inherited;
   dblcItem.SetFocus;
end;

Procedure TFrmMedicao.CmeDetalheEdit(Sender: TObject);
begin
   Inherited;
   dblcItem.SetFocus;
end;

procedure TFrmMedicao.dblcContratoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Var
   sValor : String;
begin
  inherited;
  sValor := dblcContrato.LookupValue;
  if (modified) And (Trim(dblcContrato.Text) <> '') And (qryDet.IsEmpty) then
     begin
        qryItem.Close;
        qryItem.ParamByName('IDEMPRESA').AsInteger  := Sistema.IdEmpresa;
        qryItem.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
        qryItem.Open;
        //
        qryFormaPG.Close;
        qryFormaPG.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
        if qryContratoTIPOCONTRATO.AsString = 'A' then
           qryFormaPG.ParamByName('RECPAG').AsString := 'R'
        else
           qryFormaPG.ParamByName('RECPAG').AsString := 'P';
        qryFormaPG.Open;
        //
        SetaContaPreferencial(qryContratoIDCONTRATO.AsInteger);
     end
  else
    begin
       MsgDlg('Não é possível alterar o contrato. Este já possui itens cadastrados para medição','Atenção',mtWarning,[mbOK],0);
       dblcContrato.LookupValue :=  sValor ;
    end;

end;

procedure TFrmMedicao.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 if (modified) And (Trim(dblcItem.Text) <> '') then
    begin
       qryObjeto.Close;
       qryObjeto.ParamByName('IDEMPRESA').AsInteger  := Sistema.IdEmpresa;
       qryObjeto.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
       qryObjeto.ParamByName('IDITEM').AsInteger     := StrToInt(dblcItem.LookupValue);
       qryObjeto.Open;
    end;
end;

procedure TFrmMedicao.dblcObjetoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
 if (modified) And (Trim(dblcObjeto.Text) <> '') then
    begin
       qryCalcValor.Close;
       qryCalcValor.ParamByName('IDCONTRATO').AsInteger  := StrToInt(dblcContrato.LookupValue);
       qryCalcValor.ParamByName('IDITEM').AsInteger      := StrToInt(dblcItem.LookupValue);
       qryCalcValor.ParamByName('IDOBJETO').AsInteger    := StrToInt(dblcObjeto.LookupValue);
       qryCalcValor.Open;
       dbValorUnitario.Value := qryCalcValorVALORUNITARIOOBJETO.AsFloat;
//       reValor.Value := qryCalcValorVALORUNITARIOOBJETO.AsFloat;
       //
       qryDadosContrato.Close;
       qryDadosContrato.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
       qryDadosContrato.ParamByName('IDITEM').AsInteger     := StrToInt(dblcItem.LookupValue);
       qryDadosContrato.ParamByName('IDOBJETO').AsInteger   := StrToInt(dblcObjeto.LookupValue);
       qryDadosContrato.Open;
    end;
end;

procedure TFrmMedicao.dbQuantidadeExit(Sender: TObject);
begin
  if (Trim(dblcItem.Text)='') then
   begin
      MsgDlg('O Campo Item não foi preenchido','Erro',mtError,[mbOk], 0);
      dblcItem.SetFocus;
      Exit;
   end;

  if (Trim(dblcObjeto.Text)='') then
   begin
      MsgDlg('O Campo Objeto não foi preenchido','Erro',mtError,[mbOk], 0);
      dblcObjeto.SetFocus;
      Exit;
   end;

  qryCalcValor.Close;
  qryCalcValor.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
  qryCalcValor.ParamByName('IDITEM').AsInteger     := StrToInt(dblcItem.LookupValue);
  qryCalcValor.ParamByName('IDOBJETO').AsInteger   := StrToInt(dblcObjeto.LookupValue);
  qryCalcValor.Open;
  //
  qryDetVALORMEDICAO.AsFloat := (dbQuantidade.Value * qryCalcValorVALORUNITARIOOBJETO.AsFloat);
  dbValorTotal.Value         := (dbQuantidade.Value * qryCalcValorVALORUNITARIOOBJETO.AsFloat);
  dbValorUnitario.Value      := qryCalcValorVALORUNITARIOOBJETO.AsFloat;
//  reValor.Value              := qryCalcValorVALORUNITARIOOBJETO.AsFloat;
  //
  qryAuxMedicao.Close;
  qryAuxMedicao.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
  qryAuxMedicao.Open;
  if Trim(edDataVenc.Text) = ''  then
  if not qryAuxMedicaoMAXDATAPREV.IsNull then
     begin
       edDataVenc.Date := IncMonth(qryAuxMedicaoMAXDATAPREV.Value,1);
       edDataVenc.Text := DateToStr(IncMonth(qryAuxMedicaoMAXDATAPREV.Value,1));
     end
  else
     if ( Not qryDadosContratoDATAINICIOCOBR.IsNull ) then
       begin
       if edDataMedicao.Date > qryDadosContratoDATAINICIOCOBR.Value then
          begin
            edDataVenc.Date := IncMonth(qryDadosContratoDATAINICIOCOBR.Value,1);
            edDataVenc.Text := DateToStr(IncMonth(qryDadosContratoDATAINICIOCOBR.Value,1));
          end
       else
          begin
            edDataVenc.Date := qryDadosContratoDATAINICIOCOBR.Value;
            edDataVenc.Text := DateToStr(qryDadosContratoDATAINICIOCOBR.Value);
          end;
       end;
end;

Procedure TFrmMedicao.CmeDetalheConfirma(Sender: TObject);
begin
   if dsDet.State in [dsInsert,dsEdit] then
    begin
       if Trim(dblcItem.Text) = '' then
        begin
           MsgDlg('Obrigatório preencher o Item ','Atenção',mtWarning,[mbOk],0);
           dblcItem.SetFocus;
        end
       else
        if Trim(dblcObjeto.Text) = '' then
         begin
            MsgDlg('Obrigatório preencher o Objeto ','Atenção',mtWarning,[mbOk],0);
            dblcObjeto.SetFocus;
         end
        else
         if dbValorTotal.Value <= 0 then
          begin
             MsgDlg('A Medição obrigatoriamente tem que ter um valor','Atenção',mtWarning,[mbOk],0);
             dblcObjeto.SetFocus;
          end
         else
          begin
             qryDetNOME_ITEM.AsString  := dblcItem.Text;
             qryDetNOMEOBJETO.AsString := dblcObjeto.Text;
             Inherited;
          end;
    end;
end;

Procedure TFrmMedicao.LancCapCar;
var
    iCodLancCAPCAR : LongInt;
    iSubContaCli   : LongInt;
    iCodPortForma  : LongInt;
    iNumLancto     : LongInt;
    iPlnCodigoP    : LongInt;
    iPlnCodigo     : LongInt;
    iMoeCodigo     : LongInt;
    iNumFatura     : LongInt;
    sSubContaCli   : String;
    sNomeEmp       : String;
    sHist1         : String;
    sHist2         : String;
    sHist3         : String;
    sHist4         : String;
    sHist5         : String;
    sHistorico     : String;
    sMens          : String;
    sDebCre        : String;
    sRecPag        : String;
    sPlano         : String;
    sContaCliFor   : String;
    sCCustoCliFor  : String;
    sStatus        : String;
    sOperacao      : String;
    sContaD        : String;
    sContaC        : String;
    sSubContaD     : String;
    sSubContaC     : String;
    sCCustoD       : String;
    sCCustoC       : String;
    sContaAranha   : String;
    sContaOriD     : String;
    sContaOriC     : String;
    rValTot        : Real;
    rValorTot      : Real;
    rValor         : Real;
    rIDMedicaoAux  : Real;
    bBloq          : Boolean;
    dDataVenc      : TDateTime;
    liExercicio    : LongInt;
    liPeriodo      : LongInt;
    iEmpresaProp   : LongInt;
    IdPatro, IdPrograma, IdPlanoPrev : LongInt;
    iICodDocumento,iCodSubConta      : Longint;
    iPlano : Integer ;
    iPlaconta,iCodcentroCusto : String;
    bPartidaDobrada : Boolean;
begin
   iPlnCodigo    := 0;
   sContaCliFor  := '';
   sCCustoCliFor := '';
   iSubContaCli  := -1;
   sSubContaCli  := '';
   sPlano        := '';
   liExercicio   := 0;
   liPeriodo     := 0;
   sOperacao     := '2 ';

   bPartidaDobrada:=False;
   with TQuery.Create(nil) do
   try
      DatabaseName:='BaseDados';
      Sql.Text:='SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+
                                   FloatToStr(Sistema.IdEmpresa)+') ';
      Open;
      bPartidaDobrada:=(FieldByName('PACDOBRADA').AsString='S');
   finally
      Free;
   end;

   //
   qryDadosContrato.Close;
   qryDadosContrato.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
   qryDadosContrato.ParamByName('IDITEM').AsInteger     := qryDetIDITEM.AsInteger;
   qryDadosContrato.ParamByName('IDOBJETO').AsInteger   := qryDetIDOBJETO.AsInteger;
   qryDadosContrato.Open;
   //
   dDataVenc    := edDataVenc.Date;
   //
   if qryDadosContratoTIPOCONTRATO.AsString = 'A' then
    begin
       sRecPag := 'R';
       sDebCre := 'D';
    end
   else
    begin
       sRecPag := 'P';
       sDebCre := 'C';
    end;

   //
   IntegraBack.RecPag := sRecPag;
   iNumFatura         := 0;
   sStatus            := '';
   iCodLancCAPCAR     := Documento.GetCodigo(nil);
   bBloq              := False;

   if iCodLancCAPCAR <= 0 then abort;

   if qryDadosContratoMOECODIGO.AsInteger <> 0 then
      iMoeCodigo:=qryDadosContratoMOECODIGO.AsInteger
   else
      iMoeCodigo := -1;

   if qryDadosContratoCODPORTFORMA.AsInteger <> 0 then
    begin
       iCodPortForma := qryDadosContratoCODPORTFORMA.AsInteger;
       if sRecPag = 'R' then bBloq := True;
    end
   else
    iCodPortForma := -1;

   if IntegraBack.Contabilidade = 'S' then
    begin
       if qryDadosContratoTIPOCONTRATO.AsString = 'A' then  //Cliente
        begin
           qryDadosCli.Close;
           qryDadosCli.ParamByName('IDFORCLI').AsInteger := qryDadosContratoIDFORCLI.AsInteger;
           qryDadosCli.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
           qryDadosCli.Open;
           //
           sContaCliFor  := qryDadosCliCONTACCLIENTE.AsString;
           sCCustoCliFor := qryDadosCliCODCENTROCUSTO.AsString;
           sSubContaCli  := qryDadosCliCODSUBCONTA.AsString;
           sNomeEmp      := qryDadosCliRAZAOSOCIAL.AsString;
           sContaD       := sContaCliFor;
           sContaC       := qryDadosContratoPLACONTA.AsString;
           sSubContaD    := qryDadosCliCODSUBCONTA.AsString;
           sSubContaC    := qryDadosContratoCODSUBCONTA.AsString;
        end
       else                                                 //Fornecedor
        begin
           qryDadosFor.Close;
           qryDadosFor.ParamByName('IDFORCLI').AsInteger := qryDadosContratoIDFORCLI.AsInteger;
           qryDadosFor.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
           qryDadosFor.Open;
           //
           sContaCliFor  := qryDadosForCONTACFORN.AsString;
           sCCustoCliFor := qryDadosForCODCENTROCUSTO.AsString;
           sSubContaCli  := qryDadosForCODSUBCONTA.AsString;
           sNomeEmp      := qryDadosForRAZAOSOCIAL.AsString;
           sContaC       := sContaCliFor;
           sContaD       := qryDadosContratoPLACONTA.AsString;
           sSubContaC    := qryDadosForCODSUBCONTA.AsString;
           sSubContaD    := qryDadosContratoCODSUBCONTA.AsString;
        end;
       iSubContaCli  := StrToIntDef(sSubContaCli,-1);
    end;
   //
   if IntegraBack.Contabilidade = 'S' then
      if IntegraBack.Plano <> 0 then sPlano:=IntToStr(IntegraBack.Plano);
   //
   Documento.Obs := MemoObservacao.Text ;
   Documento.Referencia := qryDadosContratoCODCONTRATOEMPR.AsString;
   Documento.IdContaBancaria := ParcIdCBancaria;

   // Inserir Documento
   Documento.Inserir(qryAuxFuncao, iCodLancCAPCAR,IntToStr(Sistema.IdModulo),
                     sPlano,sContaCliFor,sCCustoCliFor,
                     iMoeCodigo,0,Sistema.IdEmpresa,
                     qryDadosContratoIDFORCLI.AsInteger,
                     qryDadosContratoCODTIPDOC.AsInteger,
                     iCodPortForma,sRecPag,StrToFloat(reNumDoc.Text),
                     edCompl.Text,edDataMedicao.Text,
                     DateToStr(dDataVenc), DateToStr(dDataVenc),sStatus,
                     iNumFatura,sOperacao,Sistema.IdUsuario,iSubContaCli,
                     qryFormaPGCODFORMA.AsInteger,'','',bBloq,-1,-1,-1);

//-------------------------------------------------------------------------------------
// Gravar Contabilidade
//-------------------------------------------------------------------------------------
   iEmpresaProp:= Sistema.IdEmpresa;
   liExercicio := 0;
   liPeriodo   := 0;
  if IntegraBack.Contabilidade = 'S' then
      if TestaPeriodo(True,'BaseDados',edDataMedicao.Text,IntToStr(Sistema.IdModulo),liExercicio,
                      liPeriodo,iEmpresaProp,sMens) <> 0 then Abort;
   rValorTot:=0;

   qryDet.First;
   while not qryDet.Eof do
   begin

      rIDMedicaoAux:=LeUltRegistro(nil,'MEDICAO');
      qryInclusaoMed.ParamByName('IDMedicao').AsFloat:=rIDMedicaoAux;
      qryInclusaoMed.ParamByName('IDContrato').AsFloat:=StrToFloat(dblcContrato.LookupValue);

      if qryDetIDPROJETO.AsFloat=0 then
         qryInclusaoMed.ParamByName('IDProjeto').Clear
      else
         qryInclusaoMed.ParamByName('IDProjeto').AsFloat:=qryDetIDPROJETO.AsFloat;

      if qryDetIDATIVIDADE.AsFloat=0 then
         qryInclusaoMed.ParamByName('IDAtividade').Clear
      else
         qryInclusaoMed.ParamByName('IDAtividade').AsFloat:=qryDetIDATIVIDADE.AsFloat;

      //Inclusão da Medição
      qryInclusaoMed.ParamByName('IDItem').AsFloat:=qryDetIDITEM.AsFloat;
      qryInclusaoMed.ParamByName('IDObjeto').AsFloat:=qryDetIDOBJETO.AsFloat;
      qryInclusaoMed.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
      qryInclusaoMed.ParamByName('DataPrevMedicao').AsString:=qryDetDATAPREVMEDICAO.AsString;
      qryInclusaoMed.ParamByName('DataMedicao').AsString:=edDataMedicao.Text;
      qryInclusaoMed.ParamByName('MedicaoAprovada').AsString:=qryDetMEDICAOAPROVADA.AsString;
      qryInclusaoMed.ParamByName('QtdeMedicao').AsFloat:=qryDetQTDEMEDICAO.AsFloat;
      qryInclusaoMed.ParamByName('ValorMedicao').AsFloat:=qryDetVALORMEDICAO.AsFloat;
      qryInclusaoMed.ParamByName('QtdePrevista').AsFloat:=qryDetQTDEPREVISTA.AsFloat;
      qryInclusaoMed.ParamByName('ValorPrevisto').AsFloat:=qryDetVALORPREVISTO.AsFloat;
      qryInclusaoMed.ParamByName('NumParcelas').AsFloat:=qryDetNUMPARCELAS.AsFloat;
      qryInclusaoMed.ParamByName('Frequencia').AsString:=qryDetFREQUENCIA.AsString;
      qryInclusaoMed.ParamByName('Intervalo').AsFloat:=qryDetINTERVALO.AsFloat;
      qryInclusaoMed.ParamByName('Observacao').AsString:=qryDetOBSERVACAO.AsString;
      qryInclusaoMed.ExecSQL;

      // Garava Parcela Medição
      qryParc.Append;
      qryParcIDMEDICAO.AsFloat           := rIDMedicaoAux;
      qryParcIDPARCELAMEDICAO.AsFloat    := LeUltRegistro(nil,'PARCELAMEDICAO');
      qryParcDATAPREVISTAVENC.AsDateTime := edDataVenc.Date;
      qryParcIDPESSOA.AsInteger          := Sistema.IdEmpresa;
      qryParcVALORPREVISTO.AsFloat       := qryDetVALORMEDICAO.asFloat;
      qryParcCODDOCUMENTO.AsInteger      := iCodLancCAPCAR;
      qryParc.Post;

      // Grava Parcela Real
      qryParcReal.Append;
      qryParcRealIDPARCELA.AsFloat:=LeUltRegistro(nil,'PARCELAREALCONTR');
      qryParcRealIDCONTRATO.AsFloat:=StrToFloat(dblcContrato.LookupValue);
      qryParcRealIDITEM.AsFloat:=qryDetIDITEM.AsFloat;
      qryParcRealIDOBJETO.AsFloat:=qryDetIDOBJETO.AsFloat;
      qryParcRealIDPESSOA.AsFloat:=Sistema.IdEmpresa;
      qryParcRealCODDOCUMENTO.AsFloat:=iCodLancCAPCAR;
      qryParcRealIDMEDICAO.AsFloat:=rIDMedicaoAux;
      qryParcRealIDPARCELAMEDICAO.AsFloat:=qryParcIDPARCELAMEDICAO.AsFloat;
      qryParcRealDATAVENCPARCELA.AsDateTime:=qryParcDATAPREVISTAVENC.AsDateTime;
      qryParcRealDATAREALPARCELA.AsDateTime:=qryDetDATAPREVMEDICAO.AsDateTime;
      qryParcRealQTDEPARCELA.AsFloat:=qryDetQTDEMEDICAO.AsFloat;
      qryParcRealOBSERVACAO.AsString:=qryDetOBSERVACAO.AsString;

      if qryDetQTDEMEDICAO.AsFloat<>0 then
         qryParcRealVALOROBJPARCELA.AsFloat:=(qryDetVALORMEDICAO.AsFloat/qryDetQTDEMEDICAO.AsFloat);

      qryParcRealVLRMOEDACORRENTE.AsFloat:=qryDetVALORMEDICAO.AsFloat;
      qryParcReal.Post;

      //
      qryDadosContrato.Close;
      qryDadosContrato.ParamByName('IDCONTRATO').AsInteger := StrToInt(dblcContrato.LookupValue);
      qryDadosContrato.ParamByName('IDITEM').AsInteger     := qryDetIDITEM.AsInteger;
      qryDadosContrato.ParamByName('IDOBJETO').AsInteger   := qryDetIDOBJETO.AsInteger;
      qryDadosContrato.Open;
      //
      if Sistema.UsaPlanoPatro then
       begin
          IdPatro    := qryDadosContrato.FieldByName('IDPATRO').AsInteger;
          IdPrograma := -1;
          IdPlanoPrev:= qryDadosContrato.FieldByName('IDPLANOPREV').AsInteger;
       end
      else
       begin
          IdPatro    := -1;
          IdPrograma := -1;
          IdPlanoPrev:= -1;
       end;
      //
      if IntegraBack.Contabilidade = 'S' then
       begin
          if qryDadosContratoTIPOCONTRATO.AsString = 'A' then //Cliente
           begin
              qryDadosCli.Close;
              qryDadosCli.ParamByName('IDFORCLI').AsInteger := qryDadosContratoIDFORCLI.AsInteger;
              qryDadosCli.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
              qryDadosCli.Open;
              //
              sContaCliFor  := qryDadosCliCONTACCLIENTE.AsString;
              sCCustoCliFor := qryDadosCliCODCENTROCUSTO.AsString;
              sSubContaCli  := qryDadosCliCODSUBCONTA.AsString;
              sNomeEmp      := qryDadosCliRAZAOSOCIAL.AsString;
              sContaC       := qryDadosContratoPLACONTA.AsString;
              sContaD       := qryDadosCliCONTACCLIENTE.AsString; // sContaCliFor;
              sSubContaD    := qryDadosCliCODSUBCONTA.AsString;
              sSubContaC    := qryDadosContratoCODSUBCONTA.AsString;
           end
          else                                 //Fornecedor
           begin
              qryDadosFor.Close;
              qryDadosFor.ParamByName('IDFORCLI').AsInteger := qryDadosContratoIDFORCLI.AsInteger;
              qryDadosFor.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
              qryDadosFor.Open;
              //
              sContaCliFor  := qryDadosForCONTACFORN.AsString;
              sCCustoCliFor := qryDadosForCODCENTROCUSTO.AsString;
              sSubContaCli  := qryDadosForCODSUBCONTA.AsString;
              sNomeEmp      := qryDadosForRAZAOSOCIAL.AsString;
              sContaC       := sContaCliFor;
              sContaD       := qryDadosContratoPLACONTA.AsString;
              sSubContaC    := qryDadosForCODSUBCONTA.AsString;
              sSubContaD    := qryDadosContratoCODSUBCONTA.AsString;
           end;
          sContaOriC:= sContaC;
          sContaOriD:= sContaD;

          sHistorico := 'Lançamento doc. No. '+ reNumDoc.Text + '/'+edCompl.Text+
                        ' '+sNomeEmp+' ref. contrato No. '+dblcContrato.LookupValue;
          FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);

          // Filtra Qry de Rateio
          qryRateioCC.Filtered:=False;
          qryRateioCC.Filter:='IDITEM='+IntToStr(qryDadosContratoIDITEM.AsInteger)+' AND '+
                              'IDOBJETO='+IntToStr(qryDadosContratoIDOBJETO.AsInteger);
          qryRateioCC.Filtered:=True;

          // Para cada rateio do Contrato/Objeto/Item
          rValTot := 0;
          qryRateioCC.First;
          while not qryRateioCC.EOF Do
          begin
             sContaD := sContaOriD;
             sContaC := sContaOriC;
             sContaAranha := '';

             if not qryRateioCCIDPROGRAMA.isNull then
              begin
                 sContaAranha := Documento.BuscaContaContabil(qryRateioCCIDPROGRAMA.AsInteger,
                                                              qryDadosContratoCODTIPRECDES.AsString,
                                                              qryRateioCCCODCENTROCUSTO.AsString);
              end;

             if qryDadosContratoTIPOCONTRATO.AsString = 'A' then  //Cliente
              begin
                 sCCustoC := qryRateioCCCODCENTROCUSTO.AsString;
                 sCCustoD := sCCustoCliFor;
                 if sContaAranha <> '' then sContaC := sContaAranha;
              end
             else                                                 //Fornecedor
              begin
                 sCCustoC := sCCustoCliFor;
                 sCCustoD := qryRateioCCCODCENTROCUSTO.AsString;
                 if sContaAranha <> '' then sContaD := sContaAranha;
              end;

             if qryRateioCCDIVISOR.AsFloat=100 then
                rValor:=StrToFloat(Format('%17.2f',[(qryDetVALORMEDICAO.AsFloat * qryRateioCCPERCRATEIOCONTR.AsFloat/100)]))
             else
                rValor:=StrToFloat(Format('%17.2f',[((qryDetVALORMEDICAO.AsFloat/qryDetQTDEMEDICAO.AsFloat) * qryRateioCCPERCRATEIOCONTR.AsFloat)]));

             rValTot := rValTot + rValor;

             if not(bPartidaDobrada) then
              begin
                 iPlnCodigo := LANCACONTAB(True,'BASEDADOS',
                                           edDataMedicao.Text, InttoStr(Sistema.IdModulo),
                                           '0','D','','','','','','','','','','',
                                           reNumDoc.Text,sHist1,sHist2,sHist3,sHist4,sHist5,
                                           '03', sCCustoD, sContaD,'','', liExercicio, liPeriodo,
                                           Sistema.IdEmpresa,Sistema.IdUsuario,IntegraBack.Plano,
                                           rValor,0,0,0,0,0,0,0,0,
                                           qryDadosContratoUNIDNEGOC.AsString,True,0,0,
                                           sSubContaD,'','','', iPlnCodigo,sMens,
                                           IntegraBack.MascaraPlano,
                                           true,0,IdPlanoPrev,IdPatro,Sistema.UsaPlanoPatro);

                 if iPlnCodigo < 0 then Abort;
                 //
                 iPlnCodigo := LANCACONTAB(True,'BASEDADOS',edDataMedicao.Text, InttoStr(Sistema.IdModulo),
                                           '1','C','','','','','','','','','','',
                                           reNumDoc.Text,sHist1,sHist2,sHist3,sHist4,sHist5,
                                           '03','','',sCCustoC,sContaC,liExercicio, liPeriodo,
                                           Sistema.IdEmpresa,Sistema.IdUsuario,IntegraBack.Plano,rValor,
                                           0,0,0,0,0,0,0,0,qryDadosContratoUNIDNEGOC.AsString,True,0,0,
                                           '',sSubContaC,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,
                                           true,0,IdPlanoPrev,IdPatro,Sistema.UsaPlanoPatro);

                 if iPlnCodigo < 0 then Abort;
              end
             else
              begin
                 iPlnCodigo := LANCACONTAB(True,'BASEDADOS',edDataMedicao.Text, InttoStr(Sistema.IdModulo),
                                           '2','','','','','','','','','','','',
                                           reNumDoc.Text,sHist1,sHist2,sHist3,sHist4,sHist5,
                                           '03',sCCustoD, sContaD,sCCustoC,sContaC,liExercicio, liPeriodo,
                                           Sistema.IdEmpresa,Sistema.IdUsuario,IntegraBack.Plano,rValor,
                                           0,0,0,0,0,0,0,0,qryDadosContratoUNIDNEGOC.AsString,True,0,0,
                                           sSubContaD,sSubContaC,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,
                                           true,0,IdPlanoPrev,IdPatro,Sistema.UsaPlanoPatro);

                 if iPlnCodigo < 0 then Abort;
              end;

             qryRateioCC.Next;
          end;

          //Acerta diferenca de arredondamento
          if Format('%17.2f',[qryDetVALORMEDICAO.AsFloat]) <> Format('%17.2f',[rValTot]) then
           begin
              rValor    := qryDetVALORMEDICAO.AsFloat - rValtot;

              if not(bPartidaDobrada) then
               begin
                  iPlnCodigo:= LANCACONTAB(True,'BASEDADOS',edDataMedicao.Text, InttoStr(Sistema.IdModulo),
                                           '0',
                                           'D','','','','','','','','','','',reNumDoc.Text,sHist1,sHist2,
                                           sHist3,sHist4,sHist5,'03', sCCustoD, sContaD,'','', liExercicio, liPeriodo,Sistema.IdEmpresa,Sistema.IdUsuario,
                                           IntegraBack.Plano,rValor,0,0,0,0,0,0,0,0,
                                           qryDadosContratoUNIDNEGOC.AsString,True,0,0,sSubContaD,
                                           '','','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,true,0,
                                           IdPlanoPrev,IdPatro,Sistema.UsaPlanoPatro);

                  if iPlnCodigo < 0 then Abort;
                  //
                  iPlnCodigo := LANCACONTAB(True,'BASEDADOS',edDataMedicao.Text, InttoStr(Sistema.IdModulo),
                                            '1',
                                            'C','','','','','','','','','','',reNumDoc.Text,sHist1,sHist2,
                                            sHist3,sHist4,sHist5,'03','','',sCCustoC,sContaC,liExercicio,
                                            liPeriodo,Sistema.IdEmpresa,Sistema.IdUsuario,IntegraBack.Plano,
                                            rValor,0,0,0,0,0,0,0,0,qryDadosContratoUNIDNEGOC.AsString,
                                            True,0,0,'',sSubContaC,'','', iPlnCodigo,sMens,
                                            IntegraBack.MascaraPlano,true,0,IdPlanoPrev,IdPatro,
                                            Sistema.UsaPlanoPatro);

                  if iPlnCodigo < 0 then Abort;
               end
              else
               begin
                  iPlnCodigo := LANCACONTAB(True,'BASEDADOS',edDataMedicao.Text, InttoStr(Sistema.IdModulo),
                                            '2',
                                            '','','','','','','','','','','',reNumDoc.Text,sHist1,sHist2,
                                            sHist3,sHist4,sHist5,'03',sCCustoD, sContaD,sCCustoC,sContaC,
                                            liExercicio,
                                            liPeriodo,Sistema.IdEmpresa,Sistema.IdUsuario,IntegraBack.Plano,
                                            rValor,0,0,0,0,0,0,0,0,qryDadosContratoUNIDNEGOC.AsString,
                                            True,0,0,sSubContaD,sSubContaC,'','', iPlnCodigo,sMens,
                                            IntegraBack.MascaraPlano,true,0,IdPlanoPrev,IdPatro,
                                            Sistema.UsaPlanoPatro);

                  if iPlnCodigo < 0 then Abort;
               end;
           end;
       end;

      // Para cada rateio do Contrato/Objeto/Item
      rValTot:=0;
      qryRateioCC.First;
      while not qryRateioCC.EOF do
      begin
         rValor   := StrToFloat(Format('%17.2f',[(qryDetVALORMEDICAO.AsFloat*qryRateioCCPERCRATEIOCONTR.AsFloat/100)]));
         rValTot  := rValTot+rValor;

         Documento.Rateio.Inserir(iCodLancCAPCAR,qryDadosContratoCODTIPRECDES.AsString,sRecPag,
                                  qryDadosContratoCODCENTRORESPON.AsString,Sistema.IdEmpresa,rValor,0,
                                  Sistema.IdUsuario,qryDadosContratoUNIDNEGOC.AsInteger,-1,
                                  qryRateioCCCODCENTROCUSTO.AsString,IdPatro,
                                  qryRateioCCIDPROGRAMA.AsInteger,IdPlanoPrev);

          rValorTot:=rValorTot + rValor;
          qryRateioCC.Next;
      end;

      // Caso haja diferença de arredondamento lança a diferença
      qryRateioCC.First;
      if ( StrToFloat(Format('%17.2f',[rValTot])) <> StrToFloat(Format('%17.2f',[qryDetVALORMEDICAO.AsFloat])) )
         and not qryRateioCC.EOF then
       begin
          rValor := qryDetVALORMEDICAO.AsFloat - rValTot;
          rValorTot:=rValorTot + rValor;

          Documento.Rateio.Inserir(iCodLancCAPCAR,qryDadosContratoCODTIPRECDES.AsString,
                                   sRecPag,qryDadosContratoCODCENTRORESPON.AsString,Sistema.IdEmpresa,
                                   rValor,0,Sistema.IdUsuario,qryDadosContratoUNIDNEGOC.AsInteger,-1,
                                   qryRateioCCCODCENTROCUSTO.AsString,IdPatro,
                                   qryRateioCCIDPROGRAMA.AsInteger,IdPlanoPrev);

       end;
      qryDet.Next;
   end;

   iNumLancto:=Documento.GerarNumLancto(nil,iCodLancCAPCAR);
   if iNumLancto <= 0 then Abort;
   if iPlnCodigo > 0 then
      iPlnCodigoP:=iPlnCodigo
   else
      iPlnCodigoP:=-1;

   Documento.CriarLanctoDoc(qryAuxFuncao,iCodLancCAPCAR,iNumLancto,-1,iPlnCodigoP,
                            edDataMedicao.Text,rValorTot,0,
                            -1,sDebCre,sOperacao,'',Sistema.IdUsuario,False,-1,'');

   //Imposto Automático
   ImpostoRetido.DataProgramada    := dDataVenc;
   ImpostoRetido.OperacaoDocumento := sOperacao;
   ImpostoRetido.IdForCli          := qryDadosContratoIDFORCLI.AsInteger;
   ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
   ImpostoRetido.NumLancto         := iNumLancto;
   ImpostoRetido.ValorLancto       := rValorTot;
   ImpostoRetido.ValorLiquido      := rValorTot;
   ImpostoRetido.DataLancto        := StrToDate(edDataMedicao.Text);
   ImpostoRetido.DataEmissao       := StrToDate(edDataMedicao.Text);
   ImpostoRetido.CodTipoDoc        := qryDadosContratoCODTIPDOC.AsInteger;

   ImpostoRetido.Incluir;

   //qryDet.ApplyUpdates;
   //qryDet.CommitUpdates;
   
   qryParc.ApplyUpdates;
   qryParc.CommitUpdates;
   qryParcReal.ApplyUpdates;
   qryParcReal.CommitUpdates;
   //
   qryAlteradores.First;
   while not(qryAlteradores.Eof) do
   begin
      iNumLancto:=Documento.GerarNumLancto(nil,iCodLancCAPCAR);
      if iNumLancto <= 0 then Abort;
      iPlnCodigoP:=-1;
      Documento.CriarLanctoDoc(qryAuxFuncao,iCodLancCAPCAR,
                               iNumLancto,qryAlteradoresCODALTERADOR.AsInteger,
                               iPlnCodigoP,edDataMedicao.Text,
                               qryAlteradoresVALOR.AsFloat,qryAlteradoresVALOROUTRAMOEDA.AsFloat,
                               -1,qryAlteradoresDEBCRE.AsString,'4 ',
                               qryAlteradoresHISTORICOCOMPL.AsString,Sistema.IdUsuario,False,-1,'');
      qryAlteradores.Next;
   end;

   if not(qryNumApG.IsEmpty) then
    begin
       qryAtualizaNumApG.ParamByName('NumAP').AsFloat:=qryNumApGNUMAPGR.AsFloat;
       qryAtualizaNumApG.ParamByName('NovoCodDocumento').AsFloat:= iCodLancCAPCAR;
       qryAtualizaNumApG.ExecSQL;
    end;

   //GetComputerName(
end;

procedure TFrmMedicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ImpostoRetido.Free;
end;

procedure TFrmMedicao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Sel(-1);
  SelFilhos(-1);
  reNumDoc.Clear;
  edCompl.Clear;
  dbValorUnitario.Clear;
  //reValor.Clear;
  dblcContrato.Clear;
  edDataMedicao.Clear;
  edDataVenc.Clear;
  dblcFormaPG.Clear;
  MemoObservacao.Clear;
  dblcContrato.Enabled := True;
  ParcIDCBANCARIA := 0;
  edtBanco.Clear;
  edtAgencia.Clear;
  edtConta.Clear;
  edtDescTipoConta.Clear;
end;

procedure TFrmMedicao.reNumDocKeyPress(Sender: TObject; var Key: Char);
begin
 Case key of
    '0'..'9',#8:;
  else
    Key := #0;
  end;
end;

Procedure  TFrmMedicao.ExcluiCapCar;
Var
    liRetFuncao,liExercicio,liPeriodo,liEmpresa :Integer;
    sMens,sRecPag :String;
    sPlano : Longint;
    iCodLancCAPCAR:Integer;
    iPlnCodigoOri : Integer;
    sDataLancamento : String;
begin
    liEmpresa := Sistema.IdEmpresa;
    liRetFuncao:=0;
    sPlano:=0;

    qryMedDocum.Close;
    qryMedDocum.ParamByName('IDMEDICAO').asFloat   := qryDetIDMEDICAO.asFloat;
    qryMedDocum.Open;

    if (IntegraBack.Contabilidade = 'S') then
    begin
       //Testa se o período contábil está aberto ou fechado.
       liRetFuncao:=TestaPeriodo(True,'BASEDADOS',qryMedDocumDATALANCTO.AsString,
                                 IntToStr(Sistema.IdModulo),liExercicio,
                                 liPeriodo,liEmpresa,sMens);
       if liRetFuncao <> 0 then
       begin
          MsgDlg('Este lançamento não pode ser excluido, somente pode ser estornado','Erro',
                 mtError,[mbOk],0);
          Raise ELancDocError.Create('Não Foi Possível Excluir Documento.')
       end;
    end;

    iCodLancCAPCAR:=qryParcCODDOCUMENTO.AsInteger;
    iPlnCodigoOri :=qryMedDocumPLNCODIGO.AsInteger;
    sDataLancamento:=qryMedDocumDATALANCTO.AsString;

    // Seleciona Registros a serem excluídos
    qryAuxDoc.Close;
    qryAuxDoc.ParamByName('CodDocumento').AsFloat:=iCodLancCAPCAR;
    qryAuxDoc.Open;

    // Exclui Parcela Real
    qryParcRealDel.ParamByName('CodDocumento').AsFloat:=iCodLancCAPCAR;
    qryParcRealDel.ExecSQL;

    // Exclui Parcela Medição
    qryParcDel.ParamByName('CodDocumento').AsInteger:=iCodLancCAPCAR;
    qryParcDel.ExecSQL;

    // Exclui Medição
    qryAuxDoc.First;
    while not qryAuxDoc.eof do
    begin
       qryDetDel.ParamByName('IDMEDICAO').AsFloat:=qryAuxDocIDMEDICAO.AsFloat;
       qryDetDel.ExecSQL;
       qryAuxDoc.Next;
    end;

    //Imposto Automático
    if qryDadosContratoTIPOCONTRATO.AsString = 'A' then
       sRecPag := 'R'
    else
       sRecPag := 'P';

    if Modulo.VerifImposto(qryDadosContratoCODTIPRECDES.AsString,sRecPag) then
    begin
      ImpostoRetido.CodDocumento      := iCodLancCAPCAR;
      ImpostoRetido.NumLancto         := 0;
      ImpostoRetido.ExcluiAlteradores := True;
      ImpostoRetido.Excluir;
    end;

    Documento.Excluir(qryAuxFuncao,iCodLancCAPCAR,0);

    if iCodLancCAPCAR = -1 then
    begin
       iCodLancCAPCAR:=qryParcCODDOCUMENTO.AsInteger;
       Raise ELancDocError.Create('Não Foi Possível Excluir Documento.')
    end;

    if IntegraBack.Contabilidade = 'S' then
       if IntegraBack.Plano <> 0 then
          sPlano:=IntegraBack.Plano;

    if iPlnCodigoOri <> 0 then
       liRetFuncao := ExcluiLanc(True,iPlnCodigoOri,'BASEDADOS',
                      IntToStr(Sistema.IdModulo),
                      sPlano,
                      Sistema.IdEmpresa,
                      Sistema.IdUsuario,
                      true,
                      0,
                      IntegraBack.MascaraPlano);

    if liRetFuncao < 0 then
       Raise ELancDocError.Create('Não Foi Possível Excluir Lançamentos Contábeis.');
end;

procedure TFrmMedicao.SetaFiltroMs(iIdForCli:Real);
begin
   MsContaCor.Filtro.Clear;
   MsContaCor.Filtro.Add('PESSOA.IDPESSOA = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDPESSOA = ' + FloatToStr(iIdForCli));
end;

procedure TFrmMedicao.BtnBuscaContaCorClick(Sender: TObject);
begin
  //Busca Conta Corrente
  inherited;
  if CmeCadastro.Operacao In [OpInserir, OpAlterar] then
     begin
        SetaFiltroMs(qrySetaContratoIDFORCLI.AsFloat);
        if MsContaCor.Executar = MrOk then
        begin
          ParcIDCBANCARIA      := StrToInt(MsContaCor.ValoresChave[0]); //CONTABANCARIA.IDCBANCARIA
          edtBanco.Text        := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
          edtAgencia.Text      := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
          edtConta.Text        := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
          edtDescTipoConta.Text:= MsContaCor.ValoresChave[5]; //Descricao do CONTABANCARIA.TIPOCONTA
        end;
     end;
end;

procedure TFrmMedicao.SetaContaPreferencial(iContrato : LongInt );
begin
   qrySetaContrato.Close;
   qrySetaContrato.ParamByName('IDCONTRATO').AsInteger := iContrato;
   qrySetaContrato.Open;
   //
   qryContaCor.Close;
   qryContaCor.ParamByName('IDPESSOA').AsFloat  := qrySetaContratoIDFORCLI.AsFloat;
   qryContaCor.Open;
   //
   ParcIDCBANCARIA       := qryContaCorIDCBANCARIA.AsInteger;
   edtBanco.Text         := qryContaCorNUMBANCO.AsString; //BANCO.NUMBANCO
   edtAgencia.Text       := qryContaCorNUMAGENCIA.AsString; //AGENCIABANCARIA.NUMAGENCIA
   edtConta.Text         := qryContaCorCONTACORRENTE.ASString; //CONTABANCARIA.CONTACORRENTE
   edtDescTipoConta.Text := qryContaCorDESCTIPOCONTA.AsString; //CONTABANCARIA.TIPOCONTA
end;

procedure TFrmMedicao.dblcContratoChange(Sender: TObject);
begin
   inherited;
   //
   qryRateioCC.Close;
   qryRateioCC.Filtered:=False;
   qryRateioCC.Filter:='';
   qryRateioCC.ParamByName('IDCONTRATO').AsInteger := qryContratoIDCONTRATO.AsInteger;
   qryRateioCC.Open;
end;

procedure TFrmMedicao.btnRateioDifClick(Sender: TObject);
begin
   // Exibe Form de Rateios Diferenciados
   with TfrmRateios.Create(Self) do
    try
       ShowModal;
    except
       Free;
    end;
end;

procedure TFrmMedicao.edDataMEdicaoChange(Sender: TObject);
begin
   inherited;
   if (Trim(edDataVenc.Text)='') or (edDataMEdicao.Date>edDataVenc.Date) then
      edDataVenc.Date:=edDataMEdicao.Date;
end;

procedure TFrmMedicao.edDataVencChange(Sender: TObject);
begin
   inherited;
   if (Trim(edDataVenc.Text)='') or (edDataMEdicao.Date>edDataVenc.Date) then
      edDataVenc.Date:=edDataMEdicao.Date;
end;

procedure TFrmMedicao.LimpaCampos;
begin
   dblcContrato.Clear;
   dblcFormaPG.Clear;
   reNumDoc.Clear;
   edCompl.Clear;
   edDataMEdicao.ClearDateTime;
   edDataVenc.ClearDateTime;
   MemoObservacao.Clear;
   edtBanco.Clear;
   edtAgencia.Clear;
   edtConta.Clear;
end;

end.
