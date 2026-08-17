//*******************************************************************************
// Data     : 27/09/2004
// Código   : AL_1
// Descrição: Implementacao da combo CbxAplic e DbDtRefAplc
//*******************************************************************************

unit FConsSaldosRFGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel,
  TeEngine, Series, TeeProcs, Chart, DBChart, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, Db, DBTables, Wwquery, Wwdatsrc, mxgraph, mxDB, mxstore,
  mxtables, FPreview;

type
  TfrmConsSaldosRFGrp = class(TfrmOkCancelarInv)
    pnlFiltros: TPanel;
    Label1: TLabel;
    dtDataRef: TCMDateTimePicker;
    rdgPosicao: TRadioGroup;
    pgcGeral: TPageControl;
    tbsGrid: TTabSheet;
    tbsClasse: TTabSheet;
    tbsPlano: TTabSheet;
    tbsRisco: TTabSheet;
    pgcGruposGrid: TPageControl;
    tbsPlanoGrid: TTabSheet;
    dbgPlano: TwwDBGrid;
    tbsClasseGrid: TTabSheet;
    dbgClasse: TwwDBGrid;
    pgcPlanoGraficos: TPageControl;
    tbsPlanoBarras: TTabSheet;
    tbsPlanoPizza: TTabSheet;
    degPlanoPizza: TDecisionGraph;
    PieSeries1: TPieSeries;
    PieSeries2: TPieSeries;
    degPlanoBarra: TDecisionGraph;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    pgcClasseGraficos: TPageControl;
    tbsClasseBarra: TTabSheet;
    tbsClassePizza: TTabSheet;
    degClasseBarra: TDecisionGraph;
    Series1: TBarSeries;
    Series2: TBarSeries;
    degClassePizza: TDecisionGraph;
    BarSeries1: TPieSeries;
    PieSeries3: TPieSeries;
    tbsRiscoGrig: TTabSheet;
    dbgRisco: TwwDBGrid;
    pgcRiscoGraficos: TPageControl;
    tbsRiscoBarra: TTabSheet;
    tbsRiscoPizza: TTabSheet;
    degRiscoBarra: TDecisionGraph;
    BarSeries4: TBarSeries;
    BarSeries5: TBarSeries;
    degRiscoPizza: TDecisionGraph;
    PieSeries4: TPieSeries;
    PieSeries5: TPieSeries;
    tbsEmissor: TTabSheet;
    pgcEmissorGraficos: TPageControl;
    tbsEmissorBarra: TTabSheet;
    tbsEmissorPizza: TTabSheet;
    tbsEmissorGrid: TTabSheet;
    dbgEmissor: TwwDBGrid;
    degEmissorBarra: TDecisionGraph;
    BarSeries6: TBarSeries;
    BarSeries7: TBarSeries;
    degEmissorPizza: TDecisionGraph;
    PieSeries6: TPieSeries;
    PieSeries7: TPieSeries;
    ToolbarSep972: TToolbarSep97;
    bbtnImprimir: TBitBtn;
    CbxAplic: TComboBox;
    lblOpcao: TLabel;
    DbDtRefAplc: TCMDateTimePicker;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure CbxAplicExit(Sender: TObject);
  private
    { Private declarations }
    procedure AbreQry(sData: String);
    procedure FechaQry;
    function Tipo(iItem: Integer): String;
  public
    { Public declarations }
  end;

var
  frmConsSaldosRFGrp: TfrmConsSaldosRFGrp;

implementation

uses FDmRelSaldosRFGrp, UOperComum, UBibliotecaInvest, UMensErro;

{$R *.DFM}

function TfrmConsSaldosRFGrp.Tipo(iItem: Integer): String;
begin
   Result := '';
   if iItem = 0 then Result := 'ATU';
end;

