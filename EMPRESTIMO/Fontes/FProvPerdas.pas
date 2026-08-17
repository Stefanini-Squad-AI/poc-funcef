{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 138242 KINTANA 843763
Responsável : Ádler Souza
Data        : 16/09/2010
Descrição   : Criação desta funcionalidade.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FProvPerdas;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   Wwquery, mPatro, mContratoEmptmo, FSairAjudaImob, DBGrids,
   uCtrlContab, uCtrlPadroes,
   uTypesEmptmo, wwstorep, mListaPlano, mListaPatro;

type

   TfrmProvPerdas = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      Panel1: TPanel;
      Label5: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      btnContinuar: TfcShapeBtn;
      btnVoltar: TfcShapeBtn;
      qryContratosGeracao: TwwQuery;
      edtDataInicial: TwwDBDateTimePicker;
      qryAux: TwwQuery;
      memResult: TMemo;
      Panel3: TPanel;
      Panel4: TPanel;
      memErro: TMemo;
      lblTitulo: TfcLabel;
      edtDataFinal: TwwDBDateTimePicker;
      Label3: TLabel;
      molContratoEmptmo: TmolContratoEmptmo;
      Label4: TLabel;
      edtDataConsiderada: TwwDBDateTimePicker;
      qryAuxIDHISTMOVEMPTMO: TFloatField;
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
      qryContratosGeracaoDATAINSC: TDateTimeField;
      qryContratosGeracaoIDSITPART: TFloatField;
      qryContratosGeracaoFLGINTERNO: TStringField;
      qryInsertHistMovEmptmo: TwwQuery;
      qryParcelasNaoPagas: TwwQuery;
      qryParcelasNaoPagasHMEVLRPREVISTO: TFloatField;
      chkEstorna: TCheckBox;
      qrySaldoAntHMEDATAPREVISTA: TDateTimeField;
      chkNotInArquivo: TCheckBox;
      chkInArquivo: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryTipoContr: TwwQuery;
      qryTipoContrIDTIPOCONTREMPTMO: TFloatField;
      qryTipoContrTCEDESCRICAO: TStringField;
      qryTipoContrIDREGRAJURCONC: TFloatField;
      qryTipoContrIDREGRALIMITES: TFloatField;
      qryTipoContrIDREGRASUSPCOBR: TFloatField;
      qryTipoContrIDREGRASLDDIA: TFloatField;
      qryTipoContrIDREGRAJURANTCONC: TFloatField;
      qryTipoContrIDREGRAELEG: TFloatField;
      qryTipoContrIDREGRARESERVA: TFloatField;
      qryTipoContrIDREGRAMARGEM: TFloatField;
      qryTipoContrIDREGRAPRAZOSCONC: TFloatField;
      qryTipoContrFLGSITUACAO: TStringField;
      qryTipoContrFLGSUSPENSAO: TStringField;
      qryTipoContrFLGSEGURO: TStringField;
      qryTipoContrTCEMAXCONTRATO: TFloatField;
      qryTipoContrTCEMAXINSCR: TFloatField;
      qryTipoContrTCEMAXPARC: TFloatField;
      qryTipoContrTCEMINPARC: TFloatField;
      qryTipoContrTCEMINQUIT: TFloatField;
      qryTipoContrIDREPORTS: TFloatField;
      qryTipoContrTCETRATAPARCATRAS: TStringField;
      qryTipoContrTCETRATAPARCPARC: TStringField;
      qryTipoContrIDTIPOEMPTMO: TFloatField;
      qryTipoContrDESCTIPOEMPTMO: TStringField;
      qryTipoContrIDREGRASALBAS: TFloatField;
      qryTipoContrTCEMINRENOVA: TFloatField;
      qryTipoContrMOECODIGO: TFloatField;
      qryTipoContrIDREGRADATACRED: TFloatField;
      qryTipoContrIDREGRAQUITADO: TFloatField;
      qryTipoContrFLGCOBRJUDIC: TFloatField;
      qryTipoContrTCEMAXMESDEB: TFloatField;
      qryTipoContrIDREGRAVLRMAX: TFloatField;
      qryTipoContrNUMPARCDESCONTO: TFloatField;
      qryTipoContrIDREGRAPRAZOMAX: TFloatField;
      chkCommit: TCheckBox;
      qryLog: TwwQuery;
      qryLogIDMODULO: TFloatField;
      qryLogIDPESQUISA1: TFloatField;
      qryLogIDPESQUISA2: TFloatField;
      qryLogDESCPROCESSO: TStringField;
      qryLogDESCOPERACAO: TStringField;
      qryLogFLGTIPO: TFloatField;
      qryLogTRGUSERINCLUSAO: TStringField;
      qryLogTRGDTINCLUSAO: TDateTimeField;
      qryLimpaLog: TwwQuery;
      chkContratoBranco: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure edtDataInicialCloseUp(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private  // Private declarations

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404
      vIDPatro, vIDPlano   : array of Int64;
      rSaldoDevAnt         : TSaldoDevAnt;
      rSaldoDevAtualiza    : TSaldoDevAnt;
      rContrato            : TDadosContrato;
      rConcessao           : TDadosConcessao;
      vItens               : Array [0..9] of TItemRecDep;
      iPais                : Integer;
      sEstado              : String;
      iCidade              : Integer;
      iParcelaAtual        : Integer;
      rSitPart             : TSitPart;
      fSaldoAnt            : Currency;
      fSaldo20             : Currency;
      dData20              : TDateTime;

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;

      procedure AbreQueries;
      function VerificaPreenchimento: Boolean;


   public   // Public declarations

   end;



var
  frmProvPerdas: TfrmProvPerdas;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uVerificaPreenchimento,
   dLookEmptmo, uFuncoesEmptmo, dMS, uDiasUteis, dEmptmo, uIntegraEmptmo, uCalcEmptmo,
   FProgresso, dCalcEmptmo, URegra, uCmFileUtils, dAtualizacaoDiaria,
   uLancContab;




procedure TfrmProvPerdas.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;

   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmProvPerdas.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmProvPerdas.FormShow(Sender: TObject);
var
   sAno, sMes    : String;
begin
   inherited;

   ntbPrincipal.PageIndex  := 0;

   edtDataInicial.Date     := SysDate;
   edtDataFinal.Date       := edtDataInicial.Date;

   sAno  := IntToStr(DiasUteis.ExtraiAno(DiasUteis.SomaMeses(edtDataInicial.Date,-1)));
   sMes  := IntToStr(DiasUteis.ExtraiMes(DiasUteis.SomaMeses(edtDataInicial.Date,-1)));

   if length(sMes) = 1 then sMes := '0' + sMes;

   edtDataConsiderada.Date := SysDate;

   ParametrosSistema;


   molContratoEmptmo.Filtro := 'AND CON.FLGSITUACAO  NOT IN (''C'', ''K'', ''Q'') ' + #13;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TfrmProvPerdas.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with qryTipoContr do
   begin
      LimpaParametros(qryTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmProvPerdas.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with qryTipoContr do
   begin
      LimpaParametros(qryTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;

   end;
end;



procedure TfrmProvPerdas.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TfrmProvPerdas.btnContinuarClick(Sender: TObject);
var
   dIni, dFim        : TDateTime;
   iContratosPrev    : Integer;
   iContratosTent    : Integer;
   iContratos        : Integer;
   iContadorPatro    : Integer;
   iContadorPlano    : Integer;

   bTodasPatro       : Boolean;
   bTodasPlanos      : Boolean;
   i : integer;
begin
   inherited;

   bTodasPatro := False;

   for i := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
   begin
     if molListaPatro.lstPatro.Checked[i] = True then
       bTodasPatro := True;
   end;

   bTodasPlanos := False;

   for i := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
   begin
     if molListaPlano.lstPlano.Checked[i] = True then
       bTodasPlanos := True;
   end;



   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;

   if not(VerificaPreenchimento) then Exit;

   if molContratoEmptmo.IDContrato <= 0 then
   begin
      if MsgDlg('Não foi indicado Contrato.' + #13 + 'Deseja realmente prosseguir?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Repaint;
         Exit;
      end;
      Repaint;
   end;

   try
      MemErro.Lines.Clear;
      memResult.Lines.Clear;

      Repaint;
      Application.ProcessMessages;

      qryLimpaLog.ExecSQL;

      Repaint;
      Application.ProcessMessages;

      dIni := Now;
      memResult.Lines.Add('Atualização de Saldo, de ' + FormatDateTime('dd/mm/yyyy', edtDataInicial.Date) +
                          ' a ' + FormatDateTime('dd/mm/yyyy', edtDataFinal.Date) );

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Início de Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dIni) + 'h');

      DesabilitaBotoes;

      // ----------------------------------------------------------------------------------------
      if molContratoEmptmo.IDContrato > 0 then
      begin
         with dtmAtualizacaoDiaria.spProvPerdas do
         begin
            ParamByName('iContrato').AsFloat          := molContratoEmptmo.IDContrato;
            ParamByName('iTipoEmptmo').AsFloat        := -1;
            ParamByName('iTipoContrato').AsFloat      := -1;
            ParamByName('iPatro').AsFloat             := -1;
            ParamByName('iPlano').AsFloat             := -1;

            if chkEstorna.Checked then
            begin
               ParamByName('bEstorna').AsFloat        := 1;
            end else begin
               ParamByName('bEstorna').AsFloat        := 0;
            end;


            ParamByName('iCalculaProv').AsFloat    := -1;
            ParamByName('bAtualizaSaldo').AsFloat  := -1;

            if chkInArquivo.Checked then
            begin
               ParamByName('bInArquivo').AsFloat      := 1;
            end else begin
               ParamByName('bInArquivo').AsFloat      := -1;
            end;

            if chkNotInArquivo.Checked then
            begin
               ParamByName('bNotInArquivo').AsFloat   := 1;
            end else begin
               ParamByName('bNotInArquivo').AsFloat   := -1;
            end;

            ParamByName('dDataConsidera').AsDate      := edtDataConsiderada.Date;
            ParamByName('dDataInicial').AsDate        := edtDataInicial.Date;
            ParamByName('dDataFinal').AsDate          := edtDataFinal.Date;
            ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

            if not(Prepared) then Prepare;
            ExecProc;
         end;
      end
      else // if molContratoEmptmo.IDContrato > 0
      begin
        if (bTodasPatro = False) and (bTodasPlanos = False) then
        begin
          for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
          begin
            if molListaPatro.lstPatro.Checked[iContadorPatro] then
            begin
              for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
              begin
                if molListaPlano.lstPlano.Checked[iContadorPlano] then
                begin
                  with dtmAtualizacaoDiaria.spProvPerdas do
                  begin
                    ParamByName('iContrato').AsFloat          := -1;

                    if DBcboTipoEmptmo.LookupValue <> '' then begin
                       ParamByName('iTipoEmptmo').AsFloat     := StrToInt(DBcboTipoEmptmo.LookupValue);
                    end else begin
                       ParamByName('iTipoEmptmo').AsFloat     := -1;
                    end;

                    if DBcboTipoContrato.LookupValue <> '' then begin
                       ParamByName('ITipoContrato').AsFloat   := StrToInt(DBcboTipoContrato.LookupValue);
                    end else begin
                       ParamByName('ITipoContrato').AsFloat   := -1;
                    end;

                    ParamByName('iPatro').AsFloat             := molListaPatro.vIDPatro[iContadorPatro];
                    ParamByName('iPlano').AsFloat             := molListaPlano.vIDPlano[iContadorPlano];

                    if chkEstorna.Checked then
                    begin
                       ParamByName('bEstorna').AsFloat        := 1;
                    end else begin
                       ParamByName('bEstorna').AsFloat        := 0;
                    end;

                    ParamByName('iCalculaProv').AsFloat    := -1;
                    ParamByName('bAtualizaSaldo').AsFloat  := -1;


                    if chkInArquivo.Checked then
                    begin
                       ParamByName('bInArquivo').AsFloat      := 1;
                    end else begin
                       ParamByName('bInArquivo').AsFloat      := -1;
                    end;

                    if chkNotInArquivo.Checked then
                    begin
                       ParamByName('bNotInArquivo').AsFloat   := 1;
                    end else begin
                       ParamByName('bNotInArquivo').AsFloat   := -1;
                    end;

                    ParamByName('dDataConsidera').AsDate      := edtDataConsiderada.Date;
                    ParamByName('dDataInicial').AsDate        := edtDataInicial.Date;
                    ParamByName('dDataFinal').AsDate          := edtDataFinal.Date;

                    ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

                    if not(Prepared) then Prepare;
                    ExecProc;
                  end;
                end;  // if molListaPlano.lstPlano.Checked[iContadorPlano]
              end;  // for(Plano)
            end;  // if molListaPatro.lstPatro.Checked[iContadorPatro]
          end;  // for(Patro)
        end  
        else // if bTodasPatro = False and bTodasPlanos = False then
        begin
           //NOVA IMPLEMENTACAO
           //===================================================================
           if (bTodasPatro = True) and (bTodasPlanos = False) then
           begin
             //for nos planos
             //patro = -1
             for iContadorPlano := 0 to (molListaPlano.lstPlano.Items.Count - 1) do
             begin
               if molListaPlano.lstPlano.Checked[iContadorPlano] then
               begin
                 with dtmAtualizacaoDiaria.spProvPerdas do
                   begin
                      ParamByName('iContrato').AsFloat          := -1;

                      if DBcboTipoEmptmo.LookupValue <> '' then begin
                         ParamByName('iTipoEmptmo').AsFloat     := StrToInt(DBcboTipoEmptmo.LookupValue);
                      end else begin
                         ParamByName('iTipoEmptmo').AsFloat     := -1;
                      end;

                      if DBcboTipoContrato.LookupValue <> '' then begin
                         ParamByName('ITipoContrato').AsFloat   := StrToInt(DBcboTipoContrato.LookupValue);
                      end else begin
                         ParamByName('ITipoContrato').AsFloat   := -1;
                      end;

                      ParamByName('iPatro').AsFloat             := -1;
                      ParamByName('iPlano').AsFloat             := molListaPlano.vIDPlano[iContadorPlano];

                      if chkEstorna.Checked then
                      begin
                         ParamByName('bEstorna').AsFloat        := 1;
                      end else begin
                         ParamByName('bEstorna').AsFloat        := 0;
                      end;

                      ParamByName('iCalculaProv').AsFloat    := -1;
                      ParamByName('bAtualizaSaldo').AsFloat  := -1;


                      if chkInArquivo.Checked then
                      begin
                         ParamByName('bInArquivo').AsFloat      := 1;
                      end else begin
                         ParamByName('bInArquivo').AsFloat      := -1;
                      end;

                      if chkNotInArquivo.Checked then
                      begin
                         ParamByName('bNotInArquivo').AsFloat   := 1;
                      end else begin
                         ParamByName('bNotInArquivo').AsFloat   := -1;
                      end;

                      ParamByName('dDataConsidera').AsDate      := edtDataConsiderada.Date;
                      ParamByName('dDataInicial').AsDate        := edtDataInicial.Date;
                      ParamByName('dDataFinal').AsDate          := edtDataFinal.Date;

                      ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

                      if not(Prepared) then Prepare;
                      ExecProc;
                   end;
               end;
             end;
           end
           else
             //=================================================================
             if (bTodasPatro = False) and (bTodasPlanos = True) then
             begin
               //for nas Patros
               //planos = -1
               for iContadorPatro := 0 to (molListaPatro.lstPatro.Items.Count - 1) do
               begin
                 if molListaPatro.lstPatro.Checked[iContadorPatro] then
                 begin
                   with dtmAtualizacaoDiaria.spProvPerdas do
                   begin
                      ParamByName('iContrato').AsFloat          := -1;

                      if DBcboTipoEmptmo.LookupValue <> '' then begin
                         ParamByName('iTipoEmptmo').AsFloat     := StrToInt(DBcboTipoEmptmo.LookupValue);
                      end else begin
                         ParamByName('iTipoEmptmo').AsFloat     := -1;
                      end;

                      if DBcboTipoContrato.LookupValue <> '' then begin
                         ParamByName('ITipoContrato').AsFloat   := StrToInt(DBcboTipoContrato.LookupValue);
                      end else begin
                         ParamByName('ITipoContrato').AsFloat   := -1;
                      end;

                      ParamByName('iPatro').AsFloat             := molListaPatro.vIDPatro[iContadorPatro];
                      ParamByName('iPlano').AsFloat             := -1;

                      if chkEstorna.Checked then
                      begin
                         ParamByName('bEstorna').AsFloat        := 1;
                      end else begin
                         ParamByName('bEstorna').AsFloat        := 0;
                      end;

                      ParamByName('iCalculaProv').AsFloat    := -1;
                      ParamByName('bAtualizaSaldo').AsFloat  := -1;


                      if chkInArquivo.Checked then
                      begin
                         ParamByName('bInArquivo').AsFloat      := 1;
                      end else begin
                         ParamByName('bInArquivo').AsFloat      := -1;
                      end;

                      if chkNotInArquivo.Checked then
                      begin
                         ParamByName('bNotInArquivo').AsFloat   := 1;
                      end else begin
                         ParamByName('bNotInArquivo').AsFloat   := -1;
                      end;

                      ParamByName('dDataConsidera').AsDate      := edtDataConsiderada.Date;
                      ParamByName('dDataInicial').AsDate        := edtDataInicial.Date;
                      ParamByName('dDataFinal').AsDate          := edtDataFinal.Date;

                      ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

                      if not(Prepared) then Prepare;
                      ExecProc;
                   end;
                 end;
               end;
             end
             else
             //===================================================================
               //sem for
               //planos e patro = -1
               with dtmAtualizacaoDiaria.spProvPerdas do
                 begin
                    ParamByName('iContrato').AsFloat          := -1;

                    if DBcboTipoEmptmo.LookupValue <> '' then begin
                       ParamByName('iTipoEmptmo').AsFloat     := StrToInt(DBcboTipoEmptmo.LookupValue);
                    end else begin
                       ParamByName('iTipoEmptmo').AsFloat     := -1;
                    end;

                    if DBcboTipoContrato.LookupValue <> '' then begin
                       ParamByName('ITipoContrato').AsFloat   := StrToInt(DBcboTipoContrato.LookupValue);
                    end else begin
                       ParamByName('ITipoContrato').AsFloat   := -1;
                    end;

                    ParamByName('iPatro').AsFloat             := -1;
                    ParamByName('iPlano').AsFloat             := -1;

                    if chkEstorna.Checked then
                    begin
                       ParamByName('bEstorna').AsFloat        := 1;
                    end else begin
                       ParamByName('bEstorna').AsFloat        := 0;
                    end;

                    ParamByName('iCalculaProv').AsFloat    := -1;
                    ParamByName('bAtualizaSaldo').AsFloat  := -1;


                    if chkInArquivo.Checked then
                    begin
                       ParamByName('bInArquivo').AsFloat      := 1;
                    end else begin
                       ParamByName('bInArquivo').AsFloat      := -1;
                    end;

                    if chkNotInArquivo.Checked then
                    begin
                       ParamByName('bNotInArquivo').AsFloat   := 1;
                    end else begin
                       ParamByName('bNotInArquivo').AsFloat   := -1;
                    end;

                    ParamByName('dDataConsidera').AsDate      := edtDataConsiderada.Date;
                    ParamByName('dDataInicial').AsDate        := edtDataInicial.Date;
                    ParamByName('dDataFinal').AsDate          := edtDataFinal.Date;

                    ParamByName('iEmpresa').AsFloat           := Sistema.IDEmpresa;

                    if not(Prepared) then Prepare;
                    ExecProc;
                 end;
        end; // if bTodasPatro = False and bTodasPlanos = False then
      end; // molContratoEmptmo.IDContrato > 0
      // ----------------------------------------------------------------------------------------

   finally
      dFim := Now;

      iContratosPrev := 0;
      iContratosTent := 0;
      iContratos     := 0;

      qryLog.Open;
      iContratosPrev := qryLog.RecordCount;

      qryLog.First;
      while not(qryLog.EOF) do
      begin
         case qryLogFLGTIPO.AsInteger of

            0:
            begin
               inc(iContratos);
               inc(iContratosTent);
            end;

            1, 2:
            begin
               if qryLogFLGTIPO.AsInteger = 1 then inc(iContratosTent);

               memErro.Lines.Add(
               FormatDateTime('hh:mm:ss', qryLogTRGDTINCLUSAO.AsDateTime) + ' - ' +
               CompletaInicio(FormatFloat('#0', qryLogIDPESQUISA1.AsFloat), ' ', 12) + ' ' +
               qryLogDESCOPERACAO.AsString);
            end;

         end;

         qryLog.Next;
      end;

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final do Processo : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dFim) + 'h');
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Duração Total     :            ' + FormatDateTime('hh:nn:ss.zzz', dFim - dIni));
      memResult.Lines.Add(' ');
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Contratos previstos    : ' + FormatFloat('00,000', iContratosPrev) );
      memResult.Lines.Add('Contratos processados  : ' + FormatFloat('00,000', iContratosTent) );
      memResult.Lines.Add('Contratos atualizados  : ' + FormatFloat('00,000', iContratos) );

      memResult.Lines.Add(' ');

      if iContratosTent > 0 then
      begin
         memResult.Lines.Add('Tempo por Contrato     : ' + FormatDateTime('ss.zzz', (dFim - dIni) / iContratosTent) + 's');
      end
      else
      begin
         memResult.Lines.Add('Tempo por Contrato     : ' + FormatDateTime('ss.zzz', 0) + 's');
      end;

      qryLog.Close;

      ntbPrincipal.PageIndex := 1;
      HabilitaBotoes;

      EscondeEspera;
      EscondeFormProgresso;
   end;
end;



function TfrmProvPerdas.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // Ou seleciona 1 contrato ou diz que não é para selecionar
      if (molContratoEmptmo.IDContrato <= 0) and not(chkContratoBranco.Checked) then
         raise EValidacao.CreateVal('É necessário indicar um Contrato ou que não haverá Contrato selecionado!', molContratoEmptmo.btnBuscaContrato);

      // Data inicial deve ser preenchida
      if edtDataInicial.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataInicial);

      // Data final não pode ser inferior a data inicial
      if edtDataFinal.Date < edtDataInicial.Date then
         raise EValidacao.CreateVal('Data final não pode ser inferior a Data inicial!', edtDataFinal);

      // André Pontes - 03/06/2005 - pendência 19404
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataInicial.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';
         iExercicio  := 0;
         iPeriodo    := 0;

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataInicial);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataInicial);
         end;
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404

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



procedure TfrmProvPerdas.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmProvPerdas.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);

   if molContratoEmptmo.IDContrato > 0 then chkContratoBranco.Checked := False; 
end;




procedure TfrmProvPerdas.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmProvPerdas.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmProvPerdas.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmProvPerdas.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmProvPerdas.edtDataInicialCloseUp(Sender: TObject);
begin
   inherited;

   if edtDataFinal.Date < edtDataInicial.Date then edtDataFinal.Date := edtDataInicial.Date;
   edtDataConsiderada.Date := (edtDataInicial.Date);
   chkEstorna.Checked      := (edtDataInicial.Date < Date);
end;



procedure TfrmProvPerdas.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404
end;



procedure TfrmProvPerdas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   inherited;
end;



end.

