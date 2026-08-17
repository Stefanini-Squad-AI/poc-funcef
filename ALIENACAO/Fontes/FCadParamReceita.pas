unit FCadParamReceita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, fcButton, fcImgBtn,
  fcShapeBtn, Mask, DBCtrls, wwdblook;

type
  TTipoConta = (tcResult, tcDebCre);
  TfrmCadParamReceita = class(TfrmCadastroCSImob)
    DBcboTipoRecCusto: TwwDBLookupCombo;
    Label6: TLabel;
    Label26: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboTipoRecebDesemb: TwwDBLookupCombo;
    Label7: TLabel;
    Label28: TLabel;
    DBcboUnidNegocio: TwwDBLookupCombo;
    DBcboTipOper: TwwDBLookupCombo;
    Label4: TLabel;
    grpContaResult: TGroupBox;
    lblSubConta: TLabel;
    Label25: TLabel;
    Label11: TLabel;
    btnBuscaContaResult: TBitBtn;
    DBcboCCResult: TwwDBLookupCombo;
    DBedtContaResult: TDBEdit;
    DBcboSCResult: TwwDBLookupCombo;
    grpContaDebCre: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    btnBuscaContaDebCre: TBitBtn;
    DBcboCCDebCre: TwwDBLookupCombo;
    DBedtContaDebCre: TDBEdit;
    DBcboSCDebCre: TwwDBLookupCombo;
    DBedtDescricao: TDBEdit;
    Label2: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label8: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    Bevel2: TBevel;
    Label9: TLabel;
    DBchkIntegraCaPCaR: TDBCheckBox;
    DBchkIntegraContab: TDBCheckBox;
    qryIDPADRLANCIMOVEL: TFloatField;
    qryRECPAG: TStringField;
    qryDESCPADRLANCIMO: TStringField;
    qryFLGINTEGRACAPCAR: TFloatField;
    qryFLGINTEGRACONTAB: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODTIPIMOVEL: TStringField;
    qryIDTIPOCUSTORECIMO: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryIDFORCLI: TFloatField;
    qryCODCENTRORESPON: TStringField;
    qryCODTIPRECDES: TStringField;
    qryPLANO: TFloatField;
    qryIDEMPRESA: TFloatField;
    qryCONTARESULT: TStringField;
    qryCENTROCUSTORESULT: TStringField;
    qrySUBCONTARESULT: TFloatField;
    qryCONTADEBCRE: TStringField;
    qryCENTROCUSTODEBCRE: TStringField;
    qrySUBCONTADEBCRE: TFloatField;
    qryUNIDNEGOC: TFloatField;
    qryTIPCODIGO: TStringField;
    qryVerificaOcorrencia: TwwQuery;
    qryIMOVEL_EXTENSO: TStringField;
    qryCONTRATO_EXTENSO: TStringField;
    qryNF_FORCLI: TStringField;
    qryRS_FORCLI: TStringField;
    qryIDMODULO: TFloatField;
    qryVerificaOcorrenciaIDPADRLANCIMOVEL: TFloatField;
    qryVerificaOcorrenciaDESCPADRLANCIMO: TStringField;
    qryIDIMOVELMESTRE: TFloatField;

    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure DBedtContaResultExit(Sender: TObject);
    procedure DBedtContaDebCreExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaContaResultClick(Sender: TObject);
    procedure btnBuscaContaDebCreClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBchkIntegraCaPCaRClick(Sender: TObject);
    procedure DBchkIntegraContabClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);


  private { Private declarations }

    iIndiceAnterior        : int64;
    bObrigaSC, bObrigaCC   : boolean;

    procedure Sel(iPadrao: int64);
    function VerificaPreenchimento: boolean;
    function VerificaOcorrencia: boolean;

    procedure PreencheResult;
    procedure PreencheDebCre;

    function VerificaContaContabil(tConta: TTipoconta): boolean;
    procedure FiltraContabilidade(tConta: TTipoconta);

    procedure HabilitaContab;
    procedure DesabilitaContab;

    procedure AbreQueries;
    procedure PreencheDefaults;


  public { Public declarations }


  end;



