// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : sbtnImprimirClick
Data      : 07/10/2002
Autor     : Marchetti
Descrição : Colocado filtro por contrato
---------------------------------------------------------------------------------------------------}

unit FCancAtualizacaoDiaria;

//	-------------------------------------------------------------------------------------------------
//
//	   Desfazer Atualização Diária
//
//	Autor             :  João Marchetti
//	Data de Início    :  11/12/2001
//	Data de Término   :
//
//	Modificações      :
//
// -------------------------------------------------------------------------------------------------

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizard, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, fcButton,
   fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, CheckLst, Db, DBTables,
   Wwquery, mPatro, mContratoEmptmo, uCalcEmptmo, FSairAjudaImob, DBGrids;

type
   TfrmCancAtualizacaoDiaria = class(TfrmSairAjudaImob)
      ntbPrincipal: TNotebook;
      Panel1: TPanel;
      Bevel3: TBevel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      btnContinuar: TfcShapeBtn;
      Bevel1: TBevel;
      btnVoltar: TfcShapeBtn;
      qryParcela: TwwQuery;
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
      qryContaParcelas: TwwQuery;
      qryContaParcelasQUANTIDADE: TFloatField;
      Label5: TLabel;
      edtDataInicial: TwwDBDateTimePicker;
      edtDataFinal: TwwDBDateTimePicker;
      Label3: TLabel;
      LblProcessado: TLabel;
      lblErro: TLabel;
      updParcela: TUpdateSQL;
      qryParcelaIDHISTMOVEMPTMO: TFloatField;
      qryParcelaIDCONTRATOEMPTMO: TFloatField;
      qryParcelaIDITEMEMPTMO: TFloatField;
      qryParcelaHMEPARCELA: TFloatField;
      qryParcelaHMETIPOMOV: TFloatField;
      qryParcelaFLGSUSPENSAO: TFloatField;
      qryParcelaFLGESTORNADO: TFloatField;
      qryParcelaFLGBAIXADO: TFloatField;
      qryParcelaFLGABONADO: TFloatField;
      qryParcelaFLGENVIO: TFloatField;
      qryParcelaFLGDIVERGPEND: TFloatField;
      qryParcelaPLNCODIGO: TFloatField;
      qryParcelaPLNCODIGOESTORNO: TFloatField;
      qryParcelaHMEORIGEM: TFloatField;
      qryParcelaHMEFORMACOBRANCA: TStringField;
      qryParcelaHMECENTRALIZA: TFloatField;
      qryParcelaHMEDESTACADO: TFloatField;
      qryParcelaIDITEMCENTRALIZA: TFloatField;
      qryParcelaHMEVLRPREVISTO: TFloatField;
      qryParcelaHMEVLREFETIVO: TFloatField;
      qryParcelaHMEANOCOMPETENCIA: TFloatField;
      qryParcelaHMEMESCOMPETENCIA: TFloatField;
      qryParcelaHMEDATAPREVISTA: TDateTimeField;
      qryParcelaHMEDATAEFETIVA: TDateTimeField;
      qryParcelaHMEANOCOBRANCA: TFloatField;
      qryParcelaHMEMESCOBRANCA: TFloatField;
      qryParcelaHMESEQCOBRANCA: TFloatField;
      qryParcelaHMESALDODEV: TFloatField;
      qryParcelaHMETXJUROS: TFloatField;
      qryParcelaHMEFORMACOBRANCA_1: TStringField;
      qryParcelaFLGESTORNADO_1: TFloatField;
    qryParcelasEstorno: TwwQuery;
    molContratoEmptmo: TmolContratoEmptmo;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure btnMarcaTodosPatroClick(Sender: TObject);
      procedure btnInvertePatroClick(Sender: TObject);
      procedure btnMarcaTodosPlanoClick(Sender: TObject);
      procedure btnInvertePlanoClick(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);

   private  // Private declarations

      vIDPatro, vIDPlano   : array of Int64;
      dDataAtualizacao     : TDateTime;

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

      function HaParcelas(const sDataAtualiza : String): Boolean;

      procedure AbreQueries;
      function VerificaPreenchimento: Boolean;
      function SelecionaParcelas(const sDataAtualiza : String): Boolean;
      function MarcaEstornoDeParcela(const sDataAtualiza : String): Boolean;
      function EstornaParcelas(const sDataAtualiza : String): Boolean;
      function RetornaDataContabil(const sDataAtualiza : String) : TDateTime;
      function AtualizaPlanilha(const iPlanilha : Integer; sDataAtualiza : String) : Boolean;
      function ExisteContabilizacao(const sDataAtualiza : String) : Boolean;
      function VerificaAtualizaPosterior : boolean;


   public   // Public declarations

   end;



