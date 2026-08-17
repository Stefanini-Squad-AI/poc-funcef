unit fExecAntecipa;

// ------------------------------------------------------------------------------------------------
//
//	   Executa a Antecipação de Pagamento de Parcelas
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  18/02/2002
//	Data de Término   :
//
// -------------------------------------------------------------------------------------------------
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8221
Nº KINTANA..: 1577344
Data........: 20/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
  fcImgBtn, fcShapeBtn, mProposta, fcLabel, wwdblook, CMDBLookupCombo, Db,
  DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker, Wwdatsrc, Mask,
  wwdbedit, Wwdbspin, uSistema,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmExecAntecipa = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    ntbAntecipa: TNotebook;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    grdParc: TwwDBGrid;
    gbContrato: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtComprador: TEdit;
    dblcbCondPag: TCMDBLookupCombo;
    qryCondPag: TwwQuery;
    cmDtVencto: TCMDateTimePicker;
    qryParc: TwwQuery;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcNUMPARCELA: TFloatField;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcFLGTIPOLANC: TFloatField;
    GroupBox2: TGroupBox;
    cbGerada: TCheckBox;
    cbSinal: TCheckBox;
    cbAmort: TCheckBox;
    cbVista: TCheckBox;
    dsParc: TwwDataSource;
    qryParcCHKANTECIPA: TFloatField;
    UpdParc: TUpdateSQL;
    cbProj: TCheckBox;
    qryParcDESCPARCELA: TStringField;
    btnContinuar: TfcShapeBtn;
    btnVoltar: TfcShapeBtn;
    ToolbarSep974: TToolbarSep97;
    btnConfirmar: TfcShapeBtn;
    qryParcVLR_DESCONTO: TFloatField;
    qryParcVLR_PARCANTECIPADA: TFloatField;
    qryParcVLRPRESTACAO: TFloatField;
    molProposta1: TmolProposta;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryCondPagDATAVENCTOINICIAL: TDateTimeField;
    qryCondPagDSCCOND: TStringField;
    GroupBox3: TGroupBox;
    DBSpnQtde: TwwDBSpinEdit;
    Panel1: TPanel;
    qryParcFLGLANCINTEGRA: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcPLNCODIGO: TFloatField;
    qryParcDATALANCINTEGRA: TDateTimeField;
    qryParcDATAPAGAMENTO: TDateTimeField;
    qryCondPagFLGREAJMENSAL: TStringField;
    qryCondPagFORMACALCULO: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
    procedure grdParcCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdParcTopRowChanged(Sender: TObject);
    procedure ntbAntecipaPageChanged(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    // Marchetti - Pendencia 27460
    bMarcouParcela : Boolean;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    // Fim Marchetti - Pendencia 27460
    { Private declarations }
    procedure AbreCondPag(iCond: Double);
    procedure CalcCamposVirtuais;
    procedure ContinuaSelecao;
    procedure VoltaParcelas;
    function  VerificaPreenchimentoSelecao : Boolean;
    function  SelecionaParcelas : Boolean;
    function  AntecipaParcelas : Boolean;
    function  RecalculaParcela(iCondPag: Double): Boolean;
    function  VerificaParcelas : Boolean;    
  public
    { Public declarations }
  end;

var
  frmExecAntecipa: TfrmExecAntecipa;

implementation

uses DFinanciamento, uDataBase, dBaseDados, uFuncoesImob, uMensErro,
  UFuncAlienacao;

{$R *.DFM}

procedure TfrmExecAntecipa.FormShow(Sender: TObject);
begin
   inherited;
   ntbAntecipa.PageIndex := 0;
   dbSpnQtde.Value       := 1;
   cmDtVencto.Date       := Date();
   btnVoltar.Enabled     := False;
   btnConfirmar.Enabled  := False;
   btnContinuar.Enabled  := True;
   molProposta1.btnBuscaProp.SetFocus;
end;

procedure TfrmExecAntecipa.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,True,Sender);
   if molProposta1.iProposta > 0 then begin
      edtComprador.Text := molProposta1.sComprador;
      AbreCondPag(molProposta1.iProposta);
   end else begin
      edtComprador.Clear;
      AbreCondPag(-1);
   end;
