{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão do Control Object CtrlImobDocumento, com o
                     objetivo de internalizar funcionalidades.
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLancamentosBloqueados;
                                                               
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, FWizard, mContratoNumero,
  fcButton, fcImgBtn, fcShapeBtn, MontaSelect, uCtrlBloqueioImob, uCtrlPadroes, uSistema,
  Db, DBClient, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, uCtrlLancamentosImovel, {uCtrlDocumento,}
  TREdit, wwdbdatetimepicker, CMDateTimePicker, TB97Tlwn, mContrato, uCtrlTipoCustoRecImov,
  wwdblook, Menus, ppDB, ppBands, ppCtrls, ppClass, ppVar, ppStrtch,
  ppMemo, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, fPreview,
  ppDBBDE,
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  uCtrlImobDocumento;

type
  TfrmLancamentosBloqueados = class(TfrmWizardMT)
    rgTipoBloq: TRadioGroup;
    edtDocumento: TEdit;
    Label1: TLabel;
    btnBuscaDocumento: TBitBtn;
    btnLimpaDocumento: TBitBtn;
    Ms_Documento: TMontaSelect;
    cdsBloqueioImob: TCMClientDataSet;
    pnlLiberacao: TPanel;
    spdLiberaBloqueio: TSpeedButton;
    dsBloqueioImob: TDataSource;
    dbgLancamento: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    cdsImoveisDocum: TCMClientDataSet;
    cdsAlteradoresDocum: TCMClientDataSet;
    spdLancaValor: TSpeedButton;
    molLancBloqueado: TToolWindow97;
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    btnOkLancDep: TBitBtn;
    btnCancLancDep: TBitBtn;
    Panel2: TPanel;
    pnlCadHistorico: TPanel;
    Label2: TLabel;
    edtDataPagto: TCMDateTimePicker;
    Label3: TLabel;
    edtVlrPagto: TDBRealEdit;
    molContrato: TmolContrato;
    molLiberaBloqueio: TToolWindow97;
    Panel4: TPanel;
    Image2: TImage;
    Panel5: TPanel;
    btnLiberaBloqueio: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtDataLancamento: TCMDateTimePicker;
    cdsTipoOperacao: TCMClientDataSet;
    cboTipoReceita: TwwDBLookupCombo;
    CMSqlParams2: TCMSqlParams;
    ppmImpressao: TPopupMenu;
    mnuImprimir: TMenuItem;
    ppContratos: TppBDEPipeline;
    rptContratos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLogoTipo: TppImage;
    pplblEmpresa: TppLabel;
    ppLabel14: TppLabel;
    ppdbHist: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pplblSistema: TppLabel;
    ppLine3: TppLine;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppSub: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel2: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine1: TppLine;
    btnImprimir: TfcShapeBtn;
    procedure btnBuscaDocumentoClick(Sender: TObject);
    procedure btnLimpaDocumentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure spdLiberaBloqueioClick(Sender: TObject);
    procedure dbgLancamentoDblClick(Sender: TObject);
    procedure dbgLancamentoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgLancamentoTopRowChanged(Sender: TObject);
    procedure spdLancaValorClick(Sender: TObject);
    procedure btnOkLancDepClick(Sender: TObject);
    procedure btnCancLancDepClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnLiberaBloqueioClick(Sender: TObject);
    procedure cdsBloqueioImobAfterScroll(DataSet: TDataSet);
    procedure mnuImprimirClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlBloqueioImob      : TCtrlBloqueioImob;
    CtrlLancamentosImovel : TCtrlLancamentosImovel;
    //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
    //CtrlDocumento         : TCtrlDocumento;
    CtrlImobDocumento     : TCtrlImobDocumento;
    CtrlTipoCustoRecImov  : TCtrlTipoCustoRecImov;

    function VerificaPreenchimento : Boolean;
    function RecebeDadosLiberacao  : Boolean;
    function LiberaBloqueio        : Boolean;
  public
    { Public declarations }
  end;

var
  frmLancamentosBloqueados: TfrmLancamentosBloqueados;

implementation

{$R *.DFM}

uses uMensErro, uVerificaPreenchimento;

procedure TfrmLancamentosBloqueados.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlBloqueioImob := TCtrlBloqueioImob.Create;
   CtrlBloqueioImob.InitializeAs(Padroes);
   CtrlBloqueioImob.CdsBloqueioImob:= cdsBloqueioImob;

   CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa, sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlLancamentosImovel.InitializeAs(Padroes);
   CtrlLancamentosImovel.OpenTransaction := False;

   CtrlTipoCustoRecImov  := TCtrlTipoCustoRecImov.Create;
   CtrlTipoCustoRecImov.InitializeAs(Padroes);

   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento         := TCtrlDocumento.Create;
   //CtrlDocumento.InitializeAs(Padroes);
   CtrlImobDocumento      := TCtrlImobDocumento.Create;
   CtrlImobDocumento.InitializeAs(Padroes);

   cdsTipoOperacao.Data     := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo,'R');
   cdsTipoOperacao.Filter   := 'FLGBLOQJUDICIAL = 0';
   cdsTipoOperacao.Filtered := True;