var
  frmCancAtualizacaoDiaria: TfrmCancAtualizacaoDiaria;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uVerificaPreenchimento,
   dLookEmptmo, uFuncoesEmptmo, dMS, uDiasUteis, dEmptmo, uIntegraEmptmo,
   FProgresso;



procedure TfrmCancAtualizacaoDiaria.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;
   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmCancAtualizacaoDiaria.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;
   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmCancAtualizacaoDiaria.PreenchePatro;
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



procedure TfrmCancAtualizacaoDiaria.MarcaTodosPatro;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := True;
end;



function TfrmCancAtualizacaoDiaria.SelecaoPatro: Boolean;
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



function TfrmCancAtualizacaoDiaria.PegaPatro: String;
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



procedure TfrmCancAtualizacaoDiaria.PreenchePlano;
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



procedure TfrmCancAtualizacaoDiaria.MarcaTodosPlano;
var
   i : Integer;
begin
   // ...e marca todas por default
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := True;
end;



function TfrmCancAtualizacaoDiaria.SelecaoPlano: Boolean;
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



function TfrmCancAtualizacaoDiaria.PegaPlano: String;
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



procedure TfrmCancAtualizacaoDiaria.AbreQueries;
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



function TfrmCancAtualizacaoDiaria.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try

      // Pelo menos 1 Patrocinadora deve estar selecionado
      if not(SelecaoPatro) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos uma Patrocinadora!', lstPatro);

      // Pelo menos 1 Plano deve estar selecionado
      if not(SelecaoPlano) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Plano!', lstPlano);

      if edtDataInicial.Date <= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data Inicial!', edtDataInicial);

      // Data final não pode ser inferior a data inicial
      if edtDataFinal.Date < edtDataInicial.Date then
         raise EValidacao.CreateVal('Data final não pode ser inferior a Data inicial!', edtDataFinal);

      if VerificaAtualizaPosterior then
         raise EValidacao.CreateVal('Existe Data de Atualização posterior a Data Final informada!', edtDataFinal);

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



procedure TfrmCancAtualizacaoDiaria.FormShow(Sender: TObject);
begin
   inherited;

   (* *)
   ntbPrincipal.PageIndex := 0;

   (* preenche as data de lançamento *)
   edtDataInicial.Date     := SysDate;
   edtDataFinal.Date       := SysDate;

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



procedure TfrmCancAtualizacaoDiaria.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   (* seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado *)
   with dtmLookEmptmo.qryLookTipoContrato do begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmCancAtualizacaoDiaria.btnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPatro;
end;



procedure TfrmCancAtualizacaoDiaria.btnInvertePatroClick(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPatro.Items.Count - 1) do lstPatro.Checked[i] := not(lstPatro.Checked[i]);
end;



procedure TfrmCancAtualizacaoDiaria.btnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   MarcaTodosPlano;
end;



procedure TfrmCancAtualizacaoDiaria.btnInvertePlanoClick(Sender: TObject);
var
   i : Integer;
begin
   inherited;

   (* inverte a seleção *)
   for i := 0 to (lstPlano.Items.Count - 1) do lstPlano.Checked[i] := not(lstPlano.Checked[i]);
end;



function TfrmCancAtualizacaoDiaria.HaParcelas(const sDataAtualiza : String) : Boolean;
var
   sSQL : String;
begin
   Result := False;

   try