end;

procedure TfrmExecAntecipa.molProposta1btnLimpaPropClick(Sender: TObject);
begin
  inherited;
   molProposta1.btnLimpaPropClick(Sender);
   if molProposta1.iProposta > 0 then begin
      edtComprador.Text := molProposta1.sComprador;
      AbreCondPag(molProposta1.iProposta);
   end else begin
      edtComprador.Clear;
      AbreCondPag(-1);
   end;
end;

procedure TfrmExecAntecipa.AbreCondPag(iCond: Double);
begin
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsFloat := iCond;
   qryCondPag.Open;
end;

function TfrmExecAntecipa.VerificaPreenchimentoSelecao: Boolean;
begin
   Result := True;
   // Checa tela de seleção
   if molProposta1.iProposta <= 0 then begin
      MsgDlg('Selecione um Contrato','Aviso',mtWarning,[mbOk],0);
      molProposta1.btnBuscaProp.SetFocus;
      Result := False;
      Exit;
   end;
   if dblcbCondPag.LookupValue = '' then begin
      MsgDlg('Selecione uma Condição de Pagamento','Aviso',mtWarning,[mbOk],0);
      dblcbCondPag.SetFocus;
      Result := False;
      Exit;
   end;

   if dbSpnQtde.Value < 1 then begin
      MsgDlg('Pelo menos uma parcela deverá ser antecipada','Aviso',mtWarning,[mbOk],0);
      dbSpnQtde.SetFocus;
      Result := False;
      Exit;
   end;
   if cmdtVencto.Text = '' then begin
      MsgDlg('A data de vencimento deve ser informada','Aviso',mtWarning,[mbOk],0);
      cmdtVencto.SetFocus;
      Result := False;
      Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,cmdtVencto.Text) then
   begin
        MsgDlg('Período contábil bloqueado!','Aviso',mtWarning,[mbOk],0);
        cmdtVencto.SetFocus;
        Result := False;
        Exit;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

   // Marchetti - Pendencia 27460
   if (Sistema.TipoCliente = 19991) and (not qryCondPagFORMACALCULO.AsInteger in [1,2,3,4,9,10]) then
   begin
      //  1 : 'PRICE - Corrige Saldo Dev. anual, incorpora resíduo, recalculo anual da Parcela';
      //  2 : 'PRICE - Corrige Saldo Dev. mensal, recalculo anual da Parcela';
      //  3 : 'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção na Parcela';
      //  4 : 'PRICE - Corrige Saldo Dev. anual, não incorpora resíduo, recalculo anual da parcela';
      //  9 : Result := 'FIXA - Sem juros e sem correção';
      // 10 : Result := 'PRICE - Corrige Saldo Dev. mensal, parcela fixa com indice projetado';
      MsgDlg('Processo de antecipação não implementado para a forma de cálculo da condição de pagamento informada!','Aviso',mtWarning,[mbOk],0);
      Result := False;
      Exit;
   end;

   MsgDlg('Parcela(s) Integrada(s) com vencimento(s) futuro(s) NÃO pode(m) ser antecipada(s)!','Aviso',mtWarning,[mbOk],0);
   // Fim Marchetti - Pendencia 27460

end;

function TfrmExecAntecipa.SelecionaParcelas : Boolean;
begin
   Result := True;
   // Carrega filtros e Abre ParcFinancImov
   LimpaParametros(qryParc);
   if qryCondPagFORMACALCULO.AsInteger in [1,2,3,4,10,14] then
        qryParc.ParamByName('pDTLIMITE').AsString := FormatDateTime('DD/MM/YYYY',cmDtVencto.Date)
   else qryParc.ParamByName('pDTLIMITE').AsString := FormatDateTime('DD/MM/YYYY',cmDtVencto.Date -1);
   if dblcbCondPag.LookupValue > '' then
      qryParc.ParamByName('pIDCONDPAGIMOVEL').AsInteger := qryCondPagIDCONDINICIAL.AsInteger;
   if cbSinal.Checked  then qryParc.ParamByName('pSINAL').AsString := 'S';
   if cbGerada.Checked then qryParc.ParamByName('pGERA').AsString  := 'S';
   if cbProj.Checked   then qryParc.ParamByName('pPROJ').AsString  := 'S';
   if cbAmort.Checked  then qryParc.ParamByName('pAMORT').AsString := 'S';
   if cbVista.Checked  then qryParc.ParamByName('pVISTA').AsString := 'S';
   qryParc.Open;

   if qryParc.IsEmpty then begin
      Result := False;
      MsgDlg('Não Existem parcelas para serem antecipadas','Aviso',mtWarning,[mbOk],0);
   end else begin
      if VerificaParcelas then begin
         // Calcula Descrição da Parcela e Valor presente das parcelas
         CalcCamposVirtuais;
      end else begin
         Result := False;
      end;
   end;
