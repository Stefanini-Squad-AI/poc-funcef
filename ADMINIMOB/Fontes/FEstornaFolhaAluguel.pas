unit FEstornaFolhaAluguel;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Pendência   : 26271 e 26276
Responsável : Marchetti
Data        : 18/09/2007
Descrição   : Colocado chkBox para permitir desfazer apenas integração
              financeira / contabil
              Mudança na chamada da rotina CtrlLancamentosImovel.Excluir
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26248
Responsável : Daniel Simões
Data        : 30/08/2007
Descrição   : Ajuste no filtro da query do contrato. Acrescentei o 'outer join'
              da tabela 'CONTRATOIMOVEL' com a 'TIPOCONTRIMOB' ...
--------------------------------------------------------------------------------
Pendência   : 26168
Responsável : Daniel Simões
Data        : 28/08/2007
Descrição   : Mudança na tela e no processo de exclusão das Folhas de Aluguéis
              para permitir também excluir Receitas em Lote geradas...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Mask, jclSysUtils,
  wwdbedit, Wwdbspin, wwdblook, Db, DBTables, Wwquery, ComCtrls,
  FOkCancelarImob, mResponsavel, mUsuario, Menus, uCtrlLancamentosImovel, uCtrlHistMovImob,
  DBClient, uCMClientDataSet, mImovelouMestre, uCmSqlParams, Wwdatsrc,
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

type
  TfrmEstornaFolhaAluguel = class(TFrmOkCancelarImob)
    Panel1: TPanel;
    lblContador: TLabel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    Panel3: TPanel;
    Label13: TLabel;
    lbl_Informacao: TLabel;
    Label4: TLabel;
    rdgTipoAluguel: TRadioGroup;
    pnlErro: TPanel;
    memErro: TMemo;
    PopupMenu1: TPopupMenu;
    Voltar1: TMenuItem;
    qryFolhas: TwwQuery;
    qryFolhasCONTRATO_EXTENSO: TStringField;
    qryFolhasIDDOCUMENTO: TFloatField;
    qryFolhasPLNCODIGO: TFloatField;
    qryFolhasDATALANCAMENTO: TDateTimeField;
    qryFolhasFLGINTEGRADO: TFloatField;
    qryFolhasSTATUS_DOC: TStringField;
    qryFolhasCODDOCUMENTO: TFloatField;
    bbtnVoltar: TBitBtn;
    ToolbarSep975: TToolbarSep97;
    qryConfissao: TwwQuery;
    qryConfissaoCONTRATO_EXTENSO: TStringField;
    qryConfissaoIDDOCUMENTO: TFloatField;
    qryConfissaoCODDOCUMENTO: TFloatField;
    qryConfissaoPLNCODIGO: TFloatField;
    qryConfissaoDATALANCAMENTO: TDateTimeField;
    qryConfissaoFLGINTEGRADO: TFloatField;
    qryConfissaoSTATUS_DOC: TStringField;
    cdsHistMovImob: TCMClientDataSet;
    qryConfissaoIDCONTRATOIMOVEL: TFloatField;
    rgpOrigem: TRadioGroup;
    grbCompetencia: TGroupBox;
    Label15: TLabel;
    Label7: TLabel;
    DBspnAno: TwwDBSpinEdit;
    cboMes: TComboBox;
    cboMesFim: TComboBox;
    DBspnAnoFim: TwwDBSpinEdit;
    btnLimpaCompetencia: TBitBtn;
    grbGerais: TGroupBox;
    Label2: TLabel;
    edtNumContrato: TEdit;
    edtNomeContrato: TEdit;
    Label3: TLabel;
    MolResponsavel1: TmolResponsavel;
    Label1: TLabel;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    Label22: TLabel;
    DBcboPortadorForma: TwwDBLookupCombo;
    grbFiltroFolha: TGroupBox;
    grbTipoFolha: TGroupBox;
    chkFolhaAluguel: TCheckBox;
    chkFolhaConfissao: TCheckBox;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    Label5: TLabel;
    DBcboIndiceReajuste: TwwDBLookupCombo;
    grbFiltroLancLote: TGroupBox;
    molImovelouMestre1: TmolImovelouMestre;
    Label6: TLabel;
    dbcboTipoReceita: TwwDBLookupCombo;
    Label8: TLabel;
    dbcboTipoIndicador: TwwDBLookupCombo;
    cdsTipoRec: TCMClientDataSet;
    cdsTipoRecDESCCUSTORECIMO: TStringField;
    cdsTipoRecIDTIPOCUSTORECIMO: TFloatField;
    cdsTipoRecRECCUSTO: TStringField;
    cdsTipoRecCODTIPDOC: TFloatField;
    cdsTipoRecFLGOBRIGAORC: TFloatField;
    cdsTipoRecIDTIPODESPESA: TFloatField;
    cdsTipoRecFLGDIARIO: TStringField;
    dsTipoRec: TwwDataSource;
    sqlTipoRec: TCMSqlParams;
    cdsIndicadores: TCMClientDataSet;
    cdsIndicadoresINMDESCRICAO: TStringField;
    cdsIndicadoresIDINDICADORIMOVEL: TFloatField;
    dsIndicadores: TwwDataSource;
    sqlIndicadores: TCMSqlParams;
    chkApenasDesfazIntegracao: TCheckBox;
    Label9: TLabel;

    // procedimentos definidos
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    function VerificaPreenchimento: boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure LimpaCampos;
    procedure FechaQueries;

    // outros procedimentos
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure btnLimpaCompetenciaClick(Sender: TObject);
    procedure rgpOrigemClick(Sender: TObject);



  private { Private declarations }
    iAdminImovel      : integer;
    iContratoSelecao  : integer;
    iPortadorForma    : integer;

    // Daniel - 26168
    sLabel1 : String;
    sLabel2 : String;
    sLabel3 : String;
    sLabel4 : String;
    sLabel5 : String;
    // Fim.

    CtrlLancImovel  : TCtrlLancamentosImovel;
    CtrlHistMovImob : TCtrlHistMovImob;
    CtrlContab      : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

    procedure DesfazFolhaConfissao;

    procedure TrocaLabel; // Daniel - 26168

  public { Public declarations }

  end;