//      MostraEspera('Verificando Parcelas...');

      sSQL :=
         'SELECT COUNT(*) AS QUANTIDADE ' +
         'FROM ' +
         'HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEMPTMO TE ' +
         'WHERE ' +
         '( HMETIPOMOV = 1 ) '+
         'AND ( HMEORIGEM = 5 ) '+
         'AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) ) '+
         'AND ( H.FLGBAIXADO = 0 ) '+
         'AND ( ( H.FLGDIVERGPEND = 0 ) OR ( H.FLGDIVERGPEND IS NULL ) ) '+
         'AND ( H.PLNCODIGOESTORNO IS NULL ) '+
         'AND ( H.HMEDATAATUALIZA = TO_DATE('+QuotedStr(sDataAtualiza)+',''dd/mm/yyyy'') )' +
         'AND ( H.PLNCODIGOESTORNO IS NULL ) ';

         if molContratoEmptmo.IDContrato > 0 then begin
            sSQL := sSQL +
            '   AND ( C.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IDContrato) + ' ) '                    + #13;
         end;

         if DBcboTipoEmptmo.LookupValue <> '' then begin
            sSQL := sSQL +
           'AND ( ('+DBcboTipoEmptmo.LookupValue+' IS NULL) OR (TC.IDTIPOEMPTMO ='+DBcboTipoEmptmo.LookupValue+') ) '
         end;

         if DBcboTipoContrato.LookupValue <> '' then begin
            sSQL := sSQL +
           'AND ( ('+DBcboTipoContrato.LookupValue+' IS NULL) OR (C.IDTIPOCONTREMPTMO  ='+DBcboTipoContrato.LookupValue+') ) '+
           'AND ( ('+DBcboTipoContrato.LookupValue+' IS NULL) OR (TC.IDTIPOCONTREMPTMO ='+DBcboTipoContrato.LookupValue+') ) ';
         end;

          sSQL := sSQL +
         'AND ( C.IDPATRO IN ('+PegaPatro+') ) '+
         'AND ( C.IDPLANOPREV IN ('+PegaPlano+') ) '+
         'AND ( TE.IDEMPRESAPROP = ' + IntToStr(Sistema.IDEmpresa) + ' ) ' +
         'AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO ) ' +
         'AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '+
         'AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO ) '+
         'AND ( C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO )';

      with qryContaParcelas do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;
         if not(isEmpty) then Result := True;
      end;

   finally
//      EscondeEspera;
   end;
end;



procedure TfrmCancAtualizacaoDiaria.btnContinuarClick(Sender: TObject);
var iContador     : integer;
    iTotDias      : Integer;
begin
   inherited;

   if VerificaPreenchimento then begin

      if MsgDlg('Deseja realmente DESFAZER a Atualização Diária?', 'Empréstimo', mtConfirmation,
               [mbYes, mbNo], 0) = mrYes then
      begin

         try

            DesabilitaBotoes;

            (* limpa os memos de resultado e erro *)
            memResult.Clear;
            memErro.Clear;

            iTotDias      := Trunc( edtDataFinal.Date - edtDataInicial.Date );

            (* Executa o loop para o intervalo de datas informadas *)
            for iContador := 0 to iTotDias do begin

                dDataAtualizacao := StrToDate(edtDataInicial.Text) + iContador;

                // ----------------------------------------------------------------------------------------
                (* Seleciona os contratos Ativos *)
                if not (HaParcelas(DateToStr(dDataAtualizacao))) then begin

                   MemErro.Lines.Add(DateToStr(dDataAtualizacao) + ' - Não há Atualizações que possam ser desfeitas.');