var
  frmCadParamReceita: TfrmCadParamReceita;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uComunsImobiliario, uVerificaPreenchimento, uIntegraBack,
   dLookImobiliario, dImobiliario, uFuncoesImob, DMS;





procedure TfrmCadParamReceita.Sel(iPadrao: int64);
begin
   // abre a query principal com os parâmetros passados
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDPADRLANCIMOVEL').AsInteger   := iPadrao;
      ParamByName('PIDMODULO').AsInteger           := Sistema.idModulo;
      Open;
   end;
end;



function TfrmCadParamReceita.VerificaPreenchimento: boolean;
begin
   Result := False;

	try
      if ( (Modulo.bIntegraCAPCAR) and (qryFLGINTEGRACAPCAR.asInteger = 1) ) then begin

         if ( (DBcboCentroRespon.LookupValue = '') or (qryCODCENTRORESPON.IsNULL) ) then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);

         if ( (DBcboTipoRecebDesemb.LookupValue = '') or (qryCODTIPRECDES.IsNULL) ) then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Desembolso!', DBcboTipoRecebDesemb);

      end;

      // -------------------------------------------------------------------------------------------

      // só verifica o preenchimento dos campos estritamente contábeis se houver integração
      if ( (Modulo.bIntegraContab) and (qryFLGINTEGRACONTAB.asInteger = 1) ) then begin

         if qryCONTARESULT.IsNULL then
            raise EValidacao.CreateVal('É necessário indicar a Conta de Resultado!', DBedtContaResult);

         if DBcboCCResult.Enabled then
            if ( (DBcboCCResult.LookupValue = '')  or (qryCENTROCUSTORESULT.IsNULL) ) then
               raise EValidacao.CreateVal('É necessário indicar o Centro de Custo de Resultado!', DBcboCCResult);

         if ( (DBcboTipOper.LookupValue = '') or (qryTIPCODIGO.IsNULL) ) then
            raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação Contábil!', DBcboTipOper);

      end;

      // -------------------------------------------------------------------------------------------

      // Unidade de Negócio --> CaPCaR _e_ Contab
      if ( ((Modulo.bIntegraContab) and (qryFLGINTEGRACONTAB.asInteger = 1)) or
           ((Modulo.bIntegraCaPCaR) and (qryFLGINTEGRACAPCAR.asInteger = 1)) ) then
      begin
         if ( (DBcboUnidNegocio.LookupValue = '') or (qryUNIDNEGOC.IsNULL) ) then
            raise EValidacao.CreateVal('É necessário indicar a Unidade de Negócio!', DBcboUnidNegocio);
      end;

      // -------------------------------------------------------------------------------------------

      // verificar filtros de parametrização
      ParametrosSistema;
      if DBcboTipoRecCusto.Value <> '' then begin   // a despesa foi selecionada

         if (DBcboTipoImovel.Value <> '') and (dtmImobiliario.qryParamImobFLGPARTDTPIM.AsInteger = 0) then
            raise EValidacao.CreateVal('A parametrização: Tipo Imovel X Receita, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);

      end else begin                                // a Receita não foi selecionada

         if (DBcboTipoImovel.Value <> '') and (dtmImobiliario.qryParamImobFLGPARTPIM.AsInteger = 0) then
            raise EValidacao.CreateVal('A parametrização: Tipo Imovel, não foi selecionada nos parâmetros do sistema!', DBcboTipoImovel);

      end;

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



function TfrmCadParamReceita.VerificaOcorrencia: boolean;
begin
   with qryVerificaOcorrencia do begin
      LimpaParametros(qryVerificaOcorrencia);
      Params[0].AsString   := DBedtDescricao.Text;
      Params[1].AsInteger  := Sistema.idModulo;
    	Open;
	end;

   Result := True;

   try

	   // verifica a ocorrência na query e se não é o próprio
      if not(qryVerificaOcorrencia.IsEmpty) then begin
		   if qryVerificaOcorrenciaIDPADRLANCIMOVEL.asInteger <> iIndiceAnterior then begin
	         Result := False;
    	      raise EValidacao.CreateVal('Descrição já cadastrada!', DBedtDescricao);
         end;
      end;

   except

      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
      end;

   end;
end;



procedure TfrmCadParamReceita.PreencheResult;
begin
   if qry.State in [dsInsert, dsEdit] then begin
      if VerificaContaContabil(tcResult) then begin
         FiltraContabilidade(tcResult);
         if DBcboSCResult.Enabled then begin
            if DBcboSCResult.CanFocus then DBcboSCResult.SetFocus;
         end else begin
            if DBcboCCResult.Enabled then if DBcboCCResult.CanFocus then DBcboCCResult.SetFocus;
         end;
      end;
   end;
   DBedtContaResult.Modified := False;
end;



procedure TfrmCadParamReceita.PreencheDebCre;
begin
   if qry.State in [dsInsert, dsEdit] then begin
      if VerificaContaContabil(tcDebCre) then begin
         FiltraContabilidade(tcDebCre);
         if DBcboSCDebCre.Enabled then begin
            if DBcboSCDebCre.CanFocus then DBcboSCDebCre.SetFocus;
         end else begin
            if DBcboCCDebCre.Enabled then if DBcboCCDebCre.CanFocus then DBcboCCDebCre.SetFocus;
         end;
      end;
   end;
   DBedtContaDebCre.Modified := False;
end;



function TfrmCadParamReceita.VerificaContaContabil(tConta: TTipoconta): boolean;
var
   s        : string;
   DBcampo  : TField;
   campo    : TDBEdit;
begin
   Result := False;
   Screen.Cursor := crHourGlass;

   try

      try

         Case tConta of
            tcResult:
            begin
               DBcampo  := qryCONTARESULT;
               campo    := DBedtContaResult;
            end;

            tcDebCre:
            begin
               DBcampo  := qryCONTADEBCRE;
               campo    := DBedtContaDebCre;
            end;

            else begin
               DBcampo  := nil;
               campo    := nil;
            end;
         end;

         bObrigaSC   := False;
         bObrigaCC   := False;

         s := trim(DBcampo.AsString);
         if length(s) > 0 then begin

            // verifica se existe a conta digitada (para ser + rápido', a query só dá COUNT)
            with dtmImobiliario.qryVerificaConta do begin
               LimpaParametros(dtmImobiliario.qryVerificaConta);
               Params[0].asInteger  := IntegraBack.Plano;
               Params[1].asString   := s;
               Open;

               // se não há registros, a Conta não existe
               if dtmImobiliario.qryVerificaConta.isEmpty then begin
                  raise EValidacao.CreateVal('Essa Conta Contábil não é válida!', campo);
               end else begin

                  { se o sistema obrigar sub-conta de resultado - a mesma será fornecida pelo
                    imóvel ou pelo mestre

                    se o sistema obrigar sub-conta de ativo/passivo - a mesma será fornecida pelo
                    cliente/fornecedor.
                  }
                  bObrigaCC   := dtmImobiliario.qryVerificaContaPLACCUST.asString = 'S';

                  Case tConta of
                     tcResult: grpContaResult.Caption := ' Conta Crédito - ' + FieldByName('PLANOME').asString + ' ';
                     tcDebCre: grpContaDebCre.Caption := ' Conta Débito  - ' + FieldByName('PLANOME').asString + ' ';
                  end;
               end;

            end;

         end else begin

            Case tConta of
               tcResult: grpContaResult.Caption := ' Conta Crédito ';
               tcDebCre: grpContaDebCre.Caption := ' Conta Débito ';
            end;

         end;

      except

         on ev : EValidacao do begin
            Screen.Cursor := crDefault;
            if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;

      end;

      Result := True;

   finally
      dtmImobiliario.qryVerificaConta.Close;
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmCadParamReceita.FiltraContabilidade(tConta: TTipoconta);
begin
   // verifica se a Conta admite SubContas; se admitir, abre a tabela SubConta e habilita as combos
   Case tConta of

      tcResult:
      if bObrigaSC then begin
         with dtmLookImobiliario.qryLookSCResult do begin
            LimpaParametros(dtmLookImobiliario.qryLookSCResult);
            ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSCResult.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then qrySUBCONTARESULT.Clear;
         dtmLookImobiliario.qryLookSCResult.Close;
         DBcboSCResult.Clear;
         DBcboSCResult.Enabled   := False;
      end;

      tcDebCre:
      if bObrigaSC then begin
         with dtmLookImobiliario.qryLookSCDebCre do begin
            LimpaParametros(dtmLookImobiliario.qryLookSCDebCre);
            ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
            Open;
         end;
         DBcboSCDebCre.Enabled   := True;
      end else begin
         if qry.State in dsEditModes then qrySUBCONTADEBCRE.Clear;
         dtmLookImobiliario.qryLookSCDebCre.Close;
         DBcboSCDebCre.Clear;
         DBcboSCDebCre.Enabled   := False;
      end;

   end;

   // idem p/ Centro de Custo
   Case tConta of

      tcResult:
      if bObrigaCC then begin

         with dtmLookImobiliario.qryLookCCResult do begin
            LimpaParametros(dtmLookImobiliario.qryLookCCResult);
            ParamByName('CONTA').asString          := trim(qryCONTARESULT.asString);
            ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
            ParamByName('PLANO').asInteger         := IntegraBack.Plano;
            Open;
         end;
         DBcboCCResult.Enabled   := True;

      end else begin
         if qry.State in dsEditModes then qryCENTROCUSTORESULT.Clear;
         dtmLookImobiliario.qryLookCCResult.Close;
         DBcboCCResult.Clear;
         DBcboCCResult.Enabled   := False;
      end;

      tcDebCre:
      if bObrigaCC then begin

         with dtmLookImobiliario.qryLookCCDebCre do begin
            LimpaParametros(dtmLookImobiliario.qryLookCCDebCre);
            ParamByName('CONTA').asString          := trim(qryCONTADEBCRE.asString);
            ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
            ParamByName('PLANO').asInteger         := IntegraBack.Plano;
            Open;
         end;
         DBcboCCDebCre.Enabled   := True;

      end else begin
         if qry.State in dsEditModes then qryCENTROCUSTODEBCRE.Clear;
         dtmLookImobiliario.qryLookCCDebCre.Close;
         DBcboCCDebCre.Clear;
         DBcboCCDebCre.Enabled   := False;
      end;

   end;
end;



procedure TfrmCadParamReceita.AbreQueries;
begin
   ParametrosSistema;

   with dtmLookImobiliario.qryLookUnidNegocio do begin
      LimpaParametros(dtmLookImobiliario.qryLookUnidNegocio);
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
      Open;
   end;

   with dtmLookImobiliario.qryLookCentroRespon do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroRespon);
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipOper);
   dtmLookImobiliario.qryLookTipOper.Open;

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;

   with dtmlookImobiliario.qryLookTipoReceb do begin
      LimpaParametros(dtmlookImobiliario.qryLookTipoDesemb);
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
      Open;
   end;
