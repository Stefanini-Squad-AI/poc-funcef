unit FCadAmortizacao;

// ------------------------------------------------------------------------------------------------
//
//	   Cadastro de Amortização Extra do Saldo Devedor
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  01/11/2001
//	Data de Término   :
//
// -------------------------------------------------------------------------------------------------
//N. SOL..........: 271511
//N. PPM .........: 1397801
//Data............: 06/05/2016
//Responsável.....: Felipe A. Santos
//Descrição.......: Corrigindo as validações da data de amortização.
// -------------------------------------------------------------------------------------------------
//N. SOL..........: 261159
//N. PPM .........: 1056742
//Data............: 10/09/2015
//Responsável.....: Fernando Xavier  e Felipe A. Santos
//Descrição.......: O sistema está validadno o saldo do contrato incorretamente, ele procura o saldo
//                  menor que a data da amortização quando deveria ser o inverso.
// -------------------------------------------------------------------------------------------------
//Rotina..........: BuscaCondPag
//N. Sol..........: 145690
//N. Kintana......: 980821
//Data............: 19/10/2010
//Responsável.....: Felipe de Oliveira
//Descrição.......: comentada toda as chamadas da função saldodevedor para não ocorrer o conflito com a busca do mesmo
// já realizada por outra função
// -------------------------------------------------------------------------------------------------
//N. Sol..........: 137729
//N. Kintana......: 898731
//Data............: 06/09/2010
//Responsável.....: Felipe de Oliveira / Cássio Camargo
//Descrição.......: verifica antes de selecionar a condição de pagto e amortizar se a parcela está integrada
//                  modificada a query  qryCondPag para q isso ocorra
// -------------------------------------------------------------------------------------------------
//Rotina..........: Lançamento de Amortização
//N. Sol..........: 91849 e 95458
//N. Kintana......: 390045
//Data............: 05/11/2008
//Responsável.....: Emerson S.
//Descrição.......: Problema ao lançar Amortização para contratos com 1 parcela e várias amortizacoes
//                  porem não possui JUROS, MULTA E NEM CORREÇOE (TIPO 9)



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  mProposta, wwdblook, CMDBLookupCombo, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, uFuncAlienacao ,uCMTypes, uComunsImobiliarioDB,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;


type
  TfrmCadAmortizacao = class(TFrmCadastroGridCS)
    Panel1: TPanel;
    Label1: TLabel;
    edtComprador: TEdit;
    Label2: TLabel;
    dblcCondPag: TCMDBLookupCombo;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    Label3: TLabel;
    edDataAni: TCMDateTimePicker;
    Label4: TLabel;
    edValAvali: TDBRealEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtNumProp: TEdit;
    edtNomProp: TEdit;
    qryVerifParc: TwwQuery;
    qryVerifParcIDPARCFINANCIMOV: TFloatField;
    qryVerifParcIDCONDPAGIMOVEL: TFloatField;
    qryVerifParcVLRSALDODEVEDOR: TFloatField;
    qryVerifParcDATAVENCIMENTO: TDateTimeField;
    qryIDPARCFINANCIMOV: TFloatField;
    qryIDCONDPAGIMOVEL: TFloatField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryVLRPRESTACAO: TFloatField;
    qryVLRSALDODEVEDOR: TFloatField;
    qryFLGTIPOLANC: TFloatField;
    qryIDINDCORRECAO: TFloatField;
    qryFATORCORRECAO: TFloatField;
    qryCAL_SALDOPRORATA: TFloatField;
    qryCAL_SALDOPOSAMORT: TFloatField;
    qryCAL_SALDODESCAP: TFloatField;
    qryCAL_PROPORCAO: TFloatField;
    qryFLGLANCINTEGRA: TFloatField;
    qryVLRAMORTIZACAO: TFloatField;
    qryNUMPARCELA: TFloatField;
    qryCondPagDSCCOND: TStringField;
    qryVerifDataAmort: TwwQuery;
    qryCAL_SALDOANT: TFloatField;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryCondPagDATAVENCTOINICIAL: TDateTimeField;
    qryVLRCORRSALDO: TFloatField;
    qryVLRNOMINAL: TFloatField;
    qryVerifParcCondPagto: TwwQuery;
    qryVerifParcCondPagtoIDPARCFINANCIMOV: TFloatField;
    qryVerifParcCondPagtoIDCONDPAGIMOVEL: TFloatField;
    qryVerifParcCondPagtoVLRSALDODEVEDOR: TFloatField;
    qryVerifParcCondPagtoDATAVENCIMENTO: TDateTimeField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblcCondPagCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataAniChange(Sender: TObject);
    procedure edDataAniCloseUp(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }

    CondPag             : TCondPag;
    ComunsImobiliarioDB : TComunsImobiliarioDB;
    sFiltroInd          : String;
    fVlrSaldoAnt : Extended;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344

    procedure Sel(n : Double);
    function  VeriCondPag : Boolean;
    function  CalcAmortizacao : Boolean;
    function  RecalculaParcela(iCondPag: Double): Boolean;
    function  DataAmortizacaoOK : Boolean;
    function  BuscaSaldoDevAnterior(const iCondPag: Integer; const dAmort, dVenctoIni: TDateTime;
                                    var fVlrSaldoAnt: Extended): Boolean;

    //--Emerson KT 390045, SOL 91849-----------------//
    function VerificaSePodeAmortizar (iCondPagImovel : Double): boolean;
    function SaldoDevedor ( IdCondPag : double) : double;
    //-----------------------------------------------//
    
  public
    { Public declarations }

  end;

