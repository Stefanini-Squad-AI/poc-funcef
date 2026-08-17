unit FExecTrataParcAtraso;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
WO          : 4230
Responsável : Leandro Pocebon
Data        : 10/11/2023
Descrição   : Implementar fitro por data vencimento
--------------------------------------------------------------------------------
SIG         : 118975
Responsável : Everson Cunha
Data        : 17/09/2021
Descrição   : Implementar mensagem para confirmação de tratamento sem ter sele-
              cionado um contrato
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
--------------------------------------------------------------------------------
Responsável : Leandro S. Costa
SOL         : 162548
Kintana     : 1381842
Data        : 08/08/2011
Descrição   : 1º Incluido Hora, no total de tempo demorado pra finalizar o processo...
              2º Quando ocorrer um erro na procedure, será exibido na tela o erro ...
              3º Na tela Principal foi alterado o nome do Menu para: Tratamento de Parcelas em Atraso
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 161249 Kintana 1358314
Responsável : Fanuel Junior
Data        : 02/08/2010
Descrição   : Criação da tela Tratamento Parcelas em Atraso
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, Wwdatsrc, DBTables,
   Wwquery, wwdbdatetimepicker, CMDateTimePicker, TREdit, Mask, DBCtrls,
   Grids, Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdblook,
   FSairAjudaImob, MontaSelect, DBGrids, mContratoEmptmo,
   wwdbedit, Wwdbspin, uTypesEmptmo, mMutuario,
   uCtrlContab, uCtrlPadroes, Provider, DBClient, uCMClientDataSet,
   wwstorep;

type
  TfrmExecTrataParcAtraso = class(TfrmSairAjudaImob)
    molContratoEmptmo: TmolContratoEmptmo;
    Panel5: TPanel;
    Label4: TLabel;
    chkCompetencia: TCheckBox;
    dbspAnoComp: TwwDBSpinEdit;
    cboMesCompet: TComboBox;
    Panel2: TPanel;
    Label3: TLabel;
    chkCobranca: TCheckBox;
    dbspAnoCob: TwwDBSpinEdit;
    cboMesCobranca: TComboBox;
    grpCompetencia: TGroupBox;
    Label15: TLabel;
    Label6: TLabel;
    DBspnAno: TwwDBSpinEdit;
    cboMes: TComboBox;
    edtDataLancto: TwwDBDateTimePicker;
    lblTitulo: TfcLabel;
    chkInArquivo: TCheckBox;
    chkNotInArquivo: TCheckBox;
    SP_TRATA_PARCELAS: TStoredProc;
    btnContinuaSelecao: TfcShapeBtn;
    Panel1: TPanel;
    chkVencimento: TCheckBox;
    Label1: TLabel;
    edtDataVctoIni: TwwDBDateTimePicker;
    edtDataVctoFim: TwwDBDateTimePicker;
    Label2: TLabel;
    function VerificaPreenchimento: Boolean;
    function Exec_SP_Trata_Parcelas(pIdContrato : Double; pCargaIN, pCargaNOTIN : Integer; pAnoMes, pAnoMesComp, pAnoMesCobra: string; pDataCalculo: TDateTime; pDataVctoIni, pDataVctoFim: string ): boolean;
    procedure FormShow(Sender: TObject);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
  private
   { Private declarations }
   strErro:String;
  public
    { Public declarations }
  end;

var
  frmExecTrataParcAtraso: TfrmExecTrataParcAtraso ;
  sAnoMesCobra, sAnoMesComp,
  sAnoMes : String;
  sDataVctoIni, sDataVctoFim : string; //leandro pocebon wo4230
  iCargaIN, iCargaNOTIN  : integer;
  iIDContrato : extended;
  sDataCalculo, dFim,dInicio : TDateTime;
implementation
{$R *.DFM}

uses
  UFuncoesEmptmo, (* LimpaParametros, AtualizaConjunto *)
  UMensErro,      (* MsgDlg *)
   USistema,       (* Sistema *)
   UIntegraEmptmo, (* IntegraEmptmo *)
   dEmptmo,        (* qryParamEmptmo *)
   DLookEmptmo,    (* qryLookPortadorFormaR *)
   FProgresso,     (* FrmProgresso *)
   UDocumento,     (* Rotinas do CAPCAR *)
   uDiasUteis,
   DBaseDados,
   UCalcEmptmo,
   uDataBase,
   uVerificaPreenchimento,
   uLancContab,
   fAguarde, dMS, DDividaEP;



