unit FCadSaldoIniIRLitigio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdblook, wwdbedit, wwdbdatetimepicker, CMDateTimePicker,
  DBCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadSaldoIniIrLitigio = class(TfrmCadastroCS)
    Bevel1: TBevel;
    Label9: TLabel;
    cboTipoInvest: TwwDBLookupCombo;
    Label11: TLabel;
    cboInvestimento: TwwDBLookupCombo;
    Label2: TLabel;
    dblPlano: TwwDBLookupCombo;
    Label1: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label6: TLabel;
    dbeValor: TwwDBEdit;
    Panel1: TPanel;
    qryIDIRLITIGIO: TFloatField;
    qryIDORIGEMIRLITIGIO: TFloatField;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryDATAFATOGERADOR: TDateTimeField;
    qryDESFATOGERADOR: TStringField;
    qryVLRIRLITIGIO: TFloatField;
    qryIDMODULO: TFloatField;
    qryPLANO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryIDPATROCINADORA: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryPlanos: TwwQuery;
    Label7: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label8: TLabel;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDATAINICIO: TDateTimeField;
    qryTipoInvest: TwwQuery;
    qryTipoInvestIDTIPOINVEST: TFloatField;
    qryTipoInvestDESCTIPOINVEST: TStringField;
    qryInvest: TwwQuery;
    dsTipoInvest: TwwDataSource;
    qryInvestIDINVESTIMENTO: TFloatField;
    qryInvestDESCINVESTIMENTO: TStringField;
    qryCarteiraIDGESTORCARTEIRA: TFloatField;
    qryCarteiraFLGCARTPROP: TFloatField;
    qryCarteiraFLGCALCDIARIO: TStringField;
    qryCarteiraFLGTRATALOTE: TStringField;
    qryCarteiraTRGDTINCLUSAO: TDateTimeField;
    qryCarteiraTRGUSERINCLUSAO: TStringField;
    qryCarteiraIDPLANOPREV: TFloatField;
    qryCarteiraIDPATROCINADORA: TFloatField;
    qryCarteiraIDTIPOINVEST: TFloatField;
    qryCarteiraIDMERCADO: TFloatField;
    qryCarteiraFLGORDMOVINV: TStringField;
    qryPlanosPLANO: TFloatField;
    qryPlanosDESCPLANO: TStringField;
    qryLitigio: TwwQuery;
    qryLitigioIDORIGEMIRLITIGIO: TFloatField;
    qryLitigioDESORIGEMLITIGIO: TStringField;
    qryLitigioIDTIPOINVEST: TFloatField;
    qryLitigioIDMODULO: TFloatField;
    qryBuscaTipoInvest: TwwQuery;
    qryBuscaTipoInvestIDTIPOINVEST: TFloatField;
    qryBuscaPatro: TwwQuery;
    qryBuscaPatroNOME: TStringField;
    qryBuscaPatroIDPESSOA: TFloatField;
    dbPatro: TDBText;
    Bevel2: TBevel;
    Label4: TLabel;
    Bevel4: TBevel;
    Label5: TLabel;
    dsBuscaPatro: TwwDataSource;
    Bevel5: TBevel;
    Label10: TLabel;
    dbPlanPrev: TDBText;
    qryPlanPrev: TwwQuery;
    qryPlanPrevNOME: TStringField;
    dsPlanPrev: TwwDataSource;
    dbdtDataInicio: TCMDateTimePicker;
    mmDESCRICAO: TMemo;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dblCarteiraChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSaldoIniIrLitigio: TfrmCadSaldoIniIrLitigio;

implementation
uses uDataBase,uSISTEMA;

{$R *.DFM}

procedure TfrmCadSaldoIniIrLitigio.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then
   begin
      qry.Close;
      qry.Params[0].AsInteger := strtoint(MontaSelect.ValoresChave[0]);
      qry.Open;
      cboInvestimento.LookupValue  := IntToStr(qry.FieldByName('IDINVESTIMENTO').AsInteger);
      dblPlano.LookupValue := IntToStr(qry.FieldByName('IDPLANOPREV').asInteger);
      mmDESCRICAO.Text := qryDESFATOGERADOR.Value; 
      qryBuscaTipoInvest.Close;
      qryBuscaTipoInvest.params[0].AsString := qry.FieldByName('IDINVESTIMENTO').asString;
      qryBuscaTipoInvest.Open;
      cboTipoInvest.LookupValue := qryBuscaTipoInvest.FieldByName('IDTIPOINVEST').asString;
      cboInvestimento.LookupValue := qry.FieldByName('IDINVESTIMENTO').AsString ;
      qryBuscaPatro.Close;
      qryBuscaPatro.params[0].AsInteger := qry.FieldByName('IDPATROCINADORA').AsInteger;
      qryBuscaPatro.Open;
      qryPlanPrev.Close;
      qryPlanPrev.Params[0].AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger ;
      qryPlanPrev.Open;
   end;
end;

procedure TfrmCadSaldoIniIrLitigio.FormShow(Sender: TObject);
begin
  qry.Open;
  qryTipoInvest.Open;
  qryInvest.Open;
  qryLitigio.Open;
  qryCarteira.Open;
  qryPlanos.Open;
  inherited;

end;

procedure TfrmCadSaldoIniIrLitigio.bbtnConfirmarClick(Sender: TObject);
begin
  qryIDMODULO.Value := Sistema.IdModulo;
  qryIDIRLITIGIO.Value := LeUltRegistro(nil,'IRLITIGIO');
  qryIDPLANOPREV.Value := qryCarteiraIDPLANOPREV.Value;
  qryIDPATROCINADORA.Value := qryCarteiraIDPATROCINADORA.Value;
  qryIDORIGEMIRLITIGIO.Value := qryLitigioIDORIGEMIRLITIGIO.Value;
  qryDESFATOGERADOR.Value := 'SALDO IMPLANTADO - '+ mmDESCRICAO.Text ;
  inherited;
  qry.Close;
  qry.params[0].AsInteger := -1;
  qry.Open;
  cboTipoInvest.Text := '';
  dblCarteira.Text := '';
  qryBuscaPatro.Close;
  qryPlanPrev.Close;
  mmDESCRICAO.Text := '';
end;

procedure TfrmCadSaldoIniIrLitigio.bbtnCancelarClick(Sender: TObject);
begin
  qry.Close;
  qry.params[0].AsInteger := -1;
  qry.Open;
  inherited;

end;

procedure TfrmCadSaldoIniIrLitigio.sbtnInserirClick(Sender: TObject);
begin
  cboTipoInvest.Text := '';
  mmDESCRICAO.Text := '';
  qryBuscaPatro.Close;
  qryPlanPrev.Close;
  inherited;

end;

procedure TfrmCadSaldoIniIrLitigio.dblCarteiraChange(Sender: TObject);
begin
  inherited;
  qryBuscaPatro.Close;
  qryBuscaPatro.params[0].AsInteger := qryCarteira.FieldByName('IDPATROCINADORA').AsInteger;
  qryBuscaPatro.Open;
  qryPlanPrev.Close;
  qryPlanPrev.Params[0].AsInteger := qryCarteira.FieldByName('IDPLANOPREV').AsInteger ;
  qryPlanPrev.Open;
end;

procedure TfrmCadSaldoIniIrLitigio.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryBuscaPatro.Close;
  qryPlanPrev.Close;
  cboTipoInvest.Text := '';
  mmDESCRICAO.Text := '';
end;

end.