end;



procedure TfrmLancamentosBloqueados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( CtrlBloqueioImob );
   FreeAndNil( CtrlLancamentosImovel );
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //FreeAndNil( CtrlDocumento );
   FreeAndNil(CtrlImobDocumento);
   FreeAndNil( CtrlTipoCustoRecImov );
   inherited;
end;



procedure TfrmLancamentosBloqueados.btnBuscaDocumentoClick(Sender: TObject);
begin
   inherited;
   MS_Documento.Executar;
   if MS_Documento.RetornouValor then edtDocumento.Text := MS_Documento.ValoresChave[0];
end;



procedure TfrmLancamentosBloqueados.btnLimpaDocumentoClick(Sender: TObject);
begin
   inherited;
   edtDocumento.Clear;
end;



procedure TfrmLancamentosBloqueados.btnContinuarClick(Sender: TObject);
var
   iDocumento : Integer;
begin
   iDocumento := -1;
   if edtDocumento.Text <> '' then iDocumento := StrToInt(edtDocumento.Text);
   if PagControle.ActivePage = tabSelecao then
   begin
      if VerificaPreenchimento then
      begin
         cdsBloqueioImob.Data := CtrlBloqueioImob.LookupLancamentoBloqueado(molContrato.iContrato,iDocumento,(rgTipoBloq.ItemIndex = 0));

         TFloatField(cdsBloqueioImob.FieldByName('VLRLANCRECEB')).EditMask      := ',0.00';
         TFloatField(cdsBloqueioImob.FieldByName('VLRLANCRECEB')).DisplayFormat := ',0.00';
         TFloatField(cdsBloqueioImob.FieldByName('VLRPAGTO')).EditMask          := ',0.00';
         TFloatField(cdsBloqueioImob.FieldByName('VLRPAGTO')).DisplayFormat     := ',0.00';

         if rgTipoBloq.ItemIndex = 0 then
         begin
            fcLabel1.Caption     := 'Lançamentos Bloqueados';
            pnlLiberacao.Visible := True;
         end
         else
         begin
            fcLabel1.Caption     := 'Lançamentos Liberados';
            pnlLiberacao.Visible := False;
         end;

         inherited;
      end;
   end;

   btnImprimir.Enabled := PagControle.ActivePage <> tabSelecao;

end;



procedure TfrmLancamentosBloqueados.spdLiberaBloqueioClick(Sender: TObject);
begin
   inherited;
   edtDataLancamento.Date := Date;
   molLiberaBloqueio.Show;
end;



function TfrmLancamentosBloqueados.VerificaPreenchimento: Boolean;
begin
   Result := True;

   try
      if molContrato.iContrato <= 0 then
         raise EValidacao.CreateVal('Contrato deve ser informado', molContrato.btnBuscaContrato);
   except
      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
   	 Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
