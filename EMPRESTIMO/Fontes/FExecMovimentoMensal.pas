unit FExecMovimentoMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMTEP, StdCtrls, dxCntner, dxExEdtr, dxEdLib, dxDBTLCl, dxGrClms,
  dxTL, dxDBCtrl, dxDBGrid, Db, Provider, DBClient, Menus, DBTables,
  Wwquery, Mask, wwdbedit, Wwdbspin, mListaPlanoContab, mListaPatro,
  wwdblook, mContratoEmptmo, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, dxGridMenus, ExtCtrls, uTypesEmptmo;

type
  TSaveMethod = procedure (const FileName: String; ASaveAll: Boolean) of object;

  TfrmExecMovimentoMensal = class(TfrmWizardMTEP)
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlanoContab;
      Panel2: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      qryQuitacaoMorte: TwwQuery;
      qryQuitacaoMorteHMEVLRPREVISTO: TFloatField;
      qryQuitacaoMorteVLR_CONTAB: TFloatField;
      qryQuitacaoMorteVLR_ESTORNADO_CONTAB: TFloatField;
      qryQuitacao: TwwQuery;
      qryQuitacaoHMEVLRPREVISTO: TFloatField;
      qryQuitacaoVLR_CONTAB: TFloatField;
      qryQuitacaoVLR_ESTORNADO_CONTAB: TFloatField;
      qryMovimentoNormal: TwwQuery;
      qryMovimentoNormalHMEVLRPREVISTO: TFloatField;
      qryMovimentoNormalVLR_CONTAB: TFloatField;
      qryMovimentoNormalVLR_ESTORNADO_CONTAB: TFloatField;
      qryContrato: TwwQuery;
      qryLookTipoContr: TwwQuery;
      qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryLookTipoContrTCEDESCRICAO: TStringField;
      qryLookTipoContrIDTIPOEMPTMO: TFloatField;
      qryLookTipoContrDESCTIPOEMPTMO: TStringField;
      qryLookTipoContrIDPLANOPREV: TFloatField;
      dxCheckEditStyleController: TdxCheckEditStyleController;
      SaveDialog: TSaveDialog;
      pmDetail: TPopupMenu;
      piDelete: TMenuItem;
      MainMenu1: TMainMenu;
      miEdit: TMenuItem;
      miDelete: TMenuItem;
      cds: TClientDataSet;
      dsp: TDataSetProvider;
      qry: TQuery;
      ds: TDataSource;
      Panel3: TPanel;
      Panel4: TPanel;
      Label3: TLabel;
      cbSaveAll: TdxCheckEdit;
      cbLoadAllRecords: TdxCheckEdit;
      cbMultiSelect: TdxCheckEdit;
      cbShowFooter: TdxCheckEdit;
      cbShowHeader: TdxCheckEdit;
      cbShowGrid: TdxCheckEdit;
      edtSeparador: TEdit;
      btnHtml: TBitBtn;
      btnExcel: TBitBtn;
      btnXml: TBitBtn;
      btnTxt: TBitBtn;
    qryContratoIDCONTRATOEMPTMO: TFloatField;
    qryContratoMATRICULA: TStringField;
    qryContratoNOME: TStringField;
    qryContratoNOMEPLANO: TStringField;
    qryContratoNOMEPATRO: TStringField;
    qryContratoSIT_PART: TStringField;
    qryContratoDESCSITCONTRATO: TStringField;
    qryContratoTCEDESCRICAO: TStringField;
    qryContratoDATACREDITO: TDateTimeField;
    qryContratoTXJUROS: TFloatField;
    qryMovimentoNormalHMEVLRPREVCENTR: TFloatField;
    cdsCONTRATO: TFloatField;
    cdsMATRICULA: TStringField;
    cdsNOME: TStringField;
    cdsPLANO: TStringField;
    cdsPATROCINADORA: TStringField;
    cdsSITUACAO_PARTIC: TStringField;
    cdsSITUACAO_CONTRATO: TStringField;
    cdsTIPOCONTRATO: TStringField;
    cdsDATACREDITO: TDateTimeField;
    cdsTXJUROS: TFloatField;
    cdsPRESTACAOCONTR: TFloatField;
    cdsSALDODEVANT: TFloatField;
    cdsQTDPRESTANT: TFloatField;
    cdsVLRPRESTACAO: TFloatField;
    cdsATUALPRESTATRASO: TFloatField;
    cdsJUROSREMATRASO: TFloatField;
    cdsJUROSMORAATRASO: TFloatField;
    cdsMULTAPRESTATRASO: TFloatField;
    cdsDEVOLUCAOPREST: TFloatField;
    cdsAJUSTEPREST: TFloatField;
    cdsIOF: TFloatField;
    cdsSEGURO: TFloatField;
    cdsATUALMONSALDODEV: TFloatField;
    cdsJUROSREMSALDODEV: TFloatField;
    cdsAJUSTESALDODEV: TFloatField;
    cdsAMORTIZSALDODEV: TFloatField;
    cdsQUITACAONORMAL: TFloatField;
    cdsQUITACAORENOVA: TFloatField;
    cdsSALDODEVATU: TFloatField;
    cdsPRESTDEVIDAS: TFloatField;
    cdsSALDOINADIMPL: TFloatField;
    cdsPRESTATRASATU: TFloatField;
    cdsVLRINADIMPLATU: TFloatField;
    cdsQTDDIASATRASO: TFloatField;
    cdsPRECENTPROVISAO: TFloatField;
    cdsSALDOPROVISAO: TFloatField;
    cdsLIMINAR: TStringField;
    cdsTIPOSUSPENSAO: TStringField;
    cdsQTDPRESTSUSP: TFloatField;
    dxDBGrid: TdxDBGrid;
    dxDBGridCONTRATO: TdxDBGridMaskColumn;
    dxDBGridMATRICULA: TdxDBGridMaskColumn;
    dxDBGridNOME: TdxDBGridMaskColumn;
    dxDBGridPLANO: TdxDBGridMaskColumn;
    dxDBGridPATROCINADORA: TdxDBGridMaskColumn;
    dxDBGridSITUACAO_PARTIC: TdxDBGridMaskColumn;
    dxDBGridSITUACAO_CONTRATO: TdxDBGridMaskColumn;
    dxDBGridTIPOCONTRATO: TdxDBGridMaskColumn;
    dxDBGridDATACREDITO: TdxDBGridDateColumn;
    dxDBGridTXJUROS: TdxDBGridMaskColumn;
    dxDBGridPRESTACAOCONTR: TdxDBGridMaskColumn;
    dxDBGridSALDODEVANT: TdxDBGridMaskColumn;
    dxDBGridQTDPRESTANT: TdxDBGridMaskColumn;
    dxDBGridVLRPRESTACAO: TdxDBGridMaskColumn;
    dxDBGridATUALPRESTATRASO: TdxDBGridMaskColumn;
    dxDBGridJUROSREMATRASO: TdxDBGridMaskColumn;
    dxDBGridJUROSMORAATRASO: TdxDBGridMaskColumn;
    dxDBGridMULTAPRESTATRASO: TdxDBGridMaskColumn;
    dxDBGridDEVOLUCAOPREST: TdxDBGridMaskColumn;
    dxDBGridAJUSTEPREST: TdxDBGridMaskColumn;
    dxDBGridIOF: TdxDBGridMaskColumn;
    dxDBGridSEGURO: TdxDBGridMaskColumn;
    dxDBGridATUALMONSALDODEV: TdxDBGridMaskColumn;
    dxDBGridJUROSREMSALDODEV: TdxDBGridMaskColumn;
    dxDBGridAJUSTESALDODEV: TdxDBGridMaskColumn;
    dxDBGridAMORTIZSALDODEV: TdxDBGridMaskColumn;
    dxDBGridQUITACAONORMAL: TdxDBGridMaskColumn;
    dxDBGridQUITACAORENOVA: TdxDBGridMaskColumn;
    dxDBGridSALDODEVATU: TdxDBGridMaskColumn;
    dxDBGridPRESTDEVIDAS: TdxDBGridMaskColumn;
    dxDBGridSALDOINADIMPL: TdxDBGridMaskColumn;
    dxDBGridPRESTATRASATU: TdxDBGridMaskColumn;
    dxDBGridVLRINADIMPLATU: TdxDBGridMaskColumn;
    dxDBGridQTDDIASATRASO: TdxDBGridMaskColumn;
    dxDBGridPRECENTPROVISAO: TdxDBGridMaskColumn;
    dxDBGridSALDOPROVISAO: TdxDBGridMaskColumn;
    dxDBGridLIMINAR: TdxDBGridMaskColumn;
    dxDBGridTIPOSUSPENSAO: TdxDBGridMaskColumn;
    dxDBGridQTDPRESTSUSP: TdxDBGridMaskColumn;
      procedure FormCreate(Sender: TObject);
      procedure btnHtmlClick(Sender: TObject);
      procedure btnExcelClick(Sender: TObject);
      procedure btnXmlClick(Sender: TObject);
      procedure btnTxtClick(Sender: TObject);
      procedure dxDBGridMouseUp(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
      procedure dxDBGridSelectedCountChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoEmptmoExit(Sender: TObject);
    procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
    procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
    procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
  private
    { Private declarations }
      procedure Save(ADefaultExt, AFilter, AFileName: String; AMethod: TSaveMethod);
      procedure AbreQueries;

      procedure MontaQuery; 
      procedure FiltraRelatorioAtuDia;

  public
    { Public declarations }
  end;

var
  frmExecMovimentoMensal: TfrmExecMovimentoMensal;

implementation

{$R *.DFM}

uses
   dLookEmptmo, uDiasUteis, uMensErro, uSistema, uFuncoesEmptmo, dEmptmo, uCalcEmptmo, FProgresso, FProgressoDuplo;

procedure TfrmExecMovimentoMensal.FormCreate(Sender: TObject);
begin
   inherited;
   SaveDialog.InitialDir := ExtractFilePath(Application.ExeName);
end;



procedure TfrmExecMovimentoMensal.Save(ADefaultExt, AFilter, AFileName: String; AMethod: TSaveMethod);
begin
   with SaveDialog do
   begin
      DefaultExt := ADefaultExt;
      Filter := AFilter;
      FileName := AFileName;
      if Execute then
        AMethod(FileName, cbSaveAll.Checked);
   end;
end;



procedure TfrmExecMovimentoMensal.btnHtmlClick(Sender: TObject);
begin
   inherited;
   Save('htm', 'Arquivo HTML (*.htm; *.html)|*.htm', 'EP-MovimMensal.htm', dxDBGrid.SaveToHTML);
end;



procedure TfrmExecMovimentoMensal.btnExcelClick(Sender: TObject);
begin
   inherited;
   Save('xls', 'Planilha do Microsoft Excel (*.xls)|*.xls', 'EP-MovimMensal.xls', dxDBGrid.SaveToXLS);
end;




procedure TfrmExecMovimentoMensal.btnXmlClick(Sender: TObject);
begin
   inherited;
   Save('xml', 'Arquivo XML (*.xml)|*.xml', 'EP-MovimMensal.xml', dxDBGrid.SaveToXML);
end;



procedure TfrmExecMovimentoMensal.btnTxtClick(Sender: TObject);
begin
   inherited;
   with SaveDialog do
   begin
      DefaultExt := 'txt';
      Filter := 'Arquivo Texto (*.txt)|*.txt';
      FileName := 'EP-MovimMensal.txt';
      if Execute then
         dxDBGrid.SaveToText(FileName, True, edtSeparador.Text,'','');
   end;
end;



procedure TfrmExecMovimentoMensal.dxDBGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   p : TPoint;
begin
   if Button <> mbRight then exit;

   if TdxDBGridPopupMenuManager.Instance.ShowGridPopupMenu(TdxDBGrid(Sender)) then
     exit;

   if not(TdxDBGrid(Sender).GetHitTestInfoAt(X, Y) in [htColumn, htColumnEdge, htSummaryFooter, htSummaryNodeFooter, htGroupPanel])
   and PtInRect(ClientRect, Point(X, Y)) then
   begin
     dxDBGridSelectedCountChange(nil); // update items
     p := dxDBGrid.ClientToScreen(Point(X, Y));
     pmDetail.Popup(p.X, p.Y);
   end
end;



procedure TfrmExecMovimentoMensal.dxDBGridSelectedCountChange(Sender: TObject);
begin
   inherited;
   miDelete.Enabled := (dxDBGrid.SelectedCount > 0);
   piDelete.Enabled := miDelete.Enabled;
end;



procedure TfrmExecMovimentoMensal.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TfrmExecMovimentoMensal.MontaQuery;
begin
   inherited;

   ParametrosSistema;

   FiltraRelatorioAtuDia;
end;



procedure TfrmExecMovimentoMensal.FiltraRelatorioAtuDia;
var
   iPatro            : Integer;
   iPlano            : Integer;
   iTipoContr        : Integer;

   iContadorCima     : Integer;
   iContadorBaixo    : Integer;

   iContadorPlano    : Integer;
   iContadorPatro    : Integer;

   iQuantTipoContr   : Integer;
   iTotalPxPxTC      : Integer;

   rSaldoDevAnt      : TSaldoDevAnt;
   rSaldoDevAtu      : TSaldoDevAnt;

   dDataAnt          : TDateTime;
   dDataAtu          : TDateTime;

   fVlrConcessao     : Currency;
   fVlrAmortizacao   : Currency;
   fVlrAtuDia        : Currency;
   fVlrAjuste        : Currency;
   fVlrQuitacao      : Currency;
   fVlrQuitacaoMorte : Currency;
   fVlrParcela       : Currency;
begin
   dDataAtu := DiasUteis.UltDiaMes(trunc(DBspnAno.Value), (cboMes.ItemIndex + 1));

   dDataAnt := EncodeDate(Trunc(DBspnAno.Value), (cboMes.ItemIndex + 1), 1);
   dDataAnt := DiasUteis.SomaMeses(dDataAnt, -1);
   dDataAnt := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataAnt), DiasUteis.ExtraiMes(dDataAnt));

   with qryLookTipoContr do
   begin
      LimpaParametros(qryLookTipoContr);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   iQuantTipoContr   := qryLookTipoContr.RecordCount;
   iTotalPxPxTC      := molListaPlano.lstPlano.Items.Count *
                        molListaPatro.lstPatro.Items.Count *
                        iQuantTipoContr;

   // ----------------------------------------------------------------------------------------------
   cds.Close;
   cds.Open;
   // ----------------------------------------------------------------------------------------------

   try
      // ----------------------------------------------------------------------------------------------
      // Faz TRÊS loops aninhados: por Plano, por Patro e por Tipo de Contrato
      // ----------------------------------------------------------------------------------------------
      frmProgressoDuplo.MostraFormProgressoDuplo('Processando Plano, Patrocinadora, Tipo de Contrato...',   // Legenda de cima
                                                 'Processando Contratos...',                                // Legenda de Baixo
                                                 0,                        // Mínimo de cima
                                                 0,                        // Mínimo de baixo
                                                 iTotalPxPxTC,             // Máximo de cima
                                                 0,                        // Máximo de baixo
                                                 True,                     // Botão visível
                                                 True                      // Botão habilitado
                                                );
      Repaint;

      iContadorCima  := 0;

      // -------------------------------------------------------------------------------------------
      // Loops por Plano, Patro e Tipo de Contrato
      // -------------------------------------------------------------------------------------------
      for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
      begin
         if molListaPlano.lstPlano.Checked[iContadorPlano] then
         begin
            // -------------------------------------------------------------------------------------
            for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
            begin
               // ----------------------------------------------------------------------------------
               if molListaPatro.lstPatro.Checked[iContadorPatro] then
               begin
                  qryLookTipoContr.First;
                  while not(qryLookTipoContr.EOF) do
                  begin
                     // ----------------------------------------------------------------------------
                     if frmProgressoDuplo.Cancelou then
                     begin
                        Repaint;
                        Application.ProcessMessages;

                        // Verifica se abortou processo
                        if MsgDlg('Deseja realmente interromper o processamento?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        begin
                           Repaint;

                           Exit;
                        end;
                        Repaint;
                     end;
                     Repaint;

                     // ----------------------------------------------------------------------------

                     if molContratoEmptmo.IDContrato > 0 then
                     begin
                        if molContratoEmptmo.IDTipoContr <> qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger then
                        begin
                           qryLookTipoContr.Next;
                           inc(iContadorCima);
                           frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                           Continue;
                        end;
                     end;

                     // ----------------------------------------------------------------------------

                     if (DBcboTipoContrato.LookupValue <> '') and
                        (qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger <> StrToInt(DBcboTipoContrato.LookupValue)) then
                     begin
                        qryLookTipoContr.Next;
                        inc(iContadorCima);
                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                        Continue;
                     end;

                     // ----------------------------------------------------------------------------

                     if not(qryLookTipoContrIDPLANOPREV.IsNULL) and
                        (qryLookTipoContrIDPLANOPREV.AsInteger <> molListaPlano.vIDPlano[iContadorPlano]) then
                     begin
                        qryLookTipoContr.Next;
                        inc(iContadorCima);
                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
                        Continue;
                     end;

                     // ----------------------------------------------------------------------------

                     with qryContrato do
                     begin
                        LimpaParametros(qryContrato);
                        ParamByName('PIDEMPRESAPROP').AsInteger         := Sistema.IDEmpresa;
                        ParamByName('PIDPATRO').AsInteger               := molListaPatro.vIDPatro[iContadorPatro];
                        ParamByName('IDPLANOPREV').AsInteger            := molListaPlano.vIDPlano[iContadorPlano];
                        ParamByName('PIDTIPOCONTREMPTMO').AsInteger     := qryLookTipoContrIDTIPOCONTREMPTMO.AsInteger;

                        ParamByName('PHMEDATAINI').AsDateTime           := dDataAnt;
                        ParamByName('PHMEDATAFIM').AsDateTime           := dDataAtu;

                        if DBcboTipoEmptmo.LookupValue <> '' then
                           ParamByName('PIDTIPOEMPTMO').AsInteger  := StrToInt(DBcboTipoEmptmo.LookupValue);

                        if DBcboTipoContrato.LookupValue <> '' then
                           ParamByName('PIDTIPOCONTRFILTRO').AsInteger  := StrToInt(DBcboTipoContrato.LookupValue);

                        if molContratoEmptmo.IDContrato > 0 then
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat     := molContratoEmptmo.IDContrato;

                        qryContrato.Open;
                     end;
                     // -------------------------------------------------------------------------------

                     frmProgressoDuplo.MostraFormProgressoDuplo('Processando ' +
                                                                molListaPlano.lstPlano.Items[iContadorPlano] + ', ' +
                                                                molListaPatro.lstPatro.Items[iContadorPatro] + ', ' +
                                                                qryLookTipoContrTCEDESCRICAO.AsString + '...',       // Legenda de cima
                                                                'Processando Contratos...',  // Legenda de Baixo
                                                                0,                           // Mínimo de cima
                                                                0,                           // Mínimo de baixo
                                                                iTotalPxPxTC,                // Máximo de cima
                                                                qryContrato.RecordCount,     // Máximo de baixo
                                                                True,                        // Botão visível
                                                                True                         // Botão habilitado
                                                               );
                     Repaint;

                     iContadorBaixo := 0;

                     // ----------------------------------------------------------------------------
                     while not(qryContrato.EOF) do
                     begin
                        // -------------------------------------------------------------------------
                        if frmProgressoDuplo.Cancelou then
                        begin
                           Repaint;
                           Application.ProcessMessages;

                           // Verifica se abortou processo
                           if MsgDlg('Deseja realmente interromper o processamento?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                           begin
                              Repaint;

                              Exit;
                           end;
                           Repaint;
                        end;
                        Repaint;
                        // -------------------------------------------------------------------------

                        // Saldo Devedor -----------------------------------------------------------
                        rSaldoDevAnt   := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                                 dDataAnt,
                                                                 -1,
                                                                 -1,
                                                                 False
                                                                );
                        // -------------------------------------------------------------------------

                        // Saldo Devedor -----------------------------------------------------------
                        rSaldoDevAtu   := CalcEmptmo.SaldoDevAnt(qryContratoIDCONTRATOEMPTMO.AsFloat,
                                                                 dDataAtu,
                                                                 -1,
                                                                 -1,
                                                                 False
                                                                );
                        // -------------------------------------------------------------------------

                        // Atualizacao Diária ------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 5;

                           Open;
                           fVlrAtuDia        := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Ajustes -----------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 8;

                           Open;
                           fVlrAjuste        := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Quitacao ----------------------------------------------------------------
                        with qryQuitacao do
                        begin
                           LimpaParametros(qryQuitacao);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                           fVlrQuitacao      := qryQuitacaoHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Quitacao ----------------------------------------------------------------
                        with qryQuitacaoMorte do
                        begin
                           LimpaParametros(qryQuitacaoMorte);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;

                           Open;
                           fVlrQuitacaoMorte := qryQuitacaoMorteHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------
                        // Amortização -------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 2;

                           Open;
                           fVlrAmortizacao   := qryMovimentoNormalHMEVLRPREVISTO.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        // Parcelas ----------------------------------------------------------------
                        with qryMovimentoNormal do
                        begin
                           LimpaParametros(qryMovimentoNormal);
                           ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryContratoIDCONTRATOEMPTMO.AsFloat;
                           ParamByName('PHMEDATAINI').AsDateTime     := dDataAnt + 1;
                           ParamByName('PHMEDATAFIM').AsDateTime     := dDataAtu;
                           ParamByName('PHMETIPOMOV').AsInteger      := 1;
                           Open;
                           fVlrParcela       := qryMovimentoNormalHMEVLRPREVCENTR.AsCurrency;
                           Close;
                        end;
                        // -------------------------------------------------------------------------

                        cds.Append;

                        // Coluna A
                        cdsCONTRATO.AsFloat                 := qryContratoIDCONTRATOEMPTMO.AsFloat;
                        // Coluna B
                        cdsMATRICULA.AsString               := qryContratoMATRICULA.AsString;
                        // Coluna C
                        cdsNOME.AsString                    := qryContratoNOME.AsString;
                        // Coluna D
                        cdsPLANO.AsString                   := qryContratoNOMEPLANO.AsString;
                        // Coluna E
                        cdsPATROCINADORA.AsString           := qryContratoNOMEPATRO.AsString;
                        // Coluna F
                        cdsSITUACAO_PARTIC.AsString         := qryContratoSIT_PART.AsString;
                        // Coluna G
                        cdsSITUACAO_CONTRATO.AsString       := qryContratoDESCSITCONTRATO.AsString;
                        // Coluna H
                        cdsTIPOCONTRATO.AsString            := qryContratoTCEDESCRICAO.AsString;
                        // Coluna I
                        cdsDATACREDITO.AsDateTime           := qryContratoDATACREDITO.AsDateTime;
                        // Coluna J
                        cdsTXJUROS.AsFloat                  := qryContratoTXJUROS.AsFloat;
                        // Coluna K
                        cdsPRESTACAOCONTR.AsInteger         := rSaldoDevAtu.iParcelaAltAnt;
                        // Coluna L
                        cdsSALDODEVANT.AsCurrency           := rSaldoDevAnt.fSaldoDevAnt;
                        // Coluna M
                        cdsQTDPRESTANT.AsInteger            := rSaldoDevAnt.iParcRestaAnt;
                        // Coluna N
                        cdsVLRPRESTACAO.AsCurrency          := fVlrParcela;
                        // Coluna O
//                        cdsATUALPRESTATRASO.AsCurrency
                        // Coluna P
//                        cdsJUROSREMATRASO.AsCurrency
                        // Coluna Q
//                        cdsJUROSMORAATRASO.AsCurrency
                        // Coluna R
//                        cdsMULTAPRESTATRASO.AsCurrency
                        // Coluna S
//                        cdsDEVOLUCAOPREST.AsCurrency
                        // Coluna T
//                        cdsAJUSTEPREST.AsCurrency
                        // Coluna U
//                        cdsIOF.AsCurrency
                        // Coluna V
//                        cdsSEGURO.AsCurrency
                        // Coluna W
//                        cdsATUALMONSALDODEV.AsCurrency
                        // Coluna X
//                        cdsJUROSREMSALDODEV.AsCurrency
                        // Coluna Y
//                        cdsAJUSTESALDODEV.AsCurrency
                        // Coluna Z
                        cdsAMORTIZSALDODEV.AsCurrency       := fVlrAmortizacao;
                        // Coluna AA
                        cdsQUITACAONORMAL.AsCurrency        := fVlrQuitacaoMorte;
                        // Coluna AB
                        cdsQUITACAORENOVA.AsCurrency        := fVlrQuitacao;
                        // Coluna AC
                        cdsSALDODEVATU.AsCurrency           := rSaldoDevAtu.fSaldoDevAnt;
                        // Coluna AD
//                        cdsPRESTDEVIDAS.AsInteger
                        // Coluna AE
//                        cdsSALDOINADIMPL.AsCurrency
                        // Coluna AF
//                        cdsPRESTATRASATU.AsInteger
                        // Coluna AG
//                        cdsVLRINADIMPLATU.AsCurrency
                        // Coluna AH
//                        cdsQTDDIASATRASO.AsInteger
                        // Coluna AI
//                        cdsPRECENTPROVISAO.AsFloat
                        // Coluna AJ
//                        cdsSALDOPROVISAO.AsCurrency
                        // Coluna AK
//                        cdsLIMINAR.AsString
                        // Coluna AL
//                        cdsTIPOSUSPENSAO.AsString
                        // Coluna AM
//                        cdsQTDPRESTSUSP.AsInteger

                        cds.Post;

                        // ----------------------------------------------------------------------
                        qryContrato.Next;

                        inc(iContadorBaixo);

                        frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, iContadorBaixo);
                     end;
                     // ----------------------------------------------------------------------------

                     inc(iContadorCima);
                     frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);

                     qryLookTipoContr.Next;
                  end;  // while not(qryLookTipoContr.EOF)
               end
               else    // if molListaPatro.lstPatro.Checked
               begin
                  iContadorCima := iContadorCima + iQuantTipoContr;
                  frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
               end;  // if molListaPatro.lstPatro.Checked
            end;  // for(Patro)
         end
         else  // if molListaPlano.lstPlano.Checked
         begin
            iContadorCima := iContadorCima + (molListaPatro.lstPatro.Items.Count * iQuantTipoContr);
            frmProgressoDuplo.AndaFormProgressoDuplo(iContadorCima, 0);
         end;  // if molListaPlano.lstPlano.Checked
      end;  // for(Plano)
      // -------------------------------------------------------------------------------------------
      // FIM dos loops
      // -------------------------------------------------------------------------------------------
   cds.First;
   finally
      frmProgressoDuplo.EscondeFormProgressoDuplo;
   end;
end;



procedure TfrmExecMovimentoMensal.FormShow(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContrato.Click;

   // preenche o ano de referência/competência
   cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value   := DiasUteis.ExtraiAno(Date);

   AbreQueries;

   // limpa a seleção de Contrato
   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TfrmExecMovimentoMensal.DBcboTipoEmptmoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;
      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmExecMovimentoMensal.DBcboTipoEmptmoExit(Sender: TObject);
begin
  inherited;
   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;
      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmExecMovimentoMensal.molContratoEmptmobtnBuscaContratoClick(
  Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecMovimentoMensal.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecMovimentoMensal.molListaPatrobtnInvertePatroClick(
  Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecMovimentoMensal.molListaPatrobtnMarcaTodosPatroClick(
  Sender: TObject);
begin
  inherited;
  molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecMovimentoMensal.molListaPlanobtnInvertePlanoClick(
  Sender: TObject);
begin
  inherited;
  molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecMovimentoMensal.molListaPlanobtnMarcaTodosPlanoClick(
  Sender: TObject);
begin
  inherited;
  molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecMovimentoMensal.btnContinuarClick(Sender: TObject);
begin
  inherited;
  MontaQuery;
end;

end.