var
  frmCadAmortizacao: TfrmCadAmortizacao;

implementation
{$R *.DFM}
uses uMensErro, uDataBase, UFuncoesImob, DFinanciamento, UDiasInUteis, uSistema,
     dBaseDados, uCalcDocumento, uComunsImobiliario, dMS;

procedure TfrmCadAmortizacao.FormCreate(Sender: TObject);
begin
   inherited;
   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, sistema.IDEspAcesso, Sistema.UsaPlanoPatro);
   ComunsImobiliarioDB.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                   ComunsImobiliario.MensErroMT);

   sFiltroInd := MontaSelect.Filtro.Text;
   MontaSelect.Filtro.Add('CONTRATOIMOVEL.FLGSTATUS = ''V''');

   //--Emerson, incio, KT 390045, SOL 91849 ----//
   FuncAlienacao.SetDataAmortizacao(0);
   FuncAlienacao.SetStadoDelete(false);
   //--Emerson, Fim ----------------------------//

   fVlrSaldoAnt := 0;
   // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(ComunsImobiliarioDB);

end;

procedure TfrmCadAmortizacao.FormDestroy(Sender: TObject);
begin
   FreeAndNil( ComunsImobiliarioDB );
   FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
   inherited;
end;


procedure TfrmCadAmortizacao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));
      edtNumProp.Text   := MontaSelect.ValoresChave[1];
      edtNomProp.Text   := MontaSelect.ValoresChave[2];
      edtComprador.Text := MontaSelect.ValoresChave[3];
   end;
end;

procedure TfrmCadAmortizacao.Sel(n: Double);
begin
   LimpaParametros(qryCondPag);
   qryCondPag.Params[0].AsFloat := n;
   qryCondPag.Open;

   LimpaParametros(qry);
   qry.Open;


end;

procedure TfrmCadAmortizacao.dblcCondPagCloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   // procura a condição de pagamento mais recente
   if not FuncAlienacao.BuscaCondPag(qryCondPagIDCONDINICIAL.AsInteger, -1, -1, True, CondPag) then begin
      Exit;
   end;

   LimpaParametros(qry);
   qry.Params[0].AsFloat := qryCondPagIDCONDINICIAL.AsInteger;
   qry.Open;

   if qry.IsEmpty then begin
      CmeCadastro.Operacao := opVazio;
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;
   CmeCadastro.AtualizaBotoes(Self);
   dbGrd.SetFocus;
   edDataAni.Enabled := True;
end;

function TfrmCadAmortizacao.VeriCondPag: Boolean;
begin
   Result := True;
   if MontaSelect.RetornouValor = False then begin
      MsgDlg('Selecione um Contrato','Erro',mtError,[mbOK],0);
      Result := False;
      Exit;
   end;
   if dblcCondPag.Text = '' then begin
      MsgDlg('Selecione uma Condição de Pagamento','Erro',mtError,[mbOK],0);
      dblcCondPag.SetFocus;
      Result := False;
      Exit;
   end;
   if Result = True then begin
      dblcCondPag.Enabled := False;
   end;
end;

procedure TfrmCadAmortizacao.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   dblcCondPag.Enabled := True;
   RecalculaParcela(qryCondPagIDCONDINICIAL.AsFloat);