procedure TfrmConsSaldosRFGrp.AbreQry(sData: String);
begin
   if Trim(sData) = '' then
   begin
      MsgDlg('Falta Data Referência para o Relatório.','Mensagem do Sistema ',mtWarning,[mbOK],0);
      if dtDataRef.CanFocus then
         dtDataRef.SetFocus;
      exit;
   end;
   //AL_1
   if ((CbxAplic.ItemIndex > 0) And (DbDtRefAplc.Text = '')) Then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);

   with DmRelSaldosRFGrp, OperComum do
   begin
      LimpaParametros(qryPlano);
      LimpaParametros(qryClasse);
      LimpaParametros(qryRisco);
      LimpaParametros(qryEmissor);

      LimpaParametros(deqPlano);
      LimpaParametros(deqClasse);
      LimpaParametros(deqRisco);
      LimpaParametros(deqEmissor);

      LimpaParametros(qrySaldosRFGrupo);

      qryPlano.ParamByName('DATA').AsString   := sData;
      qryClasse.ParamByName('DATA').AsString  := sData;
      qryRisco.ParamByName('DATA').AsString   := sData;
      qryEmissor.ParamByName('DATA').AsString := sData;
      qrySaldosRFGrupo.ParamByName('DATA').AsString := sData;

      deqPlano.ParamByName('DATA').AsString   := sData;
      deqClasse.ParamByName('DATA').AsString  := sData;
      deqRisco.ParamByName('DATA').AsString   := sData;
      deqEmissor.ParamByName('DATA').AsString := sData;

      if rdgPosicao.ItemIndex = 0 then
      begin
         qryPlano.ParamByName('TIPMOV').AsString   := 'ATU';
         qryClasse.ParamByName('TIPMOV').AsString  := 'ATU';
         qryRisco.ParamByName('TIPMOV').AsString   := 'ATU';
         qryEmissor.ParamByName('TIPMOV').AsString := 'ATU';
         qrySaldosRFGrupo.ParamByName('TIPMOV').AsString := 'ATU';

         deqPlano.ParamByName('TIPMOV').AsString   := 'ATU';
         deqClasse.ParamByName('TIPMOV').AsString  := 'ATU';
         deqRisco.ParamByName('TIPMOV').AsString   := 'ATU';
         deqEmissor.ParamByName('TIPMOV').AsString := 'ATU';
      end;

      //AL_1
      if Trim(DbDtRefAplc.Text) <> '' then
      begin
         if CbxAplic.ItemIndex = 1 Then
         begin
            qryPlano.ParamByName('DATAOPERACAO').AsString         := DbDtRefAplc.Text;
            qryClasse.ParamByName('DATAOPERACAO').AsString        := DbDtRefAplc.Text;
            qryRisco.ParamByName('DATAOPERACAO').AsString         := DbDtRefAplc.Text;
            qryEmissor.ParamByName('DATAOPERACAO').AsString       := DbDtRefAplc.Text;
            qrySaldosRFGrupo.ParamByName('DATAOPERACAO').AsString := DbDtRefAplc.Text;

            qryPlano.ParamByName('TIPOMENOR').AsInteger           := CbxAplic.ItemIndex;
            qryClasse.ParamByName('TIPOMENOR').AsInteger          := CbxAplic.ItemIndex;
            qryRisco.ParamByName('TIPOMENOR').AsInteger           := CbxAplic.ItemIndex;
            qryEmissor.ParamByName('TIPOMENOR').AsInteger         := CbxAplic.ItemIndex;
            qrySaldosRFGrupo.ParamByName('TIPOMENOR').AsInteger   := CbxAplic.ItemIndex;
         end
         else if CbxAplic.ItemIndex = 2 then
         begin
            qryPlano.ParamByName('DATAOPERACAO').AsString         := DbDtRefAplc.Text;
            qryClasse.ParamByName('DATAOPERACAO').AsString        := DbDtRefAplc.Text;
            qryRisco.ParamByName('DATAOPERACAO').AsString         := DbDtRefAplc.Text;
            qryEmissor.ParamByName('DATAOPERACAO').AsString       := DbDtRefAplc.Text;
            qrySaldosRFGrupo.ParamByName('DATAOPERACAO').AsString := DbDtRefAplc.Text;

            qryPlano.ParamByName('TIPOMAIOR').AsInteger           := CbxAplic.ItemIndex;
            qryClasse.ParamByName('TIPOMAIOR').AsInteger          := CbxAplic.ItemIndex;
            qryRisco.ParamByName('TIPOMAIOR').AsInteger           := CbxAplic.ItemIndex;
            qryEmissor.ParamByName('TIPOMAIOR').AsInteger         := CbxAplic.ItemIndex;
            qrySaldosRFGrupo.ParamByName('TIPOMAIOR').AsInteger   := CbxAplic.ItemIndex;
         end;
      end;

      qryPlano.Open;
      qryClasse.Open;
      qryRisco.Open;
      qryEmissor.Open;
      qrySaldosRFGrupo.Open;

      // Somente para não exibir erro caso a consulta retorne vazia ou com um registro
      try
         deqPlano.Open;
      except
      end;
      try
         deqClasse.Open;
      except
      end;
      try
         deqRisco.Open;
      except
      end;
      try
         deqEmissor.Open;
      except
      end;

      if qrySaldosRFGrupo.IsEmpty then
         bbtnImprimir.Enabled := False
      else
         bbtnImprimir.Enabled := True;

   end;
