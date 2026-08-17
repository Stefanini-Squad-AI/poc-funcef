{-------------------------------------------------------------------------------
SOl_KINTANA : 163982/7003_KTN1489901
Data        : 22/11/2011
Autor       : Vinicius Eduardo Nascimento Maciel
Rotina      : recuperaAtividadePerd e CmeCadastroFind
Descrição   : Foi criada uma rotina para alterar atividades desativadas.
--------------------------------------------------------------------------------
SOl_KINTANA : 168086_1479527
Data        : 07/11/2011
Autor       : Helen
Rotina      : VerificaPreenchimento
Descrição   : Permitir a alteração de uma parametrização quando apenas marcamos
              ou desmarcamos a flag
-------------------------------------------------------------------------------
SOl_KINTANA : 141052/2322_914497
Data        : 31/05/2011
Autor       : Ricardo de Freitas Araújo
Rotina      : Formulário (DFM)
Descrição   : Adicionado o combobox de tipo de imóvel(segmento)
Rotina      : VerificaPreenchimento
Descrição   : Adicionado consistência.
-------------------------------------------------------------------------------}
unit FCadParamRecDes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, fcButton, fcImgBtn,
  fcShapeBtn, Mask, DBCtrls, wwdblook, mContrato, mImovel, mCliente,
  mImovelDB, mContratoDB, DBClient, uCMClientDataSet, uCmSqlParams, Grids,
  DBGrids;

type
  TFrmCadParamRecDes = class(TfrmCadastroCSImob)
    DBcboTipoRecCusto: TwwDBLookupCombo;
    Label6: TLabel;
    Label26: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboTipoRecebDesemb: TwwDBLookupCombo;
    lblTpRecDes: TLabel;
    Label28: TLabel;
    DBcboUnidNegocio: TwwDBLookupCombo;
    grpContaDebCre: TGroupBox;
    Label3: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    btnBuscaContaDebCre: TBitBtn;
    DBcboCCDebCre: TwwDBLookupCombo;
    DBedtContaDebCre: TDBEdit;
    DBedtDescricao: TDBEdit;
    Label2: TLabel;
    DBchkIntegraCaPCaR: TDBCheckBox;
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
    qryIMOVEL_EXTENSO: TStringField;
    qryCONTRATO_EXTENSO: TStringField;
    qryNF_FORCLI: TStringField;
    qryRS_FORCLI: TStringField;
    qryIDMODULO: TFloatField;
    qryIDIMOVELMESTRE: TFloatField;
    qryFLGDIARIO: TStringField;
    lbl1: TLabel;
    qryTipoImovel: TwwQuery;
    dsTipoImovel: TDataSource;
    qryAux: TwwQuery;
    DBcboTIpoImovel: TwwDBLookupCombo;

    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure DBedtContaDebCreExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaContaDebCreClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBchkIntegraCaPCaRClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure DBcboTipoRecCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnApagarClick(Sender: TObject);


  private { Private declarations }

    iIndiceAnterior        : int64;
    bObrigaCC   : boolean;

    procedure Sel(iPadrao: int64);
    function VerificaPreenchimento: boolean;

    procedure PreencheDebCre;

    function VerificaContaContabil: boolean;
    procedure FiltraContabilidade;

    procedure AbreQueries;
    procedure PreencheDefaults;
    procedure DefineTipoRecDesemb;
	function recuperaAtividadePerd(sCodAtividade: String): String;//Vinicius Maciel - SOL 163982/7003 - KTN 1489901

  public { Public declarations }


  end;



var
  FrmCadParamRecDes: TFrmCadParamRecDes;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModuloInvestImob, uComunsImobiliario, uVerificaPreenchimento, uIntegraBack,
   dLookImobiliario, dImobiliario, uFuncoesImob, DMS, uModuloImobiliario;





procedure TFrmCadParamRecDes.Sel(iPadrao: int64);
begin
   // abre a query principal com os parâmetros passados
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDPADRLANCIMOVEL').AsInteger   := iPadrao;
      ParamByName('PIDMODULO').AsInteger           := Sistema.idModulo;
      Open;
   end;
end;



