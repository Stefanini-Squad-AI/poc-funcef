unit FCadPlanoAssistencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, wwdblook, DBCtrls;

type
  TFrmCadPlanoAssistencial = class(TfrmCadMestreDetalheCS)
    lblValores: TLabel;
    dbedNome: TwwDBEdit;
    tbsContrib: TTabSheet;
    tbsRegras: TTabSheet;
    qryFornServAss: TwwQuery;
    qryFornServAssNOME: TStringField;
    qryFornServAssIDPESSOA: TFloatField;
    qryProdAss: TwwQuery;
    qryProdAssDESCRICAO: TStringField;
    qryProdAssIDPRODASS: TFloatField;
    qryProdAssNOME: TStringField;
    qryPortForm: TwwQuery;
    qryPortFormDESCRICAO: TStringField;
    qryPortFormCODARQUIVOREMESSA: TFloatField;
    qryPortFormCODBLOQCHE: TFloatField;
    qryPortFormCODCENTROCUSTO: TStringField;
    qryPortFormCODFORMA: TFloatField;
    qryPortFormCODFORMAPAGTO: TFloatField;
    qryPortFormCODPORTADOR: TFloatField;
    qryPortFormCODPORTFORMA: TFloatField;
    qryPortFormCODTIPOPAGTO: TFloatField;
    qryPortFormCONTROLEREMESSA: TFloatField;
    qryPortFormDATACONTRREMESSA: TDateTimeField;
    qryPortFormDESCFINAN: TStringField;
    qryPortFormDMAIS: TFloatField;
    qryPortFormFLGEMITEAVISO: TStringField;
    qryPortFormIDEMPRESA: TFloatField;
    qryPortFormIDPESSOA: TFloatField;
    qryPortFormIDTEMPLCHEQUE: TFloatField;
    qryPortFormIDUSUARIOINCLUSAO: TFloatField;
    qryPortFormJUROSPORDIA: TFloatField;
    qryPortFormLANCAFINANC: TStringField;
    qryPortFormLOTETRANSMISSAO: TFloatField;
    qryPortFormNOSSONUMERO: TStringField;
    qryPortFormNUMEMPRESABANCO: TStringField;
    qryPortFormNUMRAZAOCC: TStringField;
    qryPortFormPATHARQUIVOREM: TStringField;
    qryPortFormPATHARQUIVORET: TStringField;
    qryPortFormPLACONTA: TStringField;
    qryPortFormPLANO: TFloatField;
    qryPortFormPRAZOPROTESTO: TFloatField;
    qryPortFormRECPAG: TStringField;
    Label2: TLabel;
    dblkIdFornecedor: TwwDBLookupCombo;
    Label3: TLabel;
    dblkIdProdass: TwwDBLookupCombo;
    Label5: TLabel;
    dblkCodPortForma: TwwDBLookupCombo;
    Bevel1: TBevel;
    DBCheckBoxAtivo: TDBCheckBox;
    DBCheckBoxCobDif: TDBCheckBox;
    Label4: TLabel;
    DBEdOpcaoAident: TDBEdit;
    Label20: TLabel;
    DBEdNumContrato: TDBEdit;
    Label19: TLabel;
    DtInicVigencia: TDateTimePicker;
    Label18: TLabel;
    DtInicCom: TDateTimePicker;
    qryDet: TwwQuery;
    qryIDPLANASS: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDREGRAATRASOJUR: TFloatField;
    qryIDFORNSERV: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryCODTIPODOCHISTPAG: TFloatField;
    qryIDPRODASS: TFloatField;
    qryRECPAGHISTPAG: TStringField;
    qryNOME: TStringField;
    qryCODTIPORECHISTREC: TStringField;
    qryIDREGRAADMINISTR: TFloatField;
    qryRECPAGHISTREC: TStringField;
    qryFLGFECHADO: TFloatField;
    qryIDREGRACOBRANCA: TFloatField;
    qryIDREGRAGERAL: TFloatField;
    qryIDREGRAADMISSAO: TFloatField;
    qryIDREGRAPAGAMENTO: TFloatField;
    qryIDREGRABENEFICIA: TFloatField;
    qryIDREGRACANCELAME: TFloatField;
    qryIDREGRADESISTENC: TFloatField;
    qryIDREGRACOMISSAO: TFloatField;
    qryNUMCONTRATO: TFloatField;
    qryDATAINICIOVIGENC: TDateTimeField;
    qryDATAINICIOCOM: TDateTimeField;
    qryCODTIPRECHISTPAG: TStringField;
    qryCODTIPODOCHISTREC: TFloatField;
    qryIDREGRAATRASOCOR: TFloatField;
    qryIDREGRADEVOLJUROS: TFloatField;
    qryIDREGRADEVOLCORR: TFloatField;
    qryIDFORNSERV2: TFloatField;
    qryCOMISSFORN: TFloatField;
    qryCOMISSFUND: TFloatField;
    qryFLGOPCAOA: TFloatField;
    qryTIPOFORNSERV2: TStringField;
    qryFLGOPCAOB: TFloatField;
    qryFLGATIVO: TFloatField;
    qryOPCAOAIDENT: TStringField;
    qryOPCAOBDIF: TStringField;
    qryDetIDPLANASS: TFloatField;
    qryDetIDCONTASS: TFloatField;
    qryDetIDREGRA: TFloatField;
    qryDetIDEMPRESA: TFloatField;
    qryDetIDPROVENTO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetCODPORTFORMA: TFloatField;
    qryDetIDTPPERIODICIDADE: TFloatField;
    qryDetPAGADOR: TStringField;
    qryDetTEMPOCOBR: TFloatField;
    qryDetIDPROVENTOATRASO: TFloatField;
    qryDetIDPROVENTODEVOL: TFloatField;
    qryDetPRIORIDADE: TFloatField;
    qryDetFLGTOTAL: TFloatField;
    qryDetFLGCOBEVENTO: TFloatField;
    qryDetNOMEREGRA: TStringField;
    qryDetNOMETP: TStringField;
    qryDetDESCRICAO: TStringField;
    qryDetNOME: TStringField;
    qryDetFLGCOBCARNE: TFloatField;
    upddet: TUpdateSQL;
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdPlanoAss : Integer;

  end;

