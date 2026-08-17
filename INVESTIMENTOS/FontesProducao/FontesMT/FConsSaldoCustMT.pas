//******************************************************************************
// Data     : 15/05/2007
// Desc     : Coloquei o grid não editável
//******************************************************************************
// Data     : 28/09/2006
// Código   : AL_2
// Pendencia: 22967
// Desc     : Segregação de Planos
//            Retirada da Implementação de CC e CCI nos saldos de Custódia
//******************************************************************************
// Data     : 26/04/2006
// Código   : AL_1
// Pendencia:
// Desc     : Implementação de saldos CC e CCI - DFM
//******************************************************************************
unit FConsSaldoCustMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, DBClient,
  uCMClientDataSet, uCmSqlParams,
  uInvestimento, uCtrlInvestimento, uCtrlPadroes, DBaseDados,
  uMensErro, uSistema, uCtrlRendaVariavel, uCtrlCustodia, RSaldosCustodia,
  FPreview, Wwquery, DBTables;


type
  TFrmConsSaldoCustMT = class(TfrmOkCancelarRelInv)
    cdsCarteira: TCMClientDataSet;
    cdsCustodiante: TCMClientDataSet;
    cdsInvestimento: TCMClientDataSet;
    cdsMotivoBloq: TCMClientDataSet;
    pnlFiltros: TPanel;
    Label6: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edDataDase: TCMDateTimePicker;
    dblCarteira: TwwDBLookupCombo;
    dblInvestimento: TwwDBLookupCombo;
    dblCustodiante: TwwDBLookupCombo;
    dblMotBlq: TwwDBLookupCombo;
    pnlGrid: TPanel;
    grdConsulta: TwwDBGrid;
    cdsSaldosCustodia: TCMClientDataSet;
    dsSaldosCustodia: TDataSource;
    sprSaldosCustodia: TCMSqlParams;
    cdsSaldosCustodiaCUSTODIANTE: TStringField;
    cdsSaldosCustodiaDESCINVESTIMENTO: TStringField;
    cdsSaldosCustodiaDESCCARTINVEST: TStringField;
    cdsSaldosCustodiaDESCMOTBLOQ: TStringField;
    cdsSaldosCustodiaSALDOCC: TFloatField;
    cdsSaldosCustodiaSALDOCCI: TFloatField;
    cdsSaldosCustodiaSALDOTOTAL: TFloatField;
    cdsSaldosCustodiaIDCARTEIRAINVEST: TFloatField;
    cdsSaldosCustodiaIDCUSTODIANTE: TFloatField;
    cdsSaldosCustodiaIDINVESTIMENTO: TFloatField;
    cdsSaldosCustodiaIDLOTE: TStringField;
    cdsSaldosCustodiaIDCUSTODIA: TFloatField;
    cdsSaldosCustodiaGRUPO: TStringField;
    cdsTotais: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField5: TStringField;
    FloatField7: TFloatField;
    StringField6: TStringField;
    cdsSaldosCustodiaPLANPRVCONTABPATRO: TStringField;
    cdsPlanoPatro: TCMClientDataSet;
    Label3: TLabel;
    dblPlanoPrev: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsSaldosCustodiaAfterOpen(DataSet: TDataSet);
    procedure grdConsultaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdConsultaUpdateFooter(Sender: TObject);
    procedure cdsSaldosCustodiaAfterScroll(DataSet: TDataSet);
    procedure grdConsultaTopRowChanged(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    relSaldosCustodia : TRelSaldosCustodia;
    //AL_2
    procedure CalculaRodape;
  public
    { Public declarations }
  end;

var
  FrmConsSaldoCustMT: TFrmConsSaldoCustMT;

implementation

{$R *.DFM}

procedure TFrmConsSaldoCustMT.FormCreate(Sender: TObject);
begin
   inherited;
   relSaldosCustodia := TRelSaldosCustodia.Create(Self);
   CtrlInvestimento  := TCtrlInvestimento.Create;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);

   //AL_2
   cdsPlanoPatro.Data := CtrlInvestimento.ListPlanoPatro;
   cdsCarteira.Data := CtrlInvestimento.ListCarteira(2, -1, 0);
   cdsInvestimento.Data := CtrlInvestimento.ListInvestimento(-1, 2);
   cdsCustodiante.Data := CtrlInvestimento.ListCustodiante(-1);
   cdsMotivoBloq.Data := CtrlInvestimento.ListMotivoBloqueio(-1);
   //AL_2
   bbtnCancelarClick(Self);

