// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados seguem sem valor, pois
            os mesmos somente serão utilizados na alteração de valores da concessão.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas
---------------------------------------------------------------------------------------------------}
unit FExecGeraREFER;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, fcLabel, StdCtrls, CheckLst, fcButton, fcImgBtn,
   fcShapeBtn, wwdblook, wwdbdatetimepicker, Mask, wwdbedit, Wwdbspin,
   ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   mInscricaoEmptmo, Db, DBTables, Wwquery, TREdit, uCalcEmptmo,
   mParticipante, uTypesEmptmo, USistema;

type
   TOpcoes = Record
      VALOR1         : Currency;
      VALOR2         : Currency;
      VALOR3         : Currency;
      PRESTACAO1     : Currency;
      PRESTACAO2     : Currency;
      PRESTACAO3     : Currency;
      CQM1           : Currency;
      CQM2           : Currency;
      CQM3           : Currency;
      IOF1           : Currency;
      IOF2           : Currency;
      IOF3           : Currency;
      CPMF1          : Currency;
      CPMF2          : Currency;
      CPMF3          : Currency;
      TXADM1         : Currency;
      TXADM2         : Currency;
      TXADM3         : Currency;
      VALORBRUTO1    : Currency;
      VALORBRUTO2    : Currency;
      VALORBRUTO3    : Currency;
   end;

   TfrmExecGeraREFER = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      ntbPrincipal: TNotebook;
      Bevel3: TBevel;
      Label6: TLabel;
      Label7: TLabel;
      Panel1: TPanel;
      btnContinuar: TfcShapeBtn;
      lstPatro: TCheckListBox;
      BitBtn2: TBitBtn;
      BitBtn1: TBitBtn;
      lstPlano: TCheckListBox;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      Panel3: TPanel;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      Bevel2: TBevel;
      Label5: TLabel;
      edtDataInscricao: TwwDBDateTimePicker;
      qryInsertInscricao: TwwQuery;
      qryParticipantesGeracao: TwwQuery;
      memResult: TMemo;
      Panel2: TPanel;
      memErro: TMemo;
      edtNumResult: TRealEdit;
      Total: TLabel;
      Label3: TLabel;
      edtNumErro: TRealEdit;
      qryInsertCentral: TwwQuery;
      molParticipante: TmolParticipante;
      qryBeneficiario: TwwQuery;
      qryParticipantesGeracaoIDPESSOA: TFloatField;
      qryParticipantesGeracaoIDPATRO: TFloatField;
      qryParticipantesGeracaoIDPLANOPREV: TFloatField;
      qryParticipantesGeracaoIDSITPART: TFloatField;
      qryParticipantesGeracaoIDCBANCARIA: TFloatField;
      qryParticipantesGeracaoNOME: TStringField;
      qryParticipantesGeracaoFLGINTERNO: TStringField;
      qryBeneficiarioIDPESSOA: TFloatField;
      qryBeneficiarioIDPATRO: TFloatField;
      qryBeneficiarioIDPLANOPREV: TFloatField;
      qryBeneficiarioIDSITPART: TFloatField;
      qryBeneficiarioIDCBANCARIA: TFloatField;
      qryBeneficiarioNOME: TStringField;
      qryBeneficiarioFLGINTERNO: TStringField;
      Label4: TLabel;
      edtDataValidade: TwwDBDateTimePicker;
    DBcboCCaixaxFPagto: TwwDBLookupCombo;
    Label31: TLabel;
    chkGeraArquivo: TCheckBox;
    qryGeraArquivo: TwwQuery;
    qryGeraArquivoIDINSCRICAOEMPTMO: TFloatField;
    qryGeraArquivoNUMBANCO: TStringField;
    qryGeraArquivoNOMEBANCO: TStringField;
    qryGeraArquivoNUMAGENCIA: TStringField;
    qryGeraArquivoNOMEAGENCIA: TStringField;
    qryGeraArquivoCONTACORRENTE: TStringField;
    qryGeraArquivoNOME: TStringField;
    qryGeraArquivoCPF: TStringField;
    qryGeraArquivoIDENTIDADE: TStringField;
    qryGeraArquivoLOGRADOURO: TStringField;
    qryGeraArquivoNUMERO: TStringField;
    qryGeraArquivoCOMPLEMENTO: TStringField;
    qryGeraArquivoBAIRRO: TStringField;
    qryGeraArquivoCIDADE: TStringField;
    qryGeraArquivoCEP: TStringField;
    qryGeraArquivoNOMECIDADE: TStringField;
    qryGeraArquivoNOMEESTADO: TStringField;
    qryGeraArquivoVALORLIQUIDO1: TFloatField;
    qryGeraArquivoVALORLIQUIDO2: TFloatField;
    qryGeraArquivoVALORLIQUIDO3: TFloatField;
    qryGeraArquivoPRESTACAO1: TFloatField;
    qryGeraArquivoPRESTACAO2: TFloatField;
    qryGeraArquivoPRESTACAO3: TFloatField;
    qryGeraArquivoCQM1: TFloatField;
    qryGeraArquivoCQM2: TFloatField;
    qryGeraArquivoCQM3: TFloatField;
    qryGeraArquivoIOF1: TFloatField;
    qryGeraArquivoIOF2: TFloatField;
    qryGeraArquivoIOF3: TFloatField;
    qryGeraArquivoCPMF1: TFloatField;
    qryGeraArquivoCPMF2: TFloatField;
    qryGeraArquivoCPMF3: TFloatField;
    qryGeraArquivoTXADM1: TFloatField;
    qryGeraArquivoTXADM2: TFloatField;
    qryGeraArquivoTXADM3: TFloatField;
    qryGeraArquivoVALORBRUTO1: TFloatField;
    qryGeraArquivoVALORBRUTO2: TFloatField;
    qryGeraArquivoVALORBRUTO3: TFloatField;
    qryGeraArquivoOPCAO: TFloatField;
    qryGeraArquivoCODESTADO: TStringField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure BitBtn2Click(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure BitBtn3Click(Sender: TObject);
      procedure BitBtn4Click(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);


   private { Private declarations }

      rInsc                : TDadosContrato;
      rConcessao           : TDadosConcessao;
      rOpcoes              : TOpcoes;
      vIDPatro, vIDPlano   : array of Int64;

      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;

      sDiaSldDev           : String;

      sArquivo             : TextFile;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      
      procedure AbreQueries;

      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function SelecaoPatro: Boolean;
      function PegaPatro: String;

      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function SelecaoPlano: Boolean;
      function PegaPlano: String;

      function VerificaPreenchimento: Boolean;

      function SelecionaParticipantes: Boolean;
      procedure ProcessaInscricoes;

      function PreencheDadosComplementares: Boolean;

      function CriaInscricao(qryLocal : TwwQuery): Integer;
      function CalculaValores(fTxJuros: Currency; qryLocal : TwwQuery): Boolean;

      function InsereInscricao: Int64;
      function CriaCentral(iInscricao: Int64): Boolean;

      procedure GeraArquivoTexto;
      procedure GeraArquivoInform(const sLInha : String);

   public { Public declarations }

   end;



var
  frmExecGeraREFER: TfrmExecGeraREFER;



implementation
{$R *.DFM}
uses
   uFuncoesEmptmo, uDataBase, uMensErro, DLookEmptmo, dEmptmo, uSistema,
   uVerificaPreenchimento, FProgresso;



procedure TfrmExecGeraREFER.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;

   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmExecGeraREFER.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmExecGeraREFER.AbreQueries;
begin
   (* Tipo de Empréstimo *)
   with dtmLookEmptmo.qryLookTipoEmptmo do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   with dtmLookEmptmo.qryLookPortadorFormaP do begin
     LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
     ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
     Open;
   end;(* with qry *)
end;



procedure TfrmExecGeraREFER.PreenchePatro;
var
   i : Integer;
begin
   // Abre a tabela de patrocinadoras
   if not(dtmLookEmptmo.qryLookPatro.Active) then dtmLookEmptmo.qryLookPatro.Open;
   dtmLookEmptmo.qryLookPatro.First;

   // Limpa a lista
   lstPatro.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPatro, i);

   // Preenche a listbox de patrocinadoras e o vetor...
   while not(dtmLookEmptmo.qryLookPatro.EOF) do begin

      lstPatro.Items.Add(dtmLookEmptmo.qryLookPatroNOME.AsString);

      inc(i);
      SetLength(vIDPatro, i);
      vIDPatro[i-1] := dtmLookEmptmo.qryLookPatroIDPESSOA.AsInteger;

      dtmLookEmptmo.qryLookPatro.Next;
   end;