end;



procedure TfrmCadParamReceita.PreencheDefaults;
begin
   if Modulo.bIntegraCAPCAR then begin
      if qryFLGINTEGRACAPCAR.isNull then qryFLGINTEGRACAPCAR.asInteger := 1;
   end else begin
      qryFLGINTEGRACAPCAR.asInteger := 0;
   end;

   if Modulo.bIntegraContab then begin
      if qryFLGINTEGRACONTAB.isNull then qryFLGINTEGRACONTAB.asInteger := 1;
   end else begin
      qryFLGINTEGRACONTAB.asInteger := 0;
   end;

   if qryCODCENTRORESPON.IsNull then begin
      qryCODCENTRORESPON.asString   := dtmImobiliario.qryParamImobCODCENTRORESPON.asString;
      DBcboCentroRespon.LookupValue := dtmImobiliario.qryParamImobCODCENTRORESPON.asString;
   end;

   if qryCODCENTRORESPON.IsNull then begin
      qryUNIDNEGOC.asInteger        := dtmImobiliario.qryParamImobUNIDNEGOC.asInteger;
      DBcboUnidNegocio.LookupValue  := IntToStr(dtmImobiliario.qryParamImobUNIDNEGOC.asInteger);
   end;
end;



procedure TfrmCadParamReceita.HabilitaContab;
begin
   grpContaResult.Enabled        := True;
   DBedtContaResult.Enabled      := True;
   btnBuscaContaResult.Enabled   := True;

   grpContaDebCre.Enabled        := True;
   DBedtContaDebCre.Enabled      := True;
   btnBuscaContaDebCre.Enabled   := True;

   DBcboTipOper.Enabled          := True;