//                   MsgDlg('Não há Atualizações que possam ser desfeitas com os filtros escolhidos.',
//                          'Empréstimo', mtInformation, [mbOk], 0);
//                   Repaint;

                end else begin

                   if MarcaEstornoDeParcela(DateToStr(dDataAtualizacao)) then begin
                      //Abre transacao
                      try
                         StartTransacao;
                         qryParcela.ApplyUpdates;

                         if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 0) and
                              ( ExisteContabilizacao(DateToStr(dDataAtualizacao)) ) ) then begin
                            MsgDlg('Existe contabilização efetuada e o parâmetro de Integração com a contabilidade está desmarcado.',
                                   'Empréstimo', mtInformation, [mbOK], 0);
                            Repaint;
                            qryParcela.CancelUpdates;
                            RollBackTransacao;

                         end else if not ( EstornaParcelas(DateToStr(dDataAtualizacao)) ) then begin
                                     qryParcela.CancelUpdates;
                                     RollBackTransacao;
                                  end else begin
                                     qryParcela.CommitUpdates;
                                     CommitTransacao;
                                  end;
                         MsgDlg('Atualização Diária desfeita.', 'Empréstimo', mtInformation, [mbOk], 0);
                         Repaint;
                      except
                         RollBackTransacao;
                         MsgDlg('Atualização Diária não pode ser desfeita.', 'Empréstimo', mtInformation, [mbOk], 0);
                         Repaint;
                      end;
                   end;

                end;
            end; (* Fim do for *)

            LblProcessado.Caption := 'Processados: '       + IntToStr(memResult.Lines.Count);
            lblErro.Caption       := 'Erros encontrados: ' + IntToStr(memErro.Lines.Count);
            Application.ProcessMessages;

            MsgDlg('Atualização Diária desfeita.', 'Empréstimo', mtInformation, [mbOk], 0);
            Repaint;

         finally
            ntbPrincipal.PageIndex := 1;
            Application.ProcessMessages;
            HabilitaBotoes;
         end; (* try *)

      end; (* if MsgDlg *)
   end; (* if VerificaPreenchimento *)
end;



function TfrmCancAtualizacaoDiaria.SelecionaParcelas(const sDataAtualiza : String): Boolean;
var
   sSQL : String;
begin
   Result := False;

   sSQL :=
   'SELECT '                                                                           + #13 +
   '  H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, '                         + #13 +
   '  H.HMEPARCELA, H.HMETIPOMOV, H.HMEORIGEM, '                                       + #13 +
   '  H.FLGSUSPENSAO, H.FLGESTORNADO, H.FLGBAIXADO, H.FLGABONADO, '                    + #13 +
   '  H.FLGENVIO, H.FLGDIVERGPEND, H.PLNCODIGO, H.PLNCODIGOESTORNO, '                  + #13 +
   '  H.HMEFORMACOBRANCA, H.HMECENTRALIZA, H.HMEDESTACADO, H.IDITEMCENTRALIZA, '       + #13 +
   '  H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                             + #13 +
   '  H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA, H.HMEDATAPREVISTA, H.HMEDATAEFETIVA, ' + #13 +
   '  H.HMEANOCOBRANCA, H.HMEMESCOBRANCA, H.HMESEQCOBRANCA, '                          + #13 +
   '  H.HMESALDODEV, H.HMETXJUROS, H.HMEFORMACOBRANCA, H.FLGESTORNADO '                + #13 +

   'FROM '                                                                             + #13 +
   '  HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEMPTMO TE '           + #13 +

   'WHERE '                                                                + #13 +
   '      ( H.HMETIPOMOV = 5 ) '                                           + #13 +
   '  AND ( H.HMEORIGEM = 5 ) '                                            + #13 +
   '  AND ( H.FLGBAIXADO = 0 ) '                                           + #13 +
   '  AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) ) '       + #13 +
   '  AND ( H.PLNCODIGOESTORNO IS NULL ) '                                 + #13;

   if molContratoEmptmo.IDContrato > 0 then begin
      sSQL := sSQL +
      '   AND ( C.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IDContrato) + ' ) '                    + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '                 + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '          + #13;
   end;

   sSQL := sSQL +
   '   AND ( C.IDPATRO IN ( ' + PegaPatro + ' ) ) '                                      + #13 +
   '   AND ( C.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '                                  + #13 +
   '   AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '               + #13 +
   '   AND ( H.HMEDATAATUALIZA = TO_DATE('+QuotedStr(sDataAtualiza)+',''dd/mm/yyyy'') )' + #13 +
   '   AND ( H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO ) '                                + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                   + #13;


   try
      MostraEspera('Selecionando Parcelas...');

      with qryParcela do begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;
         if not(isEmpty) then Result := True;
      end;

   finally
      EscondeEspera;
   end;
