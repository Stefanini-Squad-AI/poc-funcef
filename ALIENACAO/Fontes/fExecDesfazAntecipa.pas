unit fExecDesfazAntecipa;
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
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, wwdblook, CMDBLookupCombo, Grids,
  Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab,USistema;

type
  TfrmExecDesfazAntecipa = class(TfrmOkCancelar)
    gbContrato: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtComprador: TEdit;
    dblcbCondPag: TCMDBLookupCombo;
    molProposta1: TmolProposta;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryCondPagDATAVENCTOINICIAL: TDateTimeField;
    qryCondPagDSCCOND: TStringField;
    Panel5: TPanel;
    DBgrdBemOriginal: TwwDBGrid;
    qryParc: TwwQuery;
    dsParc: TwwDataSource;
    UpdParc: TUpdateSQL;
    qryParcCHKANTECIPA: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcNUMPARCELA: TFloatField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcDESCPARCELA: TStringField;
    qryParcFLGLANCINTEGRA: TFloatField;
    qryParcDATALANCINTEGRA: TDateTimeField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcPLNCODIGO: TFloatField;
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
    procedure dblcbCondPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBgrdBemOriginalDblClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344

    procedure AbreCondPag(iCond: Double);
    function  SelecionaParcelas(const iIdCondPag:Integer) : Boolean;
    procedure CalcCamposVirtuais;
    function  VerificaPreenchimento : Boolean;
    function  DesfazAntecipacao : Boolean;
    function  RecalculaParcela(iCondPag: Double): Boolean;
  public
    { Public declarations }
  end;

var
  frmExecDesfazAntecipa: TfrmExecDesfazAntecipa;
  bPeriodo : Boolean; // Helen - SOL: 172902/8221 KTN: 1577344
implementation

uses DFinanciamento, uDataBase, dBaseDados, uFuncoesImob, uMensErro,
     UFuncAlienacao;

{$R *.DFM}

procedure TfrmExecDesfazAntecipa.molProposta1btnBuscaPropClick( Sender: TObject);
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

procedure TfrmExecDesfazAntecipa.molProposta1btnLimpaPropClick(
  Sender: TObject);
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

procedure TfrmExecDesfazAntecipa.AbreCondPag(iCond: Double);
begin
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsFloat := iCond;
   qryCondPag.Open;
end;


function TfrmExecDesfazAntecipa.SelecionaParcelas(const iIdCondPag:Integer): Boolean;
begin
   Result := True;
   // Carrega filtros e Abre ParcFinancImov
   LimpaParametros(qryParc);
   qryParc.ParamByName('pIDCONDPAGIMOVEL').AsFloat := iIdcondPag;
   qryParc.Open;

   // Calcula Descrição da Parcela e Valor presente das parcelas
   if not qryParc.IsEmpty then CalcCamposVirtuais;
end;

procedure TfrmExecDesfazAntecipa.CalcCamposVirtuais;
begin
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.Eof do begin
      qryParc.Edit;
      // Carrega o Tipo de Parcela
      qryParcDESCPARCELA.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger,
                                                               qryParcFLGLANCINTEGRA.AsInteger);
      qryParc.Post;
      qryParc.Next;
   end;
   qryParc.First;
   qryParc.EnableControls;
end;


procedure TfrmExecDesfazAntecipa.dblcbCondPagCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblcbCondPag.LookupValue > '' then
     SelecionaParcelas(qryCondPagIDCONDINICIAL.AsInteger);
end;

procedure TfrmExecDesfazAntecipa.DBgrdBemOriginalDblClick(Sender: TObject);
var dPagto : TDateTime;
begin
   inherited;
   // Marca ou Desmarca as parcelas para integração
   if not qryParc.IsEmpty then begin
      if not FuncAlienacao.VerificaPagto(qryParcCODDOCUMENTO.AsInteger,dPagto) then begin
         qryParc.Edit;
         qryParcCHKANTECIPA.AsInteger := (qryParcCHKANTECIPA.AsInteger Xor 1);
         qryParc.Post;
      end else begin
         MsgDlg('Parcela paga em ' + DateToStr(dPagto) + ', não pode ser desfeita.','Aviso',mtWarning,[mbOk],0);
      end;
   end;
end;

procedure TfrmExecDesfazAntecipa.DBgrdBemOriginalCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmExecDesfazAntecipa.DBgrdBemOriginalTopRowChanged(
  Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecDesfazAntecipa.FormShow(Sender: TObject);
begin
   inherited;
   AbreCondPag(-1);
   SelecionaParcelas(-1);
   molProposta1.btnBuscaProp.SetFocus;
end;

procedure TfrmExecDesfazAntecipa.bbtnCancelarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   bResult := True;
   bPeriodo :=  False; // Helen - SOL: 172902/8221 KTN: 1577344
   if not VerificaPreenchimento then begin
      MsgDlg('Selecione a parcela para desfazer a antecipação','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;

   if MsgDlg('Confirma a Exclusão da Antecipação das Parcelas?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
      try
         StartTransacao;
         bResult := DesfazAntecipacao;
         if bResult then bResult := RecalculaParcela(qryCondPagIDCONDINICIAL.AsFloat);
         if bResult then begin
            CommitTransacao;
            MsgDlg('Antecipação desfeita com Sucesso','Informação',mtInformation,[mbOk],0);
            SelecionaParcelas(StrToInt(dblcbCondPag.LookupValue));
         end else begin
            RollBackTransacao;
            if bPeriodo = False then // Helen - SOL: 172902/8221 KTN: 1577344
               MsgDlg('Ocorreram ERROS no desfazer da Antecipação das Parcelas','Erro',mtError,[mbOk],0);
         end;
      except
         RollBackTransacao;
         MsgDlg('Ocorreram ERROS no desfazer da Antecipação das Parcelas','Erro',mtError,[mbOk],0);
      end;
   end;
end;


function TfrmExecDesfazAntecipa.DesfazAntecipacao: Boolean;
var sSql,sMens : String;
begin
   Result := True;
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.Eof do begin
      if qryParcCHKANTECIPA.AsInteger = 1 then begin
         // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
         if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryParcDATAVENCIMENTO.asString) then
         begin
             MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
             Result   := False;
             bPeriodo := True;
             Break;
         end;
         // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

         // Exclui a Integração do Lançamento
         if not qryParcFLGLANCINTEGRA.IsNull then begin
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
                    '   SET FLGTIPOLANC = 4 ' +
                    ' WHERE IDPARCFINANCIMOV = ' + IntToStr(qryParcIDPARCFINANCIMOV.AsInteger);
            Result := ExecutarQuery(dtmFinanciamento.qryAux, sSql);
         end;
      end;
      qryParc.Next;
   end;
   qryParc.EnableControls;
end;

function TfrmExecDesfazAntecipa.VerificaPreenchimento: Boolean;
begin
   Result := False;
   qryParc.DisableControls;
   qryParc.First;
   while not qryParc.eof do begin
      if qryParcCHKANTECIPA.AsInteger = 1 then Result := True;
      qryParc.Next;
   end;
end;

function TfrmExecDesfazAntecipa.RecalculaParcela(iCondPag: Double): Boolean;
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


procedure TfrmExecDesfazAntecipa.FormCreate(Sender: TObject);
begin
  inherited;
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
end;

procedure TfrmExecDesfazAntecipa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
end;

end.
