{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit FExecValorAtualizadoArquivo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, CheckLst, fcCombo, fcColorCombo, Mask, wwdbedit,
   Wwdbspin, wwdblook, Db, DBTables, Wwdatsrc, Wwquery, Grids, Wwdbgrid, wwdbdatetimepicker,
   uTypesEmptmo, Wwdbigrd, FOkCancelarImob, mListaPlano, mListaPatro,
   BfDialogs, BrowseFolder, uProcuraDir;

type
   TfrmExecValorAtualizadoArquivo = class(TfrmOkCancelarImob)
      molContratoEmptmo: TmolContratoEmptmo;
      Panel2: TPanel;
      edtDataVencto: TwwDBDateTimePicker;
      Label2: TLabel;
      qryHistMov: TwwQuery;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      updHistMovVirtual: TUpdateSQL;
      qry: TwwQuery;
      DBgrdHistMovVirtual: TwwDBGrid;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovCOMPETENCIA: TStringField;
      qryHistMovCOBRANCA: TStringField;
      qryHistMovIDPATRO: TFloatField;
      qryHistMovIDPLANOPREV: TFloatField;
      qryHistMovIDSITPART: TFloatField;
      qryHistMovFLGINTERNO: TStringField;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovVirtualHMEPARCELAALT: TFloatField;
      qryHistMovVirtualHMENUMPARCELAS: TFloatField;
      qryHistMovHMEPARCELAALT: TFloatField;
      Label1: TLabel;
      Label3: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryHistMovVirtualMATRICULA: TStringField;
      qryHistMovVirtualNOME: TStringField;
      qryHistMovVirtualLOGRADOURO: TStringField;
      qryHistMovVirtualNUMERO: TStringField;
      qryHistMovVirtualCOMPL: TStringField;
      qryHistMovVirtualSITUACAO_CONTRATO: TStringField;
      qryHistMovVirtualBAIRRO: TStringField;
      qryHistMovVirtualCIDADE: TStringField;
      qryHistMovVirtualCEP: TStringField;
      qryHistMovVirtualSITPART: TStringField;
      qryHistMovVirtualCPF: TStringField;
      Label4: TLabel;
      pnlPasta: TPanel;
      lblDiretorio: TLabel;
      btnEscolheDir: TBitBtn;
      dlgCaminho: TProcuraDirDlg;
      qryINSCRICAONUMERO: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryMATRICULA: TStringField;
      qryBENEFICIARIO: TStringField;
      qryTCEDESCRICAO: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryDESCTIPOEMPTMO: TStringField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDCONTRQUITACAO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDVERBA: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDCBANCARIADEB: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryDATACANC: TDateTimeField;
      qryDATACREDITO: TDateTimeField;
      qryDATASITUACAO: TDateTimeField;
      qryDATAASSINATURA: TDateTimeField;
      qryDATAPRIMPARC: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryVLRPARCELA: TFloatField;
      qryTXJUROS: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      qryIDPLANOORIGEM: TFloatField;
      qryMOECODIGO: TFloatField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryTSEDESCRICAO: TStringField;
      qryMOESIGLA: TStringField;
      qryDATAINSC: TDateTimeField;
      qryLOGRADOURO: TStringField;
      qryNUMERO: TStringField;
      qryCOMPLEMENTO: TStringField;
      qryBAIRRO: TStringField;
      qryCEP: TStringField;
      qryCIDADE: TStringField;
      qryUF: TStringField;
      qryNUMDOCUMENTO: TStringField;
      qryHistMovVirtualUF: TStringField;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnEscolheDirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

      rContrato   : TDadosContrato;
      vLista      : TListaItem;
      rSaldo      : TSaldoDevAnt;

      procedure AbreQueries;

      procedure CalculaValores;
      procedure GeraArquivo;

      procedure PreencheTabelaVirtual;
      procedure SelecionaRegistrosDivergentes;
      function  VerificaPreenchimento: Boolean;
      procedure Sel(i: Extended);



   public   // Public declarations

   end;



var  frmExecValorAtualizadoArquivo: TfrmExecValorAtualizadoArquivo;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   dBaseDados,
   uDataBase,
   UFuncoesEmptmo,
   UDiasUteis,
   USistema,
   dEmptmo,
   uMensErro,
   fProgresso,
   uCalcEmptmo,
   uVerificaPreenchimento;




procedure TfrmExecValorAtualizadoArquivo.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



procedure TfrmExecValorAtualizadoArquivo.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   // limpa a seleção de Contrato
   molContratoEmptmo.btnLimpaContrato.Click;

   edtDataVencto.Date := Sysdate;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);

   //pnlPasta.Caption := Sistema.TempDir;
   //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;