end;



procedure TfrmCadParamReceita.DesabilitaContab;
begin
   // Result
   grpContaResult.Enabled        := False;

   DBedtContaResult.Enabled      := False;
   btnBuscaContaResult.Enabled   := False;
   DBcboCCResult.Enabled         := False;
   DBcboSCResult.Enabled         := False;

   // DebCre
   grpContaDebCre.Enabled        := False;

   DBedtContaDebCre.Enabled      := False;
   btnBuscaContaDebCre.Enabled   := False;
   DBcboCCDebCre.Enabled         := False;
   DBcboSCDebCre.Enabled         := False;

   DBcboTipOper.Enabled          := False;
end;



procedure TfrmCadParamReceita.CmeCadastroEdit(Sender: TObject);
begin
	inherited;

   PreencheDefaults;

	if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadParamReceita.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State = dsInsert then qryIDPADRLANCIMOVEL.AsInteger := LeUltRegistro(nil, 'PADRLANCIMOVEL');

   if qry.State in [dsInsert, dsEdit] then begin

      // grava a os parâmetros fixos
      qryIDPESSOA.asInteger   := Sistema.idEmpresa;
      qryIDMODULO.asInteger   := Sistema.idModulo;
      qryRECPAG.asString      := 'R';

		// grava o Plano de Contas e a Conta Contábil
      if Modulo.bIntegraContab then begin
	   	qryPLANO.asInteger := IntegraBack.Plano;
      end else begin
   		qryPLANO.Clear;
	   	qryCONTARESULT.Clear;
	   	qryCONTADEBCRE.Clear;
	   	qrySUBCONTARESULT.Clear;
	   	qrySUBCONTADEBCRE.Clear;
	   	qryCENTROCUSTORESULT.Clear;
	   	qryCENTROCUSTODEBCRE.Clear;
      end;

   end;

   inherited;

   if qry.isEmpty then begin
      // limpa as Contas Contábeis
      grpContaResult.Caption := ' Conta Crédito ';
      grpContaDebCre.Caption := ' Conta Débito ';
   end else begin
      // preenche as Contas Contábeis
      PreencheResult;
      PreencheDebCre;
   end;