end;



procedure TfrmExecGeraREFER.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TfrmExecGeraREFER.SelecaoPatro: Boolean;
var
   i : Integer;
begin
   Result := False;

   // varre a lista de Patrocinadoras até que encontre 1 marcada
   for i := 0 to (lstPatro.Items.Count - 1) do begin
      if lstPatro.Checked[i] then begin
         Result := True;
         Exit;
      end;
   end;
end;



function TfrmExecGeraREFER.PegaPatro: String;
var
   i        : Integer;
   sPatros  : String;
begin
   inherited;

   sPatros := '';

   // concatena a String de patros
   for i := 0 to (lstPatro.Items.Count - 1) do begin
      if lstPatro.Checked[i] then begin
         if sPatros <> '' then sPatros := sPatros + ', ';
         sPatros := sPatros + IntToStr(vIDPatro[i]);
      end;
   end;

   Result := sPatros;
end;



procedure TfrmExecGeraREFER.PreenchePlano;
var
   i : Integer;
begin
   // Abre a tabela de Planos
   if not(dtmLookEmptmo.qryLookPlanPrev.Active) then dtmLookEmptmo.qryLookPlanPrev.Open;
   dtmLookEmptmo.qryLookPlanPrev.First;

   // Limpa a lista
   lstPlano.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDPlano, i);

   // Preenche a listbox de planos e o vetor...
   while not(dtmLookEmptmo.qryLookPlanPrev.EOF) do begin

      lstPlano.Items.Add(dtmLookEmptmo.qryLookPlanPrevNOME.AsString);

      inc(i);
      SetLength(vIDPlano, i);
      vIDPlano[i-1] := dtmLookEmptmo.qryLookPlanPrevIDPLANOPREV.AsInteger;

      dtmLookEmptmo.qryLookPlanPrev.Next;
   end;
end;



procedure TfrmExecGeraREFER.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TfrmExecGeraREFER.SelecaoPlano: Boolean;
var
   i : Integer;
begin
   Result := False;

   // varre a lista de planos até que encontre 1 marcado
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         Result := True;
         Exit;
      end;
   end;
end;



function TfrmExecGeraREFER.PegaPlano: String;
var
   i        : Integer;
   sPlanos  : String;
begin
   inherited;

   sPlanos := '';

   // concatena a String de planos
   for i := 0 to (lstPlano.Items.Count - 1) do begin
      if lstPlano.Checked[i] then begin
         if sPlanos <> '' then sPlanos := sPlanos + ', ';
         sPlanos := sPlanos + IntToStr(vIDPlano[i]);
      end;
   end;

   Result := sPlanos;
end;



procedure TfrmExecGeraREFER.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;

   (* preenche a data de lançamento e o ano de referência/competência *)
   edtDataInscricao.Date   := Sysdate;

   ParametrosSistema;

   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         0: sDiaSldDev := 'C';
         1: sDiaSldDev := 'A';
      end;
   end;

   AbreQueries;

   (* Preenche a listbox de patrocinadoras... *)
   PreenchePatro;
   (* ...e marca todas por default *)
   MarcaTodosPatro;

   (* Preenche a listbox de Planos... *)
   PreenchePlano;
   (* ...e marca todos por default *)
   MarcaTodosPlano;
end;