function TfrmExecTrataParcAtraso.VerificaPreenchimento: Boolean;
begin
	Result := False;

   try

     if chkCompetencia.Checked then begin
         if cboMesCompet.ItemIndex < 0 then begin
             raise EValidacao.CreateVal('É necessário indicar a Mês de Competência!', cboMesCompet);
         if dbspAnoComp.Value < 1980 then
            raise EValidacao.CreateVal('É necessário indicar a Ano de Competência!', DBspAnoComp);
      end;
    // -------------------------------------------------------------------------------------------
    if chkCobranca.Checked then begin
      if cboMesCobranca.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar a Mês de Cobrança!', cboMesCobranca);

      if DBspAnoCob.Value < 1980 then
         raise EValidacao.CreateVal('É necessário indicar a Ano de Cobrança!', DBspAnoCob);
     end;

    //leandro wo4230 inicio
    if chkVencimento.Checked then
    begin
        if length(trim(edtDataVctoIni.Text)) = 0 then
           raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento Inicial!', edtDataVctoIni);

        if length(trim(edtDataVctoFim.Text)) = 0 then
           raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento Final!', edtDataVctoFim)    ;

        if edtDataVctoIni.Date > edtDataVctoFim.Date then
           raise EValidacao.CreateVal('Data de Vencimento Inicial maior que Final!', edtDataVctoIni)  ;
    end;
    //leandro wo4230 fim

    // -------------------------------------------------------------------------------------------
    if CboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar a Mês!', CboMes);

     if DBspnAno.Value < 1980 then
         raise EValidacao.CreateVal('É necessário indicar a Ano!', DBspnAno);
    // -------------------------------------------------------------------------------------------
      if length(trim(edtDataLancto.Text)) = 0 then
           raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLancto);
    // -------------------------------------------------------------------------------------------
   end;
   except
      on ev : EValidacao do
      begin
	   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
       		Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
    end;
   Result := True;
end;



//function TfrmExecTrataParcAtraso.Exec_SP_Trata_Parcelas(pIdContrato : Double; pCargaIN, pCargaNOTIN : Integer; pAnoMes, pAnoMesComp, pAnoMesCobra: string; pDataCalculo: TDateTime ): boolean; //leandro pocebon wo4230
function TfrmExecTrataParcAtraso.Exec_SP_Trata_Parcelas(pIdContrato : Double; pCargaIN, pCargaNOTIN : Integer; pAnoMes, pAnoMesComp, pAnoMesCobra: string; pDataCalculo: TDateTime; pDataVctoIni, pDataVctoFim: string ): boolean;
var
  SP_ERRO : String;
  SP_PROC : TStoredProc;
begin
  try
    //LogToFile('Antes do PREPARO dos dados a serem processados', 'Inicio-SP_PREPARADIVERGENCIA.log', True, True, True);

    //MostraEspera('Preparando dados para processamento - Aguarde...');

    // --> Leandro S. Costa - Sol: 162548 - Kintana: 1381842
    // --> A procedure inicia falsa, mas caso ela funcione, ela se torna true
    Result := False;

    SP_PROC := TStoredProc.Create(Self);
    SP_PROC.DatabaseName  := 'BaseDados';

    SP_PROC.StoredProcName := 'CM."SP_TRAT_PARCELAS_EM_ATRASO"';

    //Criando os parametros
    SP_PROC.Params.CreateParam(ftInteger,   'pNumContrato',       ptInput);
    SP_PROC.Params.CreateParam(ftInteger,   'pInArquivo',         ptInput);
    SP_PROC.Params.CreateParam(ftInteger,   'pNotInArquivo',      ptInput);
    SP_PROC.Params.CreateParam(ftString,    'pAnoMes',            ptInput);
    SP_PROC.Params.CreateParam(ftString,    'pAnoMesCobranca',    ptInput);
    SP_PROC.Params.CreateParam(ftString,    'pAnoMesCompetencia', ptInput);
    SP_PROC.Params.CreateParam(ftDate,      'pDataCalculo',     ptInput);
    //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
    SP_PROC.Params.CreateParam(ftInteger,   'pNumParcela',     ptInput);
    //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
    //leandro pocebon - wo4230 - inicio
    SP_PROC.Params.CreateParam(ftString,      'pDataVctoIni',     ptInput);
    SP_PROC.Params.CreateParam(ftString,      'pDataVctoFim',     ptInput);
    //leandro pocebon - wo4230 - fim

    //Passandos os parâmetros

    SP_PROC.ParamByName('pNumContrato').AsFloat        := pIdContrato;
    SP_PROC.ParamByName('pInArquivo').AsInteger        := pCargaIN;
    SP_PROC.ParamByName('pNotInArquivo').AsInteger     := pCargaNOTIN;
    SP_PROC.ParamByName('pAnoMes').AsString            := pAnoMes;
    SP_PROC.ParamByName('pAnoMesCobranca').AsString    := pAnoMesCobra;
    SP_PROC.ParamByName('pAnoMesCompetencia').AsString := pAnoMesComp;
    SP_PROC.ParamByName('pDataCalculo').AsDateTime     := pDataCalculo;
    //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO
    SP_PROC.ParamByName('pNumParcela').AsInteger       := 0;
    //BRUNO AZEVEDO - VOTO DE EMPRÉSTIMO

    //leandro pocebon - wo4230 - inicio
    SP_PROC.ParamByName('pDataVctoIni').AsString     := pDataVctoIni;
    SP_PROC.ParamByName('pDataVctoFim').AsString     := pDataVctoFim;
    //leandro pocebon - wo4230 - fim
    // FIM

    // --> Leandro S. Costa - Sol: 162548 - Kintana: 1381842
    if not SP_PROC.Prepared then
       SP_PROC.Prepare;

    SP_PROC.Close;
    SP_PROC.ExecProc;
    // --> Leandro S. Costa - Sol: 162548 - Kintana: 1381842
    // --> Se não ocorrerem erros durante a execução da procedure, ela se torna verdadeira
    Result := True;
    SP_PROC.Close;

  // --> Leandro S. Costa - Sol: 162548 - Kintana: 1381842
  // --> Implementação do try..finally
  finally
    FreeAndNil(SP_PROC);
  End;//try..finally
