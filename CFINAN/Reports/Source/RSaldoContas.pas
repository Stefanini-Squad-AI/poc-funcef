unit RSaldoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,
  uCmSqlParams, uSistema, TXRB, ppStrtch, ppSubRpt, ppModule, raCodMod,
  ppParameter, uCtrlExtratoContas, uCtrlPadroes;

type
  TRptSaldoContas = class(TFrmCmReport)
    cdsSaldo: TCMClientDataSet;
    pplSaldo: TppBDEPipeline;
    dsSaldo: TwwDataSource;
    SqlSaldoPlano: TCMSqlParams;
    dsSaldoPlano: TwwDataSource;
    CdsDadosEmpresa: TCMClientDataSet;
    SqlDadosEmpresa: TCMSqlParams;
    dsDadosEmpresa: TwwDataSource;
    ppLDadosEmpresa: TppDBPipeline;
    spSaldo: TCMSqlParams;
    sqlPatro: TCMSqlParams;
    ppPatro: TppBDEPipeline;
    dsPatro: TwwDataSource;
    sqlPlanoPatro: TCMSqlParams;
    ppRelatorioGeral: TppReport;
    cdsAux: TCMClientDataSet;
    ppAux: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppTitulo: TppShape;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    dbLogo: TppDBImage;
    lblSubTitulo: TppLabel;
    lblStatus: TppLabel;
    lblPeriodo: TppLabel;
    ppDBText20: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel7: TppLabel;
    lblPlanoPatro: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLine16: TppLine;
    ppDetailBand6: TppDetailBand;
    ppZebra: TppShape;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppMaozinha: TppShape;
    ppDBText1: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine5: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    lblSaldoGeral: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    dsAux: TDataSource;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    sqlRelPrincipal: TCMSqlParams;

    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure ppSubReport2Print(Sender: TObject);
    procedure ppZebraPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }

    sListaContas : string;
    CtrlExtratoContas : TCtrlExtratoContas;

    procedure CarregaLogo;


  public  { Public declarations }


  end;



var
  RptSaldoContas: TRptSaldoContas;



implementation
{$R *.DFM}



procedure TRptSaldoContas.CrmRptCMBeforePrint(Sender: TObject);
  //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
  procedure Filtra_cdsSaldo;
  var FFilter: String;
      FDistinct: String;
  begin
    FFilter   := '';
    FDistinct := '';
    CdsAux.First;
    if not CdsAux.Eof then
    begin
      FFilter := FFilter + CdsAux.FieldByName('CODPORTADOR').AsString;
      CdsAux.Next;
    end;
    while not CdsAux.Eof do
    begin
      if FDistinct <> CdsAux.FieldByName('CODPORTADOR').AsString then
        FFilter := FFilter + ', '+ CdsAux.FieldByName('CODPORTADOR').AsString;
      CdsAux.Next;
    end;
    cdsSaldo.Filtered := False;
    if FFilter <> '' then
    begin
      cdsSaldo.Filter   := 'CODPORTADOR IN ( ' + FFilter + ' ) ';
      cdsSaldo.Filtered := True;
    end;
  end;