end;


procedure TfrmExecAntecipa.CalcCamposVirtuais;
var i : Integer;
    dPagto : TDateTime;
begin
    // Marchetti - Pendencia 27460
    bMarcouParcela := False;
    // Fim Marchetti - Pendencia 27460

   i := 0;
   qryParc.First;
   while not qryParc.Eof do begin
      qryParc.Edit;
      // Carrega o Tipo de Parcela
      qryParcDESCPARCELA.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger,
                                                               qryParcFLGLANCINTEGRA.AsInteger);
      // Marca as parcelas a antecipar
      if i < dbSpnQtde.Value then begin
         // verifica se a parcela já foi paga
         if not ( FuncAlienacao.VerificaPagto(qryParcCODDOCUMENTO.AsInteger,dPagto) ) and
                ( qryParcFLGLANCINTEGRA.AsInteger = 0 ) then begin
            qryParcCHKANTECIPA.AsInteger := 1;
            // Marchetti - Pendencia 27460
            bMarcouParcela := True;
            // Fim Marchetti - Pendencia 27460
            inc(i);
         end;
      end;
      qryParc.Post;
      qryParc.Next;
   end;
   qryParc.First;
end;


procedure TfrmExecAntecipa.grdParcCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmExecAntecipa.grdParcTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecAntecipa.ntbAntecipaPageChanged(Sender: TObject);
begin
   inherited;
   case ntbAntecipa.PageIndex of
      0 : lblTitulo.Caption := 'Antecipação de Parcelas [ Seleção ]';
      1 : lblTitulo.Caption := 'Antecipação de Parcelas [ Parcelas ]';
      2 : lblTitulo.Caption := 'Antecipação de Parcelas [ Boleto ]';
   end;
end;

procedure TfrmExecAntecipa.btnContinuarClick(Sender: TObject);
begin
  inherited;
  case ntbAntecipa.PageIndex of
     0 : ContinuaSelecao;
  end;
end;

procedure TfrmExecAntecipa.btnVoltarClick(Sender: TObject);
begin
  inherited;
  case ntbAntecipa.PageIndex of
     1 : VoltaParcelas;
  end;
end;

procedure TfrmExecAntecipa.ContinuaSelecao;
begin
   if VerificaPreenchimentoSelecao then begin
      // Abre tabela com as parcelas a integrar
      if SelecionaParcelas then begin
         ntbAntecipa.PageIndex := ntbAntecipa.PageIndex + 1;
         btnVoltar.Enabled     := True;
         btnContinuar.Enabled  := False;
         // Marchetti - Pendencia 27460
//         btnConfirmar.Enabled  := True;
         btnConfirmar.Enabled := bMarcouParcela;
         // Fim Marchetti - Pendencia 27460
         grdParc.SetFocus;
      end;
   end;
end;


procedure TfrmExecAntecipa.VoltaParcelas;
begin
   ntbAntecipa.PageIndex := ntbAntecipa.PageIndex - 1;
   btnVoltar.Enabled     := False;
   btnContinuar.Enabled  := True;
   btnConfirmar.Enabled  := False;
end;