end;



procedure TfrmLancamentosBloqueados.dbgLancamentoDblClick(Sender: TObject);
begin
   inherited;
   cdsBloqueioImob.Edit;
   if cdsBloqueioImob.FieldByName('FLGESCOLHA').AsInteger = 0 then cdsBloqueioImob.FieldByName('FLGESCOLHA').AsInteger := 1
   else                                                            cdsBloqueioImob.FieldByName('FLGESCOLHA').AsInteger := 0;
   cdsBloqueioImob.Post;
end;



procedure TfrmLancamentosBloqueados.dbgLancamentoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWhite;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmLancamentosBloqueados.dbgLancamentoTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmLancamentosBloqueados.spdLancaValorClick(Sender: TObject);
begin
   inherited;
   if not cdsBloqueioImob.FieldByName('DATAPAGTO').IsNull then edtDataPagto.Date := cdsBloqueioImob.FieldByName('DATAPAGTO').AsDateTime;
   if not cdsBloqueioImob.FieldByName('VLRPAGTO').IsNull  then edtVlrPagto.Value := cdsBloqueioImob.FieldByName('VLRPAGTO').AsCurrency;

   molLancBloqueado.Show;
end;



procedure TfrmLancamentosBloqueados.btnOkLancDepClick(Sender: TObject);
begin
   inherited;

   cdsBloqueioImob.Edit;
   cdsBloqueioImob.FieldByName('DATAPAGTO').AsDateTime := edtDataPagto.Date;
   cdsBloqueioImob.FieldByName('VLRPAGTO').AsCurrency  := edtVlrPagto.Value;
   cdsBloqueioImob.Post;

   molLancBloqueado.Hide;
end;



procedure TfrmLancamentosBloqueados.btnCancLancDepClick(Sender: TObject);
begin
   inherited;
   molLancBloqueado.Hide;
end;



procedure TfrmLancamentosBloqueados.btnConfirmarClick(Sender: TObject);
begin
   if not CtrlBloqueioImob.GravaBloqueioImob then
      MsgDlg(CtrlBloqueioImob.MessageInfo,'Aviso',mtInformation,[mbOK],0);
   btnVoltarClick(Self);
   inherited;
end;



function TfrmLancamentosBloqueados.RecebeDadosLiberacao: Boolean;
begin
   Result := edtDataLancamento.Date > 0;
   if Result then Result := cboTipoReceita.LookupValue <> '';
end;



procedure TfrmLancamentosBloqueados.btnLiberaBloqueioClick(Sender: TObject);
begin
   inherited;
   molLiberaBloqueio.Hide;
   if RecebeDadosLiberacao then
   begin
      LiberaBloqueio;
      btnConfirmarClick(Self);
   end;
end;



function TfrmLancamentosBloqueados.LiberaBloqueio: Boolean;
var
   iNovoDocumento : Integer;
   iDocumento     : Integer;
   sErro          : String;