var
  FrmCadPlanoAssistencial: TFrmCadPlanoAssistencial;
  sDtInicVig,
  sDtInicCom : String;

implementation
uses
  UDataBase, UMensErro, UAutorizacao,{ FPrecoServPlan,} FTelaAut, USistema,
  UAdmAss, FCadServContribass, UModulo, UIntegraBack, DBaseDados;

{$R *.DFM}

procedure TFrmCadPlanoAssistencial.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin

     tbsContrib.Enabled := false;

     iIdPlanoAss := StrToInt(MontaSelect.ValoresChave[0]);

     qryFornServAss.Open;
     qryProdAss.Open;
     qryPortForm.Open;

     qry.Close;
     qry.ParamByName('prmIdPlanass').Value  := iIdPlanoAss;
     qry.Open;

     sDtInicVig:=qry.FieldByName('DATAINICIOVIGENC').AsString;
     If DataValida(sDtInicVig,False) then DtInicVigencia.Date:=StrToDate(sDtInicVig);

     sDtInicCom:=qry.FieldByName('DATAINICIOCOM').AsString;
     If DataValida(sDtInicCom,False) then DtInicCom.Date:=StrToDate(sDtInicCom);



     qryDet.Close;
     qryDet.ParamByName('IdPlanAss').Value  := iIdPlanoAss;
     qryDet.Open;
{
     qryBenef.Close;
     qryBenef.ParamByName('IdPlanoPrev').Value  := iIdPlanoPrev;
     qryBenef.Open;
}
  end;
end;

procedure TFrmCadPlanoAssistencial.bbtnSairClick(Sender: TObject);
begin
  inherited;
  qryFornServAss.close;
  qryProdAss.Close;
  qryPortForm.Close;
end;

end.