var
  frmEstornaFolhaAluguel: TfrmEstornaFolhaAluguel;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   uDiasInUteis, uIntegraBack, dImobiliario, uFuncoesImob, uModuloImobiliario, FEspera,
   dLookImobiliario, uMolduras, DMS;



procedure TfrmEstornaFolhaAluguel.DesabilitaBotoes;
begin
   Screen.Cursor           := crHourGlass;

   pnlFundo.Enabled        := False;

   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
   bbtnSair.Enabled        := False;

end;



procedure TfrmEstornaFolhaAluguel.HabilitaBotoes;
begin
   bbtnCancelar.Enabled    := True;
   bbtnSair.Enabled        := True;

   pnlFundo.Enabled        := True;

   Screen.Cursor           := crDefault;
end;



procedure TfrmEstornaFolhaAluguel.btnBuscaContratoClick(Sender: TObject);
var
   sFiltro : String;
begin
   inherited;
   sFiltro       := dtmMS.MS_Contrato.Filtro.Text;
   dtmMS.MS_Contrato.Filtro.Text :=  'C.IDRESPONSAVEL   = PR.IDPESSOA(+) '        +#13+
                                     'C.IDLOCATARIO     = PL.IDPESSOA(+) '        +#13+
                                     'C.IDRESPONSAVEL   = U.IDUSUARIO(+) '        +#13+
                                     'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+) ' +#13+ // Daniel - 26248
                                     'C.FLGTIPOCONTRATO IN (''L'',''D'') '        +#13;

   dtmMS.MS_Contrato.Executar;
   // dtmMS.MS_Contrato.CamposChave
   //    [0] C.IDCONTRATOIMOVEL
   //    [1] C.CONNUMERO
   //    [2] C.CONNOME

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iContratoSelecao        := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      edtNumContrato.Text     := dtmMS.MS_Contrato.ValoresChave[1];
      edtNomeContrato.Text    := dtmMS.MS_Contrato.ValoresChave[2];

      Screen.Cursor := crDefault;
   end;
   dtmMS.MS_Contrato.Filtro.Text := sFiltro;

   btnBuscaContrato.SetFocus;
end;



