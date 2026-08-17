unit FEstornaLancamentoNovo;

//	-------------------------------------------------------------------------------------------------
//
//	   Estorno / Exclusão de Lançamentos (--> nova integração)
//
//	Autor             :  André Pontes
//	Data de Início    :  22/11/2000
//	Data de Término   :  23/11/2000
//
//	Modificações      :
//
//
// obs:  A query esta selecionando o lançamento pelo idDocumento, e no SERPROS o atributo ainda não
//       estava gravado. Foi gerado script para acertar problema e corrigidos os formulários que gravam
//       o IDDOCUMENTO (13/12/2000 Alex)
//
{-------------------------------------------------------------------------------------
Rotina............: TestaIntegracaoFinanc
N. Sol............: 93222
Data..............: 30/01/2020
Responsável.......: Taffarel Sevaybriker
Descrição.........: Função para validar se existe integração financeira para o doc.
                    Não testa o bloqueio contábil se não houver integração financeira.
--------------------------------------------------------------------------------------
Rotina............: -
Nº SOL............: 172902
Nº KINTANA........: 1577381
Data..............: 14/03/2012
Responsável.......: Helen V. Bianchi
Descrição.........: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, jclDateTime,
  jclSysUtils, CMDateTimePicker, ExtCtrls, CmEventosCadastro, ImgList, uCMTypes,
  uCtrlPadrLancImovel, uCtrlPrevImob, {uCtrlLancamento,} uCtrlLancamentosImovel,
  uCtrlImobLancamento,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  TfrmEstornaLancNovo = class(TfrmCadastroCS)
    Panel1: TPanel;
    Label22: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label15: TLabel;
    lblDataVencimento: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBedtNomeUsuario: TDBEdit;
    DBedtNomeExtenso: TDBEdit;
    DBedtOrigem: TDBEdit;
    DBedtPortadorForma: TDBEdit;
    ToolbarSep972: TToolbarSep97;
    Label2: TLabel;
    Label11: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label12: TLabel;
    Label1: TLabel;
    DBEdit9: TDBEdit;
    Bevel3: TBevel;
    dsLancamentos: TwwDataSource;
    DBgrdReajuste: TwwDBGrid;
    qryDESCCUSTORECIMO: TStringField;
    qryFORCLI_DOC: TFloatField;
    qrySTATUS_DOC: TStringField;
    qryPLNPLANIL: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryNODOCUMENTO: TFloatField;
    qryPORTADOR_FORMA: TStringField;
    qryMOEDA_LANC: TStringField;
    qryCOD_MOEDA: TFloatField;
    qryIDFORCLI: TFloatField;
    qryNF_FORCLI: TStringField;
    qryRS_FORCLI: TStringField;
    qryDATALANCAMENTO: TDateTimeField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryDATA_BAIXA: TDateTimeField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryFLGORIGEMLANC: TStringField;
    qryFLGESTORNADO: TFloatField;
    qryFLGINTEGRADO: TFloatField;
    qry_ORIGEMLANC: TStringField;
    qry_MESCOMPETENCIA: TStringField;
    qryRECPAG: TStringField;
    qryVALOR_OM_TOTAL: TFloatField;
    qryVALOR_TOTAL: TFloatField;
    ToolbarSep973: TToolbarSep97;
    sbtnEstornar: TToolbarButton97;
    qryIDDOCUMENTO: TFloatField;
    Label13: TLabel;
    Panel2: TPanel;
    Label6: TLabel;
    edtDataEstorno: TCMDateTimePicker;
    lblRecPag: TLabel;
    lblEstornado: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    qryDOC_CAPCAR: TFloatField;
    qryNUMAPGR: TFloatField;
    qryNOSSONUMERO: TStringField;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    qryCODTIPIMOVEL: TStringField;
    qryIDTIPOCUSTORECIMO: TFloatField;
    qryFLGDIARIO: TStringField;

    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);

    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);

  private { Private declarations }
    sFiltroMS        : string;
    bPodeExcluir     : boolean;
    bAutorizaEstorno : Boolean;
    bFormShow        : Boolean;

    CtrlPadrLancImovel : TCtrlPadrLancImovel;
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
    //CtrlLancamento     : TCtrlLancamento;
    CtrlLancamento     : TCtrlImobLancamento;
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
    CtrlContab       : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381
    procedure FazerEstorno;
    procedure ExibeStatus;

    function VerificaPreenchimento: boolean;
    function EstornaLancDiario: Integer;


  public { Public declarations }

  end;