procedure TfrmExecValorAtualizadoArquivo.bbtnConfirmarClick(Sender: TObject);
begin
   if not(VerificaPreenchimento) then Exit;

   DesabilitaBotoes;

   SelecionaRegistrosDivergentes;

   CalculaValores;

   GeraArquivo;

   HabilitaBotoes;

   inherited;
end;



procedure TfrmExecValorAtualizadoArquivo.CalculaValores;
var
   fSaldoAReceber       : Currency;
   iParcela             : Integer;
   iParcelaAlt          : Integer;
   iParcAnt             : Integer;
   iNovoAnoCompetencia  : Integer;
   iNovoMesCompetencia  : Integer;
   iContador            : Integer;

   iIDHistMovEmptmo     : Extended;
   fContrAnt            : Extended;
   fContrato            : Extended;

   sMensErro            : String;
   sSQL                 : String;
   sNovoMesCobranca     : String;
   sNovoAnoCobranca     : String;
   sNovaFormaCobranca   : String;
   sNovaDataCobranca    : String;
begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   sMensErro            := '';

   try
      qryHistMov.First;

      frmProgresso.MostraFormProgresso('Calculando Valores Atualizados...',
                                       True, False,
                                       True,
                                       0,
                                       qryHistMov.RecordCount
                                      );

      iContador   := 0;
      iParcAnt    := -1;
      fContrAnt   := -1;

      qryHistMov.DisableControls;

      while not(qryHistMov.EOF) do
      begin
         inc(iContador);

         frmProgresso.AndaFormProgresso(iContador);

         // ----------------------------------------------------------------------------------------

         fContrato := qryHistMovIDCONTRATOEMPTMO.AsFloat;

         if fContrAnt <> fContrato then
         begin
            // abre a query principal com o participante escolhido
            Sel(qryHistMovIDCONTRATOEMPTMO.AsFloat);

            // Preenche registro com os dados do Contrato
            PreencheDadosContrato(qry, rContrato);
         end;

         // ----------------------------------------------------------------------------------------

         // calcula nova competência
         iNovoAnoCompetencia  := DiasUteis.ExtraiAno(edtDataVencto.Date);
         iNovoMesCompetencia  := DiasUteis.ExtraiMes(edtDataVencto.Date);
         sNovaFormaCobranca   := 'F';
         sNovaDataCobranca    := DateToStr(edtDataVencto.Date);

         // Processa Registro Selecionado ----------------------------------------------------


         fSaldoAReceber := qryHistMovHMEVLRPREVISTO.AsCurrency;
         iParcela       := qryHistMovHMEPARCELA.AsInteger;

         // Calcula novos dados da Cobrança
         sNovoMesCobranca := Copy(sNovaDataCobranca, 4, 2);
         sNovoAnoCobranca := Copy(sNovaDataCobranca, 7, 4);

         if (fSaldoAReceber <> 0) and (fSaldoAReceber <> qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            PreencheTabelaVirtual;
         end
         else
         if (fSaldoAReceber = qryHistMovHMEVLRPREVISTO.AsCurrency) then
         begin
            SetLength(vLista, 1);
            vLista[0].Nome                   := qryHistMovITEDESCRICAO.AsString;
            vLista[0].AnoCompetencia         := qryHistMovHMEANOCOMPETENCIA.AsInteger;
            vLista[0].MesCompetencia         := qryHistMovHMEMESCOMPETENCIA.AsInteger;
            vLista[0].SeqCobranca            := qryHistMovHMESEQCOBRANCA.AsInteger;
            vLista[0].iEvento                := qryHistMovHMETIPOMOV.AsInteger;
            vLista[0].CodigoItem             := qryHistMovIDITEMEMPTMO.AsInteger;
            vLista[0].DataPrevista           := qryHistMovHMEDATAPREVISTA.AsDateTime;
            vLista[0].Valor                  := fSaldoAReceber;
            vLista[0].SaldoDevedor           := qryHistMovHMESALDODEV.AsCurrency;
            vLista[0].TxJuros                := qryHistMovHMETXJUROS.AsCurrency;

            vLista[0].Parcela                := qryHistMovHMEPARCELA.AsInteger;
            vLista[0].ParcelaAlt             := qryHistMovHMEPARCELAALT.AsInteger;
            vLista[0].ParcResta              := qryHistMovHMENUMPARCELAS.AsInteger;

            vLista[0].AnoCobranca            := StrToInt(sNovoAnoCobranca);
            vLista[0].DataEfetiva            := 0;
            vLista[0].FlgBaixado             := -1;
            vLista[0].FlgDivergPend          := -1;
            vLista[0].FlgEnvio               := 0;
            vLista[0].FlgTipoDiverg          := -1;
            vLista[0].FormaCobranca          := sNovaFormaCobranca;
            vLista[0].MesCobranca            := StrToInt(sNovoMesCobranca);
            vLista[0].RecPag                 := qryHistMovHMERECPAG.AsString;

            // Preenche a Tabela de Resultados
            PreencheTabelaVirtual;
         end;

         // Limpa a lista de itens
         SetLength(vLista, 0);

         // Recebimento a menor ou Valor não recebido
         if (fSaldoAReceber > 0) and ( qryHistMovHMEDATAVENCTO.AsDateTime < edtDataVencto.Date) then
         begin
            if iParcela <> iParcAnt then
            begin
               // Calcula novos itens de Cobranca
               if not(CalcEmptmo.CalculaItensDiverg(rContrato,
                                                    7,
                                                    iParcela,
                                                    iParcelaAlt,
                                                    qryHistMovHMENUMPARCELAS.AsInteger,
                                                    DiasUteis.ExtraiAno(edtDataVencto.Date),
                                                    DiasUteis.ExtraiMes(edtDataVencto.Date),
                                                    edtDataVencto.Date,
                                                    edtDataVencto.Date,
                                                    edtDataVencto.Date,
                                                    sNovaFormaCobranca,
                                                    vLista,
                                                    True,
                                                    False
                                                   )) then
               begin
                  // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
                  // por Cancelamento do Usuário, logo o procedimento será abortado
                  Exit;
               end;
            end;  // if iParcela <> iParcAnt

            // Preenche a Tabela de Resultados
            PreencheTabelaVirtual;
         end; // if (fSaldoAReceber > 0) or

         // Proximo Registro do Historico
         iParcAnt    := iParcela;
         fContrAnt   := fContrato;

         qryHistMov.Next;
      end;  // while not(qryHistMov.EOF)

      qryHistMov.EnableControls;

      frmProgresso.EscondeFormProgresso;
      Repaint;

   except
      Raise;
      Repaint;
   end;
end;



procedure TfrmExecValorAtualizadoArquivo.GeraArquivo;
var
   Arquivo           : TextFile;

   fVlrTotal         : Currency;
   fTotalGeral       : Currency;

   fContrAnt         : Extended;
   fContrAtu         : Extended;

   iQuantParcela     : Integer;

   sLinhaArquivo     : String;
begin
   frmProgresso.MostraFormProgresso('Preparando relatório para impressão...', False, False, False);

   qryHistMovVirtual.First;

   AssignFile(Arquivo, pnlPasta.Caption + 'Inadimplentes_CTIS.TXT');
   Rewrite(Arquivo);

   fTotalGeral    := 0;

   sLinhaArquivo  := 'Matricula' + '^' + 'Nome' + '^' + 'Prestacoes' + '^' + 'Valor Total' + '^' +
                     'Logradouro' + '^' + 'Numero' + '^' + 'Complemento' + '^' + 'Bairro' + '^' +
                     'Cidade' + '^' + 'UF' + '^' + 'CEP' + '^' + 'CPF' + '^' + 'SitPart' + '^' +
                     'SitContrato';

   WriteLn(Arquivo, sLinhaArquivo);

   fContrAnt := qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat;
   fContrAtu := qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat;

   while not(qryHistMovVirtual.EOF) do
   begin
      sLinhaArquivo  := '';
      sLinhaArquivo  := sLinhaArquivo + qryHistMovVirtualMATRICULA.AsString + '^';
      sLinhaArquivo  := sLinhaArquivo + qryHistMovVirtualNOME.AsString + '^';

      fVlrTotal      := 0;
      iQuantParcela  := 0;

      while not(qryHistMovVirtual.EOF) and (fContrAnt = fContrAtu) do
      begin
         fVlrTotal   := fVlrTotal + qryHistMovVirtualHMEVLRPREVISTO.AsCurrency;

         if qryHistMovVirtualHMETIPOMOV.AsInteger in [1, 2, 3, 7] then inc(iQuantParcela);

         qryHistMovVirtual.Next;

         fContrAtu := qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat;
      end;

      sLinhaArquivo := sLinhaArquivo + IntToStr(iQuantParcela) + '^';
      sLinhaArquivo := sLinhaArquivo + FormatFloat('#,#0.00', fVlrTotal) + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualLOGRADOURO.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualNUMERO.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualCOMPL.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualBAIRRO.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualCIDADE.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualUF.AsString + '^';

      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualCEP.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualCPF.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualSITPART.AsString + '^';
      sLinhaArquivo := sLinhaArquivo + qryHistMovVirtualSITUACAO_CONTRATO.AsString + '^';

      WriteLn(Arquivo, sLinhaArquivo);

      fContrAnt := qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat;
   end;

   CloseFile(Arquivo);

   frmProgresso.EscondeFormProgresso;

   MsgDlg('Arquivo gerado na pasta indicada.', 'Empréstimo', mtInformation, [mbOk], 0);
   Repaint;

   inherited;
end;



procedure TfrmExecValorAtualizadoArquivo.PreencheTabelaVirtual;
var
   i : Integer;
begin
   // Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados
   for i := 0 to high(vLista) do
   begin
      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := FormatFloat('00', vLista[i].MesCompetencia) + '/' + FormatFloat('0000', vLista[i].AnoCompetencia);
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

      case vLista[i].iEvento of
         0: qryHistMovVirtualEVENTO.AsString       := 'Concessão';
         1: qryHistMovVirtualEVENTO.AsString       := 'Parcela';
         2: qryHistMovVirtualEVENTO.AsString       := 'Amortização';
         3: qryHistMovVirtualEVENTO.AsString       := 'Quitação';
         4: qryHistMovVirtualEVENTO.AsString       := 'Atualização Débito';
      end;

      qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;

      qryHistMovVirtualMATRICULA.AsString          := qryMATRICULA.AsString;
      qryHistMovVirtualNOME.AsString               := qryBENEFICIARIO.AsString;

      qryHistMovVirtualLOGRADOURO.AsString         := qryLOGRADOURO.AsString;
      qryHistMovVirtualNUMERO.AsString             := qryNUMERO.AsString;
      qryHistMovVirtualCOMPL.AsString              := qryCOMPLEMENTO.AsString;

      qryHistMovVirtualSITUACAO_CONTRATO.AsString  := qryDESCSITCONTRATO.AsString;

      qryHistMovVirtualBAIRRO.AsString             := qryBAIRRO.AsString;
      qryHistMovVirtualCIDADE.AsString             := qryCIDADE.AsString;
      qryHistMovVirtualUF.AsString                 := qryUF.AsString;
      qryHistMovVirtualCEP.AsString                := qryCEP.AsString;

      qryHistMovVirtualSITPART.AsString            := qrySITUACAO.AsString;
      qryHistMovVirtualCPF.AsString                := qryNUMDOCUMENTO.AsString;

      qryHistMovVirtual.Post;
   end;  // for i := 0 to High(vLista)
end;



procedure TfrmExecValorAtualizadoArquivo.SelecionaRegistrosDivergentes;
var
   sSQL  : String;
   sData : String;
begin
   sData := QuotedStr(FormatDateTime('dd/mm/yyyy', edtDataVencto.Date));

   // Busca Registros a processar
   sSQL :=
   'SELECT '                                                                                    + #13 +
   '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRANCA , '                      + #13 +
   '  HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO   , HME.HMEDATAVENCTO, '   + #13 +
   '  HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO   , HME.HMESALDODEV, '                          + #13 +
   '  HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEPARCELAALT, HME.HMEFORMACOBRANCA, '  + #13 +
   '  HME.IDHISTMOVEMPTMO  , HME.HMEANOCOBRANCA   , HME.HMEMESCOBRANCA, '                       + #13 +
   '  HME.HMENUMPARCELAS   , HME.HMERECPAG,         ITE.ITEDESCRICAO, '                         + #13 +

   '  TO_CHAR(HME.HMEMESCOMPETENCIA,''00'') ||''/''|| HME.HMEANOCOMPETENCIA AS COMPETENCIA, '   + #13 +
   '  TO_CHAR(HME.HMEMESCOBRANCA,''00'') ||''/''|| HME.HMEANOCOBRANCA AS COBRANCA, '            + #13 +


   '  CON.IDPATRO, CON.IDPLANOPREV, '                                                           + #13 +
   '  PPP.IDSITPART, '                                                                          + #13 +
   '  STP.FLGINTERNO '                                                                          + #13 +

   'FROM '                                                                                      + #13 +
   '   HISTMOVEMPTMO   HME, '                                                                   + #13 +
   '   PARTPREVPLAN    PPP, '                                                                   + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                   + #13 +
   '   TIPOSUSPEMPTMO  TSE, '                                                                   + #13 +
   '   SITPART         STP, '                                                                   + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                   + #13 +
   '   ITEMEMPTMO      ITE, '                                                                   + #13 +
   '   TIPOEMPTMO      TEP  '                                                                   + #13 +

   'WHERE '                                                                                     + #13 +
   '       ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO = 1 ) '                             + #13 +

   '   AND HME.HMEDATAPREVISTA     <= TO_DATE(' + sData + ', ''DD/MM/YYYY'') '                  + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO     = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)       + #13;

   // filtro por Tipo de Empréstimo
   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO         = ' + DBcboTipoEmptmo.LookupValue                           + #13;

   // filtro por Tipo de Contrato
   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO    = ' + DBcboTipoContrato.LookupValue                         + #13;

   // filtro por Plano e Patro
   sSQL := sSQL +
   '   AND CON.IDPATRO              IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '   AND CON.IDPLANOPREV          IN (' + molListaPlano.PegaPlano + ') '                      + #13 +

   '   AND HME.HMEVLREFETIVO        IS NULL '                                                   + #13 +
   '   AND HME.HMEDATAEFETIVA       IS NULL '                                                   + #13 +
   '   AND HME.FLGBAIXADO           = 0 '                                                       + #13 +

   '   AND TEP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IDEmpresa)                           + #13 +

   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                       + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                       + #13 +

   '   AND ( '                                                                                  + #13 +
   '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                    + #13 +
   '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) '                    + #13 +
   '       ) '                                                                                  + #13 +

   '   AND HME.HMETIPOMOV           IN (1, 2, 3, 4, 7) '                                        + #13 +
   '   AND CON.FLGSITUACAO          NOT IN (''C'', ''Q'') '                                     + #13 +

   '   AND CON.IDPATRO              = PPP.IDPESSJUR '                                           + #13 +
   '   AND CON.IDPESSOA             = PPP.IDPESSOA '                                            + #13 +

   '   AND PPP.FLGDESATIVADO        = 0 '                                                       + #13 +

   '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '                                    + #13 +
   '   AND PPP.IDSITPART            = STP.IDSITPART '                                           + #13 +
   '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO '                                        + #13 +
   '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '                                        + #13 +

   '   AND HME.IDTIPOSUSPEMPTMO      = TSE.IDTIPOSUSPEMPTMO(+) '                                + #13 +

   'ORDER BY '                                                                                  + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.HMEPARCELA '                                                   + #13;

   // abre a query HistMovVirtual com os parâmetros passados
   qryHistMov.Close;
   qryHistMov.SQL.Text := sSQL;
 //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 //qryHistMov.SQL.SaveToFile(Sistema.TempDir + 'EP-ParcelasRelValorAtualizado.txt');
   qryHistMov.SQL.SaveToFile(ftempregra + '\' + 'EP-ParcelasRelValorAtualizado.txt');
   qryHistMov.Open;
end;



function TfrmExecValorAtualizadoArquivo.VerificaPreenchimento: Boolean;
var
   dData : TDateTime;
begin
	Result := False;

	try
      if length(trim(edtDataVencto.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVencto);

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



procedure TfrmExecValorAtualizadoArquivo.Sel(i: Extended);
begin
   // abre a query principal com os parâmetros passados
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TfrmExecValorAtualizadoArquivo.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IdEmpresa;
      end;
      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmExecValorAtualizadoArquivo.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecValorAtualizadoArquivo.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecValorAtualizadoArquivo.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecValorAtualizadoArquivo.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecValorAtualizadoArquivo.btnEscolheDirClick(Sender: TObject);
begin
   dlgCaminho.Directory := pnlPasta.Caption;
   if dlgCaminho.Execute then pnlPasta.Caption := dlgCaminho.Directory;
end;



procedure TfrmExecValorAtualizadoArquivo.FormCreate(Sender: TObject);
begin
  inherited;
  pnlPasta.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  lblDiretorio.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

end.