procedure TfrmEstornaFolhaAluguel.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_AdminImovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdminImovel.SetFocus;
end;



procedure TfrmEstornaFolhaAluguel.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;

   iContratoSelecao  := -1;

   edtNumContrato.Clear;
   edtNomeContrato.Clear;
end;



procedure TfrmEstornaFolhaAluguel.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel  := -1;
   edtAdminImovel.Clear;
end;



procedure TfrmEstornaFolhaAluguel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   inherited;
end;



procedure TfrmEstornaFolhaAluguel.FormShow(Sender: TObject);
begin
   inherited;

   if not(dtmLookImobiliario.qryLookPortadorForma.Active) then with dtmLookImobiliario.qryLookPortadorForma do begin
      LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
      ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;

   dtmLookImobiliario.qryLookMoeda.Open;

  // Daniel - 26168
  sqlIndicadores.Open;
  sqlTipoRec.Open;
  // Fim.

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex        := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasInUteis.ExtraiAno(Date);

   AtribuiMolResponsavel(MolResponsavel1.iResponsavel,MolResponsavel1.edtResponsavel);

   iAdminImovel := -1;

   // Daniel Simões - 22516
   cboMesFim.ItemIndex := -1;
   DBspnAnoFim.Value   := 0;

   // Daniel - 26168
   rgpOrigemClick(Sender);
end;



procedure TfrmEstornaFolhaAluguel.FechaQueries;
var
  i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLookImobiliario.qryLookPortadorForma.Close;
   dtmLookImobiliario.qryLookMoeda.Close;
   qryFolhas.Close;
end;



procedure TfrmEstornaFolhaAluguel.bbtnConfirmarClick(Sender: TObject);
var sMensagem, sErro         : String;
    fQuant, fAtual           : Double;
    iPlnEstorno, iResult     : Integer;
    bDesfaz, bErro           : Boolean;
    sAnoMesLanc, sAnoMesFech : String;
    sAnoMesIni, sAnoMesFim   : string; // Daniel Simões - 22516