end;

procedure TfrmCadAmortizacao.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  dblcCondPag.Enabled := True;
end;

procedure TfrmCadAmortizacao.sbtnInserirClick(Sender: TObject);
begin
   if VeriCondPag then begin
      inherited;
   end else begin
      sbtnInserir.Down := False;
   end;
end;

procedure TfrmCadAmortizacao.sbtnAlterarClick(Sender: TObject);
begin
   if VeriCondPag then begin
      inherited;
   end else begin
      sbtnAlterar.Down := False;
   end;
end;

procedure TfrmCadAmortizacao.sbtnApagarClick(Sender: TObject);
begin

   if VeriCondPag then begin
      if qryFLGLANCINTEGRA.AsInteger = 0 then begin
         inherited;
         dblcCondPag.Enabled := True;

      end else begin
         MsgDlg('O lançamento já foi integrado, efetue primeiro e estorno do lançamento','Erro',mtError,[mbOK],0);
         sbtnApagar.Down := False;
      end;
   end else begin
      sbtnApagar.Down := False;
   end;
end;

procedure TfrmCadAmortizacao.CmeCadastroInsert(Sender: TObject);
var fValorAuxi : double;

begin
   inherited;
  begin
   qryIDPARCFINANCIMOV.AsFloat := LeUltRegistro(nil,'PARCFINANCIMOV');
   qryIDCONDPAGIMOVEL.AsFloat  := qryCondPagIDCONDINICIAL.AsFloat;
   qryFLGLANCINTEGRA.AsInteger := 0;
   qryNUMPARCELA.AsInteger     := 0;
   qryFLGTIPOLANC.AsInteger    := 5;
  end; 
end;

procedure TfrmCadAmortizacao.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
  iQtde : integer;
  fValorAuxi : double;
  fIDCondImovel : double;
begin
   inherited;

   fIDCondImovel := 0;

   Accept := True;
   if qryVLRPRESTACAO.AsFloat = 0 then begin
      MsgDlg('Valor da Amortização não pode ser zero','Erro',mtError,[mbOK],0);
      Accept := False;
      Exit;
   end;

   if qryDATAVENCIMENTO.IsNull then begin
      MsgDlg('Data da Amortização deve ser preenchida','Erro',mtError,[mbOK],0);
      Accept := False;
      Exit;
   end;

   if DataAmortizacaoOK = False then begin
      MsgDlg('Existem pagamentos efetuados superiores a data informada ou ' +#13+
             'Amortizações extras com data posterior. ' +#13+
             'Altere a Data da Amortização','Erro',mtError,[mbOK],0);
      Accept := False;
      Exit;
   end;

// Início ------- Data: 26/01/2004 ----- Marcio Motta ----- Pendência: 15799
   if FuncAlienacao.TemParcIntegrada(qryCondPagIDCONTRATOIMOVEL.AsInteger,edDataAni.DateTime, iQtde) then begin
      MsgDlg('Existem percelas integradas superiores a data informada. Altere a Data da Amortização','Erro',mtError,[mbOK],0);
      Accept := False;
      Exit;
   end;
// Fim ------------------------ Marcio Motta -----------------------------------

   if not CalcAmortizacao then begin
      MsgDlg('Não existe parcela gerada no mes da amortização','Erro',mtError,[mbOK],0);
      Accept := False;
      Exit;
   end;


   //--emerson------KT 390045, SOL 91849 ---------//
    if qryVerifParcIDCONDPAGIMOVEL.AsFloat = 0  then
    begin
      fIDCondImovel := qryCondPagIDCONDINICIAL.AsFloat;
    end
    else
    begin
      fIDCondImovel := qryVerifParcIDCONDPAGIMOVEL.AsFloat;
    end;
// Felipe de Oliveira SOL 145690 Ktn980821
    //if qryVLRAMORTIZACAO.AsFloat  >  SaldoDevedor(fIDCondImovel) then
    if qryVLRAMORTIZACAO.AsFloat  >  fVlrSaldoAnt then
    begin
      MsgDlg('Não é permitido efetuar um lançamento de uma Amortização, maior que o saldo devedor!','Aviso',mtWarning,[mbOK],0);
      Accept := False;
      Exit;
    end;
    //--------------------------------------------//

end;