end;

procedure TfrmConsSaldosRFGrp.FechaQry;
begin
   with DmRelSaldosRFGrp, OperComum do
   begin
      LimpaParametros(qryPlano);
      LimpaParametros(qryClasse);
      LimpaParametros(qryRisco);
      LimpaParametros(qryEmissor);

      LimpaParametros(deqPlano);
      LimpaParametros(deqClasse);
      LimpaParametros(deqRisco);
      LimpaParametros(deqEmissor);

      LimpaParametros(qryGrupos);

   end;
end;

procedure TfrmConsSaldosRFGrp.FormShow(Sender: TObject);
begin
   inherited;
   pgcGeral.ActivePage := tbsGrid;
   pgcGruposGrid.ActivePage := tbsPlanoGrid;
   pgcPlanoGraficos.ActivePage := tbsPlanoBarras;
   pgcClasseGraficos.ActivePage := tbsClasseBarra;
   pgcRiscoGraficos.ActivePage := tbsRiscoBarra;
   pgcEmissorGraficos.ActivePage := tbsEmissorBarra;
   dtDataRef.Text := DateToStr(pRPI.DATAULTFECHRF);
   dtDataRef.DateTime := pRPI.DATAULTFECHRF;
   AbreQry(dtDataRef.Text);
   //AL_1
   CbxAplic.ItemIndex := 0;
   CbxAplic.Text := 'Todas';
   DbDtRefAplc.Text  := '';
end;

procedure TfrmConsSaldosRFGrp.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   FechaQry;
end;

procedure TfrmConsSaldosRFGrp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbreQry(dtDataRef.Text);
end;

procedure TfrmConsSaldosRFGrp.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState      := wsMaximized;
end;

procedure TfrmConsSaldosRFGrp.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with OperComum, DmRelSaldosRFGrp do
  begin
     try
        lblDataRef.Caption := dtDataRef.Text;
        qryGrupos.DisableControls;
        qryPlano.DisableControls;
        qryClasse.DisableControls;
        qryRisco.DisableControls;
        qryEmissor.DisableControls;

        if not qrySaldosRFGrupo.Active then
           qrySaldosRFGrupo.Open;
        if not qryGrupos.Active then
           qryGrupos.Open;
        if not qryPlano.Active then
           qryPlano.Open;
        if not qryClasse.Active then
           qryClasse.Open;
        if not qryRisco.Active then
           qryRisco.Open;
        if not qryEmissor.Active then
           qryEmissor.Open;

        TfrmPreview.CreateModalPreview(Application,
                                       rptSaldosRFGrupo,
                                       rptSaldosRFGrupo.PrinterSetup.DocumentName);

     finally
        qryGrupos.EnableControls;
        qryPlano.EnableControls;
        qryClasse.EnableControls;
        qryRisco.EnableControls;
        qryEmissor.EnableControls;
     end;
  end;
end;

//AL_1
procedure TfrmConsSaldosRFGrp.CbxAplicExit(Sender: TObject);
begin
  inherited;
   If CbxAplic.ItemIndex = 0 then
      DbDtRefAplc.Clear;

   If (DbDtRefAplc.Text  = '') And (CbxAplic.ItemIndex > 0) then
      DbDtRefAplc.Text  := DateToStr(pRPI.DTMUDACPMF);
end;

end.
