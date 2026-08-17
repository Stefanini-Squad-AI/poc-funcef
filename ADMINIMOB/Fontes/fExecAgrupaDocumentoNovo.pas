{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecAgrupaDocumentoNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizard, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwriched, Grids, Wwdbigrd,
  Wwdbgrid, mOrigemLanc, mContrato, wwdbdatetimepicker, CMDateTimePicker,
  Mask, wwdbedit, Wwdbspin, mUsuario, wwdblook, fcButton, fcImgBtn,
  fcShapeBtn, mResponsavel, Db, DBTables, Wwquery, Wwdatsrc, mLocatario;

type
  TfrmExecAgrupaDocumentoNovo = class(TfrmWizard)
    ntbPrincipal: TNotebook;
    btnContinuaSelecao: TfcShapeBtn;
    btnAtualizar: TfcShapeBtn;
    molContrato1: TmolContrato;
    btnVoltar: TfcShapeBtn;
    Panel5: TPanel;
    wwDBGrid1: TwwDBGrid;
    fcShapeBtn4: TfcShapeBtn;
    Panel3: TPanel;
    MolResponsavel1: TMolResponsavel;
    Label22: TLabel;
    DBcboPortadorForma: TwwDBLookupCombo;
    qryLancamentosAgrupar: TwwQuery;
    edtDataVencimento: TCMDateTimePicker;
    Label5: TLabel;
    qryLancamentosAgruparCODDOCUMENTO: TFloatField;
    qryLancamentosAgruparCODPORTFORMA: TFloatField;
    qryLancamentosAgruparDATAVENCIMENTO: TDateTimeField;
    qryLancamentosAgruparCONTRATO_EXTENSO: TStringField;
    qryLancamentosAgruparDESCCUSTORECIMO: TStringField;
    qryLancamentosAgruparVALOR_LANC: TFloatField;
    dsLancamentosAgrupar: TwwDataSource;
    qryLancamentosAgruparFLGAGRUPAR: TFloatField;
    updLancamentosAgrupar: TUpdateSQL;
    btnMarcar: TfcShapeBtn;
    btnDesmarcar: TfcShapeBtn;
    Memo1: TMemo;
    Panel6: TPanel;
    Memo2: TMemo;
    btnConfirma: TfcShapeBtn;
    btnContinuarLanc: TfcShapeBtn;
    qryAgrupaDocs: TwwQuery;
    qryLancamentosAgruparIDCONTRATOIMOVEL: TFloatField;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    GroupBox2: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edtln1: TEdit;
    edtln2: TEdit;
    edtln4: TEdit;
    edtln5: TEdit;
    edtln6: TEdit;
    edtln7: TEdit;
    edtln3: TEdit;
    edtln8: TEdit;
    edtln9: TEdit;
    fcShapeBtn1: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    qryLancamentosAgruparIDLOCATARIO: TFloatField;
    qryLookEndereco: TwwQuery;
    qryLookEnderecoENDERECO: TStringField;
    molLocatario1: TmolLocatario;
    chkIgnoraCompetencia: TCheckBox;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure btnContinuarLancClick(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);

  private { Private declarations }
    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
  end;

var
  frmExecAgrupaDocumentoNovo: TfrmExecAgrupaDocumentoNovo;

implementation

{$R *.DFM}

uses
   dLookImobiliario, UComunsImobiliario, uVerificaPreenchimento, uFuncoesImob, dImobiliario,
   uMensErro, uSistema, uDocumento, uDiasInUteis;

procedure TfrmExecAgrupaDocumentoNovo.btnVoltarClick(Sender: TObject);
begin
   inherited;
   if ntbPrincipal.PageIndex = 3 then
        ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 2
   else ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

function TfrmExecAgrupaDocumentoNovo.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      if ( DBcboPortadorForma.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar a forma de cobrança!', DBcboPortadorForma);
      if ( edtDataVencimento.Text = '' ) then
         raise EValidacao.CreateVal('É necessário indicar a data de vencimento!', edtDataVencimento);
      if not chkIgnoraCompetencia.Checked then begin
         if ( cboMesCompetencia.Text = '' ) then
            raise EValidacao.CreateVal('É necessário indicar o mês de competência!', cboMesCompetencia);
         if ( DBspnAnoCompetencia.Text = '' ) then
            raise EValidacao.CreateVal('É necessário indicar o ano de competência!', DBspnAnoCompetencia);
      end;
   except
      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmExecAgrupaDocumentoNovo.FormShow(Sender: TObject);
begin
   inherited;
   edtDataVencimento.Date := date;
   cboMesCompetencia.ItemIndex := DiasInUteis.ExtraiMes(date) - 1;
   DBspnAnoCompetencia.Value   := DiasInUteis.ExtraiAno(date);

   ntbPrincipal.PageIndex := 0;
   LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
   dtmLookImobiliario.qryLookPortadorForma.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookPortadorForma.Open;

   ParametrosSistema;
   DBcboPortadorForma.LookupValue := dtmImobiliario.qryParamImobCODPORTFORMA.AsString;
end;

procedure TfrmExecAgrupaDocumentoNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   dtmLookImobiliario.qryLookPortadorForma.Close;
end;

procedure TfrmExecAgrupaDocumentoNovo.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimento then begin
      ntbPrincipal.PageIndex := ntbPrincipal.PageIndex + 1;
   end;
end;

procedure TfrmExecAgrupaDocumentoNovo.btnMarcarClick(Sender: TObject);
begin
   inherited;
   qryLancamentosAgrupar.DisableControls;
   qryLancamentosAgrupar.First;
   while not qryLancamentosAgrupar.Eof do begin
      qryLancamentosAgrupar.Edit;
      qryLancamentosAgruparFLGAGRUPAR.AsInteger := 1;
      qryLancamentosAgrupar.Post;
      qryLancamentosAgrupar.Next;
   end;
   qryLancamentosAgrupar.First;
   qryLancamentosAgrupar.EnableControls;
end;

procedure TfrmExecAgrupaDocumentoNovo.btnDesmarcarClick(Sender: TObject);
begin
   inherited;
   qryLancamentosAgrupar.DisableControls;
   qryLancamentosAgrupar.First;
   while not qryLancamentosAgrupar.Eof do begin
      qryLancamentosAgrupar.Edit;
      qryLancamentosAgruparFLGAGRUPAR.AsInteger := 0;
      qryLancamentosAgrupar.Post;
      qryLancamentosAgrupar.Next;
   end;
   qryLancamentosAgrupar.First;
   qryLancamentosAgrupar.EnableControls;
end;

procedure TfrmExecAgrupaDocumentoNovo.wwDBGrid1DblClick(Sender: TObject);
begin
   inherited;
   qryLancamentosAgrupar.Edit;
   if qryLancamentosAgruparFLGAGRUPAR.AsInteger = 1 then qryLancamentosAgruparFLGAGRUPAR.AsInteger := 0
   else qryLancamentosAgruparFLGAGRUPAR.AsInteger := 1;
   qryLancamentosAgrupar.Post;
end;

procedure TfrmExecAgrupaDocumentoNovo.btnConfirmaClick(Sender: TObject);
var
   vMsgCnab, vDiscriminacao, vAux : array of string;
   sClausulaIn, sSql : string;
   iLocatario, i, j, k, iGrupoCNAB: integer;
   sTotalBoleto: Extended;
begin
   inherited;

   // montar a query basica, o que vai mudar é a cláusula in
   sSql := 'SELECT CODDOCUMENTO, CODPORTFORMA ' + #13 +
           'FROM DOCUMENTO ' + #13 +
           'WHERE CODDOCUMENTO IN (';

   // varrer a query para montar os contratos a serem agrupados
   qryLancamentosAgrupar.First;
   while (not qryLancamentosAgrupar.Eof) do begin

      sClausulaIn := '';
      iLocatario  := qryLancamentosAgruparIDLOCATARIO.AsInteger;
      i := 0;
      sTotalBoleto := 0;
      while (iLocatario = qryLancamentosAgruparIDLOCATARIO.AsInteger) and (not qryLancamentosAgrupar.Eof) do begin
         if qryLancamentosAgruparFLGAGRUPAR.AsInteger = 1 then begin

            // atri4bui a cláusula in com os CODDOCUMENTO selecionados
            sClausulaIn := sClausulaIn +  IntToStr(qryLancamentosAgruparCODDOCUMENTO.AsInteger) + ',';

            // aumenta o tamanho do vetor discriminacao e atribui seu valor
            SetLength (vDiscriminacao, i + 1 );
            vDiscriminacao[i] := qryLancamentosAgruparDESCCUSTORECIMO.AsString + ' = ' + FormatFloat('#,##0.00',qryLancamentosAgruparVALOR_LANC.AsFloat);
            sTotalBoleto := sTotalBoleto + qryLancamentosAgruparVALOR_LANC.AsFloat;
            inc(i);

         end;
         qryLancamentosAgrupar.Next;
      end;

      // processar grupo de contratos
      if sClausulaIn <> '' then begin
         sClausulaIn := copy(sClausulaIn,1,length(sClausulaIn)-1);
      end;

      qryAgrupaDocs.SQL.Clear;
      qryAgrupaDocs.SQL.Add (sSql + sClausulaIn + ')');
      qryAgrupaDocs.Open;

      // agrupa todos os documentos daquele contrato que tenham o mesmo vencimento
      // e já altera o EMISBLOQ para 'N'
      Documento.IntBanco.AgrupaDocCNAB(qryAgrupaDocs, False, False, True, True, ['CODPORTFORMA']);

      // Define e grava nova mensagem do Boleto
      SetLength ( vMsgCnab, 9 );
      j := 0;
      for j:= 0 to 8 do
         vMsgCnab[j] := TEdit(FindComponent('edtln'+inttostr(j+1))).Text;

      if Documento.IntBanco.CodigosGrupo.Count > 0 then begin
         iGrupoCNAB := StrToInt(Documento.IntBanco.CodigosGrupo[0]);
      end;

      if not(Documento.IntBanco.SetaMensagensCNAB(-1, iGrupoCNAB, vMsgCNAB)) then begin
         MsgDlg('Não foi possível gravar o texto do bloqueto. Favor verificar.', 'Erro', mtError, [mbOk], 0);
      end;

   end;

   MsgDlg('Processo concluído.', 'Aviso', mtInformation, [mbOk], 0);
   ntbPrincipal.PageIndex := 0;

end;



procedure TfrmExecAgrupaDocumentoNovo.fcShapeBtn4Click(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecAgrupaDocumentoNovo.btnContinuarLancClick(Sender: TObject);
begin
   inherited;
   LimpaParametros(qryLancamentosAgrupar);
   qryLancamentosAgrupar.ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);
   qryLancamentosAgrupar.ParamByName('PDATAVENCIMENTO').AsDateTime := edtDataVencimento.DateTime;
   if not chkIgnoraCompetencia.Checked then begin
      qryLancamentosAgrupar.ParamByName('PMESCOMPETENCIA').AsInteger  := cboMesCompetencia.ItemIndex + 1;
      qryLancamentosAgrupar.ParamByName('PANOCOMPETENCIA').AsInteger  := word(trunc(DBspnAnoCompetencia.Value));
   end;

   if molContrato1.edtContrato.Text <> '' then qryLancamentosAgrupar.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
   if MolResponsavel1.edtResponsavel.Text <> '' then qryLancamentosAgrupar.ParamByName('PIDRESPONSAVEL').AsInteger := MolResponsavel1.iResponsavel;
   if molLocatario1.edtLocatario.Text <> '' then qryLancamentosAgrupar.ParamByName('PIDLOCATARIO').AsInteger := molLocatario1.iLocatario;
   qryLancamentosAgrupar.Open;

   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex +1
end;

procedure TfrmExecAgrupaDocumentoNovo.fcShapeBtn2Click(Sender: TObject);
begin
   inherited;
   btnContinuarLanc.Click;
   ntbPrincipal.PageIndex := ntbPrincipal.PageIndex +1
end;

procedure TfrmExecAgrupaDocumentoNovo.ntbPrincipalPageChanged(
  Sender: TObject);
begin
  inherited;
   case ntbPrincipal.PageIndex of
      1: lblTitulo.Caption := 'Agrupa Documentos [ seleção ]';
      2: lblTitulo.Caption := 'Agrupa Documentos [ mensagens - frente ]';
      3: lblTitulo.Caption := 'Agrupa Documentos [ mensagens - verso ]';
      4: lblTitulo.Caption := 'Agrupa Documentos [ documentos ]';
   else
      lblTitulo.Caption :=  'Agrupa Documentos';
   end;
end;

end.