function TfrmCadAmortizacao.CalcAmortizacao : Boolean;
var rProRata     : Double;
    iDia, iMes, iAno : Word;
begin
   Result       := True;
   rProRata     := 1;
   fVlrSaldoAnt := 0;

   BuscaSaldoDevAnterior(qryCondPagIDCONDINICIAL.AsInteger,qryDATAVENCIMENTO.AsDateTime,
                         CondPag.dDataVencimento, fVlrSaldoAnt);
// Felipe de Oliveira SOL 145690 Ktn980821
//   fVlrSaldoAnt :=SaldoDevedor(CondPag.fIDCondPagImovel);
   if (qryVerifParc.RecordCount > 0) or (qryVerifParcCondPagto.recordcount > 0) then
   begin
      rProRata := ComunsImobiliarioDB.FatorCorrecao(CondPag.iIdIndCorr,
                                                    qryVerifParcDATAVENCIMENTO.asDateTime + 1,
                                                    qryDATAVENCIMENTO.AsDateTime,
                                                    False, CondPag.iMesRefReajuste, True);
// Felipe de Oliveira SOL 145690 Ktn980821
       //--Emerson, KT 390045, SOL 91849, Busca o Saldo devedor. Foi implementada esta linha pois caso tenho MAIS DE UMA AMORTIZACAO p uma UNICA PARCELA--//
//       fVlrSaldoAnt :=SaldoDevedor(CondPag.fIDCondPagImovel);
   end
   else
      fVlrSaldoAnt := CondPag.fSaldoDev;


   if CondPag.iIDIndCorr > 0 then
      qryIDINDCORRECAO.AsInteger := CondPag.iIDIndCorr
   else
      qryIDINDCORRECAO.Clear;



   qryVLRAMORTIZACAO.AsFloat  := qryVLRPRESTACAO.AsFloat;
   qryVLRNOMINAL.AsFloat      := qryVLRPRESTACAO.AsFloat;
   qryFATORCORRECAO.AsFloat   := rProRata;

   if (fVlrSaldoAnt > 0) and (not qryFATORCORRECAO.IsNull) then
   begin

      qryCAL_SALDOPRORATA.AsFloat  := fVlrSaldoAnt * qryFATORCORRECAO.asFloat;
      qryCAL_SALDOPOSAMORT.AsFloat := qryCAL_SALDOPRORATA.AsFloat - qryVLRPRESTACAO.asFloat;
      qryCAL_SALDODESCAP.AsFloat   := qryCAL_SALDOPOSAMORT.AsFloat / qryFATORCORRECAO.asFloat;
      qryCAL_PROPORCAO.AsFloat     := qryCAL_SALDODESCAP.AsFloat / fVlrSaldoAnt;


      DecodeDate(CondPag.dDataVencimento, iAno, iMes, iDia);
      if (Sistema.TipoCliente = 19991) and (iAno = 2025) then begin
         qryVLRCORRSALDO.AsFloat := ComunsImobiliario.Arredonda( qryCAL_SALDOPRORATA.AsFloat - fVlrSaldoAnt, 2 );
      end else begin
         qryVLRCORRSALDO.AsFloat := ComunsImobiliario.Arredonda( qryCAL_SALDODESCAP.AsFloat - (fVlrSaldoAnt - qryVLRPRESTACAO.AsFloat), 2 );
      end;

      if CondPag.iFormaCalculo = 14 then qryVLRCORRSALDO.Clear;

   end;

   // Específico FUNCEF para ajuste do contrato TUIUTI - deverá ser criado parametro no contrato
   if (Sistema.TipoCliente = 19991) and (iAno = 2025) then begin
      qryVLRSALDODEVEDOR.AsFloat := qryCAL_SALDOPOSAMORT.AsFloat;
   end else begin
      qryVLRSALDODEVEDOR.AsFloat := qryCAL_SALDODESCAP.AsFloat;
   end;
end;

function TfrmCadAmortizacao.BuscaSaldoDevAnterior(const iCondPag: Integer; const dAmort, dVenctoIni: TDateTime;
                                                  var fVlrSaldoAnt: Extended): Boolean;
var sMes,sAno : String;
    iMes,iAno : Integer;
