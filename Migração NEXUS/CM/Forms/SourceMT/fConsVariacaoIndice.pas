{ Data       : 07.08.2015
 Sol        : 148922/8841
 PPM        : 1628565
 Autor      : Jonas Otavio
 Rotina     : Botão Ajuda
 Descrição  : Confeccionar documentação do módulo de Empréstimo
-------------------------------------------------------------------------------
// Alterações:

Rotina......: btnConsultaClick, ppLabel5GetText, ppLabel2GetText
Nº SIG......: 116924
Data........: 09/05/2022
Responsável.: Luis Ferrari
Descrição...: o cálculo da rentabilidade contempla 12 meses, sendo o correto 13 últimos meses
-----------------------------------------------------------------------------------------------------
}
unit fConsVariacaoIndice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, uCtrlVariacaoIndice, DBClient, uCMClientDataSet,
  uSistema, uCmTypes, dBaseDados, Grids, Wwdbigrd, Wwdbgrid, Mask,
  JCLStrings, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppCtrls, ppVar, ppBands, ppPrnabl, ppCache, ppModule,
  fCMEspera, fPreview;

type
  TfrmConsVariacaoIndice = class(TfrmSairAjuda)
    pnlTopo: TPanel;
    grpMoeda: TGroupBox;
    lblSiglaDesc: TLabel;
    dblkpSiglaDescMoeda: TwwDBLookupCombo;
    grpPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    lblTipo: TLabel;
    edtTipo: TEdit;
    lblPeriodicidade: TLabel;
    edtPeriodicidade: TEdit;
    pnlBotoes: TPanel;
    btnImprime: TBitBtn;
    btnLimpa: TBitBtn;
    btnConsulta: TBitBtn;
    cdsMoeda: TCMClientDataSet;
    pnlDados: TPanel;
    dbgrdDados: TwwDBGrid;
    cdsDados: TCMClientDataSet;
    dtsDados: TDataSource;
    cdsDadosANO: TStringField;
    cdsDadosMES: TStringField;
    cdsDadosCOTDATA: TDateTimeField;
    cdsDadosCOTVALOR: TFloatField;
    cdsDadosDOZEMESES: TFloatField;
    cdsDadosACUMULADO: TFloatField;
    cdsDadosMOECODIGO: TFloatField;
    cdsDadosNUMDIASPRAZO: TFloatField;
    cdsDadosCOTMESREF: TStringField;
    cdsDadosMOEDESC: TStringField;
    cdsDadosMOESIGLA: TStringField;
    Panel2: TPanel;
    dtInicial: TwwDBDateTimePicker;
    dtFinal: TwwDBDateTimePicker;
    cdsDadosFLGPERCVALOR: TStringField;
    dbgrdDadosIButton: TwwIButton;
    cdsDadosMOEPERIODICIDADE: TStringField;
    ppRelatorio: TppBDEPipeline;
    rptReport: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel148: TppLabel;
    pplblEmpresa: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppFooterBand15: TppFooterBand;
    ppLine47: TppLine;
    pplblSistema: TppLabel;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppdbValor: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    pplblMoeda: TppLabel;
    ppLabel18: TppLabel;
    pplblTipo: TppLabel;
    ppLabel20: TppLabel;
    pplblPeriodicidade: TppLabel;
    ppLabel22: TppLabel;
    pplblPeriodo: TppLabel;
    ppShape1: TppShape;
    cdsReport: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    dtsReport: TDataSource;
    ppSummaryBand1: TppSummaryBand;
    pplblAcumulado: TppLabel;
    ppLabel19: TppLabel;
    ppLine3: TppLine;
    ppAlternado: TppShape;
    cdsImagem: TCMClientDataSet;
    dtsImagem: TDataSource;
    ppImagem: TppBDEPipeline;
    ppDBImage1: TppDBImage;
    cdsImagemIMAGEM: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpSiglaDescMoedaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnLimpaClick(Sender: TObject);
    procedure cdsDadosAfterOpen(DataSet: TDataSet);
    procedure cdsDadosAfterClose(DataSet: TDataSet);
    procedure dbgrdDadosUpdateFooter(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure ppAlternadoPrint(Sender: TObject);
    procedure dbgrdDadosTopRowChanged(Sender: TObject);
    procedure GridZebrado(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnAjudaClick(Sender: TObject);
    procedure ppLabel5GetText(Sender: TObject; var Text: String);
    procedure ppLabel12GetText(Sender: TObject; var Text: String);
  private
    CtrlVariacaoIndice : TCtrlVariacaoIndice;

    sFiltroMoeda,
    sFiltroTipo,
    sFiltroPeriodicidade,
    sFiltroPeriodo : string;

  public
    sTotalAcumulado : string;
    procedure MsgErro( sMsg : string );
    procedure SelecionaMoeda;
  end;

var
  frmConsVariacaoIndice: TfrmConsVariacaoIndice;

implementation

{$R *.DFM}

procedure TfrmConsVariacaoIndice.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlVariacaoIndice := TCtrlVariacaoIndice.Create;
  CtrlVariacaoIndice.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  cdsMoeda.Data  := CtrlVariacaoIndice.LookupMoeda;
  cdsImagem.Data := CtrlVariacaoIndice.ImagemPessoa( Sistema.IdEmpresa );

  btnLimpaClick( btnLimpa );
end;

procedure TfrmConsVariacaoIndice.FormDestroy(Sender: TObject);
begin
  CtrlVariacaoIndice.Free;
  inherited;
end;

procedure TfrmConsVariacaoIndice.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;

procedure TfrmConsVariacaoIndice.dblkpSiglaDescMoedaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelecionaMoeda;
end;

procedure TfrmConsVariacaoIndice.SelecionaMoeda;
begin
  edtTipo.Clear;
  edtPeriodicidade.Clear;
  if trim( dblkpSiglaDescMoeda.LookupValue ) <> '' then
  begin
    dblkpSiglaDescMoeda.Text := cdsMoeda.FieldByName('MOESIGLA').AsString;

    if trim( cdsMoeda.FieldByName('FLGPERCVALOR').AsString ) = 'V' then
      edtTipo.Text := 'Valor'
    else
      edtTipo.Text := 'Percentual';

    case trim( cdsMoeda.FieldByName('MOEPERIODICIDADE').AsString )[1] of
     'D' : edtPeriodicidade.Text := 'Diária';
     'M' : edtPeriodicidade.Text := 'Mensal';
     'A' : edtPeriodicidade.Text := 'Anual';
    end;

  end;
end;

procedure TfrmConsVariacaoIndice.btnConsultaClick(Sender: TObject);
begin
  inherited;

  cdsDados.Close;

  if trim( dblkpSiglaDescMoeda.LookupValue ) = '' then
  begin
    MessageDlg( 'Selecione o índice/moeda.', mtError, [mbOk], 0);
    dblkpSiglaDescMoeda.SetFocus;
    exit;
  end;

  if dtInicial.Text = '' then
  begin
    MessageDlg( 'Informe a data inicial.', mtError, [mbOk], 0);
    dtInicial.SetFocus;
    exit;
  end;

  if dtFinal.Text = '' then
  begin
    MessageDlg( 'Informe a data final.', mtError, [mbOk], 0);
    dtFinal.SetFocus;
    exit;
  end;

  if dtInicial.Date > dtFinal.Date then
  begin
    MessageDlg( 'A data final não pode ser anterior à data inicial.', mtError, [mbOk], 0);
    dtFinal.SetFocus;
    exit;
  end;

  if trim( cdsMoeda.FieldByName('FLGPERCVALOR').AsString ) = 'V' then
  begin
    cdsDadosCOTVALOR.DisplayFormat := '#,##0.000000';
    ppdbValor.DisplayFormat        := '#,##0.000000';
  end
  else
  begin
    cdsDadosCOTVALOR.DisplayFormat := '#,##0.000000''%''';
    ppdbValor.DisplayFormat        := '#,##0.000000''%''';
  end;

  cdsDados.DisableControls;
  try
    cdsDados.Data := CtrlVariacaoIndice.RecuperaVariacaoIndice( dblkpSiglaDescMoeda.LookupValue, dtInicial.Date, dtFinal.Date );
    sTotalAcumulado := '';
    if not cdsDados.IsEmpty then
    begin
      cdsDados.Last;
      sTotalAcumulado := FormatFloat( '#,##0.000000', ( cdsDadosACUMULADO.AsFloat - 1 ) * 100 ) + '%';
      cdsDados.First;
    end;
  finally
    // Inicio SIG 116924 Ferrari
    dbgrdDados.Selected.Clear;
    dbgrdDados.Selected.Add('ANO' + #9 + '07' + #9 + 'Ano');
    dbgrdDados.Selected.Add('MES' + #9 + '07' + #9 + 'Mês');
    dbgrdDados.Selected.Add('COTDATA' + #9 + '10' + #9 + 'Data');
    dbgrdDados.Selected.Add('COTVALOR' + #9 + '18' + #9 + 'Cotação');
    dbgrdDados.Selected.Add('DOZEMESES' + #9 + '18' + #9 + 'Últimos '+ cdsMoeda.FieldByName('MESESFATOR').AsString + ' Meses');
    dbgrdDados.Selected.Add('ACUMULADO' + #9 + '18' + #9 + 'Acumulado');
    dbgrdDados.Selected.Add('NUMDIASPRAZO' + #9 + '12' + #9 + 'Prazo');
    // FIM
    cdsDados.EnableControls;
  end;

  sFiltroMoeda         := cdsMoeda.FieldByName('MOESIGLA').AsString + '  (' + cdsMoeda.FieldByName('MOEDESC').AsString + ')';
  sFiltroTipo          := edtTipo.Text;
  sFiltroPeriodicidade := edtPeriodicidade.Text;
  sFiltroPeriodo       := 'De ' + dtInicial.Text + ' a ' + dtFinal.Text;

end;

procedure TfrmConsVariacaoIndice.btnLimpaClick(Sender: TObject);
begin
  inherited;
  dblkpSiglaDescMoeda.LookupValue := '';
  dblkpSiglaDescMoeda.Text := '';
  edtTipo.Clear;
  edtPeriodicidade.Clear;
  dtInicial.Clear;
  dtFinal.Clear;
  cdsDados.Close;
  sTotalAcumulado := '';
  sFiltroMoeda := '';
  sFiltroTipo := '';
  sFiltroPeriodicidade := '';
  sFiltroPeriodo := '';
end;

procedure TfrmConsVariacaoIndice.cdsDadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  btnImprime.Enabled := True;
end;

procedure TfrmConsVariacaoIndice.cdsDadosAfterClose(DataSet: TDataSet);
begin
  inherited;
  btnImprime.Enabled := False;
end;

procedure TfrmConsVariacaoIndice.dbgrdDadosUpdateFooter(Sender: TObject);
begin
  inherited;
  dbgrdDados.Columns[5].FooterValue := sTotalAcumulado;
end;

procedure TfrmConsVariacaoIndice.btnImprimeClick(Sender: TObject);
begin
  inherited;
  cdsReport.Close;
  
  cdsReport.Data := cdsDados.Data;

  pplblMoeda.Caption         := sFiltroMoeda;
  pplblTipo.Caption          := sFiltroTipo;
  pplblPeriodicidade.Caption := sFiltroPeriodicidade;
  pplblPeriodo.Caption       := sFiltroPeriodo;
  pplblAcumulado.Caption     := sTotalAcumulado;

  pplblSistema.Caption := Sistema.NomeModulo;
  pplblEmpresa.Caption := Sistema.NomeEmpresa;

  TfrmPreview.CreateModalPreview( Application, rptReport, 'Relatório' );
end;

procedure TfrmConsVariacaoIndice.ppAlternadoPrint(Sender: TObject);
begin
  inherited;
  if ( cdsReport.RecNo mod 2 ) = 0 then
    ppAlternado.Brush.Color := $00E4E4E4
  else
    ppAlternado.Brush.Color := clWhite;
end;

procedure TfrmConsVariacaoIndice.dbgrdDadosTopRowChanged(Sender: TObject);
begin
  inherited;
  TwwDBGrid(Sender).Invalidate;
end;

procedure TfrmConsVariacaoIndice.GridZebrado(Sender: TObject;
                           Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
const clYellowBaby = $00C0FFFF; //Amarelo Bebê
begin
  // Se a celula pintada não pertencer a uma coluna Fixada
  if not (gdFixed in State) then
  begin
     // Se a celula pintada for a linha ativa
     if TwwDBGrid(Sender).CalcCellRow = TwwDBGrid(Sender).GetActiveRow then
     begin
        // Se a celula pintada não estiver selecionada nem focada
        if not ((gdSelected in State) or (gdFocused in State)) then
        begin
           // Se o DataSet não estiver vazio e existir o campo IDINC
           if (not TwwDBGrid(Sender).DataSource.DataSet.IsEmpty) and
              (Field.DataSet.FindField('IDINC') <> nil) then
           begin
              // Se o campo tiver vazio (Saldo incompleto)
              if Field.DataSet.FindField('IDINC').AsInteger = 0 then
                 AFont.Color := $00C0FFFF //cCorZebra
              else
              begin
                 // Zebrado normal
                 if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                    AFont.Color := clYellowBaby
                 else
                    AFont.Color := clHighLightText;
              end;
           end
           else
           begin
              // Zebrado normal
              if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                 AFont.Color := clYellowBaby
              else
                 AFont.Color := clHighLightText;
           end;
        end
        else
           AFont.Color := clWhite;
           
        ABrush.Color := clHighLight;
     end
     // Se a celula pintada não for da linha ativa
     else
     // Se a celula pintada não estiver selecionada nem focada
     if not ((gdSelected in State) or (gdFocused in State)) then
     begin
        // Se o DataSet não estiver vazio e existir o campo IDINC
        if (not TwwDBGrid(Sender).DataSource.DataSet.IsEmpty) and
           (Field.DataSet.FindField('IDINC') <> nil) then
        begin
           // Se o campo tiver vazio (Saldo incompleto)
           if Field.DataSet.FindField('IDINC').AsInteger = 0 then
           begin
              // Fundo Cereja e Fonte Branca
              ABrush.Color := $00C0FFFF;//cCorZebra;
              AFont.Color := clWhite;
           end
           else
           begin
              // Zebrado normal
              if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
                 ABrush.Color := clYellowBaby
              else
                 ABrush.Color := clWhite;
           end;
        end
        else
        begin
           // Zebrado normal
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := clYellowBaby
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

procedure TfrmConsVariacaoIndice.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  // SOL 148922/8841 - Jonas
  if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230030)
      end;

end;

procedure TfrmConsVariacaoIndice.ppLabel5GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := 'Últimos '+ cdsMoeda.FieldByName('MESESFATOR').AsString + ' Meses'    // SIG 116924 Ferrari
end;

procedure TfrmConsVariacaoIndice.ppLabel12GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := 'Últimos '+ cdsMoeda.FieldByName('MESESFATOR').AsString + ' Meses'    // SIG 116924 Ferrari

end;

end.