begin
   try
      cdsBloqueioImob.First;
      while not cdsBloqueioImob.Eof do
      begin
         iDocumento := cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger;

         while (iDocumento = cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger) and
               (not cdsBloqueioImob.Eof) do
         begin
            if cdsBloqueioImob.FieldByName('FLGESCOLHA').AsInteger = 1 then
            begin

               CtrlBloqueioImob.StartTransaction;

               //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
               //iNovoDocumento           := CtrlDocumento.GetSequenceDocumento;
               iNovoDocumento           := CtrlImobDocumento.GetSequenceDocumento;
               cdsImoveisDocum.Data     := CtrlLancamentosImovel.LookupImoveisDocum(cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger);
               cdsAlteradoresDocum.Data := CtrlLancamentosImovel.LookupAlteradoresDocum(cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger);

               if CtrlLancamentosImovel.Inserir(cdsBloqueioImob.FieldByName('MESCOMPETENCIA').AsInteger,
                                                cdsBloqueioImob.FieldByName('ANOCOMPETENCIA').AsInteger,
                                                cdsBloqueioImob.FieldByName('IDFORCLI').AsInteger,
                                                StrToInt(cboTipoReceita.LookupValue),
                                                cdsBloqueioImob.FieldByName('CODFORMA').AsInteger,
                                                cdsBloqueioImob.FieldByName('CODPORTFORMA').AsInteger,
                                                cdsBloqueioImob.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                                cdsBloqueioImob.FieldByName('IDCBANCARIA').AsInteger,
                                                cdsBloqueioImob.FieldByName('MOEDARECEB').AsInteger,
                                                iNovoDocumento,
                                                cdsBloqueioImob.FieldByName('NUMAPALT').AsInteger,
                                                iNovoDocumento,
                                                cdsBloqueioImob.FieldByName('VLRLANCRECEB').AsFloat,
                                                0,
                                                'A',
                                                'R',
                                                cdsBloqueioImob.FieldByName('REFERENCIAAP').AsString,
                                                cdsBloqueioImob.FieldByName('OBS').AsString,
                                                cdsBloqueioImob.FieldByName('CODCENTROCUSTO').AsString,
                                                'Desbloqueio de cobrança',
                                                cdsBloqueioImob.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                edtDataLancamento.Date,
                                                cdsBloqueioImob.FieldByName('DTINICTBDIARIA').AsDateTime,
                                                cdsBloqueioImob.FieldByName('DTFIMCTBDIARIA').AsDateTime,
                                                cdsImoveisDocum.Data,
                                                cdsAlteradoresDocum.Data,
                                                False,
                                                False,
                                                cdsBloqueioImob.FieldByName('DATAEMISSAO').AsDateTime
                                               ) then
               begin
                  cdsBloqueioImob.Edit;
                  cdsBloqueioImob.FieldByName('IDDOCUMENTOLIB').AsInteger := iNovoDocumento;
                  cdsBloqueioImob.Post;
                  if CtrlBloqueioImob.GravaBloqueioImob then
                  begin
                     if CtrlBloqueioImob.InTransaction then CtrlBloqueioImob.Commit;
                  end
                  else
                  begin
                     if CtrlBloqueioImob.InTransaction then CtrlBloqueioImob.RollBack;
                     sErro := CtrlBloqueioImob.MessageInfo;
                  end;
               end
               else
               begin
                  sErro := CtrlLancamentosImovel.MessageInfo;
                  if CtrlBloqueioImob.InTransaction then CtrlBloqueioImob.RollBack;
               end;
            end;
            cdsBloqueioImob.Next;

            if (not cdsBloqueioImob.eof) and
               (iDocumento = cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger) then
            begin
               repeat
                  cdsBloqueioImob.Next;
               until
                  (cdsBloqueioImob.eof) or
                  (iDocumento <> cdsBloqueioImob.FieldByName('IDDOCUMENTOBLOQ').AsInteger);
            end;
         end;
      end;
   except
      MsgDlg(sErro,'Aviso',mtInformation, [mbOK],0);
      if CtrlBloqueioImob.InTransaction then CtrlBloqueioImob.RollBack;
      Raise;
   end;
end;



procedure TfrmLancamentosBloqueados.cdsBloqueioImobAfterScroll(DataSet: TDataSet);
begin
   inherited;
   pnlLiberacao.Visible := cdsBloqueioImob.FieldByName('IDDOCUMENTOLIB').IsNull;
end;



procedure TfrmLancamentosBloqueados.mnuImprimirClick(Sender: TObject);
begin
   inherited;
    TFrmPreview.CreateModalPreview( Application,
                                    rptContratos,
                                    rptContratos.PrinterSetup.DocumentName)
end;



procedure TfrmLancamentosBloqueados.btnVoltarClick(Sender: TObject);
begin
  inherited;
  btnImprimir.Enabled := PagControle.ActivePage <> tabSelecao;
end;



end.
