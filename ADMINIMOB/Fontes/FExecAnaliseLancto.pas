unit FExecAnaliseLancto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizard, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwriched, Grids, Wwdbigrd,
  Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, Db, DBTables, Wwquery, Wwdatsrc,
  Menus, mContrato, mUsuario, Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, mOrigemLanc, wwdblook;

type
  TfrmExecAnaliseLancto = class(TfrmWizard)
    ntbPrincipal: TNotebook;
    btnContinuaSelecao: TfcShapeBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    wwDBGrid4: TwwDBGrid;
    wwDBRichEdit1: TwwDBRichEdit;
    wwDBRichEdit2: TwwDBRichEdit;
    dsDocumento: TwwDataSource;
    qryDocumento: TwwQuery;
    qryDocumento_ORIGEMLANC: TStringField;
    qryDocumento_DESCERRO: TStringField;
    qryDocumentoIDDOCUMENTO: TFloatField;
    qryDocumentoNODOCUMENTO: TFloatField;
    qryDocumentoTOTAL_LANC: TFloatField;
    qryDocumentoTOTAL_OM_LANC: TFloatField;
    qryDocumentoFLGORIGEMLANC: TStringField;
    qryDocumentoMESCOMPETENCIA: TFloatField;
    qryDocumentoANOCOMPETENCIA: TFloatField;
    qryDocumentoDATAVENCIMENTO: TDateTimeField;
    qryDocumentoDESCCUSTORECIMO: TStringField;
    qryDocumentoFLGERRO: TFloatField;
    dsLancamentos: TwwDataSource;
    qryLancamentos: TwwQuery;
    qryLancamentosIMOVEL_EXTENSO: TStringField;
    qryLancamentosCONTRATO_EXTENSO: TStringField;
    qryLancamentosVALOR_LANC: TFloatField;
    qryLancamentosMSGERROINTEGRA: TStringField;
    pupmLibera: TPopupMenu;
    miLibera: TMenuItem;
    qryUpdLancImovel: TwwQuery;
    MolUsuario1: TMolUsuario;
    molContrato1: TmolContrato;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    chkCompetencia: TCheckBox;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label2: TLabel;
    rdgTipoData: TRadioGroup;
    molOrigemLanc1: TmolOrigemLanc;
    VoltaraoIncio1: TMenuItem;
    qryDocumento_RECPAG: TStringField;
    wwDBGrid1: TwwDBGrid;
    qryDocumentoRECPAG: TStringField;
    qryLancamentosCODTIPIMOVEL: TStringField;
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pupmLiberaPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryDocumentoCalcFields(DataSet: TDataSet);
    procedure miLiberaClick(Sender: TObject);
    procedure VoltaraoIncio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frmExecAnaliseLancto: TfrmExecAnaliseLancto;

implementation

uses UFuncoesImob, UDataBase, USistema, uMensErro, DLancImovel, UCalcDocumento,
  dLookImobiliario;

{$R *.DFM}

procedure TfrmExecAnaliseLancto.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   // atribui parametros em qryDocumento
   LimpaParametros(qryDocumento);
   qryDocumento.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;

   if MolUsuario1.iUsuario > 0 then
      qryDocumento.ParamByName('PIDUSUARIOSISTEMA').AsInteger := MolUsuario1.iUsuario;

   if molContrato1.iContrato > 0 then
      qryDocumento.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;

   if DBcboTipoRecDes.Text <> '' then
      qryDocumento.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

   if (edtDataIni.Text <> '') and (edtDataFim.Text <> '') then begin
      if rdgTipoData.ItemIndex = 0 then begin
         qryDocumento.ParamByName('PTRGDTINCLUSAO1').AsDateTime := edtDataIni.DateTime;
         qryDocumento.ParamByName('PTRGDTINCLUSAO2').AsDateTime := edtDataFim.DateTime;
      end else if rdgTipoData.ItemIndex = 1 then begin
         qryDocumento.ParamByName('PDATALANCAMENTO1').AsDateTime := edtDataIni.DateTime;
         qryDocumento.ParamByName('PDATALANCAMENTO2').AsDateTime := edtDataFim.DateTime;
      end else if rdgTipoData.ItemIndex = 3 then begin
         qryDocumento.ParamByName('PDATAVENCIMENTO1').AsDateTime := edtDataIni.DateTime;
         qryDocumento.ParamByName('PDATAVENCIMENTO2').AsDateTime := edtDataFim.DateTime;
      end;
   end;

   if not chkCompetencia.Checked then begin
      qryDocumento.ParamByName('PMESCOMPETENCIA').AsInteger := cboMesCompetencia.ItemIndex+1;
      qryDocumento.ParamByName('PANOCOMPETENCIA').AsInteger := Word(trunc(DBspnAnoCompetencia.Value));
   end;

   qryDocumento.ParamByName('PFLGORIGEMLANC').AsString := molOrigemLanc1.cboOrigemLanc.Value;

   if not qryDocumento.Prepared   then qryDocumento.Prepare;
   if not qryLancamentos.Prepared then qryLancamentos.Prepare;
   qryDocumento.Open;
   qryLancamentos.Open;

   ntbPrincipal.PageIndex := 1;
   lblTitulo.Caption      := 'Análise de Lançamentos [ resultado ]';
end;

procedure TfrmExecAnaliseLancto.FormShow(Sender: TObject);
begin
   inherited;
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      if Active = False then Open;
   end;
   ntbPrincipal.PageIndex := 0;
   lblTitulo.Caption      := 'Análise de Lançamentos [ seleção ]';
end;

procedure TfrmExecAnaliseLancto.pupmLiberaPopup(Sender: TObject);
begin
   inherited;
   if qryDocumentoFLGERRO.AsInteger = -56 then
        miLibera.Enabled := True
   else miLibera.Enabled := False;
end;

procedure TfrmExecAnaliseLancto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   qryDocumento.Close;
   qryLancamentos.Close;
   dtmLookImobiliario.qryLookTipoRecDes.Close;   
end;

procedure TfrmExecAnaliseLancto.qryDocumentoCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryDocumento_ORIGEMLANC.AsString := OrigemLancamento(qryDocumentoFLGORIGEMLANC.asString[1]);
   qryDocumento_DESCERRO.AsString   := DescricaoErro(qryDocumentoFLGERRO.AsInteger);

   if qryDocumentoRECPAG.AsString = 'R' then qryDocumento_RECPAG.AsString := 'Receita'
   else qryDocumento_RECPAG.AsString := 'Despesa'
end;

procedure TfrmExecAnaliseLancto.miLiberaClick(Sender: TObject);
begin
  inherited;
  if CalcDocumento.LiberaLanc(qryDocumentoFLGERRO.AsInteger,
                              qryDocumentoIDDOCUMENTO.AsInteger,
                              Sistema.IdUsuario) then begin
     qryDocumento.Close;
     qryDocumento.Open;
  end;
end;

procedure TfrmExecAnaliseLancto.VoltaraoIncio1Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
   lblTitulo.Caption := 'Análise de Lançamentos [ seleção ]';
end;

end.