var
  frmEstornaLancNovo: TfrmEstornaLancNovo;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, dImobiliario, dLookImobiliario, uFuncoesImob,
   UComunsImobiliario, uVerificaPreenchimento, DMS, dLancImovel, uModuloImobiliario, uLancContab, uIntegraBack,
   uModuloAdminImob;



procedure TfrmEstornaLancNovo.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa CtrlObjects
   CtrlPadrLancImovel := TCtrlPadrLancImovel.Create( Sistema.IdEmpresa,
                                                     Sistema.IdModulo);
   //CtrlLancamento     := TCtrlLancamento.Create;
   CtrlLancamento     := TCtrlImobLancamento.Create;
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016

   CtrlPadrLancImovel.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                                  Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                                  ComunsImobiliario.MensErroMT );
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
   CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, true );

//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
   // Adiciona o filtro de EmpresaProp ao MontaSelect
//   sFiltroMS := dtmMS.MS_Lancamento.Filtro.Text;

//   dtmMS.MS_Lancamento.Filtro.Add('(STATUS_DOC IS NULL) OR (RTRIM(STATUS_DOC) <> ''2'')');
//   dtmMS.MS_Lancamento.Filtro.Add('(FLGESTORNADO IS NULL) OR (FLGESTORNADO <> 1)');
    // Helen - SOL: 172902 KTN: 1577381
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlLancamento);
end;



procedure TfrmEstornaLancNovo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   // configura o estado dos botões - só o "Estornar", no caso }

   inherited;

   if bFormShow then begin
      bAutorizaEstorno := sbtnEstornar.Enabled;
      bFormShow := False;
   end;   


   sbtnEstornar.Enabled := False;
   sbtnApagar.Enabled   := False;

   case CmeCadastro.Operacao of

      opVazio:
      begin
         sbtnApagar.Down      := False;
         sbtnApagar.Enabled   := False;
         sbtnEstornar.Down    := False;
         sbtnEstornar.Enabled := False;
      end;

      opIdle:
      begin
         sbtnApagar.Down   := False;
         sbtnEstornar.Down := False;

         if (qry.Active) and not(qry.IsEmpty) then begin
            sbtnApagar.Enabled   := ( (bPodeExcluir) or (qryFLGINTEGRADO.asInteger = 0) );
            sbtnEstornar.Enabled := (qryFLGINTEGRADO.IsNull and bAutorizaEstorno);
         end else begin
            sbtnApagar.Enabled   := False;
            sbtnEstornar.Enabled := False;
         end;
      end;

      opApagar :
      begin
         sbtnApagar.Down      := False;
         sbtnApagar.Enabled   := ( (bPodeExcluir) or (qryFLGINTEGRADO.asInteger = 0) );
         sbtnEstornar.Down    := False;
         sbtnEstornar.Enabled := (qryFLGINTEGRADO.IsNull and bAutorizaEstorno);
      end;

   end;

   pnlFundo.Enabled  := True;
end;



procedure TfrmEstornaLancNovo.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
   dtmMS.MS_Lancamento_Estorna.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
   // se houve busca, abre a query principal com apenas o registro buscado
   if dtmMS.MS_Lancamento_Estorna.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      LimpaParametros(qry);
      qry.ParamByName('PIDEMPRESAPROP').AsInteger  := Sistema.idEmpresa;
      //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
      qry.ParamByName('PIDDOCUMENTO').AsInteger    := StrToInt(dtmMS.MS_Lancamento_Estorna.ValoresChave[6]);
      qry.Open;

      LimpaParametros(dtmLancImovel.qryLancImovel);
      dtmLancImovel.qryLancImovel.ParamByName('PIDPESSOA').AsInteger      := Sistema.idEmpresa;
      //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
      dtmLancImovel.qryLancImovel.ParamByName('PIDDOCUMENTO').AsInteger   := StrToInt(dtmMS.MS_Lancamento_Estorna.ValoresChave[6]);
      dtmLancImovel.qryLancImovel.Open;

      ExibeStatus;

      Screen.Cursor := crDefault;
   end;

   if qry.IsEmpty then begin
      LimpaParametros(dtmLancImovel.qryLancImovel);
      CmeCadastro.Operacao := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   CmeCadastro.AtualizaBotoes(self);