end;

procedure TFrmConsSaldoCustMT.bbtnConfirmarClick(Sender: TObject);
//AL_2
var iPlanPatro, iCarteira, iCustodiante, iInvestimento, iMotBloq: Integer;
    sGrupo, sCor: String;
begin
  inherited;
  //AL_2 - Ini
  iPlanPatro := -1;
  iCarteira := -1;
  iCustodiante := -1;
  iInvestimento := -1;
  iMotBloq := -1;

  if Trim(dblPlanoPrev.Text) <> '' then
     iPlanPatro := cdsPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;

  if Trim(dblCarteira.Text) <> '' then
     iCarteira := cdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

  if Trim(dblCustodiante.Text) <> '' then
     iCustodiante := cdsCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;

  if Trim(dblInvestimento.Text) <> '' then
     iInvestimento := cdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

  if Trim(dblMotBlq.Text) <> '' then
     iMotBloq := cdsMotivoBloq.FieldByName('IDMOTIVOBLOQUEIO').AsInteger;


  cdsSaldosCustodia.Data := RelSaldosCustodia.CtrlCustodia.ListaRelSaldoCustodia(edDataDase.Date,
                                                                                 iPlanPatro, iCarteira, iCustodiante, iInvestimento, iMotBloq);

  // Grava o controle de cores para o relatório
  try
     cdsSaldosCustodia.DisableControls;
     sGrupo := '';
     sCor := 'N';
     while not cdsSaldosCustodia.Eof do
     begin
        if sGrupo <> cdsSaldosCustodia.FieldByName('GRUPO').AsString then
        begin
           if sCor = 'S' then
              sCor := 'N'
           else
              sCor := 'S';
           sGrupo := cdsSaldosCustodia.FieldByName('GRUPO').AsString;
        end;
        cdsSaldosCustodia.Edit;
        cdsSaldosCustodia.FieldByName('GRUPO').AsString := sCor;
        cdsSaldosCustodia.Post;
        cdsSaldosCustodia.Next;
     end;
  finally
     cdsSaldosCustodia.First;
     cdsSaldosCustodia.EnableControls;
  end;

  //AL_2 - Fim

  if cdsSaldosCustodia.IsEmpty then
     bt_Imprime.Enabled := False
  else
     bt_Imprime.Enabled := True;

end;

procedure TFrmConsSaldoCustMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FreeAndNil(RelSaldosCustodia);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
end;

procedure TFrmConsSaldoCustMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //AL_2 - Ini
  cdsSaldosCustodia.Data := RelSaldosCustodia.CtrlCustodia.ListaRelSaldoCustodia(0, -1, -1, -1, -1);
  grdConsulta.ColumnByName('DESCCARTINVEST').FooterValue := '';
  grdConsulta.ColumnByName('CUSTODIANTE').FooterValue := '';
  grdConsulta.ColumnByName('DESCINVESTIMENTO').FooterValue := '';
  grdConsulta.ColumnByName('SALDOTOTAL').FooterValue := FloatToStrF( 0, ffNumber, 22, 0);
  //AL_2 - Fim
  bt_Imprime.Enabled := False
end;

procedure TFrmConsSaldoCustMT.bt_ImprimeClick(Sender: TObject);
begin
   inherited;
   RelSaldosCustodia.cdsSaldosCustodia.Data := cdsSaldosCustodia.Data;

   RelSaldosCustodia.LblEmpresa.Caption := Investimentos.NomeEmpresa;
   RelSaldosCustodia.LblSistema.Caption := Investimentos.NomeModulo;
   RelSaldosCustodia.lblPeriodo.Caption := 'Data base: ' + edDataDase.Text;

   if not cdsSaldosCustodia.IsEmpty then
   begin
      TFrmPreview.CreateModalPreview(Application,
                                     RelSaldosCustodia.rptSaldosCustodia,
                                     RelSaldosCustodia.rptSaldosCustodia.PrinterSetup.DocumentName);


   end;
   RelSaldosCustodia.cdsSaldosCustodia.EmptyDataSet;