end;



procedure TfrmExecTrataParcAtraso.FormShow(Sender: TObject);
begin
  inherited;
   cboMes.ItemIndex           := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value             := DiasUteis.ExtraiAno(Date);
   cboMesCobranca.ItemIndex   := cboMes.ItemIndex;
   cboMesCompet.ItemIndex     := cboMes.ItemIndex;
   dbspAnoCob.Value           := DBspnAno.Value;
   dbspAnoComp.Value          := DBspnAno.Value;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      //edtDataVencto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 20);
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 20);
   end
   else
   begin
      //edtDataVencto.Date      := DiasUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
      edtDataLancto.Date      := DiasUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
   end;

   if Sistema.TipoCliente = 20071 then
   begin
      //edtDataVencto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25);
      edtDataLancto.Date      := EncodeDate(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1), 25);
   end;
end;

procedure TfrmExecTrataParcAtraso.btnContinuaSelecaoClick(Sender: TObject);
begin
  inherited;

  //Everson Cunha - SIG118975 - Ini
  if molContratoEmptmo.IDContrato < 1 then //Sem contrato preenchido
    if MsgDlg('Serão alterados todos os itens de todos os contratos inadimplentes da carteira. Tem Certeza que deseja continuar?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
  //Everson Cunha - SIG118975 - Fim

  dInicio := Now;

  if not(VerificaPreenchimento) then Exit;

    if chkCompetencia.Checked then
        sAnoMesComp  := FormatFloat('0000', dbspAnoComp.Value) + FormatFloat('00', cboMesCompet.ItemIndex + 1)
     else
        sAnoMesComp  := '-1';


     if chkCobranca.Checked then
        sAnoMesCobra := FormatFloat('0000', dbspAnoCob.Value) + FormatFloat('00', cboMesCobranca.ItemIndex + 1)
     else
        sAnoMesCobra := '-1';

     //leandro pocebon - wo4230 - inicio
     if chkVencimento.Checked then
     begin
        sDataVctoIni := FormatDateTime('yyyymmdd', edtDataVctoIni.Date);
        sDataVctoFim := FormatDateTime('yyyymmdd', edtDataVctoFim.Date);
     end
     else
     begin
        sDataVctoIni := '-1';
        sDataVctoFim := '-1';
     end;
     //leandro pocebon - wo4230 - fim


     if molContratoEmptmo.IDContrato > 0 then
        iIDContrato     := (molContratoEmptmo.IDContrato)
     else
        iIDContrato     := -1;

     sAnoMes :=  FormatFloat('0000', DBspnAno.Value) + FormatFloat('00', CboMes.ItemIndex + 1);


    if chkInArquivo.Checked then
       iCargaIN := 1
    else
       iCargaIN := 0;

    if chkNotInArquivo.Checked then
       iCargaNOTIN := 1
    else
       iCargaNOTIN := 0;

    sDataCalculo := edtDataLancto.Date;


    try
       Exec_SP_Trata_Parcelas(iIdContrato, iCargaIN, iCargaNOTIN, sAnoMes, sAnoMesComp, sAnoMesCobra, sDataCalculo, sDataVctoIni, sDataVctoFim  );
       dFim := now;
       // --> Leandro S. Costa - Sol: 162548 - Kintana: 1381842
       // --> Acrescentado o parâmetro de HORA
       MsgDlg('Processo finalizado em : '+FormatDateTime('HH',dFim - dInicio) + ' Hr ' + FormatDateTime('nn',dFim - dInicio) + ' min ' +FormatDateTime('ss',dFim - dInicio) + ' seg '
              , 'Empréstimo', mtInformation,[mbOk,mbHelp],0);
    except on
       E : Exception  do
       // --> Leandro S. Costa - Sol: 162548 - Kintana: 1381842
       // --> Adicionado o erro ocasionado durante a execução da procedure
       MsgDlg('Ocorreu um erro ao executar o processo' + #13 +
              'Erro Ocorrido: ' + E.Message, 'Empréstimo', mtWarning, [mbOk,mbHelp],0);
    end;//try..except
end;

procedure TfrmExecTrataParcAtraso.molContratoEmptmobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnBuscaContratoClick(Sender);

end;

end.