procedure TfrmExecAntecipa.btnConfirmarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   bResult := True;
   if MsgDlg('Confirma a Antecipação das Parcelas?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      try
         StartTransacao;
         bResult := AntecipaParcelas;
         if bResult then bResult := RecalculaParcela(qryCondPagIDCONDINICIAL.AsFloat);
         if bResult then begin
            CommitTransacao;
            MsgDlg('Parcelas Antecipadas com Sucesso','Informação',mtInformation,[mbOk],0);
            ntbAntecipa.PageIndex := 0;
            btnVoltar.Enabled     := False;
            btnConfirmar.Enabled  := False;
            btnContinuar.Enabled  := True;
         end else begin
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS na Antecipação das Parcelas','Erro',mtError,[mbOk],0);
         end;
      except
         RollBackTransacao;
         MsgDlg('Ocorreram ERROS na Antecipação das Parcelas','Erro',mtError,[mbOk],0);
      end;
   end;
end;

function TfrmExecAntecipa.AntecipaParcelas: Boolean;
var sSql, sMens : String;
begin
   Result := True;
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.Eof do begin
      if qryParcCHKANTECIPA.AsInteger = 1 then begin

         // Exclui a Integração do Lançamento
         if qryParcFLGLANCINTEGRA.AsInteger > 0 then begin
            if not FuncAlienacao.ExcluiIntegracao(qryParcCODDOCUMENTO.AsInteger,
                                                  qryParcPLNCODIGO.AsInteger,
                                                  qryParcIDPARCFINANCIMOV.AsInteger,
                                                  qryParcFLGTIPOLANC.AsInteger,
                                                  qryParcDATALANCINTEGRA.AsDateTime,
                                                  True,sMens) then begin
               MsgDlg(sMens,'Erro',mtError,[mbOk],0);
               Result := False;
               Break;
            end;
         end;

         // Marca o Tipo de Parcela e Altera a data de vencimento
         if Result then begin
            sSql := 'UPDATE PARCFINANCIMOV ' +
                    '   SET FLGTIPOLANC    = 9, ' +
                    '       DATAVENCIMENTO = TO_DATE(' + QuotedStr(DateToStr(cmDtVencto.Date)) + ') ' +
                    ' WHERE IDPARCFINANCIMOV = ' + IntToStr(qryParcIDPARCFINANCIMOV.AsInteger);
            Result := ExecutarQuery(dtmFinanciamento.qryAux, sSql);
         end;
      end;
      qryParc.Next;
   end;
   qryParc.EnableControls;
end;


function TfrmExecAntecipa.RecalculaParcela(iCondPag: Double): Boolean;
var dDataIni,dDataBase : TDateTime;
begin
   Result := True;
   dDataIni  := qryCondPagDATAVENCTOINICIAL.AsDateTime;
   dDataBase := FuncAlienacao.BuscaUltMesGerado(iCondPag);
   with dtmFinanciamento do begin
      LimpaParametros(qryParc);
      qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat := iCondPag;
      qryParc.Open;
      try
         FuncAlienacao.GeraParcela(iCondPag, dDataIni, dDataBase,
                                   DtmFinanciamento.qryParc);
         qryParc.ApplyUpdates;
         qryParc.CommitUpdates;
      except
         Result := False;
      end;
   end;
end;

function TfrmExecAntecipa.VerificaParcelas: Boolean;
var
 iQtde : integer;

begin
   Result := True;
   qryParc.First;

   while not qryParc.eof do begin
      if not qryParcDATAPAGAMENTO.IsNull then begin
         Result := False;
         break;
      end;
      qryParc.Next;
   end;

   qryParc.First;

   if not Result then begin
      MsgDlg('Existem parcelas pagas após a data de antecipação','Aviso',mtWarning,[mbOk],0);
   end;


// Início ------- Data: 26/01/2004 ----- Marcio Motta ----- Pendência: 15799
// Verifica se existem parcelas integradas após a data de antecipação
   Result := not FuncAlienacao.TemParcIntegrada(qryCondPagIDCONTRATOIMOVEL.AsInteger,cmDtVencto.DateTime, iQtde);

   if not Result then begin
      MsgDlg('Existem parcelas integradas após a data de antecipação','Aviso',mtWarning,[mbOk],0);
   end;
// Fim ------------------------ Marcio Motta -----------------------------------

end;


procedure TfrmExecAntecipa.FormCreate(Sender: TObject);
begin
  inherited;
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
end;

procedure TfrmExecAntecipa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
end;

end.