begin
  inherited;

  // Daniel Simões - 22516
  sAnoMesIni := IntToStr(Word(trunc(DBspnAno.Value)))+IntToStr(cboMes.ItemIndex+1);
  sAnoMesFim := IntToStr(Word(trunc(DBspnAnoFim.Value)))+IntToStr(cboMesFim.ItemIndex+1);

  // por default, não deixa desfazer...
  bDesfaz := False;

  if chkFolhaAluguel.Checked then begin
    if VerificaPreenchimento then begin
      // Quando for contab. diária, não permite a exclusão se o mês já estiver fechado
      if ModuloImobiliario.AdminImob.bFlgDiario then begin
        sAnoMesLanc := DBspnAno.Text+IntToStrZeroPad((cboMes.itemIndex+1),2);
        sAnoMesFech := IntToStrZeroPad(ModuloImobiliario.AdminImob.iAnoCompetencia,4)+
                       IntToStrZeroPad(ModuloImobiliario.AdminImob.iMesCompetencia,2);

        if sAnoMesLanc<sAnoMesFech then begin
          // Daniel - 26168
          MsgDlg('Mês de competência já foi encerrado. '+sLabel1,'Aviso',mtWarning,[mbOk],0);
          Exit;
        end;
      end;

      try
        // Daniel - 26168
        sMensagem := 'Deseja realmente DESFAZER '+sLabel2+' de '+cboMes.Text+'/'+IntToStr(trunc(DBspnAno.Value))+'?';

        // 1ª verificação
        if MsgDlg(sMensagem, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then bDesfaz := True;

        // 2ª verificação, se não houver sido definido responsável
        if ( (bDesfaz) and (MolResponsavel1.iResponsavel <= 0) ) then begin
          bDesfaz    := False;
          // Daniel - 26168
          sMensagem  := 'Não foi indicado um Responsável. Dessa forma, serão desfeitos os lançamentos '+
                        'de TODOS os Responsáveis.'+#13+'Deseja realmente DESFAZER '+sLabel2+' de '    +
                        cboMes.Text+'/'+IntToStr(trunc(DBspnAno.Value))+'?';
          // Fim.

          if MsgDlg(sMensagem, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then bDesfaz := True;
        end;

        // se respostas afirmativas...
        if bDesfaz then begin
          memErro.Clear;
          pnlErro.BringToFront;
          bbtnVoltar.Enabled := True;

          DesabilitaBotoes;

          frmEspera.Config('Aguarde', 'Selecionando lançamentos...', False);
          frmEspera.Show;
          Application.ProcessMessages;

          // seleciona os lançamentos para exclusão
          with qryFolhas do begin
            LimpaParametros(qryFolhas);

            ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;

            if (DBspnAnoFim.Value<=0) or (cboMes.ItemIndex=-1) then begin
              ParamByName('PMESCOMPETENCIA').AsInteger := cboMes.ItemIndex + 1;
              ParamByName('PANOCOMPETENCIA').AsInteger := StrToInt(IntToStr(trunc(DBspnAno.Value)));
            end else begin
              // Daniel Simões - 22516
              ParamByName('PANOMESINI').AsString := sAnoMesIni;
              ParamByName('PANOMESFIM').AsString := sAnoMesFim;
            end;

            if (DBcboPortadorForma.LookupValue<>'')  then ParamByName('PCODPORTFORMA').AsInteger     := StrToInt(DBcboPortadorForma.LookupValue);
            if (DBcboIndiceReajuste.LookupValue<>'') then ParamByName('PINDICEREAJUSTE').AsInteger   := StrToInt(DBcboIndiceReajuste.LookupValue);
            if (molResponsavel1.iResponsavel>0)      then ParamByName('PIDRESPONSAVEL').AsInteger    := MolResponsavel1.iResponsavel;
            if (iAdminImovel>0)                      then ParamByName('PADMIN_CONTRATO').AsInteger   := iAdminImovel;
            if (iContratoSelecao>0)                  then ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContratoSelecao;

// Daniel - 26168 - Início -----------------------------------------------------
            if (rgpOrigem.ItemIndex=0) then
                 ParamByName('PFLGORIGEMLANC').AsString := 'F'
            else ParamByName('PFLGORIGEMLANC').AsString := 'L';

            if (molImovelouMestre1.iImovel>0)       then ParamByName('PIDIMOVEL').AsInteger          := molImovelouMestre1.iImovel;
            if (dbcboTipoReceita.LookupValue<>'')   then ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(dbcboTipoReceita.LookupValue);
            if (dbcboTipoIndicador.LookupValue<>'') then ParamByName('PIDINDICADORIMOVEL').AsInteger := StrToInt(dbcboTipoIndicador.LookupValue);
// Daniel - 26168 - Fim --------------------------------------------------------

            Open;

            frmEspera.Hide;
            frmEspera.Config('', '', False);

            if not(IsEmpty) then begin
              fQuant := RecordCount;
              fAtual := 0;
              bErro  := False;

              // ProgressBar
              // Daniel - 26168
              MostraProgresso(ProgressBar,lblProgress,lblContador,fQuant,'Desfazendo '+sLabel3+'...');


              First;
              while not(EOF) do begin
                fAtual := fAtual + 1;
                AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);

                // só tenta excluir se o lançamento ainda não houver sido baixado
                if qryFolhasSTATUS_DOC.asString <> '2' then begin
                   iPlnEstorno := qryFolhasPLNCODIGO.AsInteger;
                   if qryFolhasPLNCODIGO.isNull then iPlnEstorno := -1;

                   // Se o resultado for <> 0 --> ERRO
                   sErro := '';

                   // Marchetti - Pendencia 26271 e 26276
                   if CtrlLancImovel.Excluir( qryFolhasIDDOCUMENTO.AsInteger, True, -1, chkApenasDesfazIntegracao.Checked ) then begin
                     iResult := 0;
                   end else begin
                     iResult := 1;
                     sErro := CtrlLancImovel.MessageInfo;
                   end;
                   // Fim Marchetti - Pendencia 26271 e 26276

                   if not bErro then
                     bErro := iResult <> 0;

                   if iResult = 0 then begin
                     // Daniel - 26168
                     memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss',now)+' - doc.: '+qryFolhasCODDOCUMENTO.AsString+' - '+qryFolhasCONTRATO_EXTENSO.AsString + ' - ' + 'EXCLUÍDO OK');
                   end else begin
                     memErro.Lines.Add('------------------------------------------------------------');
                     // Daniel - 26168
                     memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss',now)+ ' - doc.: '+qryFolhasCODDOCUMENTO.AsString+' - '+qryFolhasCONTRATO_EXTENSO.AsString + ' - ' + 'NÃO EXCLUÍDO');
                     memErro.Lines.Add(sErro);
                     memErro.Lines.Add('------------------------------------------------------------');
                   end;
                end else begin
                  memErro.Lines.Add('------------------------------------------------------------');
                  // Daniel - 26168
                  memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss',now)+' - doc.: '+qryFolhasCODDOCUMENTO.AsString+' - '+qryFolhasCONTRATO_EXTENSO.AsString + ' - ' + 'JA LIQUIDADO');
                  memErro.Lines.Add('------------------------------------------------------------');
                end;

                Next;
              end;

              EscondeProgresso(ProgressBar, lblProgress, lblContador);

              if bErro then begin
                // Daniel - 26168
                sMensagem := sLabel4+#13+'ENTRETANTO, PELO MENOS UM LANÇAMENTO NÃO PÔDE SER EXCLUÍDO.';

                MsgDlg(sMensagem, 'Aviso', mtWarning, [mbOk], 0);
              end else begin
                sMensagem := sLabel4; //Daniel - 26168

                MsgDlg(sMensagem, 'Informação', mtInformation, [mbOk], 0);
              end;
            end;
          end;
        end;

      finally
        Repaint;
        HabilitaBotoes;
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  if chkFolhaConfissao.Checked then DesfazFolhaConfissao;
end;



function TfrmEstornaFolhaAluguel.VerificaPreenchimento: boolean;
begin
  Result := False;

   try
      if chkFolhaAluguel.Checked then
      begin
         if MolResponsavel1.iResponsavel < -1 then
            raise EValidacao.CreateVal('É necessário indicar um responsável válido!', MolResponsavel1.btnBuscaResponsavel);
      end;

      if cboMes.ItemIndex < 0 then
         // Daniel - 26168
         raise EValidacao.CreateVal('É necessário indicar o Mês de competência '+sLabel5+'!', cboMes);

      if DBspnAno.Value <= 0 then
         // Daniel - 26168
         raise EValidacao.CreateVal('É necessário indicar o Ano de competência '+sLabel5+'!', DBspnAno);

      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,'01/'+IntToStr(cboMes.ItemIndex+1) +'/'+DBspnAno.text) then
      begin
          raise EValidacao.CreateVal('Período contábil bloqueado!', cboMes);
      end;
       // Helen - SOL: 172902 KTN: 1577381 - Fim


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