end;


procedure TfrmEstornaLancNovo.CmeCadastroDelete(Sender: TObject);
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
var  CtrlLancImovel : TCtrlLancamentosImovel;
begin
   Screen.Cursor := crHourGlass;
   try
      //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
      CtrlLancImovel := TCtrlLancamentosImovel.Create( Sistema.IdEmpresa,
                                                       Sistema.IdModulo,
                                                       Sistema.IdUsuario,
                                                       Sistema.IdEspAcesso,
                                                       Sistema.UsaPlanoPatro );
      CtrlLancImovel.InitializeAs( CtrlPadrLancImovel );
      // Exclui o(s) lançamento(s)
      if CtrlLancImovel.Excluir( qryIDDOCUMENTO.AsInteger ) then begin
         MsgDlg('O(s) Lançamento(s) foi(ram) excluído(s).', 'Informação', mtInformation, [mbOk], 0);
         qry.Close;
      end else begin
         MsgDlg('Erro na exclusão do(s) Lançamento(s)', 'Erro', mtError, [mbOk], 0);
      end;
   finally
      //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016   
      FreeAndNil( CtrlLancImovel );   
      lblRecPag.Visible := False;
      Screen.Cursor := crDefault;
      Repaint;
   end;
end;



procedure TfrmEstornaLancNovo.FazerEstorno;
var
   iDocumento     : integer;
   iPlanilha      : integer;
   iCodDocumento  : integer;
   iResult        : Integer;
begin
   Screen.Cursor := crHourGlass;
   iResult := 0;
   try
      try
         // Quando for contab. diária, além do estorno, faz a contabilização inversa para o diário
         if (ModuloImobiliario.AdminImob.bFlgDiario) and
            ( (qryFLGDIARIO.AsString = 'M') or (qryFLGDIARIO.AsString = 'A') ) then begin

            iResult := EstornaLancDiario;

         end else begin
            // Estorna o(s) lançamento(s) para cotabilizações que não são diárias
            iPlanilha     := -1;
            iCodDocumento := -1;
            iDocumento    := qryIDDOCUMENTO.AsInteger;
            if not(qryCODDOCUMENTO.IsNULL) then iCodDocumento := qryCODDOCUMENTO.AsInteger;
            if not(qryPLNCODIGO.IsNULL) then iPlanilha        := qryPLNCODIGO.AsInteger;
            iResult := FuncoesImob.EstornaLancImovel(iDocumento, iCodDocumento, iPlanilha, edtDataEstorno.Date);
         end;

         if iResult <> -1 then begin
            MsgDlg('O(s) Lançamento(s) foi(ram) estornado(s).', 'Informação', mtInformation, [mbOk], 0);
            Repaint;
            qry.Close;
         end;
      except
         Raise;
         Repaint;
      end;
   finally
      lblRecPag.Visible := False;
      Screen.Cursor := crDefault;
   end;
end;



function TfrmEstornaLancNovo.EstornaLancDiario: Integer;
var ParamIntegra : TParamContabeisMT;
    liRetFuncao,liEmpresa,liExercicio,liPeriodo : LongInt;
    sMens : String;
    iDocumento,iPlanilha,iCodDocumento, iCodErro : integer;
    //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
    CtrlPrevImob       : TCtrlPrevImob;