end;



function TfrmCancAtualizacaoDiaria.MarcaEstornoDeParcela(const sDataAtualiza : String): Boolean;
begin
   Result := True;
   if not(SelecionaParcelas(sDataAtualiza)) then begin
      Result := False;
   end else begin
      try
         while not ( qryParcela.EOF ) do begin
            LimpaParametros(qryParcelasEstorno);
            qryParcelasEstorno.ParamByName('PIDHISTMOVEMPTMO').AsFloat :=
                                                qryParcela.FieldByName('IDHISTMOVEMPTMO').AsFloat;
            qryParcelasEstorno.ExecSql;
            memResult.Lines.Add('Data atualização: ' + sDataAtualiza +
                                ' Contrato: ' + qryParcela.FieldByName('IDCONTRATOEMPTMO').AsString);
            qryParcela.Next;
         end;

      except;
         Result := False;
      end;
   end;
end;



function TfrmCancAtualizacaoDiaria.EstornaParcelas(const sDataAtualiza : String): Boolean;
var
   sSQL              : String;
   sHistoricoContab  : String;
   sResult, sErro    : TStringList;
   iPlanilhaResult   : Integer;
begin
   Result := True;

   sSQL :=
   'SELECT '                                                               + #13 +
   '  H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO, H.IDITEMEMPTMO, '                         + #13 +
   '  H.HMETIPOMOV, '                                                                  + #13 +
   '  H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA, '                                      + #13 +
   '  H.HMEDATAPREVISTA, H.HMEDATAEFETIVA, '                                           + #13 +
   '  H.HMEANOCOBRANCA, H.HMEMESCOBRANCA, '                                            + #13 +
   '  H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                             + #13 +
   '  H.HMESEQCOBRANCA, '                                                              + #13 +
   '  H.HMEPARCELA, H.HMESALDODEV, H.HMETXJUROS, H.HMEFORMACOBRANCA,'                  + #13 +
   '  H.FLGESTORNADO, '                                                                + #13 +
   '  TC.IDTIPOCONTREMPTMO, '                                                          + #13 +
   '  C.IDPLANOPREV, '                                                                 + #13 +
   '  C.IDPATRO, '                                                                     + #13 +
   '  ITC.TIPCODIGO '                                                                  + #13 +

   'FROM '                                                                             + #13 +
   '  HISTMOVEMPTMO H, CONTRATOEMPTMO C, ITEMXTIPOCONTR ITC, '                         + #13 +
   '  TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                              + #13 +

   'WHERE '                                                                + #13 +
   '      ( H.HMETIPOMOV = 1 ) '                                           + #13 +
   '  AND ( H.HMEORIGEM = 5 ) '                                            + #13 +
   '  AND ( H.FLGENVIO = 0 ) '                                             + #13 +
   '  AND ( H.FLGBAIXADO = 0 ) '                                           + #13 +
   '  AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) ) '       + #13 +
   '  AND ( H.PLNCODIGOESTORNO IS NULL ) '                                 + #13 +
   '  AND ( H.PLNCODIGO IS NOT NULL ) '                                    + #13;

   if molContratoEmptmo.IDContrato > 0 then begin
      sSQL := sSQL +
      '   AND ( C.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IDContrato) + ' ) '                    + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '                 + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '          + #13;
   end;

   sSQL := sSQL +
   '   AND ( C.IDPATRO IN ( ' + PegaPatro + ' ) ) '                                    + #13 +
   '   AND ( C.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '                                + #13 +
   '   AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '             + #13 +
   '   AND ( H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO ) '                              + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                            + #13 +
   '   AND ( H.HMEDATAATUALIZA = TO_DATE('+QuotedStr(sDataAtualiza)+',''dd/mm/yyyy'') )' + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                 + #13;


   if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) ) then begin

       sHistoricoContab := 'Empréstimo - Estorno de atualização diária - Referência ' + sDataAtualiza;

       if IntegraEmptmo.ContabilizaItens('C', 'E', sSQL, sHistoricoContab,
                                         RetornaDataContabil(sDataAtualiza), sResult, sErro, iPlanilhaResult ) < 0 then begin
          Result := False;
          MsgDlg('Erro no estorno Contábil.', 'Empréstimo', mtInformation, [mbOK], 0);
          Repaint;

       end else begin
          AtualizaPlanilha (iPlanilhaResult, sDataAtualiza);
       end;
   end;
