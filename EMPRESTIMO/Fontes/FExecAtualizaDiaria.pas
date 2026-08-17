{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : -
Data      : 15/07/2003
Autor     : Marchetti
Descrição : Passando para a rotina de Calculo dos Itens, a data prevista da
            maior parcela em atraso, bem como, o somatorio de todas as parcelas
            em aberto, vencidas e vincendas.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 15/07/2003
Autor     : Marchetti
Descrição : Passando para a rotina de Calculo dos Itens, a data prevista da
            maior parcela em atraso, bem como, o somatorio de todas as parcelas
            em aberto, vencidas e vincendas.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 03/12/2002
Autor     : Marchetti
Descrição : O saldo devedor passado para a regra de cálculo dos itens refere-se
            à data a ser considerada, ou seja, geralmente dia 20 para a FUNCEF.
            Quando não possuir atualização para o dia 20, leva-se em
            consideração a data de crédito.
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados
            seguem sem valor, pois os mesmos somente serão utilizados na
            alteração de valores da concessão.
--------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas.
--------------------------------------------------------------------------------
Rotina    : GeraItensAtu
Data      : 24/10/2002
Autor     : Marchetti
Descrição : Coloca o flgenvio dos itens calculados como enviado.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocado na qry que verifica se existe atualização diária já
            efetuada para não levar em consideração itens de atualização
            estornados.
--------------------------------------------------------------------------------
Rotina    : SelecionaContratosGeracao
Data      : 07/10/2002
Autor     : Marchetti
Descrição : Colocado filtro por contrato
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecAtualizaDiaria;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   Wwquery, mPatro, mContratoEmptmo, FSairAjudaImob, DBGrids,

   uTypesEmptmo, wwstorep,UFuncoesEmptmo;

type

   TfrmExecAtualizaDiaria = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      Panel1: TPanel;
      Label5: TLabel;
      Bevel3: TBevel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      btnContinuar: TfcShapeBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      qryContratosGeracao: TwwQuery;
      edtDataInicial: TwwDBDateTimePicker;
      Label6: TLabel;
      lstPatro: TCheckListBox;
      BitBtn2: TBitBtn;
      BitBtn1: TBitBtn;
      Label7: TLabel;
      lstPlano: TCheckListBox;
      BitBtn3: TBitBtn;
      BitBtn4: TBitBtn;
      qryAux: TwwQuery;
      memResult: TMemo;
      Panel3: TPanel;
      Panel4: TPanel;
      memErro: TMemo;
      lblTitulo: TfcLabel;
      edtDataFinal: TwwDBDateTimePicker;
      Label3: TLabel;
      LblProcessado: TLabel;
      lblErro: TLabel;
      molContratoEmptmo: TmolContratoEmptmo;
      Label4: TLabel;
      edtDataConsiderada: TwwDBDateTimePicker;
      qryAuxIDHISTMOVEMPTMO: TFloatField;
      qryParcelasEstorno: TwwQuery;
      qrySaldoAnt: TwwQuery;
      qrySaldoAntHMESALDODEV: TFloatField;
      qryParcelasAberto: TwwQuery;
      qryParcelasAbertoTOTAL: TFloatField;
      qryAtualizaSaldo: TwwQuery;
      qryAtualizaSaldoIDHISTMOVEMPTMO: TFloatField;
      qryAtualizaSaldoHMEVLRPREVISTO: TFloatField;
      qryAtualizaSaldoITCTRATASALDODEV: TFloatField;
      qryUpdateSaldo: TwwQuery;
      qryRetornaValor: TwwQuery;
      qryInsertHistMovEmptmo: TwwQuery;
      qryParcelasNaoPagas: TwwQuery;
      qryParcelasNaoPagasHMEVLRPREVISTO: TFloatField;
    chkEstorna: TCheckBox;
    qrySaldoAntHMEDATAPREVISTA: TDateTimeField;
    chkNotInArquivo: TCheckBox;
    chkInArquivo: TCheckBox;
    qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField;
    qryContratosGeracaoIDCONTRQUITACAO: TFloatField;
    qryContratosGeracaoIDTIPOEMPTMO: TFloatField;
    qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField;
    qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField;
    qryContratosGeracaoIDPATRO: TFloatField;
    qryContratosGeracaoIDPLANOPREV: TFloatField;
    qryContratosGeracaoIDVERBA: TFloatField;
    qryContratosGeracaoIDPESSOA: TFloatField;
    qryContratosGeracaoIDBENEF: TFloatField;
    qryContratosGeracaoFLGSITUACAO: TStringField;
    qryContratosGeracaoFLGFORMAREC: TStringField;
    qryContratosGeracaoFLGFORMAPAG: TStringField;
    qryContratosGeracaoCODFORMAPAG: TFloatField;
    qryContratosGeracaoPORTFORMAREC: TFloatField;
    qryContratosGeracaoPORTFORMAPAG: TFloatField;
    qryContratosGeracaoIDCBANCARIA: TFloatField;
    qryContratosGeracaoDATAASSINATURA: TDateTimeField;
    qryContratosGeracaoDATASITUACAO: TDateTimeField;
    qryContratosGeracaoDATACREDITO: TDateTimeField;
    qryContratosGeracaoDATAPRIMPARC: TDateTimeField;
    qryContratosGeracaoDATACANC: TDateTimeField;
    qryContratosGeracaoMOECODIGO: TFloatField;
    qryContratosGeracaoMOESIGLA: TStringField;
    qryContratosGeracaoVLRCONTRATO: TFloatField;
    qryContratosGeracaoVLRPARCELA: TFloatField;
    qryContratosGeracaoTXJUROS: TFloatField;
    qryContratosGeracaoNUMPARCELAS: TFloatField;
    qryContratosGeracaoIDREGRAJURCONC: TFloatField;
    qryContratosGeracaoIDREGRALIMITES: TFloatField;
    qryContratosGeracaoIDREGRASUSPCOBR: TFloatField;
    qryContratosGeracaoIDREGRASLDDIA: TFloatField;
    qryContratosGeracaoIDREGRAJURANTCONC: TFloatField;
    qryContratosGeracaoIDREGRAELEG: TFloatField;
    qryContratosGeracaoIDREGRARESERVA: TFloatField;
    qryContratosGeracaoIDREGRAMARGEM: TFloatField;
    qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnMarcaTodosPatroClick(Sender: TObject);
      procedure btnInvertePatroClick(Sender: TObject);
      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
    procedure edtDataFinalExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

   private { Private declarations }

      vIDPatro, vIDPlano   : array of Int64;
      rSaldoDevAnt         : TSaldoDevAnt;
      rSaldoDevAtualiza    : TSaldoDevAnt;
      rContrato            : TDadosContrato;
      rConcessao           : TDadosConcessao;
      vItens               : Array [0..9] of TItemRecDep;
      dDataAtualizacao     : TDateTime;

      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;
      //xMutuario            : TmolMutuario;
      iParcelaAtual        : Integer;
      rSitPart             : TSitPart;
      fSaldoAnt            : Currency;
      fSaldo20             : Currency;
      dData20              : TDateTime;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      procedure PreenchePatro;
      procedure MarcaTodosPatro;
      function SelecaoPatro: Boolean;
      function PegaPatro: String;

      procedure PreenchePlano;
      procedure MarcaTodosPlano;
      function SelecaoPlano: Boolean;
      function PegaPlano: String;

      procedure AbreQueries;
      function VerificaPreenchimento: Boolean;


   public { Public declarations }

   end;



var
  frmExecAtualizaDiaria: TfrmExecAtualizaDiaria;


implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uVerificaPreenchimento,
   dLookEmptmo, dMS, uDiasUteis, dEmptmo, uIntegraEmptmo, uCalcEmptmo,
   FProgresso, dCalcEmptmo, URegra, uCmFileUtils, dAtualizacaoDiaria;




procedure TfrmExecAtualizaDiaria.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;

   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmExecAtualizaDiaria.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmExecAtualizaDiaria.PreenchePatro;
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



procedure TfrmExecAtualizaDiaria.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TfrmExecAtualizaDiaria.SelecaoPatro: Boolean;
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



function TfrmExecAtualizaDiaria.PegaPatro: String;
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



procedure TfrmExecAtualizaDiaria.PreenchePlano;
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



procedure TfrmExecAtualizaDiaria.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TfrmExecAtualizaDiaria.SelecaoPlano: Boolean;
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



function TfrmExecAtualizaDiaria.PegaPlano: String;
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



procedure TfrmExecAtualizaDiaria.FormShow(Sender: TObject);
var
   iAno, iMes       : Word;
begin
   inherited;

   ntbPrincipal.PageIndex := 0;

   iAno := DiasUteis.ExtraiAno(DiasUteis.SomaMeses(SysDate,-1));
   iMes := DiasUteis.ExtraiMes(DiasUteis.SomaMeses(SysDate,-1));

   edtDataInicial.Date     := DiasUteis.UltDiaMes(iAno, iMes);
   edtDataFinal.Date       := edtDataInicial.Date;

   edtDataConsiderada.Date := DiasUteis.SomaMeses(edtDataFinal.Date,1);

   iAno := DiasUteis.ExtraiAno(edtDataConsiderada.Date);
   iMes := DiasUteis.ExtraiMes(edtDataConsiderada.Date);

   edtDataConsiderada.Date := DiasUteis.UltDiaMes(iAno,iMes);

   ParametrosSistema;

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



procedure TfrmExecAtualizaDiaria.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmExecAtualizaDiaria.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPatro;
end;



procedure TfrmExecAtualizaDiaria.btnInvertePatroClick(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := not(lstPatro.Checked[i]);
end;



procedure TfrmExecAtualizaDiaria.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPlano;
end;



procedure TfrmExecAtualizaDiaria.btnInvertePlanoClick(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;



procedure TfrmExecAtualizaDiaria.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;

      end else begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmExecAtualizaDiaria.AbreQueries;
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



procedure TfrmExecAtualizaDiaria.btnContinuarClick(Sender: TObject);
var
   iResultContab : integer;
   iContador     : integer;
begin
   inherited;

   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

   if VerificaPreenchimento then
   begin
      try
         MemErro.Lines.Clear;
         memResult.Lines.Clear;

         if edtDataFinal.Date > edtDataInicial.Date then chkEstorna.Checked := True;

         Repaint;
         Application.ProcessMessages;

         memResult.Lines.Add('Início de Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', now));

         DesabilitaBotoes;

         // ----------------------------------------------------------------------------------------
         (* Seleciona os contratos Ativos *)


         (* Executa o loop para o intervalo de datas informadas *)
         for iContador := trunc(edtDataInicial.Date) to trunc(edtDataFinal.Date) do
         begin
             dDataAtualizacao := iContador;

             dtmAtualizacaoDiaria.IDContratoEmptmo := molContratoEmptmo.IDContrato;
             dtmAtualizacaoDiaria.DataAtualizacao  := dDataAtualizacao;

             if not(dtmAtualizacaoDiaria.SelecionaContratosGeracao(DateToStr(dDataAtualizacao),
                                                                   DBcboTipoEmptmo.LookupValue,
                                                                   DBcboTipoContrato.LookupValue,
                                                                   PegaPatro,
                                                                   PegaPlano,
                                                                   chkInArquivo.Checked,
                                                                   chkNotInArquivo.Checked
                                                                  )) then
             begin
                MemErro.Lines.Add(DateToStr(dDataAtualizacao) + ' - Não há contratos a serem atualizados.')

             end
             else
             begin
                (* Itera pelos contratos, gerando (ou não) as parcelas *)
                if not(dtmAtualizacaoDiaria.ProcessaContratos(MemResult,
                                                              MemErro,
                                                              chkEstorna.Checked,
                                                              edtDataConsiderada.Date)) then
                begin
                  lblProcessado.Caption := 'Processados: '             + IntToStr(memResult.Lines.Count);
                  lblErro.Caption       := 'Ocorrências encontradas: ' + IntToStr(memErro.Lines.Count);

                  Application.ProcessMessages;
                  Exit;
                end;

                lblProcessado.Caption := 'Processados: '             + IntToStr(memResult.Lines.Count);
                lblErro.Caption       := 'Ocorrências encontradas: ' + IntToStr(memErro.Lines.Count);

                Application.ProcessMessages;
             end;

             // ----------------------------------------------------------------------------------------
            if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         end; {end for data inicial}


         MsgDlg('Atualização diária finalizada.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

      finally
         memResult.Lines.Add('Final de Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', now));

         ntbPrincipal.PageIndex := 1;
         HabilitaBotoes;
      end; (* try *)

   end; (* if VerificaPreenchimento *)
end;



function TfrmExecAtualizaDiaria.VerificaPreenchimento: Boolean;
begin
      Result := False;

   try

      // Pelo menos 1 Patrocinadora deve estar selecionado
      if not(SelecaoPatro) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos uma Patrocinadora!', lstPatro);

      // Pelo menos 1 Plano deve estar selecionado
      if not(SelecaoPlano) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Plano!', lstPlano);

      // Data inicial deve ser preenchida
      if edtDataInicial.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataInicial);

      // Data final não pode ser inferior a data inicial
      if edtDataFinal.Date < edtDataInicial.Date then
         raise EValidacao.CreateVal('Data final não pode ser inferior a Data inicial!', edtDataFinal);

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



procedure TfrmExecAtualizaDiaria.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecAtualizaDiaria.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecAtualizaDiaria.edtDataInicialExit(Sender: TObject);
var
   iAno, iMes       : Word;
begin
   inherited;
   edtDataFinal.Date       := edtDataInicial.Date;
   edtDataConsiderada.Date := DiasUteis.SomaMeses(edtDataFinal.Date,1);
   iAno := DiasUteis.ExtraiAno(edtDataConsiderada.Date);
   iMes := DiasUteis.ExtraiMes(edtDataConsiderada.Date);
   edtDataConsiderada.Date := DiasUteis.UltDiaMes(iAno,iMes);
end;



procedure TfrmExecAtualizaDiaria.edtDataFinalExit(Sender: TObject);
var
   iAno, iMes       : Word;
begin
   inherited;
   edtDataConsiderada.Date := DiasUteis.SomaMeses(edtDataFinal.Date,1);
   iAno := DiasUteis.ExtraiAno(edtDataConsiderada.Date);
   iMes := DiasUteis.ExtraiMes(edtDataConsiderada.Date);
   edtDataConsiderada.Date := DiasUteis.UltDiaMes(iAno,iMes);
end;

procedure TfrmExecAtualizaDiaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UFuncoesEmptmo.bBuscaMutuario := false;
end;


end.