function TFrmCadParamRecDes.VerificaPreenchimento: boolean;
var Ssql : String; //Helen Sol : 168086
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if ( (Modulo.bIntegraCAPCAR) and (qryFLGINTEGRACAPCAR.asInteger = 1) ) then
      begin

        if ( (DBcboCentroRespon.LookupValue = '') or (qryCODCENTRORESPON.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Centro de Responsabilidade!', DBcboCentroRespon);

        if ( (DBcboTipoRecebDesemb.LookupValue = '') or (qryCODTIPRECDES.IsNULL) ) then
          raise EValidacao.CreateVal('É necessário indicar o Tipo de Desembolso!', DBcboTipoRecebDesemb);

      end;
      // Unidade de Negócio --> CaPCaR _e_ Contab
      if ( (Modulo.bIntegraCaPCaR) and (qryFLGINTEGRACAPCAR.asInteger = 1) ) then
      begin
         if ( (DBcboUnidNegocio.LookupValue = '') or (qryUNIDNEGOC.IsNULL) ) then
            raise EValidacao.CreateVal('É necessário indicar a Unidade de Negócio!', DBcboUnidNegocio);
      end;

      // -------------------------------------------------------------------------------------------

      if DBcboTipoRecCusto.Value = '' then
         raise EValidacao.CreateVal('É necessário indicar a Receita / Despesa!', DBcboTipoRecCusto);


      //Ricardo SOl_KINTANA : 141052/2322_914497
      if Trim(DBcboTIpoImovel.Text) = '' then
         raise EValidacao.CreateVal('É necessário indicar tipo de imóvel!', DBcboTIpoImovel);

      //Ricardo SOl_KINTANA : 141052/2322_914497
      if Trim(DBcboTIpoImovel.Text) <> '' then
      begin
         TRY
            qryAux.CLose;
            //Helen Sol : 168086   KINTANA : 1479527 - Inicio
            Ssql := ' SELECT IDPADRLANCIMOVEL FROM PADRLANCIMOVEL ' +
                               ' WHERE ' +
                               ' TRIM(UPPER(DESCPADRLANCIMO)) = ' + QuotedStr( UpperCase(Trim(DBedtDescricao.text))) +
                               ' AND CODTIPIMOVEL = '  +    QuotedStr( ds.DataSet.Fieldbyname('CODTIPIMOVEL').AsString) +
                               ' AND IDTIPOCUSTORECIMO = ' + ds.DataSet.Fieldbyname('IDTIPOCUSTORECIMO').AsString;

            if qry.State in [dsEdit] then
               Ssql := Ssql + ' AND IDPADRLANCIMOVEL <> ' + ds.DataSet.Fieldbyname('IDPADRLANCIMOVEL').AsString;

            {qryAux.SQL.Text := ' SELECT IDPADRLANCIMOVEL FROM PADRLANCIMOVEL ' +
                               ' WHERE ' +
                               ' TRIM(UPPER(DESCPADRLANCIMO)) = ' + QuotedStr( UpperCase(Trim(DBedtDescricao.text))) +
                               ' AND CODTIPIMOVEL = '  +    QuotedStr( ds.DataSet.Fieldbyname('CODTIPIMOVEL').AsString) +
                               ' AND IDTIPOCUSTORECIMO = ' + ds.DataSet.Fieldbyname('IDTIPOCUSTORECIMO').AsString;}
            //Helen Sol : 168086   kINTANA : 1479527 - Fim
            qryAux.SQL.Text := Ssql;
            qryAux.Open;
            if qryAux.RecordCount > 0 then
               raise EValidacao.CreateVal('Já existe uma Receita/Despesa cadastrada com os mesmos campos de “Descrição”,' +#13+
                                           '“Tipo de Imóvel” e “Tipo de Despesa/Receita”.',DBcboTipoRecCusto);
         finally
            qryAux.CLose;
         end;
      end;
   except
     on ev : EValidacao do
     begin
       if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then ev.Control.SetFocus;
       Exit;
     end;
   end;

   Result := True;
end;



procedure TFrmCadParamRecDes.PreencheDebCre;
begin
   if qry.State in [dsInsert, dsEdit] then begin
      if VerificaContaContabil then begin
         FiltraContabilidade;
      end;
   end;
   DBedtContaDebCre.Modified := False;
end;



function TFrmCadParamRecDes.VerificaContaContabil: boolean;
var
   s        : string;
   DBcampo  : TField;
   campo    : TDBEdit;
begin
   Result := False;
   Screen.Cursor := crHourGlass;

   try

      try

         DBcampo  := qryCONTADEBCRE;
         campo    := DBedtContaDebCre;

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

                  grpContaDebCre.Caption := ' Conta Contábil de Ativo / Passivo - ' + FieldByName('PLANOME').asString + ' ';
               end;

            end;

         end else begin
            grpContaDebCre.Caption := ' Conta Contábil de Ativo / Passivo ';
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



procedure TFrmCadParamRecDes.FiltraContabilidade;
begin
   // verifica se a Conta admite SubContas; se admitir, abre a tabela SubConta e habilita as combos

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



procedure TFrmCadParamRecDes.AbreQueries;
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

   //Ricardo SOL: 141052/2322 kintana: 914497 - comentado
   //dtmLookImobiliario.qryLookTipoImovel.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipOper);
   dtmLookImobiliario.qryLookTipOper.Open;

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;

   // SE FOR DESPESA
   with dtmlookImobiliario.qryLookTipoDesemb do begin
      LimpaParametros(dtmlookImobiliario.qryLookTipoDesemb);
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
      Open;
   end;
   // SE FOR RECEITA
   with dtmlookImobiliario.qryLookTipoReceb do begin
      LimpaParametros(dtmlookImobiliario.qryLookTipoReceb);
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
      Open;
   end;
end;



procedure TFrmCadParamRecDes.PreencheDefaults;
begin
   if Modulo.bIntegraCAPCAR then begin
      if qryFLGINTEGRACAPCAR.isNull then qryFLGINTEGRACAPCAR.asInteger := 1;
   end else begin
      qryFLGINTEGRACAPCAR.asInteger := 0;
   end;

   qryFLGINTEGRACONTAB.asInteger := 0;
   qryFLGDIARIO.AsString         := 'N';

   if qryCODCENTRORESPON.IsNull then begin
      qryCODCENTRORESPON.asString   := ModuloImobiliario.InvestImob.sCodCentroRespon;
      DBcboCentroRespon.LookupValue := ModuloImobiliario.InvestImob.sCodCentroRespon;
   end;

   if qryUNIDNEGOC.IsNull then begin
      qryUNIDNEGOC.asInteger        := ModuloImobiliario.InvestImob.iUnidNegoc;
      DBcboUnidNegocio.LookupValue  := IntToStr(ModuloImobiliario.InvestImob.iUnidNegoc);
   end;
end;



procedure TFrmCadParamRecDes.CmeCadastroEdit(Sender: TObject);
begin
	inherited;

   PreencheDefaults;

	if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TFrmCadParamRecDes.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State = dsInsert then qryIDPADRLANCIMOVEL.AsInteger := LeUltRegistro(nil, 'PADRLANCIMOVEL');

   if qry.State in [dsInsert, dsEdit] then begin

      // grava a os parâmetros fixos
      qryIDPESSOA.asInteger   := Sistema.idEmpresa;
      qryIDMODULO.asInteger   := Sistema.idModulo;

      if dtmLookImobiliario.qryLookTipoRecDesRECCUSTO.AsString = 'R' then  // R = RECEITA
         qryRECPAG.asString := 'R'
      else                                                                 // C = CUSTO
         qryRECPAG.asString := 'P';

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
      grpContaDebCre.Caption := ' Conta Contábil de Ativo / Passivo ';
   end else begin
      // preenche as Contas Contábeis
      PreencheDebCre;
   end;
end;



procedure TFrmCadParamRecDes.DBedtContaDebCreExit(Sender: TObject);
begin
   inherited;
   if DBedtContaDebCre.Modified then PreencheDebCre;
end;



procedure TFrmCadParamRecDes.FormCreate(Sender: TObject);
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

   //Ricardo SOl_KINTANA : 141052/2322_914497
   qryTipoImovel.Open;
end;



procedure TFrmCadParamRecDes.FormShow(Sender: TObject);
begin
	inherited;

   // habilita/desabilita o cadastro dos dados de integração com Contabilidade
   if Modulo.bIntegraContab then begin
      grpContaDebCre.Enabled        := True;
      btnBuscaContaDebCre.Enabled   := True;
   end else begin
      grpContaDebCre.Enabled        := False;
      btnBuscaContaDebCre.Enabled   := False;
   end;
end;



procedure TFrmCadParamRecDes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;

   //Ricardo SOL: 141052/2322 kintana: 914497
   qryTipoImovel.Close;

   inherited;
end;



procedure TFrmCadParamRecDes.btnBuscaContaDebCreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_CContabil.Executar;
   Repaint;
   Screen.Cursor := crHourGlass;
   if dtmMS.MS_CContabil.RetornouValor then qryCONTADEBCRE.Text := dtmMS.MS_CContabil.ValoresChave[0];
   PreencheDebCre;
   Screen.Cursor := crDefault;
end;



procedure TFrmCadParamRecDes.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin
      inherited;
   end;
end;



procedure TFrmCadParamRecDes.DBchkIntegraCaPCaRClick(Sender: TObject);
begin
   inherited;

   if qry.State in dsEditModes then
   begin
     if not Modulo.bIntegraCAPCAR then
     begin
       qryFLGINTEGRACAPCAR.asInteger := 0;
     end;
   end;
end;



procedure TFrmCadParamRecDes.CmeCadastroFind(Sender: TObject);
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
      //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
        if((DBcboUnidNegocio.Text = '') and (DBcboUnidNegocio.LookupValue <> '')) then
        DBcboUnidNegocio.Text := recuperaAtividadePerd(DBcboUnidNegocio.LookupValue);
      //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
      // verifica as Contas Contábeis
      if Modulo.bIntegraContab then begin
         if VerificaContaContabil then FiltraContabilidade;
      end;

      DefineTipoRecDesemb;
      Screen.Cursor := crDefault;
   end;

end;



procedure TFrmCadParamRecDes.CmeCadastroInsert(Sender: TObject);
begin
   AbreQueries;

   // abre a query principal contendo zero registros
   Sel(-1);
   iIndiceAnterior := -1;

   inherited;

   PreencheDefaults;
   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;


procedure TFrmCadParamRecDes.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   // A CONTABLILIZAÇÃO É FEITA PELO CAF
   qryFLGINTEGRACONTAB.asInteger := 0;
end;

procedure TFrmCadParamRecDes.DBcboTipoRecCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   DefineTipoRecDesemb;
end;

procedure TFrmCadParamRecDes.DefineTipoRecDesemb;
begin
   if dtmLookImobiliario.qryLookTipoRecDesRECCUSTO.AsString = 'R' then begin
      DBcboTipoRecebDesemb.LookupTable := dtmLookImobiliario.qryLookTipoReceb;
      lblTpRecDes.Caption := 'Tipo de Recebimento';
   end else begin
      DBcboTipoRecebDesemb.LookupTable := dtmLookImobiliario.qryLookTipoDesemb;
      lblTpRecDes.Caption := 'Tipo de Desembolso';
   end;
end;

procedure TFrmCadParamRecDes.sbtnApagarClick(Sender: TObject);
begin
  //Ricardo SOl_KINTANA : 141052/2322_914497
  if Trim(DBedtDescricao.Text) = '' then
  begin
    Application.MessageBox('Não há regisro para excluir!','Atenção',48);
    exit;
  end;

  inherited;
  //Ricardo SOl_KINTANA : 141052/2322_914497
  //Limpar Controles Lookup
  DBedtDescricao.Text              := '';
  DBcboTipoRecCusto.Text           := '';
  DBcboCentroRespon.Text           := '';
  DBcboTipoRecebDesemb.Text        := '';
  DBcboUnidNegocio.Text            := '';
  DBcboTIpoImovel.Text             := '';
  DBedtContaDebCre.Text            := '';
  DBcboCCDebCre.Text               := '';
  DBchkIntegraCaPCaR.Checked       := false;
  Application.ProcessMessages;
end;
//Vinicius Maciel - SOL 163982/7003 - KTN 1489901
function TFrmCadParamRecDes.recuperaAtividadePerd(
  sCodAtividade: String): String;
begin
   with dtmLookImobiliario.qryLookUnidNegocioPerdida do begin
      LimpaParametros(dtmLookImobiliario.qryLookUnidNegocioPerdida);
      ParamByName('pUNIDNEGOC').asInteger := StrToInt(sCodAtividade);
      Open;
      Result := FieldByName('NOME').asString;
   end;
end;
//Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
end.