end;



procedure TfrmCadParamReceita.DBedtContaResultExit(Sender: TObject);
begin
   inherited;
   if DBedtContaResult.Modified then PreencheResult;
end;



procedure TfrmCadParamReceita.DBedtContaDebCreExit(Sender: TObject);
begin
   inherited;
   if DBedtContaDebCre.Modified then PreencheDebCre;
end;



procedure TfrmCadParamReceita.FormCreate(Sender: TObject);
begin
	inherited;

	// adiciona o filtro por Empresa Proprietária nos MontaSelect
	MontaSelect.Filtro.Add('PLI.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
	MontaSelect.Filtro.Add('PLI.IDMODULO = ' + IntToStr(Sistema.idModulo));

   if Modulo.bIntegraContab then begin
		qryCONTARESULT.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
		qryCONTADEBCRE.EditMask         := trim(IntegraBack.MascaraPlano) + ';0;_';
      dtmMS.MS_CContabil.Mascaras[0]  := trim(IntegraBack.MascaraPlano) + ';0;_';

      dtmMS.MS_CContabil.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(IntegraBack.Plano));
   end;

   dtmlookImobiliario.qryLookTipoDesembCODTIPRECDES.EditMask := trim(Modulo.sMascaraDesemb) + ';0; ';
end;