procedure TfrmEstornaFolhaAluguel.LimpaCampos;
begin
   DBcboPortadorForma.LookupValue     := '';
   DBcboPortadorForma.Clear;

   cboMes.Clear;
   DBspnAno.Clear;

   edtAdminImovel.Clear;
   edtNumContrato.Clear;
   edtNomeContrato.Clear;

   iAdminImovel      := -1;
   iContratoSelecao  := -1;
   iPortadorForma    := -1;
end;



procedure TfrmEstornaFolhaAluguel.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   qryFolhas.Close;
   LimpaCampos;
end;



procedure TfrmEstornaFolhaAluguel.Voltar1Click(Sender: TObject);
begin
   inherited;
   bbtnVoltarClick(Sender);
end;



procedure TfrmEstornaFolhaAluguel.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlLancImovel := TCtrlLancamentosImovel.Create( Sistema.IdEmpresa,
                                                    Sistema.IdModulo,
                                                    Sistema.IdUsuario,
                                                    Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );

   CtrlLancImovel.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, true );

   CtrlHistMovImob := TCtrlHistMovImob.Create;
   CtrlHistMovImob.InitializeAs(CtrlLancImovel);
   CtrlHistMovImob.OpenTransaction := False;
   CtrlHistMovImob.CdsHistMovImob := cdsHistMovImob;
   // Helen - SOL: 172902 KTN: 1577381
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlLancImovel);
end;



procedure TfrmEstornaFolhaAluguel.FormDestroy(Sender: TObject);
begin
   FreeAndNil(CtrlLancImovel);
   FreeAndNil(CtrlHistMovImob);
   FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
   inherited;