begin
   Result := True;
   // abre a parcela do vencimento anterior a amortização para pegar o saldo devedor
   try
      // SOL 261159 PPM 1056742
      LimpaParametros(qryVerifParc);
      qryVerifParc.ParamByName('pIDCONDPAGIMOVEL').AsInteger := iCondPag;
      qryVerifParc.ParamByName('pDTAMORTIZACAO').AsDateTime  := dAmort;
      qryVerifParc.Open;

      if qryVerifParcVLRSALDODEVEDOR.AsFloat > 0 then
      begin
         fVlrSaldoAnt := qryVerifParcVLRSALDODEVEDOR.AsFloat;
      end
      else
      begin
         LimpaParametros(qryVerifParcCondPagto);
         qryVerifParcCondPagto.ParamByName('pIDCONDPAGIMOVEL').AsInteger := iCondPag;
         qryVerifParcCondPagto.ParamByName('pDTAMORTIZACAO').AsDateTime  := dAmort;
         qryVerifParcCondPagto.Open;

         fVlrSaldoAnt := qryVerifParcCondPagtoVLRSALDODEVEDOR.AsFloat;
      end;
      // SOL 261159 PPM 1056742
   except
      Result := False;
   end;
end;


function TfrmCadAmortizacao.RecalculaParcela(iCondPag : Double) : Boolean;
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
         StartTransacao;
         FuncAlienacao.GeraParcela(iCondPag, dDataIni, dDataBase, DtmFinanciamento.qryParc);
         qryParc.ApplyUpdates;
         qryParc.CommitUpdates;
         CommitTransacao;
      except
         RollBackTransacao;
         raise;
      end;
   end;

end;



procedure TfrmCadAmortizacao.qryCalcFields(DataSet: TDataSet);
var fVlrSaldoAntCalc : Extended; // alterado o nome da variavel pois estava interferindo no Saldo devedor da amortização, Felipe A. Santos SOL 261159 PPM 1056742
begin
   inherited;

   fVlrSaldoAntCalc := 0;
   BuscaSaldoDevAnterior(qryIDCONDPAGIMOVEL.AsInteger,qryDATAVENCIMENTO.AsDateTime,
                         CondPag.dDataVencimento, fVlrSaldoAntCalc); // Felipe A. Santos SOL 261159 PPM 1056742  alterado nome váriavel para fVlrSaldoAntCalc

// Felipe de Oliveira SOL 145690 Ktn980821
   //--Emerson, KT 390045, SOL 91849, Busca o Saldo devedor. Foi implementada esta linha pois caso tenho MAIS DE UMA AMORTIZACAO p uma UNICA PARCELA--//
   //fVlrSaldoAnt :=SaldoDevedor(CondPag.fIDCondPagImovel);


   // alterado por Felipe A. Santos SOL 261159 PPM 1056742 - incluído (qryVerifParcCondPagto.RecordCount <= 0) 
   if (qryVerifParc.RecordCount <= 0) and (qryVerifParcCondPagto.RecordCount <= 0) then
      fVlrSaldoAntCalc := CondPag.fSaldoDev;

   qryCAL_SALDOANT.AsFloat := fVlrSaldoAntCalc; // Felipe A. Santos SOL 261159 PPM 1056742  alterado nome váriavel para fVlrSaldoAntCalc

   if (fVlrSaldoAntCalc > 0) and (not qryFATORCORRECAO.IsNull) then begin // Felipe A. Santos SOL 261159 PPM 1056742  alterado nome váriavel para fVlrSaldoAntCalc
      qryCAL_SALDOPRORATA.AsFloat  := fVlrSaldoAntCalc * qryFATORCORRECAO.asFloat; // Felipe A. Santos SOL 261159 PPM 1056742  alterado nome váriavel para fVlrSaldoAntCalc
      qryCAL_SALDOPOSAMORT.AsFloat := qryCAL_SALDOPRORATA.AsFloat - qryVLRPRESTACAO.asFloat;
      qryCAL_SALDODESCAP.AsFloat   := qryCAL_SALDOPOSAMORT.AsFloat / qryFATORCORRECAO.asFloat;
      qryCAL_PROPORCAO.AsFloat     := qryCAL_SALDODESCAP.AsFloat / fVlrSaldoAntCalc; // Felipe A. Santos SOL 261159 PPM 1056742  alterado nome váriavel para fVlrSaldoAntCalc
   end;


end;