begin
   inherited;

   CtrlExtratoContas.RemoveContasAbertas := CmpRptCM.ParamValues[4].AsBoolean;
   if CmpRptCM.ParamValues[4].AsBoolean then
      sListaContas := ' - Não listado as contas em aberto'
   else
      sListaContas := '';

   if not (( CmpRptCM.ParamValues[2].AsBoolean ) or ( CmpRptCM.ParamValues[3].AsBoolean )) then
   begin
     CarregaLogo;

     sqlRelPrincipal.Open;

     cdsSaldo.Data := CtrlExtratoContas.ListaSaldoGeral(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[5].AsFloat,
                                                      CmpRptCM.ParamValues[1].AsInteger, DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ) ;

     lblPeriodo.Caption:='Saldo das Contas em '+CmpRptCM.ParamValues[0].AsString;
     lblStatus.Caption:=CmpRptCM.ParamValues[1].RadioGroupSettings.Items[
                                                CmpRptCM.ParamValues[1].AsInteger] + ' ' + sListaContas;
   end
   else

   if (( CmpRptCM.ParamValues[2].AsBoolean ) and ( CmpRptCM.ParamValues[3].AsBoolean )) then
   begin
     CarregaLogo;
     cdsSaldo.Data := CtrlExtratoContas.ListaSaldoGeral(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[5].AsFloat,
                                                        CmpRptCM.ParamValues[1].AsInteger, DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ) ;

     lblPlanoPatro.Caption := 'Patrocinadora - Plano';
     lblSubTitulo.Caption := 'Saldo de contas por plano e patrocinadora';
     lblSaldoGeral.Caption := 'Saldo geral dos planos e patrocinadoras: ';

     CdsAux.Data := CtrlExtratoContas.ListaSaldoXPlanoEPatrocinadora(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[5].AsFloat,
                                                                     CmpRptCM.ParamValues[1].AsInteger, DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ) ;

   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
     Filtra_cdsSaldo;

     lblPeriodo.Caption := 'Saldo das contas em:   '+CmpRptCM.ParamValues[0].AsString;
     lblStatus.Caption  := 'Status:   ' +  CmpRptCM.ParamValues[1].RadioGroupSettings.Items[CmpRptCM.ParamValues[1].AsInteger] + ' ' + sListaContas;

   end
   else

   if ( CmpRptCM.ParamValues[2].AsBoolean ) and not ( CmpRptCM.ParamValues[3].AsBoolean ) then
   begin
     CarregaLogo;

     cdsSaldo.Data := CtrlExtratoContas.ListaSaldoGeral(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[5].AsFloat,
                                                         CmpRptCM.ParamValues[1].AsInteger, DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ) ;

     CdsAux.Data := CtrlExtratoContas.ListaSaldoXPlano(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[5].AsFloat,
                                                         CmpRptCM.ParamValues[1].AsInteger, DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ) ;

   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
     Filtra_cdsSaldo;

     lblSubTitulo.Caption := 'Saldo de contas por plano';
     lblPlanoPatro.Caption := 'Plano';
     lblSaldoGeral.Caption := 'Saldo geral por plano: ';

     lblPeriodo.Caption := 'Saldo das contas em:   '+CmpRptCM.ParamValues[0].AsString;
     lblStatus.Caption  := 'Status:   ' +  CmpRptCM.ParamValues[1].RadioGroupSettings.Items[CmpRptCM.ParamValues[1].AsInteger] + ' ' + sListaContas;
   end;

   if not ( CmpRptCM.ParamValues[2].AsBoolean ) and ( CmpRptCM.ParamValues[3].AsBoolean ) then
   begin
     CarregaLogo;

     lblSubTitulo.Caption := 'Saldo de contas por patrocinadora';
     lblPlanoPatro.Caption := 'Patrocinadora';
     lblSaldoGeral.Caption := 'Saldo geral por patrocinadoras: ';
     cdsSaldo.Data := CtrlExtratoContas.ListaSaldoGeral(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[5].AsFloat,
                                                        CmpRptCM.ParamValues[1].AsInteger, DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ) ;

     CdsAux.Data := CtrlExtratoContas.ListaSaldoXPatrocinadora(CrmRptCM.IdEmpresa, CmpRptCM.ParamValues[5].AsFloat,
                                                               CmpRptCM.ParamValues[1].AsInteger, DateToStr( CmpRptCM.ParamValues[0].AsDateTime ) ) ;

   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
     Filtra_cdsSaldo;

     lblPeriodo.Caption := 'Saldo das contas em:   '+CmpRptCM.ParamValues[0].AsString;
     lblStatus.Caption  := 'Status:   ' +  CmpRptCM.ParamValues[1].RadioGroupSettings.Items[CmpRptCM.ParamValues[1].AsInteger] + ' ' + sListaContas;

   end;
end;


procedure TRptSaldoContas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODPORTADOR, '+
                                                    '   DESCRICAO '+
                                                    'FROM PORTADORCONTA '+
                                                    'WHERE (IDPESSOA = '+
                                                     FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY DESCRICAO ';
end;



procedure TRptSaldoContas.ppSubReport2Print(Sender: TObject);
begin
  inherited;

  CdsAux.Filtered := false;

  if not (cdsAux.IsEmpty) then
  begin
    CdsAux.Filter := 'CODPORTADOR = ' + cdsSaldo.fieldbyName('CODPORTADOR').AsString;
    CdsAux.Filtered := True;
  end;
end;



procedure TRptSaldoContas.ppZebraPrint(Sender: TObject);
begin
  inherited;

  if ppZebra.Brush.Color = $00C8D0D4 then
     ppZebra.Brush.Color := clWhite
  else
     ppZebra.Brush.Color := $00C8D0D4;
end;



procedure TRptSaldoContas.CarregaLogo;
begin
   SqlDadosEmpresa.Prepare;
   SqlDadosEmpresa.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   SqlDadosEmpresa.Open;
end;




procedure TRptSaldoContas.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlExtratoContas := TCtrlExtratoContas.Create;
  CtrlExtratoContas.InitializeAs(padroes);
end;




procedure TRptSaldoContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlExtratoContas);
  inherited;
end;



end.