end;



procedure TfrmEstornaFolhaAluguel.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
   pnlErro.SendToBack;
   bbtnConfirmar.Enabled := True;
   bbtnVoltar.Enabled    := False;
end;

procedure TfrmEstornaFolhaAluguel.btnLimpaCompetenciaClick(
  Sender: TObject);
begin
  inherited;
  // Daniel Simões - 22516
  cboMesFim.ItemIndex := -1;
  DBspnAnoFim.Value   := 0;
end;

procedure TfrmEstornaFolhaAluguel.DesfazFolhaConfissao;
var
   sMensagem, sErro     : string;
   fQuant, fAtual       : double;
   iPlnEstorno, iResult : integer;
   bDesfaz, bErro       : boolean;
   sAnoMesLanc, sAnoMesFech : String;

   // Daniel Simões - 22516
   sAnoMesIni,sAnoMesFim : string;
begin
   sAnoMesIni := IntToStr(Word(trunc(DBspnAno.Value)))+IntToStr(cboMes.ItemIndex+1);
   sAnoMesFim := IntToStr(Word(trunc(DBspnAnoFim.Value)))+IntToStr(cboMesFim.ItemIndex+1);


   // por default, não deixa desfazer...
   bDesfaz := False;

   if VerificaPreenchimento then begin

      // Quando for contab. diária, não permite a exclusão se o mês já estiver fechado
      if ModuloImobiliario.AdminImob.bFlgDiario then begin
         sAnoMesLanc := DBspnAno.Text + IntToStrZeroPad((cboMes.itemIndex + 1),2);
         sAnoMesFech := IntToStrZeroPad(ModuloImobiliario.AdminImob.iAnoCompetencia,4) +
                        IntToStrZeroPad(ModuloImobiliario.AdminImob.iMesCompetencia,2);
         if sAnoMesLanc < sAnoMesFech then begin
            MsgDlg('Mês de competência já foi encerrado. A folha de Confissão de Dívidas não poderá ser desfeita', 'Aviso', mtWarning, [mbOk], 0);
            Exit;
         end;
      end;

      try

         StartTransacao;

         sMensagem   := 'Deseja realmente DESFAZER a Folha de Confissão de Dívidas de ' + cboMes.Text + '/' +
                        IntToStr(trunc(DBspnAno.Value)) + '?';

         // 1ª verificação
         if MsgDlg(sMensagem, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then bDesfaz := True;

         // se respostas afirmativas...
         if bDesfaz then begin

            memErro.Clear;
            pnlErro.BringToFront;
            bbtnVoltar.Enabled := True;

            DesabilitaBotoes;

            frmEspera.Config('Aguarde', 'Selecionando lançamentos...', False);
            frmEspera.Show;
            Application.ProcessMessages;

            // seleciona os lançamentos para exclusão
            with qryConfissao do begin
               LimpaParametros(qryConfissao);

               ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;

               if (DBspnAnoFim.Value<=0) or (cboMes.ItemIndex=-1) then begin
                 ParamByName('PMESCOMPETENCIA').AsInteger := cboMes.ItemIndex + 1;
                 ParamByName('PANOCOMPETENCIA').AsInteger := StrToInt(IntToStr(trunc(DBspnAno.Value)));
               end else begin
                 // Daniel Simões - 22516
                 ParamByName('PANOMESINI').AsString := sAnoMesIni;
                 ParamByName('PANOMESFIM').AsString := sAnoMesFim;
               end;

               if DBcboPortadorForma.LookupValue <> ''  then ParamByName('PCODPORTFORMA').AsInteger := StrToInt(DBcboPortadorForma.LookupValue);
               if DBcboIndiceReajuste.LookupValue <> '' then ParamByName('PINDICEREAJUSTE').AsInteger := StrToInt(DBcboIndiceReajuste.LookupValue);

               if iAdminImovel > 0 then ParamByName('PADMIN_CONTRATO').AsInteger                   := iAdminImovel;
               if iContratoSelecao > 0 then ParamByName('PIDCONTRATOIMOVEL').AsInteger             := iContratoSelecao;

               Open;

               frmEspera.Hide;
               frmEspera.Config('', '', False);

               if not(IsEmpty) then begin

                  fQuant := RecordCount;
                  fAtual := 0;
                  bErro  := False;

                  // ProgressBar
                  MostraProgresso(ProgressBar, lblProgress, lblContador, fQuant, 'Desfazendo Folha de Confissão de Dívidas...');

                  First;
                  while not(EOF) do begin

                     fAtual := fAtual + 1;
                     AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fQuant);

                     // só tenta excluir se o lançamento ainda não houver sido baixado
                     if qryConfissaoSTATUS_DOC.asString <> '2' then begin

                        sErro := '';

                        cdsHistMovImob.Data := CtrlHistMovImob.LookupHistMovImob(-1,
                                                                                 -1,
                                                                                 0,
                                                                                 -3,
                                                                                 -1,
                                                                                 qryConfissaoDATALANCAMENTO.AsDateTime,
                                                                                 qryConfissaoDATALANCAMENTO.AsDateTime,
                                                                                 qryConfissaoIDCONTRATOIMOVEL.AsInteger);
                        if not cdsHistMovImob.IsEmpty then
                        begin
                           while not cdsHistMovImob.eof do
                           begin
                              iPlnEstorno := cdsHistMovImob.FieldByName('PLNCODIGO').AsInteger;

                              cdsHistMovImob.Delete;
                              if not CtrlHistMovImob.GravaHistMovImob then
                              begin
                                 bErro := True;
                                 memErro.Lines.Add('------------------------------------------------------------');
                                 memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss', now)+ ' - ' + qryConfissaoCONTRATO_EXTENSO.AsString + ' - ' + 'NÃO EXCLUÍDO - Erro na exclusão do Item');
                                 memErro.Lines.Add(sErro);
                                 memErro.Lines.Add('------------------------------------------------------------');
                                 Next;
                                 Continue;
                              end;

                              if not CtrlHistMovImob.DesfazContabilizacao(Sistema.IdUsuario,
                                                                          iPlnEstorno,
                                                                          Sistema.IdModulo,
                                                                          0,
                                                                          Sistema.UsaPlanoPatro,
                                                                          True) then
                              begin
                                 bErro := True;
                                 memErro.Lines.Add('------------------------------------------------------------');
                                 memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss', now)+ ' - ' + qryConfissaoCONTRATO_EXTENSO.AsString + ' - ' + 'NÃO EXCLUÍDO - Erro ao desfazer Contabilização do Item');
                                 memErro.Lines.Add(sErro);
                                 memErro.Lines.Add('------------------------------------------------------------');
                                 Next;
                                 Continue;
                              end;
                           end;
                        end;

                        cdsHistMovImob.Data := CtrlHistMovImob.LookupHistMovImob(-1,
                                                                                 -1,
                                                                                 0,
                                                                                 -1,
                                                                                 -1,
                                                                                 qryConfissaoDATALANCAMENTO.AsDateTime,
                                                                                 qryConfissaoDATALANCAMENTO.AsDateTime,
                                                                                 qryConfissaoIDCONTRATOIMOVEL.AsInteger);

                        while not cdsHistMovImob.eof do cdsHistMovImob.Delete;
                        if not CtrlHistMovImob.GravaHistMovImob then
                        begin
                           bErro := True;
                           memErro.Lines.Add('------------------------------------------------------------');
                           memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss', now)+ ' - ' + qryConfissaoCONTRATO_EXTENSO.AsString + ' - ' + 'NÃO EXCLUÍDO - Erro na exclusão do Item');
                           memErro.Lines.Add(sErro);
                           memErro.Lines.Add('------------------------------------------------------------');
                           Next;
                           Continue;
                        end;

                        iPlnEstorno := qryConfissaoPLNCODIGO.AsInteger;
                        if qryConfissaoPLNCODIGO.isNull then iPlnEstorno := -1;

                        // Marchetti - Pendencia 26271 e 26276
                        if CtrlLancImovel.Excluir( qryConfissaoIDDOCUMENTO.AsInteger, False, -1, chkApenasDesfazIntegracao.Checked ) then begin
                           iResult := 0;
                        end else begin
                           iResult := 1;
                           sErro := CtrlLancImovel.MessageInfo;
                        end;
                        // Fim Marchetti - Pendencia 26271 e 26276

                        if not bErro then
                           bErro := iResult <> 0;

                        if iResult = 0 then begin
                           memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss', now)+ ' - ' + qryConfissaoCONTRATO_EXTENSO.AsString + ' - ' + 'EXCLUÍDO OK');
                        end else begin
                           memErro.Lines.Add('------------------------------------------------------------');
                           memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss', now)+ ' - ' + qryConfissaoCONTRATO_EXTENSO.AsString + ' - ' + 'NÃO EXCLUÍDO');
                           memErro.Lines.Add(sErro);
                           memErro.Lines.Add('------------------------------------------------------------');
                        end;
                     end else begin
                        memErro.Lines.Add('------------------------------------------------------------');
                        memErro.Lines.Add(FormatDateTime('dd/mm/yy hh:nn:ss', now)+ ' - ' + qryConfissaoCONTRATO_EXTENSO.AsString + ' - ' + 'JA LIQUIDADO');
                        memErro.Lines.Add('------------------------------------------------------------');
                     end;

                     Next;
                  end;

                  EscondeProgresso(ProgressBar, lblProgress, lblContador);

                  if bErro then begin
                     sMensagem   := 'A Folha de Confissão de Dívidas foi desfeita.' + #13 +
                                    'ENTRETANTO, PELO MENOS UM LANÇAMENTO NÃO PÔDE SER EXCLUÍDO.';

                     MsgDlg(sMensagem, 'Aviso', mtWarning, [mbOk], 0);
                  end else begin
                     sMensagem   := 'A Folha de Confissão de Dívidas foi desfeita.';

                     MsgDlg(sMensagem, 'Informação', mtInformation, [mbOk], 0);
                  end;

               end;
            end;
         end;

      finally
         CommitTransacao;
         Repaint;
         HabilitaBotoes;
         Screen.Cursor := crDefault;
      end;
   end;