function TfrmCadAmortizacao.DataAmortizacaoOK: Boolean;
begin
  Result := True;
   with qryVerifDataAmort do begin
      LimpaParametros(qryVerifDataAmort);
      ParamByName('PIDCONDPAGIMOVEL').AsFloat := qryCondPagIDCONDINICIAL.AsFloat;
      Open;

      // Alterado por Felipe A. Santos - SOL 271511 PPM 1397801  - início
      if not(IsEmpty) then
      begin
        if qryDATAVENCIMENTO.AsDateTime < FieldByName('DATALIMITE').AsDateTime then
           Result := False;
      end
      else
        Result := True;

       // Alterado por Felipe A. Santos - SOL 271511 PPM 1397801 - fim
   end;
end;




procedure TfrmCadAmortizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  MontaSelect.Filtro.Text := sFiltroInd;
end;

procedure TfrmCadAmortizacao.edDataAniChange(Sender: TObject);

begin
  inherited;
    //--Emerson, incio, KT 390045, SOL 91849,-----//
    if (edDataAni.DateTime>0) then
    begin
          FuncAlienacao.SetDataAmortizacao(edDataAni.DateTime);
    end;
    //--Emerson, ---------------------------------//
end;


//--------------------------------------------
//Rotina..........: VerificaSePodeAmortizar
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 05/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Verifica atraves da data da ultima parcela se é possível entrar com
//                  uma amortização.
function TfrmCadAmortizacao.VerificaSePodeAmortizar (iCondPagImovel : Double): boolean;
var sSql     : String;
    iIdParc  : integer;
begin
    // Felipe A. Santos - SOL 271511 PPM 1397801  - início
    sSQL := 'SELECT MAX(DATAVENCIMENTO) AS DATAVENCIMENTO ' +
            '  FROM PARCFINANCIMOV ' +
            ' WHERE IDCONDPAGIMOVEL = ' + FloatToStr(iCondPagImovel) +
            '   AND FLGTIPOLANC <> 11 ';
     // Felipe A. Santos - SOL 271511 PPM 1397801  - FIM
     // Felipe A. Santos - SOL 271511 PPM 1397801  - início comentário
{   // Procura a condição de pagamento original
   sSql := 'SELECT DATAVENCIMENTO, FLGTIPOLANC ' +
           '  FROM parcfinancimov  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(iCondPagImovel) +
//Felipe de oliveira Sol 145690 Kintana 980821
// alguns contratos não tem flagtipolanc = 3  assim ele não traria data alguma
// ao modificar essa condição ele sempre pega a ultima data.
//           ' AND FLGTIPOLANC = 3' +
           ' AND FLGTIPOLANC <> 11' +
           ' ORDER BY  DATAVENCIMENTO,NUMPARCELA ';   }
    // Felipe A. Santos - SOL 271511 PPM 1397801  - fim comentário

    if FazQuery(dtmFinanciamento.qryAux,sSql) then
   begin
      dtmFinanciamento.qryAux.Last;

      if dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime > FuncAlienacao.GetDataAmortizacao then
      begin
           Result := true;
      end
      else
      begin
           Result := false;
      end;
   end
   else
   begin
       Result := false;
   end;
end;


//--Emerson, incio, KT 390045, SOL 91849, crítica sobre lançamento de amortizações apos a ultima data do contrato gerada--//
procedure TfrmCadAmortizacao.edDataAniCloseUp(Sender: TObject);
var
  sDataParcela : string;  // Felipe A. Santos - SOL 271511 PPM 1397801
begin
  inherited;

  sDataParcela := '';  // Felipe A. Santos - SOL 271511 PPM 1397801

  //Cássio - SOl Nº114331 KINTANA Nº533939 - Início
  if (Length(trim(edDataAni.Text)) > 0) then
  begin
  //Cássio - SOl Nº114331 KINTANA Nº533939 - Fim
    //if not VerificaSePodeAmortizar( qryIDCONDPAGIMOVEL.AsFloat ) then   // Felipe A. Santos - SOL 271511 PPM 1397801  
    if not(VerificaSePodeAmortizar(qryCondPagIDCONDPAGIMOVEL.AsFloat)) then  // Felipe A. Santos - SOL 271511 PPM 1397801
    begin

     // Felipe A. Santos - SOL 271511 PPM 1397801 - início
     if dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime > 0 then
        sDataParcela := dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsString
     else
        sDataParcela := 'Parcela Nula';

     //MsgDlg('Não é permitido efetuar um lançamento após a última parcela gerada ('+DateToStr(dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime)+')','Aviso',mtWarning,[mbOK],0);
     MsgDlg('Não é permitido efetuar um lançamento após a última parcela gerada ('+sDataParcela+')','Aviso',mtWarning,[mbOK],0);
     // Felipe A. Santos - SOL 271511 PPM 1397801 - fim

     edDataAni.SetFocus;
     edDataAni.DateTime := 0;
     //Cássio - SOl Nº114331 KINTANA Nº533939 - Início
     qryDATAVENCIMENTO.AsDateTime := 0;
     //Cássio - SOl Nº114331 KINTANA Nº533939 - Fim
    end;     
  end;