begin
   Result := 0;
   // Testa pelo período se é possivel contabilizar o estorno do diário
   liEmpresa   := Sistema.IdEmpresa;
   liRetFuncao := TestaPeriodo(true,'BASEDADOS',DateToStr(edtDataEstorno.Date),IntToStr(Sistema.IdModulo),
                               liExercicio,liPeriodo,liEmpresa,sMens);
   if liRetFuncao <> 0 then begin
      Result := -1;
      Exit;
   end;

   try
      // Busca a Parametrização Contábil do diário
      if not CtrlPadrLancImovel.BuscaPadrLancContabil(ParamIntegra, iCodErro,
                                                      qryRECPAG.AsString, True,
                                                      Sistema.IdEmpresa,
                                                      Sistema.IdModulo,
                                                      qryIDTIPOCUSTORECIMO.AsInteger,
                                                      qryCODTIPIMOVEL.AsString) then begin
         raise Exception.Create ( CtrlPadrLancImovel.MessageInfo );
      end;

      // definir histórico contábil - Adriana Funcef
      ParamIntegra.sHistoricoCtb := 'Estorno Doc.' + qryCODDOCUMENTO.AsString + ' Contab. Diária - ' +
                                    qryCODTIPIMOVEL.AsString + ' - ' +
                                    qryDESCCUSTORECIMO.AsString + ' - ' +
                                    Modulo.sPlanoPrevGlobal + '/' + Modulo.sPatroGlobal;

      StartTransacao;

      // Estorna o(s) lançamento(s)
      iCodDocumento := -1;
      iPlanilha     := -1;
      iDocumento    := qryIDDOCUMENTO.AsInteger;
      if not qryCODDOCUMENTO.IsNull then iCodDocumento := qryCODDOCUMENTO.AsInteger;
      if not qryPLNCODIGO.IsNull    then iPlanilha     := qryPLNCODIGO.AsInteger;

      Result := FuncoesImob.EstornaLancImovel(iDocumento, iCodDocumento, iPlanilha,
                                              edtDataEstorno.Date);

      // Efetua a contabilização inversa do lançamento para o diário
      // As contas de DÉBITO E CREDITO FORAM INVERTIDAS para estornar o Valor.
      if Result <> -1 then begin
         if not CtrlLancamento.InsereLancaContab ( '2', Sistema.IdEmpresa,
                             Sistema.IdModulo,
                             Sistema.IdUsuario, IntegraBack.Plano,
                             ParamIntegra.iUnidNegoc, 0, 0,
                             Modulo.iPlanoPrevGlobal,
                             Modulo.iPatroGlobal, 0, 0,
                             DateToStr(edtDataEstorno.Date),
                             '', ParamIntegra.sHistoricoCtb, '', '', '', '',
                             '', ParamIntegra.sCentroCustoCredito,
                             ParamIntegra.sContaContabilCredito,
                             ParamIntegra.sCentroCustoDebito,
                             ParamIntegra.sContaContabilDebito, '',
                             qryVALOR_TOTAL.AsFloat,
                             false, Sistema.UsaPlanoPatro,
                             ParamIntegra.iIdSegregaCriter,
                             edtDataEstorno.Date) then
            raise Exception.Create ( CtrlLancamento.MessageInfo )
         else begin
            // Grava o Código da Planilha
            if CtrlLancamento.RetornoPlnCodigo > 0 then begin
               //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
               CtrlPrevImob       := TCtrlPrevImob.Create( Sistema.IdEmpresa,
                                                           Sistema.IdModulo,
                                                           Sistema.IdUsuario,
                                                           Sistema.IdEspAcesso,
                                                           Sistema.UsaPlanoPatro );
               CtrlPrevImob.InitializeAs( CtrlPadrLancImovel );

               if not CtrlPrevImob.RegistraEstornoPrevImob( qryIDDOCUMENTO.AsInteger,
                                                            CtrlLancamento.RetornoPlnCodigo,
                                                            False ) then begin
                  raise Exception.Create ( CtrlPrevImob.MessageInfo );
               end;
            end else raise Exception.Create ( 'Nr. da planilha não foi gerada');
         end;
      end;
      if Result <> -1 then
           CommitTransacao
      else RollbackTransacao;
   except
      on E:Exception do begin
         RollbackTransacao;
         Result := -1;
      end;
   end;
   //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
   FreeAndNil( CtrlPrevImob );
end;


procedure TfrmEstornaLancNovo.ExibeStatus;
var
   sRecPag, sStatus : string;