end;

// Daniel - 26168 - Início -----------------------------------------------------
procedure TfrmEstornaFolhaAluguel.rgpOrigemClick(Sender: TObject);
begin
  inherited;

  if (rgpOrigem.ItemIndex=0) then begin
    // Se for 'Folha de Aluguel', desabilita 'Lançamento em Lote' ...
    grbFiltroLancLote.Enabled := False;
    dbcboTipoReceita.Text     := '';
    dbcboTipoIndicador.Text   := '';
    molImovelouMestre1.btnLimpaImovelClick(Sender);

    // ... e habilita 'Folha de Aluguel' ...
    grbFiltroFolha.Enabled := True;

    // ... e muda o Caption do label informativo.
    lbl_Informacao.Caption := ':  Este procedimento irá EXCLUIR todos os lançamentos de uma Folha de Aluguéis, integrados ou não, ';
  end else begin
    // Se for 'Lançamento em Lote', desabilita 'Folha de Aluguel' ...
    grbFiltroFolha.Enabled   := False;
    DBcboIndiceReajuste.Text := '';

    // ... e habilita 'Lançamento em Lote' ...
    grbFiltroLancLote.Enabled := True;

    // ... e muda o Caption do label informativo.
    lbl_Informacao.Caption := ':  Este procedimento irá EXCLUIR todos os Lançamentos em Lote, integrados ou não, ';
  end;

  TrocaLabel;
end;

procedure TfrmEstornaFolhaAluguel.TrocaLabel;
begin
  if (rgpOrigem.ItemIndex=0) then begin
    sLabel1 := 'A Folha não poderá ser desfeita.';
    sLabel2 := 'a Folha de Aluguéis';
    sLabel3 := 'Folha de Aluguéis';
    sLabel4 := 'A Folha de Aluguéis foi desfeita.';
    sLabel5 := 'da Folha de Aluguéis';
  end else begin
    sLabel1 := 'O Lançamento em Lote não poderá ser desfeito.';
    sLabel2 := 'os Lançamentos em Lote';
    sLabel3 := 'Lançamentos em Lote';
    sLabel4 := 'Os Lançamentos em Lote foram desfeitos.';
    sLabel5 := 'dos Lançamentos em Lote';
  end;
end;
// Daniel - 26168 - Fim --------------------------------------------------------

end.