procedure TfrmExecGeraREFER.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmExecGeraREFER.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmExecGeraREFER.BitBtn2Click(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := not(lstPatro.Checked[i]);
end;



procedure TfrmExecGeraREFER.BitBtn1Click(Sender: TObject);
begin
   inherited;
   MarcaTodosPatro;
end;



procedure TfrmExecGeraREFER.BitBtn3Click(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;



procedure TfrmExecGeraREFER.BitBtn4Click(Sender: TObject);
begin
   inherited;
   MarcaTodosPlano;
end;



procedure TfrmExecGeraREFER.btnContinuarClick(Sender: TObject);
var
   iTotal : integer;
begin
   inherited;

   if chkGeraArquivo.Checked then begin
      GeraArquivoTexto;
      Exit;
   end;

   if not(VerificaPreenchimento) then Exit;

   try
      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      memResult.Clear;
      memErro.Clear;

      memResult.Lines.Add('Início: ' + TimeToStr(Time));

      MostraEspera('Selecionando Participantes para Inscrição...');

      (* Verifica se há inscrições a gerar e se se deseja gerá-las ------------------------------ *)


      (* fim verificação ------------------------------------------------------------------------ *)


      (* Seleciona os participantes cujas inscrições se deseja gerar ---------------------------- *)
      if not(SelecionaParticipantes) then begin

         MsgDlg('ERRO ao selecionar os Participantes para Inscrição de Empréstimo.', 'Empréstimo', mtInformation, [mbOk], 0);
         EscondeEspera;
         Repaint;
         Exit;

      end else begin

         iTotal := qryParticipantesGeracao.RecordCount + qryBeneficiario.RecordCount;

         if iTotal <= 0 then begin
            MsgDlg('Não há Inscrições a gerar com os filtros indicados. ', 'Empréstimo', mtInformation, [mbOk], 0);
            EscondeEspera;
            Repaint;
            Exit;
         end;

         if MsgDlg('Serão geradas ' + IntToStr(iTotal) + ' inscrições. ' + #13 + 'Deseja prosseguir?',
                   'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
            EscondeEspera;
            Repaint;
            Exit;
         end;
         (* Itera pelos participantes, gerando (ou não) as inscrições *)

         ProcessaInscricoes;

         memResult.Lines.Add('Fim: ' + TimeToStr(Time));

      end;

      (* fim do processo ------------------------------------------------------------------------ *)

      GeraArquivoTexto;

      MsgDlg('Geração de inscrições finalizada.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;

   finally
      EscondeEspera;

      ntbPrincipal.PageIndex := 1;
      Repaint;

      HabilitaBotoes;
   end;
end;



function TfrmExecGeraREFER.VerificaPreenchimento: boolean;
begin
   Result := False;

	try

      (* Pelo menos 1 Patrocinadora deve ser selecionada *)
      if not(SelecaoPatro) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos uma Patrocinadora!', lstPatro);

      (* Pelo menos 1 Plano deve ser selecionado *)
      if not(SelecaoPlano) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Plano!', lstPlano);

      (* Data de Inscricao *)
      if edtDataInscricao.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Inscricao!', edtDataInscricao);

      (* Data de Inscricao *)
      if edtDataValidade.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Validade!', edtDataValidade);

      (* Forma de pagamento *)
      if DBcboCCaixaxFPagto.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar a Conta-Caixa x Forma Pagto!', DBcboCCaixaxFPagto);

      (* Tipo de Empréstimo *)
      if DBcboTipoEmptmo.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Empréstimo!', DBcboTipoEmptmo);

      (* Tipo de Contrato *)
      if DBcboTipoContrato.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Contrato de Empréstimo!', DBcboTipoContrato);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecGeraREFER.SelecionaParticipantes: Boolean;
var
   sSQL, sSQLB : String;
begin
   Result := True;

   sSQL :=
   'SELECT DISTINCT '                                      + #13 +
   '  PPP.IDPESSOA, '                                      + #13 +
   '  PPP.IDPESSJUR AS IDPATRO, '                          + #13 +
   '  PPP.IDPLANOPREV, '                                   + #13 +
   '  NVL(C.IDCBANCARIA,0) AS IDCBANCARIA, '               + #13 +
   '  ST.FLGINTERNO, '                                     + #13 +
   '  PPP.IDSITPART, '                                     + #13 +
   '  P.NOME '                                             + #13 +

   'FROM '                                                 + #13 +
   '  PESSOA P, '                                          + #13 +
   '  PARTPREVPLAN PPP, '                                  + #13 +
   '  SITPART ST, '                                        + #13 +
   '  PLANPREV PL, '                                       + #13 +
   '  CONTABANCARIA C, '                                   + #13 +
   '  CONTRIBPREVPARTP CPP '                               + #13 +

   'WHERE '                                                + #13 +
   '      ( PPP.SEQPROPOSTA   = 1 ) '                      + #13 +
   '  AND ( PPP.FLGDESATIVADO = 0 ) '                      + #13 +
   '  AND ( ST.FLGINTERNO     IN (''AT'',''MA'') ) '       + #13 +
   '  AND ( PPP.IDPESSJUR     IN ( ' + PegaPatro + ' ) ) ' + #13 +
   '  AND ( PPP.IDPLANOPREV   IN ( ' + PegaPlano + ' ) ) ' + #13 +
   '  AND ( CPP.FLGCOBRA      = 1 ) '                      + #13 +
   '  AND ( PPP.IDPESSOA      = P.IDPESSOA ) '             + #13 +
   '  AND ( PPP.IDSITPART     = ST.IDSITPART ) '           + #13 +
   '  AND ( C.IDPESSOA        = PPP.IDPESSOA ) '           + #13 +
   '  AND ( C.FLGCONTAPREF    = 1 ) '                      + #13 +
   '  AND ( CPP.IDPESSJUR     = PPP.IDPESSJUR ) '          + #13 +
   '  AND ( CPP.IDPLANOPREV   = PPP.IDPLANOPREV ) '        + #13 +
   '  AND ( CPP.SEQPROPOSTA   = PPP.SEQPROPOSTA ) '        + #13 +
   '  AND ( CPP.IDPESSOA      = PPP.IDPESSOA ) '           + #13 +
   '  AND ( PL.IDPLANOPREV    = PPP.IDPLANOPREV ) '        + #13;

   if molParticipante.iParticipante > 0 then begin
      sSQL := sSQL +
      '  AND ( PPP.IDPESSOA = ' + IntToStr(molParticipante.iParticipante) + ' ) ' + #13;
   end;

   sSQLB :=
   'SELECT DISTINCT '                                      + #13 +
   '  PPP.IDPESSOA, '                                      + #13 +
   '  PPP.IDPESSJUR AS IDPATRO, '                          + #13 +
   '  PPP.IDPLANOPREV, '                                   + #13 +
   '  NVL(C.IDCBANCARIA,0) AS IDCBANCARIA, '               + #13 +
   '  ST.FLGINTERNO, '                                     + #13 +
   '  PPP.IDSITPART, '                                     + #13 +
   '  P.NOME '                                             + #13 +

   'FROM '                                                 + #13 +
   '  PESSOA P, '                                          + #13 +
   '  PARTPREVPLAN PPP, '                                  + #13 +
   '  SITPART ST, '                                        + #13 +
   '  PLANPREV PL, '                                       + #13 +
   '  CONTABANCARIA C, '                                   + #13 +
   '  BENEFBFCIARIO BFC, '                                 + #13 +
   '  DEPENTIT DPT, '                                      + #13 +
   '  BFCIARIOTITPLAN BTP '                                + #13 +

   'WHERE '                                                + #13 +
   '      DPT.IDDEPENDENCIA  IN (''COM'',''COP'') '        + #13 +
   '  AND PPP.SEQPROPOSTA    = 1 '                         + #13 +
   '  AND PPP.FLGDESATIVADO  = 0 '                         + #13 +
   '  AND PPP.IDPESSJUR      IN ( ' + PegaPatro + ' ) '    + #13 +
   '  AND PPP.IDPLANOPREV    IN ( ' + PegaPlano + ' ) '    + #13 +
   '  AND C.FLGCONTAPREF     = 1 '                         + #13 +
   '  AND BFC.IDSITBENEFICIO = 1 '                         + #13 +
   '  AND PL.IDPLANOPREV     = PPP.IDPLANOPREV '           + #13 +
   '  AND BTP.IDTITULAR      = DPT.IDTITULAR '             + #13 +
   '  AND BTP.IDRESPONSAVEL  = DPT.IDPESSOA '              + #13 +
   '  AND BFC.IDTITULAR      = DPT.IDTITULAR '             + #13 +
   '  AND BFC.IDPESSOA       = DPT.IDPESSOA '              + #13 +
   '  AND P.IDPESSOA         = DPT.IDPESSOA '              + #13 +
   '  AND PPP.IDPESSOA       = P.IDPESSOA '                + #13 +
   '  AND PPP.IDSITPART      = ST.IDSITPART '              + #13 +
   '  AND C.IDPESSOA         = PPP.IDPESSOA '              + #13 +
   '  AND PPP.IDPESSJUR      = BTP.IDPESSJUR '             + #13 +
   '  AND PPP.IDPLANOPREV    = BTP.IDPLANOPREV '           + #13 +
   '  AND PPP.IDPESSOA       = BTP.IDPESSOA '              + #13 +
   '  AND PPP.SEQPROPOSTA    = BTP.SEQPROPOSTA '           + #13;

   if molParticipante.iParticipante > 0 then begin
      sSQLB := sSQLB +
      '  AND ( PPP.IDPESSOA = ' + IntToStr(molParticipante.iParticipante) + ' ) ' + #13;
   end;

//   LimpaParametros(qryParticipantesGeracao);
//   LimpaParametros(qryBeneficiario);
   qryParticipantesGeracao.Close;
   qryParticipantesGeracao.SQL.Clear;
   qryParticipantesGeracao.SQL.Text := sSQL;

   qryBeneficiario.Close;
   qryBeneficiario.SQL.Clear;
   qryBeneficiario.SQL.Text := sSQLB;

   try
      qryParticipantesGeracao.Open;
      qryBeneficiario.Open;
   except
      Result := False;
      Raise;
      Repaint;
   end;
end;



procedure TfrmExecGeraREFER.ProcessaInscricoes;
var
   bGerou            : Boolean;
   sMsg, sErro       : String;
   sParticipante     : String;
   i, iInsc, iErro   : Integer;
   iResultInscricao  : Integer;
begin
   (* inicializa os contadores *)
   i     := 0; (* registro atual *)
   iInsc := 0; (* inscrições bem-sucedidas *)
   iErro := 0; (* inscrições com ERRO *)

   try
      with qryParticipantesGeracao do begin

         MostraFormProgresso('Processando Inscrições...', 0, RecordCount, True, True);

         First;
         while not(EOF) do begin

            inc(i);
            AndaFormProgresso(i);

            (* Verifica se o usuário Cancelou a Operação *)
            if frmProgresso.Cancelou then begin

               sMsg := 'Processo interrompido pelo usuário.' + #13;
               if bGerou then begin
                  sMsg := sMsg + 'Entretanto, pelo menos uma Inscrição foi gerada.';
               end else begin
                  sMsg := sMsg + 'Não foi gerada Inscrição alguma.';
               end;

               MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;

               Break;
            end;

            // -------------------------------------------------------------------------------------

            (* guarda o nome do Participante para posterior exibição nos memos *)
            sParticipante := qryParticipantesGeracaoNOME.AsString;

            StartTransacao;

            (* tenta fazer a inscrição *)

            iResultInscricao := CriaInscricao(qryParticipantesGeracao);

            if iResultInscricao > 0 then begin

               (* inscrição teve sucesso *)
               inc(iInsc);

               (* insere o Participante no memo de resultado *)
               memResult.Lines.Add(sParticipante + ' - Inscrição: ' + IntToStr(iResultInscricao));

               (* insere os dados da Inscrição na base da Central *)
               if CriaCentral(iResultInscricao) then begin
                  CommitTransacao;
               end else begin

                  RollBackTransacao;
                  inc(iErro);

                  (* insere o Participante no memo de erro com o motivo da "falha" *)
                  memErro.Lines.Add(CompletaFim(sParticipante, ' ', 60) + ': ERRO InscricaoLote.');

               end;

            end else begin

               (* em caso de falha... *)
               RollBackTransacao;

               (* inscrição falhou *)
               inc(iErro);

               case iResultInscricao of
                   0: sErro := 'ERRO InscricaoLote.';
                  -1: sErro := 'Participante não satisfez a Regra de Elegibilidade.';
                  -2: sErro := 'Não foram encontrados os dados necessários para Cobrança.';
                  -3: sErro := 'Não foi possível determinar a Taxa de Juros.';
                  -4: sErro := 'ERRO no cálculo dos valores.';
                  -5: sErro := 'ERRO na gravação da Inscrição.';
                  -6: sErro := 'Não foi possível gerar inscrição (Valores insuficientes).';
               end;

               (* insere o Participante no memo de erro com o motivo da "falha" *)
               memErro.Lines.Add(CompletaFim(sParticipante, ' ', 60) + ': ' + sErro);

            end; (* if iResultInscricao *)

            Next;
         end; (* while not(EOF) *)
      end; (* with qryParticipante *)

      with qryBeneficiario do begin

         MostraFormProgresso('Processando Inscrições...', 0, RecordCount, True, True);

         First;
         while not(EOF) do begin

            inc(i);
            AndaFormProgresso(i);

            (* Verifica se o usuário Cancelou a Operação *)
            if frmProgresso.Cancelou then begin

               sMsg := 'Processo interrompido pelo usuário.' + #13;
               if bGerou then begin
                  sMsg := sMsg + 'Entretanto, pelo menos uma Inscrição foi gerada.';
               end else begin
                  sMsg := sMsg + 'Não foi gerada Inscrição alguma.';
               end;

               MsgDlg(sMsg, 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;

               Break;
            end;

            // -------------------------------------------------------------------------------------

            (* guarda o nome do Participante para posterior exibição nos memos *)
            sParticipante := qryBeneficiarioNOME.AsString;

            StartTransacao;

            (* tenta fazer a inscrição *)
            iResultInscricao := CriaInscricao(qryBeneficiario);

            if iResultInscricao > 0 then begin

               (* inscrição teve sucesso *)
               inc(iInsc);

               (* insere o Participante no memo de resultado *)
               memResult.Lines.Add(sParticipante + ' - Inscrição: ' + IntToStr(iResultInscricao));

               (* insere os dados da Inscrição na base da Central *)
               if CriaCentral(iResultInscricao) then begin
                  CommitTransacao;
               end else begin

                  RollBackTransacao;
                  inc(iErro);

                  (* insere o Participante no memo de erro com o motivo da "falha" *)
                  memErro.Lines.Add(CompletaFim(sParticipante, ' ', 60) + ': ERRO InscricaoLote.');
                  
               end;

            end else begin

               (* em caso de falha... *)
               RollBackTransacao;

               (* inscrição falhou *)
               inc(iErro);

               case iResultInscricao of
                   0: sErro := 'ERRO InscricaoLote.';
                  -1: sErro := 'Participante não satisfez a Regra de Elegibilidade.';
                  -2: sErro := 'Não foram encontrados os dados necessários para Cobrança.';
                  -3: sErro := 'Não foi possível determinar a Taxa de Juros.';
                  -4: sErro := 'ERRO no cálculo dos valores.';
                  -5: sErro := 'ERRO na gravação da Inscrição.';
                  -6: sErro := 'Não foi possível gerar inscrição (Valores insuficientes).';
               end;

               (* insere o Participante no memo de erro com o motivo da "falha" *)
               memErro.Lines.Add(CompletaFim(sParticipante, ' ', 60) + ': ' + sErro);

            end; (* if iResultInscricao *)

            Next;
         end; (* while not(EOF) *)
      end; (* with qryBeneficiario *)

   finally
      edtNumResult.Value   := iInsc;
      edtNumErro.Value     := iErro;
      EscondeFormProgresso;
      Repaint;
   end;
end;



function TfrmExecGeraREFER.CriaInscricao(qryLocal : TwwQuery) : Integer;
var
   dDataFinal     : TDateTime;
   fTaxaJuros     : Currency;
   fValorMaximo   : Currency;
begin
   LimpaRegistroContrato(rInsc);
   LimpaRegistroConcessao(rConcessao);

   // ----------------------------------------------------------------------------------------------

   (* 1º - Preenche o registro com os dados necessários (os possíveis até aqui...) *)

   rInsc.IDPessoa          := qryLocal.FieldByName('IDPESSOA').AsInteger;
   rInsc.IDBenef           := qryLocal.FieldByName('IDPESSOA').AsInteger;
   rInsc.IDPlanoPrev       := qryLocal.FieldByName('IDPLANOPREV').AsInteger;
   rInsc.IDPatro           := qryLocal.FieldByName('IDPATRO').AsInteger;
   rInsc.IDTipoEmptmo      := StrToInt(DBcboTipoEmptmo.LookupValue);
   rInsc.IDTipoContrEmptmo := StrToInt(DBcboTipoContrato.LookupValue);
   rInsc.Indexador         := dtmLookEmptmo.qryLookTipoContratoMOECODIGO.AsInteger;
   rInsc.PortFormaPag      := dtmLookEmptmo.qryLookPortadorFormaPCODPORTFORMA.AsInteger;

   rInsc.IDCBancaria       := qryLocal.FieldByName('IDCBANCARIA').AsInteger;
   rInsc.NumParcelas       := 12;

   rInsc.fSalParticipacao  := 0;
   rInsc.fSalMantido       := 0;
   rInsc.fSalAuxDoenca     := 0;
   rInsc.fSalBenef         := 0;

   rInsc.fValMargem        := 0;
   rInsc.fValReserva       := 0;

   rInsc.VlrContrato       := 0;

   rInsc.DataInscricao     := edtDataInscricao.Date;

   rInsc.DataAssinatura    := edtDataInscricao.Date;

   rInsc.DataValidade      := edtDataValidade.Date;

   rInsc.FlgSituacao       := 'A';


   // ----------------------------------------------------------------------------------------------

   (* 2º - Verifica Elegibilidade do Participante *)

   if not(CalcEmptmo.VerificaElegibilidade(rInsc.IDPessoa, rInsc.IDBenef,
                                           dtmLookEmptmo.qryLookTipoContratoIDREGRAELEG.AsInteger,
                                           dtmLookEmptmo.qryLookTipoContratoTCEMINRENOVA.AsInteger,
                                           -1,
                                           dDataFinal, False)) then
   begin
      Result := -1;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   (* 3º - Preenche os dados complementares necessários à Inscrição, e que, como dependem de
           outras consultas, não foram preenchidos antes visando à otimização do processo *)

   if not(PreencheDadosComplementares) then begin
      Result := -2;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   (* 4º - Margem Consignável e Reserva de Poupança *)

   (* função da unit UCalcEmptmo que busca a Margem Consignável do participante *)
   rInsc.fValMargem  := CalcEmptmo.BuscaMargem(rInsc.IDPessoa, rInsc.IDBenef,
                                               dtmLookEmptmo.qryLookTipoContratoIDREGRAMARGEM.AsInteger,
                                               0, 0, 0,
                                               rInsc.fSalParticipacao, rInsc.fSalMantido,
                                               rInsc.fSalAuxDoenca, rInsc.fSalBenef, False);


   (* função da unit UCalcEmptmo que busca a Reserva de Poupança do participante ou
      do beneficiário, no caso do pensionista *)
   rInsc.fValReserva := CalcEmptmo.BuscaReserva(rInsc.IDPessoa, rInsc.IDPatro, rInsc.IDPlanoPrev,
                                                dtmLookEmptmo.qryLookTipoContratoIDREGRARESERVA.AsInteger,
                                                edtDataInscricao.Date, False);

   // ----------------------------------------------------------------------------------------------

   (* 5º - Taxa de Juros *)

   if not(dtmLookEmptmo.qryLookTipoContratoIDREGRADATACRED.IsNull) then begin
      (* função da unit UCalcEmptmo que utiliza a regra para data de crédito *)


      rInsc.DataCredito := CalcEmptmo.BuscaDataCredito(dtmLookEmptmo.qryLookTipoContratoIDREGRADATACRED.AsInteger,
                                                       'C',
                                                       rInsc.FlgFormaPag,
                                                       rInsc.FlgSituacao,
                                                       rInsc.IDPatro,
                                                       rInsc.IDPlanoPrev,
                                                       0,
                                                       edtDataInscricao.Date,
                                                       False,
                                                       False);
   end else begin

      rInsc.DataCredito := CalcEmptmo.BuscaData('C', (* Crédito *) 'C', (* qryFLGFORMAPAG.AsString *)
                                                qryLocal.FieldByName('FLGINTERNO').AsString,
                                                rInsc.IDPatro, rInsc.IDPlanoPrev,
                                                0, (* Parcela *) edtDataInscricao.Date);
   end;


   rInsc.DataPrimParc := CalcEmptmo.BuscaData('N', (* Normal *) 'C',
                                               qryLocal.FieldByName('FLGINTERNO').AsString,
                                               qryLocal.FieldByName('IDPATRO').AsInteger,
                                               qryLocal.FieldByName('IDPLANOPREV').AsInteger,
                                               0, (* parcela 0 = concessão *)
                                               edtDataInscricao.Date);

   fTaxaJuros := CalcEmptmo.BuscaTxJuros(rInsc, dtmLookEmptmo.qryLookTipoContratoIDREGRAJURCONC.AsInteger,
                                         0, rInsc.DataCredito, 0, 0, False, rInsc.Indexador);

   // ----------------------------------------------------------------------------------------------

   (* 6º - Valor Solicitado Máximo *)

   rInsc.VlrContrato := CalcEmptmo.BuscaVlrSolicMax(rInsc, qryLocal.FieldByName('IDSITPART').AsInteger,
                                                    fTaxaJuros, rInsc.fValMargem, rInsc.fValReserva,
                                                    0, 0, rInsc.fSalParticipacao, rInsc.fSalAuxDoenca,
                                                    rInsc.fSalMantido, rInsc.fSalBenef, 0, False);

   // ----------------------------------------------------------------------------------------------

   if rInsc.VlrContrato <= 0 then begin
      Result := -6;
      Exit;
   end;


   (* 7º - 3 valores *)

   if not(CalculaValores(fTaxaJuros,qryLocal)) then begin
      Result := -4;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   Result := InsereInscricao;
end;



function TfrmExecGeraREFER.CalculaValores(fTxJuros: Currency; qryLocal : TwwQuery): Boolean;
var
   v, i, j     : integer;
   fVlrRateio  : Currency;
   fVlrCalc    : Currency;
   vLista      : TListaItem;
   fValor      : Currency;
   fPrestacao  : Currency;
   fCQM        : Currency;
   fIOF        : Currency;
   fCPMF       : Currency;
   fVlrBruto   : Currency;
   ftxAdm      : Currency;
begin
   try
      Result     := True;
      fVlrRateio := Arredonda((rInsc.VlrContrato / 3), 2);

      for v := 3 downto 1 do begin

         if v = 3 then
            fVlrCalc := rInsc.VlrContrato
         else
            fVlrCalc := Arredonda((fVlrRateio * v),2);

         CalcEmptmo.CalculaItens(rInsc,
                                 rConcessao,
                                 0, // Evento, Tipo do item
                                 0, // Origem
                                 iPais, sEstado, iCidade,
                                 0, // Parcela ZERO
                                 qryLocal.FieldByName('IDSITPART').AsInteger, 'C', fTxJuros, 0,
                                 fVlrCalc, 0, rInsc.fValMargem, rInsc.fValReserva,
                                 rInsc.fSalParticipacao, rInsc.fSalMantido,
                                 rInsc.fSalAuxDoenca, rInsc.fSalBenef, 0, 0,
                                 (* VlrSolic, SaldoQuit, Margem, Reserva, SalPart,
                                 SalMantido, SalDoenca, SalBenef, VlrMaxPermit *)
                                 0, 0, 0, 
                                 rInsc.DataAssinatura, rInsc.DataAssinatura, ' ',
                                 False, False, False, vLista);

         fValor      := 0;
         fPrestacao  := 0;
         fCQM        := 0;
         fIOF        := 0;
         fCPMF       := 0;
         fVlrBruto   := 0;
         fTxAdm      := 0;

         for i := 0 to High(vLista) do begin

            case vLista[i].CodigoItem of
              34: fValor      := vLista[i].Valor; (* Crédito Empréstimo *)
              11: fPrestacao  := vLista[i].Valor; (* Prestação *)
              10: fCQM        := vLista[i].Valor; (* QQM *)
              14: fIOF        := vLista[i].Valor; (* IOF *)
              15: fCPMF       := vLista[i].Valor; (* CPMF *)
              41: fVlrBruto   := vLista[i].Valor; (* Valor Solicitado *)
              12: fTxAdm      := vLista[i].Valor; (* Tx de Adm *)
            end;

         end; (* for i := 0 to High(vLista) *)

         case v of
            3: (* 3/3 do valor permitido *)
            begin
               rOpcoes.VALOR1       := fValor;
               rOpcoes.PRESTACAO1   := fPrestacao;
               rOpcoes.CQM1         := fCQM;
               rOpcoes.IOF1         := fIOF;
               rOpcoes.CPMF1        := fCPMF;
               rOpcoes.VALORBRUTO1  := fVlrBruto;
               rOpcoes.TXADM1       := fTxAdm;
            end;

            2: (* 2/3 do valor permitido *)
            begin
               rOpcoes.VALOR2       := fValor;
               rOpcoes.PRESTACAO2   := fPrestacao;
               rOpcoes.CQM2         := fCQM;
               rOpcoes.IOF2         := fIOF;
               rOpcoes.CPMF2        := fCPMF;
               rOpcoes.VALORBRUTO2  := fVlrBruto;
               rOpcoes.TXADM2       := fTxAdm;
            end;

            1: (* 1/3 do valor permitido *)
            begin
               rOpcoes.VALOR3       := fValor;
               rOpcoes.PRESTACAO3   := fPrestacao;
               rOpcoes.CQM3         := fCQM;
               rOpcoes.IOF3         := fIOF;
               rOpcoes.CPMF3        := fCPMF;
               rOpcoes.VALORBRUTO3  := fVlrBruto;
               rOpcoes.TXADM3       := fTxAdm;
           end;
         end; (* case *)
      end; (* for i := 3 downto 1 *)
   except
      Result := False;
   end;
end;



function TfrmExecGeraREFER.InsereInscricao: Int64;
begin
   (* último - pega o IDInscricaoEmptmo *)
      rInsc.IDInscricaoEmptmo := LeUltRegistro(nil, 'INSCRICAOEMPTMO');
   try
      with qryInsertInscricao do begin
         LimpaParametros(qryInsertInscricao);

         ParamByName('PIDINSCRICAOEMPTMO').AsInteger  := rInsc.IDInscricaoEmptmo;
         ParamByName('PIDPESSOA').AsInteger           := rInsc.IDPessoa;
         ParamByName('PIDBENEF').AsInteger            := rInsc.IDBenef;
         ParamByName('PIDPATRO').AsInteger            := rInsc.IDPatro;
         ParamByName('PIDPLANOPREV').AsInteger        := rInsc.IDPlanoPrev;
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := rInsc.IDTipoContrEmptmo;
         ParamByName('PVLRSOLIC').AsCurrency          := rInsc.VlrContrato;
         ParamByName('PNUMPARCELAS').AsInteger        := rInsc.NumParcelas;
         ParamByName('PMOECODIGO').AsInteger          := rInsc.Indexador;
         ParamByName('PIDCBANCARIA').AsInteger        := rInsc.IDCBancaria;
         ParamByName('PDATAINSC').AsDateTime          := rInsc.DataInscricao;
         ParamByName('PDATAVALIDADE').AsDateTime      := rInsc.DataValidade;
         ParamByName('PPORTFORMAPAG').AsInteger       := rInsc.PortFormaPag;
         ParamByName('PFLGSITUACAO').AsString         := rInsc.FlgSituacao;
         ParamByName('PVLRMARGEM').AsCurrency         := rInsc.fValMargem;
         ParamByName('PVLRMAXPERMIT').AsCurrency      := rInsc.VlrContrato;
         ParamByName('PFLGFORMAREC').AsString         := 'F';
         ParamByName('PFLGFORMAPAG').AsString         := 'C';
         ExecSQL;
      end;

      Result := rInsc.IDInscricaoEmptmo;

   except
      Result := -5;
   end;
end;



function TfrmExecGeraREFER.CriaCentral(iInscricao: Int64): Boolean;
begin
   try
      with qryInsertCentral do begin
         LimpaParametros(qryInsertCentral);

         ParamByName('PIDINSCRICAO').AsInteger  := rInsc.IDInscricaoEmptmo;

         ParamByName('PVALOR1').AsCurrency      := rOpcoes.VALOR1;
         ParamByName('PVALOR2').AsCurrency      := rOpcoes.VALOR2;
         ParamByName('PVALOR3').AsCurrency      := rOpcoes.VALOR3;

         ParamByName('PPRESTACAO1').AsCurrency  := rOpcoes.PRESTACAO1;
         ParamByName('PPRESTACAO2').AsCurrency  := rOpcoes.PRESTACAO2;
         ParamByName('PPRESTACAO3').AsCurrency  := rOpcoes.PRESTACAO3;

         ParamByName('PCQM1').AsCurrency        := rOpcoes.CQM1;
         ParamByName('PCQM2').AsCurrency        := rOpcoes.CQM2;
         ParamByName('PCQM3').AsCurrency        := rOpcoes.CQM3;

         ParamByName('PIOF1').AsCurrency        := rOpcoes.IOF1;
         ParamByName('PIOF2').AsCurrency        := rOpcoes.IOF2;
         ParamByName('PIOF3').AsCurrency        := rOpcoes.IOF3;

         ParamByName('PCPMF1').AsCurrency       := rOpcoes.CPMF1;
         ParamByName('PCPMF2').AsCurrency       := rOpcoes.CPMF2;
         ParamByName('PCPMF3').AsCurrency       := rOpcoes.CPMF3;

         ParamByName('PTXADM1').AsCurrency      := rOpcoes.TXADM1;
         ParamByName('PTXADM2').AsCurrency      := rOpcoes.TXADM2;
         ParamByName('PTXADM3').AsCurrency      := rOpcoes.TXADM3;

         ParamByName('PVALORBRUTO1').AsCurrency := rOpcoes.VALORBRUTO1;
         ParamByName('PVALORBRUTO2').AsCurrency := rOpcoes.VALORBRUTO2;
         ParamByName('PVALORBRUTO3').AsCurrency := rOpcoes.VALORBRUTO3;

         ExecSQL;
      end;

      Result := True;

   except
      Result := False;
   end;
end;



function TfrmExecGeraREFER.PreencheDadosComplementares: Boolean;
begin
   Result := True;
end;



procedure TfrmExecGeraREFER.btnVoltarClick(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecGeraREFER.GeraArquivoTexto;
var
   i        : Integer;
   sLinha   : String;
begin
   //AssignFile(sArquivo,'c:\Inform.txt');
   AssignFile(sArquivo, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\Inform.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
   ReWrite(sArquivo);
   WriteLn(sArquivo,'+DJDE JDE=JOBEMP,JDL=REFPDL,END;');
   LimpaParametros(qryGeraArquivo);
   qryGeraArquivo.Open;
   i := 0;
   MostraFormProgresso('Gerando arquivo texto',0,qryGeraArquivo.RecordCount,True,True);
   while not qryGeraArquivo.Eof do begin
      Inc(i);
      AndaFormProgresso(i);
      sLinha := '11                                    ' + qryGeraArquivo.FieldByName('IDINSCRICAOEMPTMO').AsString;
      GeraArquivoInform(sLinha);

      sLinha := '22 ' +
                CompletaInicio(Copy(qryGeraArquivo.FieldByName('NUMBANCO').AsString,1,4),' ',4)     + '-' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('NOMEBANCO').AsString,1,22),' ',22)     + ' ' +
                CompletaInicio(Copy(qryGeraArquivo.FieldByName('NUMAGENCIA').AsString,1,4),' ',4)   + '-' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('NOMEAGENCIA').AsString,1,22),' ',32)   +
                CompletaFim(qryGeraArquivo.FieldByName('CONTACORRENTE').AsString,' ',20);
      GeraArquivoInform(sLinha);

      sLinha := '32    ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('NOME').AsString,1,47),' ',47)        + '    ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('IDENTIDADE').AsString,1,12),' ', 12) + '       ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('CPF').AsString,1,14),' ',14);
      GeraArquivoInform(sLinha);

      sLinha := '42    ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('LOGRADOURO').AsString,1,47),' ',47) + ' ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('NUMERO').AsString,1,4),' ',4)        + ' ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('COMPLEMENTO').AsString,1,10),' ',10);
      GeraArquivoInform(sLinha);

      sLinha := ' 2    ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('BAIRRO').AsString,1,22),' ',22)     + '-' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('CIDADE').AsString,1,22),' ',22);
      GeraArquivoInform(sLinha);

      sLinha := ' 2    ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('NOMEESTADO').AsString,1,20),' ',20) + '-' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('CODESTADO').AsString,1,2),' ',2);
      GeraArquivoInform(sLinha);

      sLinha := ' 2    ' +
                CompletaFim(Copy(qryGeraArquivo.FieldByName('CEP').AsString,1,8),' ',8);
      GeraArquivoInform(sLinha);

      sLinha := '53        ' +
                FormatFloat('##,###.##',qryGeraArquivo.FieldByName('VALORBRUTO1').AsCurrency)    + '  ' +
                FormatFloat('###.##',qryGeraArquivo.FieldByName('CPMF1').AsFloat)                + '  ' +
                FormatFloat('##.##',qryGeraArquivo.FieldByName('IOF1').AsFloat)                  + ' ' +
                FormatFloat('###.##',qryGeraArquivo.FieldByName('CQM1').AsFloat)                 + '  ' +
                FormatFloat('#,###.##',qryGeraArquivo.FieldByName('TXADM1').AsFloat)             + '  ' +
                FormatFloat('##,###.##',qryGeraArquivo.FieldByName('VALORLIQUIDO1').AsCurrency)  + '  ' +
                FormatFloat('#,###.##',qryGeraArquivo.FieldByName('PRESTACAO1').AsCurrency);
      GeraArquivoInform(sLinha);

      sLinha := '64        <' + CompletaInicio(Copy(qryGeraArquivo.FieldByName('IDINSCRICAOEMPTMO').AsString,1,6),'0',6) +
                '1>';
      GeraArquivoInform(sLinha);


      sLinha := '73        ' +
                FormatFloat('##,###.##',qryGeraArquivo.FieldByName('VALORBRUTO2').AsCurrency)    + '  ' +
                FormatFloat('###.##',qryGeraArquivo.FieldByName('CPMF2').AsFloat)                + '  ' +
                FormatFloat('##.##',qryGeraArquivo.FieldByName('IOF2').AsFloat)                  + ' ' +
                FormatFloat('###.##',qryGeraArquivo.FieldByName('CQM2').AsFloat)                 + '  ' +
                FormatFloat('#,###.##',qryGeraArquivo.FieldByName('TXADM2').AsFloat)             + '  ' +
                FormatFloat('##,###.##',qryGeraArquivo.FieldByName('VALORLIQUIDO2').AsCurrency)  + '  ' +
                FormatFloat('#,###.##',qryGeraArquivo.FieldByName('PRESTACAO2').AsCurrency);
      GeraArquivoInform(sLinha);

      sLinha := '84        <' + CompletaInicio(Copy(qryGeraArquivo.FieldByName('IDINSCRICAOEMPTMO').AsString,1,6),'0',6) +
                '2>';
      GeraArquivoInform(sLinha);

      sLinha := '93        ' +
                FormatFloat('##,###.##',qryGeraArquivo.FieldByName('VALORBRUTO3').AsCurrency)    + '  ' +
                FormatFloat('###.##',qryGeraArquivo.FieldByName('CPMF3').AsFloat)                + '  ' +
                FormatFloat('##.##',qryGeraArquivo.FieldByName('IOF3').AsFloat)                  + ' ' +
                FormatFloat('###.##',qryGeraArquivo.FieldByName('CQM3').AsFloat)                 + '  ' +
                FormatFloat('#,###.##',qryGeraArquivo.FieldByName('TXADM3').AsFloat)             + '  ' +
                FormatFloat('##,###.##',qryGeraArquivo.FieldByName('VALORLIQUIDO3').AsCurrency)  + '  ' +
                FormatFloat('#,###.##',qryGeraArquivo.FieldByName('PRESTACAO3').AsCurrency);
      GeraArquivoInform(sLinha);

      sLinha := 'A4        <' + CompletaInicio(Copy(qryGeraArquivo.FieldByName('IDINSCRICAOEMPTMO').AsString,1,6),'0',6) +
                '3>';
      GeraArquivoInform(sLinha);

      sLinha := '11';
      GeraArquivoInform(sLinha);

      sLinha := 'C1                                    ' + qryGeraArquivo.FieldByName('IDINSCRICAOEMPTMO').AsString;
      GeraArquivoInform(sLinha);

      qryGeraArquivo.Next;
   end;
   EscondeFormProgresso;
   CloseFile(sArquivo);
end;



procedure TfrmExecGeraREFER.GeraArquivoInform(const sLinha : String);
begin
   WriteLn(sArquivo,sLinha);
end;


end.