procedure TfrmCadParamReceita.FormShow(Sender: TObject);
begin
   inherited;
   // habilita/desabilita o cadastro dos dados de integração com Contabilidade
   if Modulo.bIntegraContab then begin
      grpContaResult.Enabled      := True;
      grpContaDebCre.Enabled      := True;
      btnBuscaContaResult.Enabled := True;
      btnBuscaContaDebCre.Enabled := True;
   end else begin
      grpContaResult.Enabled      := False;
      grpContaDebCre.Enabled      := False;
      btnBuscaContaResult.Enabled := False;
      btnBuscaContaDebCre.Enabled := False;
   end;
end;



procedure TfrmCadParamReceita.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   inherited;
end;



procedure TfrmCadParamReceita.btnBuscaContaResultClick(Sender: TObject);
begin
   inherited;
   dtmMS.MS_CContabil.Executar;
   Repaint;
   Screen.Cursor := crHourGlass;
   if dtmMS.MS_CContabil.RetornouValor then qryCONTARESULT.Text := dtmMS.MS_CContabil.ValoresChave[0];
   PreencheResult;
   Screen.Cursor := crDefault;
end;



procedure TfrmCadParamReceita.btnBuscaContaDebCreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_CContabil.Executar;
   Repaint;
   Screen.Cursor := crHourGlass;
   if dtmMS.MS_CContabil.RetornouValor then qryCONTADEBCRE.Text := dtmMS.MS_CContabil.ValoresChave[0];
   PreencheDebCre;
   Screen.Cursor := crDefault;
end;



procedure TfrmCadParamReceita.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      if VerificaOcorrencia then begin
         inherited;
      end;
   end;
end;



procedure TfrmCadParamReceita.DBchkIntegraCaPCaRClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin
      if Modulo.bIntegraCAPCAR then begin
         if DBchkIntegraCaPCaR.Checked then begin
         end else begin
         end;
      end else begin
         qryFLGINTEGRACAPCAR.asInteger := 0;
      end;
   end;
end;



procedure TfrmCadParamReceita.DBchkIntegraContabClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then begin
      if Modulo.bIntegraContab then begin
         if DBchkIntegraContab.Checked then begin
            HabilitaContab;
         end else begin
            DesabilitaContab;
         end;
      end else begin
         qryFLGINTEGRACONTAB.asInteger := 0;
         DesabilitaContab;
      end;
   end;
end;



procedure TfrmCadParamReceita.CmeCadastroFind(Sender: TObject);
begin
   inherited;
	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if MontaSelect.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      AbreQueries;

      // abre a query
      Sel(StrToInt(MontaSelect.ValoresChave[0]));

      // verifica as Contas Contábeis
      if Modulo.bIntegraContab then begin
         if VerificaContaContabil(tcResult) then FiltraContabilidade(tcResult);
         if VerificaContaContabil(tcDebCre) then FiltraContabilidade(tcDebCre);
      end;

      Screen.Cursor := crDefault;
   end;

end;



procedure TfrmCadParamReceita.CmeCadastroInsert(Sender: TObject);
begin
   AbreQueries;

   // abre a query principal contendo zero registros
   Sel(-1);
   iIndiceAnterior := -1;
   inherited;
   PreencheDefaults;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;


end.