end;



function TfrmCancAtualizacaoDiaria.RetornaDataContabil(const sDataAtualiza : String) : TDateTime;
var
  sSql : String;
begin

   Result := SysDate;

   sSql :=
   'SELECT '                                                               + #13 +
   '  MAX(PL.PLNDATDIA) AS PLNDATDIA '                                     + #13 +

   'FROM '                                                                 + #13 +
   '  PLANILHA PL, HISTMOVEMPTMO H, CONTRATOEMPTMO C, '                    + #13 +
   '  TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                  + #13 +

   'WHERE '                                                                + #13 +
   '      ( H.HMETIPOMOV = 1 ) '                                           + #13 +
   '  AND ( H.HMEORIGEM = 5 ) '                                            + #13 +
   '  AND ( H.FLGENVIO = 0 ) '                                             + #13 +
   '  AND ( H.FLGBAIXADO = 0 ) '                                           + #13 +
   '  AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) ) '       + #13 +
   '  AND ( H.PLNCODIGOESTORNO IS NULL ) '                                 + #13 +
   '  AND ( H.PLNCODIGO IS NOT NULL ) '                                    + #13;

   if molContratoEmptmo.IDContrato > 0 then begin
      sSQL := sSQL +
      '   AND ( C.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IDContrato) + ' ) '                    + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '                 + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '          + #13;
   end;

   sSQL := sSQL +
   '   AND ( C.IDPATRO IN ( ' + PegaPatro + ' ) ) '                                    + #13 +
   '   AND ( C.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '                                + #13 +
   '   AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '             + #13 +
   '   AND ( H.HMEDATAATUALIZA = TO_DATE('+QuotedStr(sDataAtualiza)+',''dd/mm/yyyy'') )' + #13 +
   '   AND ( H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO ) '                              + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                            + #13 +
   '   AND ( PL.PLNCODIGO        = H.PLNCODIGO ) '                                     + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                 + #13;

   with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
      Open;
      if not(isEmpty) then Result := FieldByName('PLNDATDIA') .AsDateTime;
   end;

end;



function TfrmCancAtualizacaoDiaria.AtualizaPlanilha(const iPlanilha : Integer; sDataAtualiza : String) : Boolean;
var
   sSQL              : String;
begin
   Result := True;

   sSQL :=
   'UPDATE HISTMOVEMPTMO '                                                 + #13 +
   'SET    PLNCODIGO = ' + IntToStr(iPlanilha)                             + #13 +
   'WHERE '                                                                + #13 +
   '   IDHISTMOVEMPTMO IN '                                                + #13 +
   '   (SELECT '                                                           + #13 +
   '     H.IDHISTMOVEMPTMO '                                                              + #13 +
   '  FROM '                                                                              + #13 +
   '     HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEMPTMO TE '           + #13 +

   '    WHERE '                                                            + #13 +
   '       ( H.HMETIPOMOV = 1 ) '                                          + #13 +
   '    AND ( H.HMEORIGEM = 5 ) '                                          + #13 +
   '    AND ( H.FLGENVIO = 0 ) '                                           + #13 +
   '    AND ( H.FLGBAIXADO = 0 ) '                                         + #13 +
   '    AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) ) '     + #13 +
   '    AND ( H.PLNCODIGOESTORNO IS NULL ) '                               + #13 +
   '    AND ( H.PLNCODIGO IS NOT NULL ) '                                  + #13;

   if molContratoEmptmo.IDContrato > 0 then begin
      sSQL := sSQL +
      '   AND ( C.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IDContrato) + ' ) '                    + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
   sSQL := sSQL +
   '    AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '                 + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
   sSQL := sSQL +
   '    AND ( C.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13 +
   '    AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '          + #13;
   end;

   sSQL := sSQL +
   '    AND ( C.IDPATRO IN ( ' + PegaPatro + ' ) ) '                                    + #13 +
   '    AND ( C.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '                                + #13 +
   '    AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '             + #13 +
   '    AND ( H.HMEDATAATUALIZA = TO_DATE('+QuotedStr(sDataAtualiza)+',''dd/mm/yyyy'') )' + #13 +
   '    AND ( H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO ) '                              + #13 +
   '    AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                            + #13 +
   '    AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) )'                                + #13;

   with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
      ExecSql;
   end;