end;

procedure TFrmConsSaldoCustMT.FormShow(Sender: TObject);
begin
  inherited;
  cdsSaldosCustodia.Data := RelSaldosCustodia.CtrlCustodia.ListaRelSaldoCustodia(0, -1, -1, -1, -1);
end;

procedure TFrmConsSaldoCustMT.cdsSaldosCustodiaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  // AL_1
  if DataSet.FindField('SALDOCC') <> nil then
     TFloatField(DataSet.FindField('SALDOCC')).DisplayFormat := '#,##0';
  if DataSet.FindField('SALDOCCI') <> nil then
     TFloatField(DataSet.FindField('SALDOCCI')).DisplayFormat := '#,##0';
  if DataSet.FindField('SALDOTOTAL') <> nil then
     TFloatField(DataSet.FindField('SALDOTOTAL')).DisplayFormat := '#,##0';

end;

//AL_2
procedure TFrmConsSaldoCustMT.grdConsultaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState;
                                                        Highlight: Boolean; AFont: TFont; ABrush: TBrush);
const clYellowBaby = $00C0FFFF; //Amarelo Bebê
begin
  inherited;
  if not (gdFixed in State) then
  begin
     if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
     begin
        if not ((gdSelected in State) or (gdFocused in State)) then
        begin
           if Field.DataSet.FieldByName('GRUPO').AsString = 'S' then
              AFont.Color := clYellowBaby
           else
              AFont.Color := clHighLightText;
        end
        else
           AFont.Color := clSilver;
        ABrush.Color := clHighLight;
     end
     else
     if not ((gdSelected in State) or (gdFocused in State)) then
     begin
        if Field.DataSet.FieldByName('GRUPO').AsString = 'S' then
           ABrush.Color := clYellowBaby
        else
           ABrush.Color := clWhite;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

//AL_2
procedure TFrmConsSaldoCustMT.grdConsultaUpdateFooter(Sender: TObject);
begin
   inherited;
   CalculaRodape;
end;

//AL_2
procedure TFrmConsSaldoCustMT.cdsSaldosCustodiaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CalculaRodape;
end;

//AL_2
procedure TFrmConsSaldoCustMT.CalculaRodape;
var fTotCC, fTotCCI, fTotGeral: Double;
begin
   if (dgShowFooter in grdConsulta.Options) and (not cdsSaldosCustodia.IsEmpty) then
   begin
      try
         cdsTotais.Data := cdsSaldosCustodia.Data;
         cdsTotais.Filtered := True;
         cdsTotais.Filter := '';
         cdsTotais.Filter :=
                'IDCARTEIRAINVEST = ' + cdsSaldosCustodia.FieldByName('IDCARTEIRAINVEST').AsString + ' AND ' +
                'IDCUSTODIANTE = ' + cdsSaldosCustodia.FieldByName('IDCUSTODIANTE').AsString + ' AND ' +
                'IDINVESTIMENTO = ' + cdsSaldosCustodia.FieldByName('IDINVESTIMENTO').AsString;

         while not cdsTotais.Eof do
         begin
            fTotCC := fTotCC + cdsTotais.FieldByName('SALDOCC').AsFloat;
            fTotCCI := fTotCCI + cdsTotais.FieldByName('SALDOCCI').AsFloat;
            fTotGeral := fTotGeral + cdsTotais.FieldByName('SALDOTOTAL').AsFloat;
            cdsTotais.Next;
         end;

         grdConsulta.ColumnByName('DESCCARTINVEST').FooterValue := cdsSaldosCustodiaDESCCARTINVEST.AsString;
         grdConsulta.ColumnByName('CUSTODIANTE').FooterValue := cdsSaldosCustodiaCUSTODIANTE.AsString;
         grdConsulta.ColumnByName('DESCINVESTIMENTO').FooterValue := cdsSaldosCustodiaDESCINVESTIMENTO.AsString;
         grdConsulta.ColumnByName('SALDOTOTAL').FooterValue := FloatToStrF( fTotGeral, ffNumber, 22, 0);

      finally
         cdsTotais.Close;
      end;
   end;

end;

//AL_2
procedure TFrmConsSaldoCustMT.grdConsultaTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

end.




