// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :
// Data        :
// Alteração   :
//------------------------------------------------------------------------------
unit FParamRelMovReserva_EspFCRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, {DRelatAdmPrev,} Db, DBTables,
  Wwquery, Mask, DBClient, uCMClientDataSet, ppBands, ppClass, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Wwdatsrc, UCtrlExtratoReserva, ComCtrls, Provider,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, ppModule, raCodMod;

type
  TfrmParamRelMovReserva_EspFCRT = class(TfrmOkCancelar)
    MontaSelect: TMontaSelect;
    cdsMensal: TCMClientDataSet;
    ppMensal: TppBDEPipeline;
    rpMensal: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppShape3: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppRodapeMensal: TppFooterBand;
    ppShape12: TppShape;
    lblSumarioTituloBeneficioSaldado: TppLabel;
    ppLabel29: TppLabel;
    ppDBText14: TppDBText;
    ppSumarioMensal: TppSummaryBand;
    ppShape11: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel13: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppDBText12: TppDBText;
    lblTotValorCota: TppDBText;
    lblTotalSaldoReal: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppShape1: TppShape;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    lblSaldoAnterior: TppLabel;
    ppRodapeGrupoMensal: TppGroupFooterBand;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape5: TppShape;
    ppLabel3: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine2: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppDBText10: TppDBText;
    dsMensal: TwwDataSource;
    ppDBText15: TppDBText;
    cdsFundacao: TCMClientDataSet;
    lblSubSaldoReal: TppLabel;
    lblSumarioBeneficioSaldado: TppLabel;
    ppDBImage5: TppDBImage;
    ppDBText145: TppDBText;
    ppDBText144: TppDBText;
    ppDBText143: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppLabel25: TppLabel;
    ppDBText101: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppFundacao: TppBDEPipeline;
    dsFundacao: TwwDataSource;
    rpTrimestral: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape13: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppDBText16: TppDBText;
    ppLabel32: TppLabel;
    ppDBText17: TppDBText;
    ppLabel33: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine16: TppLine;
    ppDBImage1: TppDBImage;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel34: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppShape14: TppShape;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppRodapeTrimestral: TppFooterBand;
    lblSumarioTituloBeneficioSaldadoTri: TppLabel;
    ppLabel37: TppLabel;
    ppDBText31: TppDBText;
    lblSumarioBeneficioSaldadoTri: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppLabel40: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppDBText32: TppDBText;
    lblTotValorCotaTri: TppDBText;
    lblTotalSaldoTrimestral: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppDBText34: TppDBText;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    lblSaldoAntTri: TppLabel;
    ppDBText36: TppDBText;
    ppRodapeGrupoTrimestral: TppGroupFooterBand;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppDBText37: TppDBText;
    ppSUBValorCotaTrimestral: TppDBText;
    lblSUBSaldoTrimestral: TppLabel;
    ppTrimestral: TppBDEPipeline;
    dsTrimestral: TwwDataSource;
    Panel1: TPanel;
    pgctrlExtrato: TPageControl;
    tbsIndividual: TTabSheet;
    tbsGrupo: TTabSheet;
    cdsTrimestral: TCMClientDataSet;
    ppLabel61: TppLabel;
    ppLabel60: TppLabel;
    ppLabel62: TppLabel;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edParticipante: TEdit;
    edMatricula: TEdit;
    edNumInsc: TEdit;
    edPatrocinadora: TEdit;
    edPlano: TEdit;
    lblSubQuantcotas: TppLabel;
    lblSubValorCota: TppDBText;
    ppSomaCotasAux: TppDBCalc;
    lblTotQuantcotas: TppLabel;
    ppSUBQuantCotasTrimestral: TppLabel;
    ppSomaCotasAuxTri: TppDBCalc;
    lblTotQuantcotasTri: TppLabel;
    ppDBText13: TppDBText;
    grpPedeAno: TGroupBox;
    Label1: TLabel;
    edAnoRef: TMaskEdit;
    grpPedeMes: TGroupBox;
    Label15: TLabel;
    lblObsTrimestral: TLabel;
    edMesCobIni: TMaskEdit;
    rgrpTipo: TRadioGroup;
    rpConsolidado: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppShape25: TppShape;
    ppLabel35: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel46: TppLabel;
    ppDBText33: TppDBText;
    ppLabel63: TppLabel;
    ppDBText38: TppDBText;
    ppLabel64: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine31: TppLine;
    ppDBImage2: TppDBImage;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppLabel65: TppLabel;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDetalheCons: TppDetailBand;
    ppShape26: TppShape;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText52: TppDBText;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel72: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppLabel73: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    lblTotSaldoRealCons: TppLabel;
    lblTotQuantcotasCons: TppLabel;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    lblSaldoAntCons: TppLabel;
    ppLabel87: TppLabel;
    ppDBText58: TppDBText;
    ppConsolidado: TppBDEPipeline;
    dsConsolidado: TwwDataSource;
    cdsConsolidado: TCMClientDataSet;
    ppGroup3: TppGroup;
    ppHeaderMatriculaConsolidado: TppGroupHeaderBand;
    ppRodapeGrupoCons: TppGroupFooterBand;
    ppShape34: TppShape;
    ppLabel66: TppLabel;
    ppDBText56: TppDBText;
    ppLine43: TppLine;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppDBText49: TppDBText;
    ppDBText59: TppDBText;
    ppLine47: TppLine;
    ppSomaCotasAuxCons: TppDBCalc;
    ppDBText51: TppDBText;
    lblValorRealCons: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    cdsPatro: TCMClientDataSet;
    dblkpcmbPatro: TwwDBLookupCombo;
    cdsPatroORDEM: TFloatField;
    cdsPatroIDPESSOA: TFloatField;
    cdsPatroNOME: TStringField;
    Label2: TLabel;
    cdsSituacao: TCMClientDataSet;
    Label3: TLabel;
    dbgrdSituacao: TwwDBGrid;
    dsSituacao: TwwDataSource;
    cdsSituacaoFILTRA: TFloatField;
    cdsSituacaoIDSITPART: TFloatField;
    cdsSituacaoDESCRICAO: TStringField;
    Label4: TLabel;
    memMatriculas: TMemo;
    ppGroup4: TppGroup;
    ppCabecalhoGrupoMensal: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    BitBtn1: TBitBtn;
    wwQuery1: TwwQuery;
    ppGroup5: TppGroup;
    ppCabecalhoGrupoTrimestral: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    chkIncluiMesesAnteriores: TCheckBox;
    ppShape15: TppShape;
    lblSumarioTituloBeneficioSaldadoCons: TppLabel;
    lblSumarioBeneficioSaldadoCons: TppLabel;
    ppShape27: TppShape;
    ppDBText11: TppDBText;
    ppLine48: TppLine;
    ppLabel15: TppLabel;
    ppLine49: TppLine;
    ppDBText35: TppDBText;
    ppLine50: TppLine;
    ppDBText55: TppDBText;
    ppLabel26: TppLabel;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppLabel36: TppLabel;
    ppDBText57: TppDBText;
    ppShape37: TppShape;
    ppLabel52: TppLabel;
    ppDBText60: TppDBText;
    ppLabel53: TppLabel;
    lblTotQuantcotasAtu: TppLabel;
    ppLabel74: TppLabel;
    lblTotSaldoRealAtu: TppLabel;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppDBText61: TppDBText;
    ppLabel71: TppLabel;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppLabel86: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppDBText62: TppDBText;
    lblValorCotaAtual: TppDBText;
    lblSaldoAtual: TppLabel;
    lblQuantcotasAtu: TppLabel;
    ppLabel41: TppLabel;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppSumarioMensalBeforePrint(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure rgrpTipoClick(Sender: TObject);
    procedure ppRodapeGrupoConsBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppRodapeGrupoTrimestralBeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure ppRodapeGrupoMensalBeforePrint(Sender: TObject);
    procedure ppHeaderMatriculaConsolidadoBeforePrint(Sender: TObject);
    procedure ppCabecalhoGrupoTrimestralBeforePrint(Sender: TObject);
    procedure ppCabecalhoGrupoMensalBeforePrint(Sender: TObject);
  private
    { Private declarations }
    dSaldoCotasTotal : double;
    bFiltraPatro     : boolean;
    iIdPatroFiltro   : longint;
    strSituacao      : string;
    strMatricula     : string;

    ExtratoReserva : TCtrlExtratoReserva;
    procedure LimpaCampos;
    procedure TrataErro( sMsgErro : string);
    procedure EmiteExtratoMensal;
    procedure EmiteExtratoTrimestral;
    procedure EmiteExtratoConsolidado;

    function ClienteNumeroLocal(sNumero : string):string;
  public
    { Public declarations }
  end;

var
  frmParamRelMovReserva_EspFCRT: TfrmParamRelMovReserva_EspFCRT;

implementation

uses DBaseDados, UMensErro, USistema;

{$R *.DFM}

procedure TfrmParamRelMovReserva_EspFCRT.LimpaCampos;
begin
   edParticipante.Text  := '';
   edMatricula.Text     := '';
   edPatrocinadora.Text := '';
   edNumInsc.Text       := '';
   edPlano.Text         := '';
   edAnoRef.Text        := '';
end;

procedure TfrmParamRelMovReserva_EspFCRT.bbtnProcurarClick(Sender: TObject);
var sSQL : string;
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     edParticipante.Text  := MontaSelect.ValoresChave[3];
     edPatrocinadora.Text := MontaSelect.ValoresChave[4];
     edPlano.Text         := MontaSelect.ValoresChave[5];
     edMatricula.Text     := MontaSelect.ValoresChave[7];
     edNumInsc.Text       := MontaSelect.ValoresChave[8];
     edMesCobIni.SetFocus;
  end
  else LimpaCampos;
end;

procedure TfrmParamRelMovReserva_EspFCRT.FormShow(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(sistema.IdEmpresa)+')'); // CAMILLE - 07.07.2003
  lblObsTrimestral.Visible := False;
  grpPedeMes.BringToFront;
end;

procedure TfrmParamRelMovReserva_EspFCRT.bbtnConfirmarClick(Sender: TObject);
var i : word;
begin

  if (pgctrlExtrato.ActivePage = tbsIndividual) and (Trim(edParticipante.Text) = '')
  then begin
     MsgDlg('Selecione o Participante. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (rgrpTipo.ItemIndex < 2) and (Trim(edMesCobIni.Text) = '')
  then begin
     MsgDlg('Selecione o Mês de Referência.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (rgrpTipo.ItemIndex = 2) and (Trim(edAnoRef.Text) = '')
  then begin
     MsgDlg('Selecione o Ano de Referência.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (pgctrlExtrato.ActivePage <> tbsIndividual)
  then begin
     if (Trim(dblkpcmbPatro.Text) <> '') and (cdsPatro.FieldByName('IDPESSOA').AsInteger > 0)
     then begin
        bFiltraPatro   := True;
        iIdPatroFiltro := cdsPatro.FieldByName('IDPESSOA').AsInteger;
     end
     else begin
        bFiltraPatro   := False;
        iIdPatroFiltro := -1;
     end;

     strSituacao := '';
     cdsSituacao.First;
     while not cdsSituacao.Eof do
     begin
        if cdsSituacao.FieldByName('FILTRA').AsInteger = 1
        then begin
           if Trim(strSituacao) = ''
           then strSituacao := cdsSituacao.FieldByName('IDSITPART').AsString
           else strSituacao := strSituacao +','+cdsSituacao.FieldByName('IDSITPART').AsString;
        end;
        cdsSituacao.Next;
     end;

     strMatricula := '';
     for i := 0 to memMatriculas.Lines.Count do
     begin
        if Trim(memMatriculas.Lines[i]) <> ''
        then begin
           if Trim(strMatricula) = ''
           then strMatricula := ''''+Trim(memMatriculas.Lines[i])+''''
           else strMatricula := strMatricula +','''+Trim(memMatriculas.Lines[i])+'''';
        end;
     end;
  end;


  case rgrpTipo.ItemIndex of
       0 : EmiteExtratoMensal;
       1 : EmiteExtratoTrimestral;
       2 : EmiteExtratoConsolidado;
  end;

  // Retirar o comentário apenas para fins de debug
  {case rgrpTipo.ItemIndex of
       0 : cdsMensal.SaveToFile('C:\DadosExtratoMensal.cds');
       1 : cdsTrimestral.SaveToFile('C:\DadosExtratoTrimestral.cds');
       2 : cdsConsolidado.SaveToFile('C:\DadosExtratoConsolidado.cds');
  end;}

  inherited;
end;

procedure TfrmParamRelMovReserva_EspFCRT.FormCreate(Sender: TObject);
begin
  inherited;
  ExtratoReserva := TCtrlExtratoReserva.Create;
  ExtratoReserva.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, TrataErro);

  cdsFundacao.Close;
  cdsFundacao.Data := ExtratoReserva.BuscaFundacao(Sistema.IdEmpresa);

  cdsPatro.Close;
  cdsPatro.Data := ExtratoReserva.BuscaPatro(Sistema.IdEmpresa);

  cdsSituacao.Close;
  cdsSituacao.Data := ExtratoReserva.BuscaSituacao(Sistema.IdEmpresa);

  memMatriculas.Lines.Clear;
end;

procedure TfrmParamRelMovReserva_EspFCRT.TrataErro( sMsgErro : string);
begin
  MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
end;

procedure TfrmParamRelMovReserva_EspFCRT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ExtratoReserva.Free;
  inherited;

end;

procedure TfrmParamRelMovReserva_EspFCRT.ppSumarioMensalBeforePrint(
  Sender: TObject);
begin
  inherited;
  lblTotQuantcotas.Caption  := FormatFloat('###,###,###,##0.000000',dSaldoCotasTotal);
  lblTotalSaldoReal.Caption := FormatFloat('###,###,###,##0.00', StrToFloat(ClienteNumeroLocal(lblTotQuantcotas.GetText)) * StrToFloat(ClienteNumeroLocal(lblTotValorCota.GetText)));
end;

procedure TfrmParamRelMovReserva_EspFCRT.EmiteExtratoMensal;
begin
  cdsMensal.Close;

  if pgctrlExtrato.ActivePage = tbsIndividual
  then cdsMensal.Data := ExtratoReserva.EmiteExtratoReservaMensal( Trim(edMesCobIni.Text),
                                                                   StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[1])),
                                                                   StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[2])),
                                                                   StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[0])),
                                                                   StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[6])),
                                                                   bFiltraPatro,
                                                                   iIdPatroFiltro,
                                                                   strSituacao,
                                                                   strMatricula)
  else cdsMensal.Data := ExtratoReserva.EmiteExtratoReservaMensal( Trim(edMesCobIni.Text),
                                                                   -1,
                                                                   -1,
                                                                   -1,
                                                                   -1,
                                                                   bFiltraPatro,
                                                                   iIdPatroFiltro,
                                                                   strSituacao,
                                                                   strMatricula);
  dsMensal.DataSet       := cdsMensal;
  ppMensal.DataSource    := dsMensal;
  rpMensal.DataPipeline  := ppMensal;
  rpMensal.Print;
end;

procedure TfrmParamRelMovReserva_EspFCRT.EmiteExtratoTrimestral;
begin
  cdsTrimestral.Close;

  if pgctrlExtrato.ActivePage = tbsIndividual
  then cdsTrimestral.Data := ExtratoReserva.EmiteExtratoReservaTrimestral( Trim(edMesCobIni.Text),
                                                                           StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[1])),
                                                                           StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[2])),
                                                                           StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[0])),
                                                                           StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[6])),
                                                                           bFiltraPatro,
                                                                           iIdPatroFiltro,
                                                                           strSituacao,
                                                                           strMatricula)
  else cdsTrimestral.Data := ExtratoReserva.EmiteExtratoReservaTrimestral( Trim(edMesCobIni.Text),
                                                                           -1,
                                                                           -1,
                                                                           -1,
                                                                           -1,
                                                                           bFiltraPatro,
                                                                           iIdPatroFiltro,
                                                                           strSituacao,
                                                                           strMatricula);
  dsTrimestral.DataSet       := cdsTrimestral;
  ppTrimestral.DataSource    := dsTrimestral;
  rpTrimestral.DataPipeline  := ppTrimestral;
  rpTrimestral.Print;
end;

procedure TfrmParamRelMovReserva_EspFCRT.EmiteExtratoConsolidado;
begin
  cdsConsolidado.Close;
  if pgctrlExtrato.ActivePage = tbsIndividual
  then cdsConsolidado.Data := ExtratoReserva.EmiteExtratoReservaConsolidado( Trim(edAnoRef.Text),
                                                                             StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[1])),
                                                                             StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[2])),
                                                                             StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[0])),
                                                                             StrToInt(ClienteNumeroLocal(MontaSelect.ValoresChave[6])),
                                                                             bFiltraPatro,
                                                                             iIdPatroFiltro,
                                                                             strSituacao,
                                                                             strMatricula, False)
  else cdsConsolidado.Data := ExtratoReserva.EmiteExtratoReservaConsolidado( Trim(edAnoRef.Text),
                                                                             -1,
                                                                             -1,
                                                                             -1,
                                                                             01,
                                                                             bFiltraPatro,
                                                                             iIdPatroFiltro,
                                                                             strSituacao,
                                                                             strMatricula,False);
  dsConsolidado.DataSet       := cdsConsolidado;
  ppConsolidado.DataSource    := dsConsolidado;
  rpConsolidado.DataPipeline  := ppConsolidado;
  rpConsolidado.Print;
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
  dSaldoCotasTotal := 0;
end;

procedure TfrmParamRelMovReserva_EspFCRT.rgrpTipoClick(Sender: TObject);
begin
  inherited;
  lblObsTrimestral.Visible := (rgrpTipo.ItemIndex = 1);

  if rgrpTipo.ItemIndex = 2
  then begin
     grpPedeMes.SendToBack;
     edAnoRef.SetFocus;
  end
  else begin
     grpPedeMes.BringToFront;
     edMesCobIni.Text;
  end;
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppRodapeGrupoConsBeforePrint(
  Sender: TObject);
var dSaldoCotas : double;
begin
  inherited;
  dSaldoCotas                   := StrToFloat(ClienteNumeroLocal(ppSomaCotasAuxCons.GetText)) + cdsConsolidado.FieldByName('SALDOANTCOTA').AsFloat;
  lblTotQuantcotasCons.Caption  := FormatFloat('###,###,###,##0.000000',dSaldoCotas);
  lblTotSaldoRealCons.Caption   := FormatFloat('###,###,###,##0.00', StrToFloat(ClienteNumeroLocal(lblTotQuantcotasCons.GetText)) * cdsConsolidado.FieldByName('VALOR_DA_COTA').AsFloat);
  // Gleyber - 23/07/2004 - Pendência 17081 - Início
  lblTotQuantcotasAtu.Caption  := FormatFloat('###,###,###,##0.000000',dSaldoCotas);
  lblTotSaldoRealAtu.Caption   := FormatFloat('###,###,###,##0.00', StrToFloat(ClienteNumeroLocal(lblTotQuantcotasCons.GetText)) * cdsConsolidado.FieldByName('VALOR_ULT_COTA').AsFloat);
  // Gleyber - 23/07/2004 - Pendência 17081 - Fim
  lblSumarioTituloBeneficioSaldadoCons.Caption := 'Valor do Benefício Saldado aos '+cdsConsolidado.FieldByName('IDADEBSALDADO').AsString+' anos ';
  lblSumarioBeneficioSaldadoCons.Caption       := 'R$ '+FormatFloat('###,###,###,##0.00', cdsConsolidado.FieldByName('BSALDADO').AsFloat);
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppGroupFooterBand1BeforePrint(
  Sender: TObject);
var dSaldoCotas : double;
begin
  inherited;
  dSaldoCotas := StrToFloat(ClienteNumeroLocal(ppSomaCotasAux.GetText)) + cdsMensal.FieldByName('SALDOANTCOTA').AsFloat;
  dSaldoCotasTotal := dSaldoCotasTotal + dSaldoCotas;
  lblSubQuantCotas.Caption := FormatFloat('###,###,###,##0.000000',dSaldoCotas);
  lblSubSaldoReal.Caption  := FormatFloat('###,###,###,##0.00', StrToFloat(ClienteNumeroLocal(lblSubQuantCotas.GetText)) * StrToFloat(ClienteNumeroLocal(lblSubValorCota.GetText)));
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppGroupFooterBand2BeforePrint(
  Sender: TObject);
var dSaldoCotas : double;
begin
  inherited;
  dSaldoCotas                       := StrToFloat(ClienteNumeroLocal(ppSomaCotasAuxTri.GetText)) + cdsTrimestral.FieldByName('SALDOANTCOTA').AsFloat;
  dSaldoCotasTotal                  := dSaldoCotasTotal + dSaldoCotas;
  ppSUBQuantCotasTrimestral.Caption := FormatFloat('###,###,###,##0.000000',dSaldoCotas);
  lblSubSaldoTrimestral.Caption     := FormatFloat('###,###,###,##0.00', StrToFloat(ClienteNumeroLocal(ppSUBQuantCotasTrimestral.GetText)) * StrToFloat(ClienteNumeroLocal(ppSUBValorCotaTrimestral.GetText)));
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppRodapeGrupoTrimestralBeforePrint(
  Sender: TObject);
begin
  inherited;
  lblTotQuantcotasTri.Caption     := FormatFloat('###,###,###,##0.000000',dSaldoCotasTotal);
  lblQuantcotasAtu.Caption        := FormatFloat('###,###,###,##0.000000',dSaldoCotasTotal); // Gleyber - 28/07/2004 - Pendência 17081
  lblTotalSaldoTrimestral.Caption := FormatFloat('###,###,###,##0.00', StrToFloat(ClienteNumeroLocal(lblTotQuantcotasTri.GetText)) * StrToFloat(ClienteNumeroLocal(lblTotValorCotaTri.GetText)));
  lblSaldoAtual.Caption           := FormatFloat('###,###,###,##0.00', StrToFloat(ClienteNumeroLocal(lblQuantcotasAtu.GetText)) * StrToFloat(ClienteNumeroLocal(lblValorCotaAtual.GetText))); // Gleyber - 28/07/2004 - Pendência 17081
  lblSumarioTituloBeneficioSaldadoTri.Caption := 'Valor do Benefício Saldado aos '+cdsTrimestral.FieldByName('IDADEBSALDADO').AsString+' anos ';
  lblSumarioBeneficioSaldadoTri.Caption       := 'R$ '+FormatFloat('###,###,###,##0.00', cdsTrimestral.FieldByName('BSALDADO').AsFloat);
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppGroupHeaderBand2BeforePrint(
  Sender: TObject);
begin
  inherited;
  dSaldoCotasTotal := 0;
end;

function TfrmParamRelMovReserva_EspFCRT.ClienteNumeroLocal(
  sNumero: string): string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   // CAMILLE - REFER - 23.08.1999
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppRodapeGrupoMensalBeforePrint(
  Sender: TObject);
begin
  inherited;
  lblSumarioTituloBeneficioSaldado.Caption := 'Valor do Benefício Saldado aos '+cdsMensal.FieldByName('IDADEBSALDADO').AsString+' anos ';
  lblSumarioBeneficioSaldado.Caption       := 'R$ '+FormatFloat('###,###,###,##0.00', cdsMensal.FieldByName('BSALDADO').AsFloat);
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppHeaderMatriculaConsolidadoBeforePrint(
  Sender: TObject);
begin
  lblSaldoAntCons.Caption := 'Saldo Anterior em 31/12/'+IntToStr(StrToInt(edAnoRef.Text)-1);
  inherited;
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppCabecalhoGrupoTrimestralBeforePrint(
  Sender: TObject);
var sDiaAnt : string;
    sAnoMesAnt : string;
begin
  sAnoMesAnt := ExtratoReserva.SAnoMesAnterior(edMesCobIni.Text);
  sAnoMesAnt := ExtratoReserva.SAnoMesAnterior(sAnoMesAnt);
  sAnoMesAnt := ExtratoReserva.SAnoMesAnterior(sAnoMesAnt);
  if Copy(sAnoMesAnt,6,2) = '01'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '02'  then sDiaAnt := '28' else
  if Copy(sAnoMesAnt,6,2) = '03'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '04'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '05'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '06'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '07'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '08'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '09'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '10'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '11'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '12'  then sDiaAnt := '31';
  lblSaldoAntTri.Caption := 'Saldo Anterior (cotas) em '+sDiaAnt +'/'+Copy(sAnoMesAnt,6,2)+'/'+Copy(sAnoMesAnt,1,4)+' : ';
  inherited;
end;

procedure TfrmParamRelMovReserva_EspFCRT.ppCabecalhoGrupoMensalBeforePrint(
  Sender: TObject);
var sDiaAnt : string;
    sAnoMesAnt : string;
begin
  sAnoMesAnt :=ExtratoReserva.SAnoMesAnterior(edMesCobIni.Text);
  if Copy(sAnoMesAnt,6,2) = '01'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '02'  then sDiaAnt := '28' else
  if Copy(sAnoMesAnt,6,2) = '03'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '04'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '05'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '06'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '07'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '08'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '09'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '10'  then sDiaAnt := '31' else
  if Copy(sAnoMesAnt,6,2) = '11'  then sDiaAnt := '30' else
  if Copy(sAnoMesAnt,6,2) = '12'  then sDiaAnt := '31';
  lblSaldoAnterior.Caption := 'Saldo Anterior (cotas) em '+sDiaAnt +'/'+Copy(sAnoMesAnt,6,2)+'/'+Copy(sAnoMesAnt,1,4)+' : ';
  inherited;
end;

end.