end;



function TfrmCancAtualizacaoDiaria.ExisteContabilizacao(const sDataAtualiza : String) : Boolean;
var
   sSql : String;
begin
   Result := False;

   sSQL :=
   'SELECT COUNT(*) AS TOTCONTAB'                                          + #13 +

   'FROM '                                                                 + #13 +
   '  HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEMPTMO TE '              + #13 +

   'WHERE '                                                                + #13 +
   '      ( H.HMETIPOMOV = 1 ) '                                           + #13 +
   '  AND ( H.HMEORIGEM = 5 ) '                                            + #13 +
   '  AND ( H.FLGENVIO = 0 ) '                                             + #13 +
   '  AND ( H.FLGBAIXADO = 0 ) '                                           + #13 +
   '  AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) ) '       + #13 +
   '  AND ( H.PLNCODIGOESTORNO IS NULL ) '                                 + #13 +
   '  AND ( H.PLNCODIGO IS NOT NULL ) '                                    + #13;

   if molContratoEmptmo.IDContrato > 0 then begin
      sSQL := sSQL +
      '   AND ( C.IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IDContrato) + ' ) '                    + #13;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( TC.IDTIPOEMPTMO = ' + DBcboTipoEmptmo.LookupValue + ' ) '                 + #13;
   end;

   if DBcboTipoContrato.LookupValue <> '' then begin
   sSQL := sSQL +
   '   AND ( C.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '           + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '          + #13;
   end;

   sSQL := sSQL +
   '   AND ( C.IDPATRO IN ( ' + PegaPatro + ' ) ) '                                    + #13 +
   '   AND ( C.IDPLANOPREV IN ( ' + PegaPlano + ' ) ) '                                + #13 +
   '   AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '             + #13 +
   '   AND ( H.HMEDATAATUALIZA = TO_DATE('+QuotedStr(sDataAtualiza)+',''dd/mm/yyyy'') )' + #13 +
   '   AND ( H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO ) '                              + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                            + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                 + #13;

   with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Text := sSQL;
      Open;
      if not(isEmpty) then Result := ( FieldByName('TOTCONTAB') .AsInteger > 0 );
   end;

end;



procedure TfrmCancAtualizacaoDiaria.btnVoltarClick(Sender: TObject);
begin
  inherited;
   ntbPrincipal.PageIndex := 0;
end;


function TfrmCancAtualizacaoDiaria.VerificaAtualizaPosterior : boolean;
begin
   Result := False;
   with dtmEmptmo.qryAux do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT MAX(HMEDATAPREVISTA) AS HMEDATAPREVISTA FROM HISTMOVEMPTMO WHERE HMETIPOMOV = 5 AND (FLGESTORNADO IS NULL OR FLGESTORNADO = 0)');

      if molContratoEmptmo.IDContrato > 0 then begin
         Sql.Add('AND IDCONTRATOEMPTMO = ' + FloatToStr(molContratoEmptmo.IDContrato) );
      end;

      Open;
      if not IsEmpty then begin
         if FieldByNAme('HMEDATAPREVISTA').AsDateTime > edtDataFinal.Date then Result := True;
      end;
      Close;
   end;


end;

end.