end;


procedure TfrmCadAmortizacao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    //--Emerson, incio, KT 390045, SOL 91849,
    FuncAlienacao.SetDataAmortizacao(0);
    FuncAlienacao.SetStadoDelete(false);
    //--Emerson, Fim --//
end;
//--Emerson, Fim --------------------------------------//



//--------------------------------------------
//Rotina..........: SaldoDevedor
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 05/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Devolve o saldo devedor
function TfrmCadAmortizacao.SaldoDevedor( IdCondPag : double) : double;
var sSql        : String;
    iIdParc     : integer;
    fValorSDeve : double;

begin

   Result := 0;

   LimpaParametros(qryVerifParc);
   qryVerifParc.ParamByName('pIDCONDPAGIMOVEL').AsString := FloatToStr(IdCondPag);
   qryVerifParc.ParamByName('pDTAMORTIZACAO').AsDateTime  := qryCondPagDATAVENCTOINICIAL.AsDateTime;
   qryVerifParc.Open;

   sSql := 'SELECT DATAVENCIMENTO, VLRSALDODEVEDOR, VLRAMORTIZACAO, FLGTIPOLANC  ' +
           '  FROM PARCFINANCIMOV  ' +
           ' WHERE IDCONDPAGIMOVEL  = ' + FloatToStr(IdCondPag)+
           ' AND FLGTIPOLANC <> 11 ' +
           ' AND DATAVENCIMENTO = (SELECT MAX(P.DATAVENCIMENTO) AS DATAVENCIMENTO ' +
           ' FROM PARCFINANCIMOV P '+
           ' WHERE P.IDCONDPAGIMOVEL =  '+ FloatToStr(IdCondPag)+
           '   AND P.FLGTIPOLANC <> 11 ' +
           '   AND P.DATAVENCIMENTO < '+ QuotedStr(DatetoStr(qryCondPagDATAVENCTOINICIAL.AsDateTime))+
           ' ) ORDER BY DATAVENCIMENTO, NUMPARCELA ';

 if FazQuery(dtmFinanciamento.qryAux,sSql) then
 begin
   fValorSDeve := 0;
   dtmFinanciamento.qryAux.First;
   while (not dtmFinanciamento.qryAux.Eof) do
   begin
//        if  dtmFinanciamento.qryAux.FieldbyName('DATAVENCIMENTO').AsDateTime > FuncAlienacao.GetDataAmortizacao then
        if  qryCondPagDATAVENCTOINICIAL.AsDateTime > FuncAlienacao.GetDataAmortizacao then
        begin
//            fValorSDeve := fValorSDeve + dtmFinanciamento.qryAux.FieldbyName('VLRAMORTIZACAO').asFloat;
            fValorSDeve := fValorSDeve + dtmFinanciamento.qryAux.FieldbyName('VLRSALDODEVEDOR').asFloat;
        end;
        dtmFinanciamento.qryAux.Next;
   end;

   Result := fValorSDeve;
 end
 else
 begin
     Result :=  qryVerifParcVLRSALDODEVEDOR.asFloat;
 end

end;

procedure TfrmCadAmortizacao.CmeCadastroDelete(Sender: TObject);
begin

    //--Emerson, incio, KT 390045, SOL 91849,
    FuncAlienacao.SetStadoDelete(true);
    FuncAlienacao.SetDataAmortizacao(qryDATAVENCIMENTO.AsDateTime);
    //--Emerson, Fim --//
  inherited;


end;

procedure TfrmCadAmortizacao.bbtnConfirmarClick(Sender: TObject);
begin
   // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
   if (Length(trim(edDataAni.Text)) > 0) then
   begin
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edDataAni.Text) then
      begin
         edDataAni.SetFocus;
         exit;
      end;
   end;
   // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
  inherited;

end;

end.