begin
   lblRecPag.Visible    := False;
   lblEstornado.Visible := False;

   // Não Integrado
   if ( (qryCODDOCUMENTO.IsNull) and (qryPLNCODIGO.IsNull) ) then begin

      lblEstornado.Caption := 'Não Integrado';
      lblEstornado.Visible := True;

   end else begin

      // Só integrado com Contabilidade
      if (qryCODDOCUMENTO.IsNull) then begin // não integra capcar

         lblEstornado.Caption := 'Contabilizado';
         lblEstornado.Visible := True;

      end else begin

         // RecPag ---------------------------------------------------------------------------------
         sRecPag := qryRECPAG.AsString;
         if length(sRecPag) > 0 then begin

            case sRecPag[1] of
               'R':
               begin
                  lblRecPag.Caption    := 'a Receber';
                  lblRecPag.Font.Color := clNavy;
               end;

               'P':
               begin
                  lblRecPag.Caption    := 'a Pagar';
                  lblRecPag.Font.Color := clMaroon;
               end;
            end;

            lblRecPag.Visible := True;
         end;

         // Estornado ------------------------------------------------------------------------------
         if (qryFLGESTORNADO.asInteger = 1) then begin

            lblEstornado.Caption := 'Estornado';
            lblEstornado.Visible := True;

         end;
      end;
   end;
end;



function TfrmEstornaLancNovo.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if length(trim(edtDataEstorno.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data do Estorno!', edtDataEstorno);

      if ( (qryCODDOCUMENTO.IsNull) and (qryPLNCODIGO.IsNull) ) then
         raise EValidacao.CreateVal('O Lançamento ainda não foi integrado. Deve ser Excluído.', edtDataEstorno);

      //TAES - SIG93222 - início
      if not CtrlContab.TestaIntegracaoFinanc(Sistema.idEmpresa, Sistema.idModulo, qryNODOCUMENTO.AsString) then
      begin
        // Helen - SOL: 172902 KTN: 1577381 - Inicio
        if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DBEdit16.text) then
            raise EValidacao.CreateVal('Período contábil bloqueado.', edtDataEstorno);
        // Helen - SOL: 172902 KTN: 1577381 - Fim
      end;
      //TAES - SIG93222 - fim

  except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

	Result := True;
end;



procedure TfrmEstornaLancNovo.sbtnProcurarClick(Sender: TObject);
begin
   CmeCadastro.Find(Self);
end;



procedure TfrmEstornaLancNovo.FormShow(Sender: TObject);
begin
   bFormShow := True;

   with dtmImobiliario.qryParamContab do begin
      LimpaParametros(dtmImobiliario.qryParamContab);
      ParamByName('PIDPESSOA').AsInteger := Sistema.idEmpresa;
      Open;
      bPodeExcluir := dtmImobiliario.qryParamContabPACESTORNA.AsString <> 'S';
      Close;
   end;

   LimpaParametros(dtmLancImovel.qryLancImovel);
   qry.Close;

   inherited;
end;



procedure TfrmEstornaLancNovo.qryCalcFields(DataSet: TDataSet);
begin
   Case qryMESCOMPETENCIA.asInteger of
       1: qry_MESCOMPETENCIA.asString := 'Janeiro';
       2: qry_MESCOMPETENCIA.asString := 'Fevereiro';
       3: qry_MESCOMPETENCIA.asString := 'Março';
       4: qry_MESCOMPETENCIA.asString := 'Abril';
       5: qry_MESCOMPETENCIA.asString := 'Maio';
       6: qry_MESCOMPETENCIA.asString := 'Junho';
       7: qry_MESCOMPETENCIA.asString := 'Julho';
       8: qry_MESCOMPETENCIA.asString := 'Agosto';
       9: qry_MESCOMPETENCIA.asString := 'Setembro';
      10: qry_MESCOMPETENCIA.asString := 'Outubro';
      11: qry_MESCOMPETENCIA.asString := 'Novembro';
      12: qry_MESCOMPETENCIA.asString := 'Dezembro';
   end;

   // prenche a origem do lançamento (nome extenso)
   qry_ORIGEMLANC.AsString := OrigemLancamento(qryFLGORIGEMLANC.asString[1]);
end;




procedure TfrmEstornaLancNovo.DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmEstornaLancNovo.DBgrdReajusteTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmEstornaLancNovo.sbtnEstornarClick(Sender: TObject);
begin
   // Lançamento já estornado não pode ser estornado novamente
   if qryFLGESTORNADO.asInteger = 1 then begin
      MsgDlg('O Lançamento já foi estornado.', 'Aviso', mtWarning, [mbOk], 0);
      sbtnEstornar.Down := False;
      Exit;
   end;

   if VerificaPreenchimento then begin

      if CmeCadastro.Operacao = opIdle then begin
         CmeCadastro.Operacao := opApagar;
         if MsgDlg('Deseja realmente ESTORNAR este Lançamento?' +#13+
                   'Este processo não poderá ser desfeito!' , 'Estorno', mtConfirmation, [mbYes, mbNo], 0) = mrYes then FazerEstorno;
      end;

   end;

   if qry.IsEmpty then begin
      LimpaParametros(dtmLancImovel.qryLancImovel);
      CmeCadastro.Operacao := opVazio
   end else begin
      CmeCadastro.Operacao := opIdle;
   end;

   CmeCadastro.AtualizaBotoes(self);
end;



procedure TfrmEstornaLancNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // atualiza os saldos das carteiras
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
//   dtmMS.MS_Lancamento.Filtro.Text := sFiltroMS;

   dtmLancImovel.qryLancImovel.Close;
   dtmLancImovel.qryLancImovel.UnPrepare;

   FreeAndNil( CtrlPadrLancImovel );
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
   FreeAndNil( CtrlLancamento );
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
   FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
   inherited;
end;


procedure TfrmEstornaLancNovo.sbtnApagarClick(Sender: TObject);
var iDia,iMes,iAno : Integer;
    sAnoMesLanc, sAnoMesFech : String;
begin
   // Lançamento já estornado não pode ser excluído
   if qryFLGESTORNADO.asInteger = 1 then begin
      MsgDlg('Lançamentos estornados não podem ser excluídos.', 'Aviso', mtWarning, [mbOk], 0);
      sbtnApagar.Down := False;
      Exit;
   end;

   //TAES - SIG93222 - início
   if not CtrlContab.TestaIntegracaoFinanc(Sistema.idEmpresa, Sistema.idModulo, qryNODOCUMENTO.AsString) then
   begin
     // Helen - SOL: 172902 KTN: 1577381 - Inicio
     if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DBEdit16.text) then
     begin
          MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
          Exit;
     end;
   // Helen - SOL: 172902 KTN: 1577381 - Fim
   end;
   //TAES - SIG93222 - fim
   
   // Quando for contab. diária, não permite a exclusão se o mês já estiver fechado
   if (ModuloImobiliario.AdminImob.bFlgDiario) and
      ( (qryFLGDIARIO.AsString = 'M') or (qryFLGDIARIO.AsString = 'A') ) then begin
      DecodeDate(qryDATALANCAMENTO.AsDateTime,iAno,iMes,iDia);
      sAnoMesLanc := IntToStrZeroPad(iAno,4) + IntToStrZeroPad(iMes + 1,2);
      sAnoMesFech := IntToStrZeroPad(ModuloImobiliario.AdminImob.iAnoCompetencia,4) +
                     IntToStrZeroPad(ModuloImobiliario.AdminImob.iMesCompetencia,2);

      // só verificar se o lançamento for na competencia superior ao inicio da implementação na Fundação
      if (sAnoMesLanc >= '200211') and (sAnoMesLanc < sAnoMesFech) then begin
         MsgDlg('Mês de competência já foi encerrado. O lançamento não poderá ser excluído.', 'Aviso', mtWarning, [mbOk], 0);
         sbtnApagar.Down := False;
      end else begin
         inherited;
         if qry.IsEmpty then begin
            LimpaParametros(dtmLancImovel.qryLancImovel);
            CmeCadastro.Operacao := opVazio
         end else begin
            CmeCadastro.Operacao := opIdle;
         end;
         CmeCadastro.AtualizaBotoes(self);
      end;
   end else begin;
      inherited;
      if qry.IsEmpty then begin
         LimpaParametros(dtmLancImovel.qryLancImovel);
         CmeCadastro.Operacao := opVazio
      end else begin
         CmeCadastro.Operacao := opIdle;
      end;
      CmeCadastro.AtualizaBotoes(self);
   end;
end;



end.
