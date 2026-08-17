{-------------------------------------------------------------------------------

Rateia Lançamentos de despesa - Incluindo Rateio do Rateio no caso de o mesmo
                                Imóvel possuir mais de um contrato

	Autor           : Alex Pereira
	Data de Início  : 04/10/2000
	Data de Término : 05/10/2000

	Modificações	: 03/01/2001 1) Retirado o flgIntegrado = -1 >> somente
                                        para PC (Alex)

                          04/01/2001 2) qryRateio ordenada pelo total de rateio
                                        p/ jogar a diferença no maior valor,
                                        gerando a menor distorção possível (André)

                          04/01/2001 3) Mudança na forma de totalizador (por
                                        diferença - subtração), para corrigir o
                                        total, que estava incorreto (André)

                          09/01/2001 4) Novos campos gravados: CodForma (Forma
                                        de Pagamento) e ReferenciaAP (André)

                          30/01/2001 5) Msg informando sucesso do Lançamento (André)

                          28/02/2001 a
                          28/02/2001 6) Críticas de Contrato (André)

                                     7) Registro das ocorrências (André)

                                     8) Recálculo do Rateio (André)

                          28/02/2001 9) Refresh re-ponteirando as combos (André)

                                     10) Centro de Custo default ao entrar
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
// Nº SIG.....: SIG TIBERO
// Data.......: 
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 23/04/2007
Descrição   : Mudança na função 'CalculaRateio'. A query foi adaptada para
              carregar Imóveis ou Unidades pertencentes ao contrato.
--------------------------------------------------------------------------------
Pendência   : 24781
Responsável : Daniel Simões
Data        : 19/03/2007
Descrição   : Passa o parâmetro pCODTIPIMOVEL na hora de inserir o lançamento.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecLancRateio;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, fcButton, fcImgBtn,
  fcShapeBtn, Wwdbspin, wwdbedit, Wwdotdot, Wwdbcomb, Mask, wwdblook, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Spin, TREdit, Db, Wwdatsrc, DBTables, Wwquery,
  MontaSelect, fcLabel, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  FOkCancelarImob, FSairAjudaImob, TEdNum, mFornecedor,
  // Helen - SOL: 172902 KTN: 1577381
   uCtrlContab,uCtrlPadroes;

type
  TfrmExecLancRateio = class(TFrmSairAjudaImob)
    dsRateio: TwwDataSource;
    updRateio: TUpdateSQL;
    qryUpdateRateio: TwwQuery;
    qryRateio: TwwQuery;
    qryRateioIMOVEL_EXTENSO: TStringField;
    qryRateioGXIPERCENTRATEIO: TFloatField;
    qryRateioIDIMOVEL: TFloatField;
    qryRateioIDCONTRATOIMOVEL: TFloatField;
    qryRateioCONNUMERO: TStringField;
    qryRateioCONNOME: TStringField;
    qryRateioVALOR: TFloatField;
    qryRateioPERCENT_RATEIO: TFloatField;
    qryRateio_CONTRATOEXTENSO: TStringField;
    qryRateioIMOCODIGO: TStringField;
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    Label22: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    DBcboGrupo: TwwDBLookupCombo;
    btnContinuaSelecao: TfcShapeBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    lblDataVencimento: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    DBcboFormaRecPag: TwwDBLookupCombo;
    edtReferenciaAP: TEdit;
    edtNumDocumento: TEdit;
    btnAtualizar: TfcShapeBtn;
    memObs: TMemo;
    DBcboCentroCusto: TwwDBLookupCombo;
    Label12: TLabel;
    Label4: TLabel;
    pgcLancamentos: TPageControl;
    tbsLancamentos: TTabSheet;
    DBgrdLancamentos: TwwDBGrid;
    tbsErro: TTabSheet;
    memErro: TMemo;
    btnConfirma: TfcShapeBtn;
    btnVoltar: TfcShapeBtn;
    Panel3: TPanel;
    chkRefazRateio: TCheckBox;
    edtTotalLanc: TRealEdit;
    edtTotalInformado: TRealEdit;
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    btnContinuarLanc: TfcShapeBtn;
    btnTotaliza: TfcShapeBtn;
    Bevel3: TBevel;
    Bevel1: TBevel;
    fcShapeBtn1: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    Label9: TLabel;
    Label14: TLabel;
    rdgAcreDesc: TRadioGroup;
    DBcboAlterador: TwwDBLookupCombo;
    DBgrdAlteradoresLanc: TwwDBGrid;
    edtValor: TEditNum;
    Panel4: TPanel;
    bbtnConfirmar: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    btnRefreshAlterador: TfcShapeBtn;
    Bevel4: TBevel;
    updAlterador: TUpdateSQL;
    qryAlterador: TwwQuery;
    qryAlteradorDESCRICAO: TStringField;
    qryAlteradorIDDOCUMENTO: TFloatField;
    qryAlteradorCODALTERADOR: TFloatField;
    qryAlteradorVLRALTERADOR: TFloatField;
    dsAlterador: TwwDataSource;
    qryRateioCODTIPIMOVEL: TStringField;
    lblContaBancaria: TLabel;
    molFornecedor1: TmolFornecedor;
    dbCboContaBancaria: TwwDBLookupCombo;
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBgrdLancRateioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancRateioTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBgrdLancRateioEnter(Sender: TObject);
    procedure DBgrdLancRateioExit(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtVlrTotalExit(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure qryRateio_CONTRATOEXTENSOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
    procedure btnTotalizaClick(Sender: TObject);
    procedure btnContinuarLancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure molFornecedor1btnBuscaFornClick(Sender: TObject);
    procedure DBcboFormaRecPagExit(Sender: TObject);


  private { Private declarations }
    iResult       : smallint;
    fTotalRateio  : double;
    sTipoImovel   : string;
    iDocumento    : integer;

    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    procedure FazerRefresh;

    procedure AbreTabelas;
    procedure FechaTabelas;

    function CalculaRateio: boolean;

    function GeraLancamentos: shortint;
    function GravaLancamento(iDocumento: integer): boolean;
    function GravaRateio(fPercentRateio: double): boolean;

    function VerificaPreenchimento: boolean;
    function VerificaTotal: boolean;
    function VerificaTipoImoveisLanc: boolean;
    function TotalizaRateio: double;

    procedure AbreTipoAlterador;
    procedure VerificaContaBancaria;

  public { Public declarations }

  end;



var
  frmExecLancRateio: TfrmExecLancRateio;



implementation

{$R *.DFM}

uses USistema, UMensErro, UDatabase, UComunsImobiliario, uVerificaPreenchimento, UDiasInUteis,
     dImobiliario, dLookImobiliario, uFuncoesImob, uDocumento, DMS, dLancImovel,
     uModuloImobiliario, uModuloAdminImob;



procedure TfrmExecLancRateio.DesabilitaBotoes;
begin
   Screen.Cursor := crHourGlass;

   btnContinuaSelecao.Enabled := False;
   btnVoltar.Enabled          := False;
   btnConfirma.Enabled        := False;
   bbtnSair.Enabled           := False;

   ntbPrincipal.Enabled          := False;
end;



procedure TfrmExecLancRateio.HabilitaBotoes;
begin
   btnContinuaSelecao.Enabled := True;
   btnVoltar.Enabled          := True;
   btnConfirma.Enabled        := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled          := True;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecLancRateio.FazerRefresh;
begin
   AbreTabelas;
end;



procedure TfrmExecLancRateio.AbreTabelas;
var
   sGrupoAnt   : string;
   sRecDesAnt  : string;
   sFormaAnt   : string;
   sCCAnt      : string;
begin
   // Parametros do Sistema
   dtmImobiliario.qryParamImob.Close;
   ParametrosSistema;

   // Grupo de Rateio
   if DBcboGrupo.LookupValue <> '' then sGrupoAnt := DBcboGrupo.LookupValue;
   LimpaParametros(dtmLookImobiliario.qryLookGrupoRateio);
   dtmLookImobiliario.qryLookGrupoRateio.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
   dtmLookImobiliario.qryLookGrupoRateio.Open;
   if length(trim(sGrupoAnt)) > 0 then DBcboGrupo.LookupValue := sGrupoAnt;

//   dtmLookImobiliario.qryLookMoeda.Open;
//
//   // default = moeda corrente

   // Tipo de Despesa
   if DBcboTipoRecDes.LookupValue <> '' then sRecDesAnt := DBcboTipoRecDes.LookupValue;
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString := 'C';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;
   if length(trim(sRecDesAnt)) > 0 then DBcboTipoRecDes.LookupValue := sRecDesAnt;

   // Forma de Pagamento
   if DBcboFormaRecPag.LookupValue <> '' then sFormaAnt := DBcboFormaRecPag.LookupValue;
   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;
   if length(trim(sFormaAnt)) > 0 then DBcboFormaRecPag.LookupValue := sFormaAnt;

   // Centro de Custo
   if DBcboCentroCusto.LookupValue <> '' then sCCAnt := DBcboCentroCusto.LookupValue;
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
   if length(trim(sCCAnt)) > 0 then begin
      DBcboCentroCusto.LookupValue := sCCAnt;
   end else begin
      if not(dtmImobiliario.qryParamImobCODCENTROCUSTO.isNULL) then begin
         DBcboCentroCusto.LookupValue := dtmImobiliario.qryParamImobCODCENTROCUSTO.AsString;
      end;
   end;
end;



procedure TfrmExecLancRateio.FechaTabelas;
begin
   qryRateio.Close;

   dtmLookImobiliario.qryLookGrupoRateio.Close;

   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookTipoRecDes.Close;

   dtmImobiliario.qryParamImob.Close;
   dtmLookImobiliario.qryLookContaBancaria.Close;
end;



function TfrmExecLancRateio.VerificaPreenchimento: boolean;
var
  iDia, iMes, iAno, iDifMeses, iAnoComp, iMesComp: word;
  dDia1, dDia2: TDateTime;
begin
   Result := False;

   try
      iAnoComp := Word(trunc(DBspnAno.Value));
      iMesComp := cboMes.ItemIndex + 1;

      if (DBcboGrupo.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar um Grupo para o Rateio!', DBcboGrupo);

      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa a ser rateada!', DBcboTipoRecDes);

      if (molFornecedor1.iFornecedor = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Fornecedor/Favorecido!', molFornecedor1.btnBuscaForn);

      if (edtVlrTotal.Value <= 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor Total a ser rateado!', edtVlrTotal);

      if (cboMes.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if (length(trim(edtDataVenc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if (length(trim(edtDataLanc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLanc);

      // 19/08 travado data de lançamento apenas para frente da competência
      DecodeDate(edtDataLanc.Date, iAno, iMes, iDia);
      dDia1 := DiasInUteis.UltDiaMes (iAnoComp, iMesComp);
      if edtDataLanc.Date > dDia1 then
         raise EValidacao.CreateVal('A data de lançamento não pode ser após a sua competência!', edtDataLanc);

      if (iAno < DBspnAno.Value) or (iMes < cboMes.ItemIndex + 1) then
         if MsgDlg ('A data de lançamento esta digitada antes do vencimento. Continua?', 'AdminImob', mtConfirmation, [mbyes,mbno], 0) = MrNo then
           raise EValidacao.CreateVal('Altere data de Lançamento.', edtDataLanc);

      ParametrosSistema;

      { 20/06
        se possui contabilização diária
           se despesas/receitas com periodicidade mensal
              a competencia do lançamento somente pode ser igual a competencia
              atual ou no máximo um mês apos
      }
      if ModuloImobiliario.AdminImob.bFlgDiario then begin
         if dtmLookImobiliario.qryLookTipoRecDesFLGDIARIO.AsString = 'M' then begin
            dDia1 := EncodeDate(ModuloImobiliario.AdminImob.iAnoCompetencia,
                                ModuloImobiliario.AdminImob.iMesCompetencia, 1);
            dDia2 := EncodeDate(iAnoComp, iMesComp, 1);
            if dDia2 < dDia1 then begin  // tentativa de lançar em um mes anterior
               raise EValidacao.CreateVal('A competência selecionada já foi encerrada!', edtDataLanc);
            end else begin
               iDifMeses := DiasInUteis.IntervaloMeses(dDia1, dDia2);
               if iDifMeses = ModuloImobiliario.AdminImob.iMesBloqLancto then
                  MsgDlg('A competência selecionada ainda não foi inicializada, execute o fechamento mensal!', 'Informação', mtInformation, [mbok], 0)
               else if iDifMeses > ModuloImobiliario.AdminImob.iMesBloqLancto then
                  raise EValidacao.CreateVal('A competência selecionada ainda não foi inicializada, execute o encerramento mensal!', edtDataLanc);
            end;
         end;
      end;

      // verifica se o vencimento escolhido é um dia inútil
      if dtmImobiliario.qryParamImobFLGDIAUTILAP.AsString = 'S' then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if dtmImobiliario.qryParamImobFLGUSAAP.Asinteger = 1 then begin

         if (DBcboFormaRecPag.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaRecPag);

         if (length(trim(edtReferenciaAP.Text)) = 0) then
            raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);

         if (DBcboCentroCusto.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);

      end;
      // Helen - SOL: 172902 KTN: 1577381 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataVenc);
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLanc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataLanc);
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



function TfrmExecLancRateio.VerificaTotal: boolean;
begin
   Result := False;

   try

      if ( Arredonda(edtVlrTotal.Value, 2) <> Arredonda(TotalizaRateio, 2) ) then
         raise EValidacao.CreateVal('O Valor Total dos Lançamentos não confere com o Valor a ser rateado!', btnConfirma);

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



function TfrmExecLancRateio.VerificaTipoImoveisLanc: boolean;
var
   sTipoImovelAnt, sTipoImovelAtual : string;
begin
   Result := False;

   ParametrosSistema;
   if dtmImobiliario.qryParamImobFLGMULTITIPO.AsInteger <> 1 then begin
      try

         with qryRateio do begin

            First;
            sTipoImovelAnt := qryRateioCODTIPIMOVEL.AsString;

            while not(EOF) do begin
               sTipoImovelAtual := qryRateioCODTIPIMOVEL.AsString;

               if (sTipoImovelAtual <> sTipoImovelAnt) then
                  raise EValidacao.CreateVal('Para lançar Alteradoresé necessário que TODOS os Imóveis sejam do mesmo Tipo!', btnContinuarLanc);

               Next;
            end;

         end;

      except

         on ev : EValidacao do begin
            if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;

      end;

      sTipoImovel := sTipoImovelAnt;
   end else sTipoImovel := qryRateioCODTIPIMOVEL.AsString;

   Result := True;
end;



function TfrmExecLancRateio.TotalizaRateio: double;
begin
   Screen.Cursor := crHourGlass;

   qryRateio.First;

   fTotalRateio := 0;
   while not qryRateio.EOF do begin
      fTotalRateio := fTotalRateio + Arredonda(qryRateioVALOR.AsFloat, 2);
      qryRateio.Next;
   end;

   Application.ProcessMessages;

   qryRateio.First;

   edtTotalLanc.Value   := Arredonda(fTotalRateio, 2);
   Result               := Arredonda(fTotalRateio, 2);

   Screen.Cursor := crDefault;
end;



procedure TfrmExecLancRateio.AbreTipoAlterador;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin

      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);

      ParamByName('PCODTIPIMOVEL').AsString     := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := 'P';

      case rdgAcreDesc.ItemIndex of
         0: ParamByName('PACRESDECRES').AsString   := 'C'; // Acréscimo
         1: ParamByName('PACRESDECRES').AsString   := 'D'; // Desconto
      end;

      Open;
   end;
end;



function TfrmExecLancRateio.CalculaRateio: boolean;
var
   fValorRateado  : extended;
   fTotalRateado  : extended;
   sMensagem      : string;
   iContador      : integer;
begin
   Result := True;

   ParametrosSistema;

   with qryRateio do begin

     Close;

// Daniel - 24085 - Início -----------------------------------------------------
      // Não obriga contrato...
     if not (ModuloImobiliario.AdminImob.bFlgObrigaContrato) then begin
       SQL.Text := 'SELECT substr(DECODE(I.IDIMOVELPAI,NULL,IM.IMONOME||'' - ''||I.IMONOME, '                +#13+ //Everson TIBERO (Add substr)
                   '       DECODE(I.IMONOME,NULL,IM.IMONOME||'' - ''||IP.IMONOME, '                          +#13+
                   '              IM.IMONOME||'' - ''||IP.IMONOME||'' - ''||I.IMONOME)), 0, 255) AS IMOVEL_EXTENSO, ' +#13+   //Everson TIBERO (Add substr)
                   '       I.IMOCODIGO, I.CODTIPIMOVEL, GXI.IDIMOVEL, GXI.GXIPERCENTRATEIO, '                +#13+
                   '       '''+StringOfChar(' ',20)+''' AS CONNUMERO, '                                      +#13+
                   '       '''+StringOfChar(' ',60)+''' AS CONNOME, '                                        +#13+
                   '   0 AS VALOR, 0 AS IDCONTRATOIMOVEL, 100 AS PERCENT_RATEIO '                            +#13+
                   'FROM GRUPOXIMOVEL GXI, IMOVEL I, IMOVEL IP, IMOVEL IM '                                  +#13+
                   'WHERE ( I.IDPESSOA        = '+IntToStr(Sistema.IdEmpresa)+' ) '                          +#13+
                   '  AND ( GXI.IDGRUPORATEIO = '+DBcboGrupo.LookupValue+' ) '                               +#13+
                   '  AND ( I.IDIMOVELMESTRE  = IM.IDIMOVEL ) '                                              +#13+
                   '  AND ( I.IDIMOVELPAI     = IP.IDIMOVEL(+) ) '                                           +#13+
                   '  AND ( GXI.IDIMOVEL      = I.IDIMOVEL) '                                                +#13+
                   'ORDER BY GXI.GXIPERCENTRATEIO ';

     end else begin
       // Obriga contrato...
       // Gerar apenas para contratos vigentes ?
       SQL.Text := 'SELECT substr(DECODE(I.IDIMOVELPAI,NULL,IM.IMONOME||'' - ''||I.IMONOME, '                       +#13+  //Everson TIBERO (Add substr)
                   '       DECODE(I.IMONOME,NULL,IM.IMONOME||'' - ''||IP.IMONOME, '                                 +#13+
                   '              IM.IMONOME||'' - ''||IP.IMONOME||'' - ''||I.IMONOME)), 0, 255) AS IMOVEL_EXTENSO,'+#13+  //Everson TIBERO (Add substr)
                   '       I.IMOCODIGO, I.CODTIPIMOVEL, GXI.GXIPERCENTRATEIO, GXI.IDIMOVEL, C.CONNUMERO, '          +#13+
                   '       C.CONNOME, 0 AS VALOR, C.IDCONTRATOIMOVEL, '                                             +#13+
                   '       DECODE(CXI.FLGRATEIO,NULL,100, '                                                         +#13+
                   '       DECODE(CXI.FLGRATEIO,0,100, '                                                            +#13+
                   '       DECODE(CXI.CIMPERCENTRATEIO,NULL,0,CXI.CIMPERCENTRATEIO))) AS PERCENT_RATEIO '           +#13+
                   'FROM GRUPOXIMOVEL GXI, IMOVEL I, IMOVEL IP, IMOVEL IM, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL C '  +#13+
                   'WHERE ( I.IDPESSOA           = '+IntToStr(Sistema.IdEmpresa)+' ) '                              +#13+
                   '  AND ( GXI.IDGRUPORATEIO    = '+DBcboGrupo.LookupValue+' ) '                                   +#13+
                   '  AND ( GXI.IDIMOVEL         = I.IDIMOVEL ) '                                                   +#13+
                   '  AND ( I.IDIMOVELMESTRE     = IM.IDIMOVEL ) '                                                  +#13+
                   '  AND ( I.IDIMOVELPAI        = IP.IDIMOVEL(+) ) '                                               +#13+
                   '  AND ( I.IDIMOVEL           = CXI.IDIMOVEL(+) ) '                                              +#13+
                   '  AND ( CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '                                        +#13+
                   '  AND ( ( C.CONDATAFIM >= TO_DATE('''+FormatDateTime('dd/mm/yyyy',Date)+''',''DD/MM/YYYY'') ) ' +#13+
                   '     OR ( C.FLGINDETERMINADO = ''S'' ) ) '                                                      +#13+
                   'ORDER BY GXI.GXIPERCENTRATEIO ';
     end;
// Daniel - 24085 - Fim --------------------------------------------------------

      Open;
   end;

   if not(qryRateio.isEmpty) then begin

      fTotalRateado := Arredonda(edtVlrTotal.Value, 2);

      qryRateio.First;
      iContador := 1;

      while not(qryRateio.EOF) do begin

         fValorRateado := Arredonda(edtVlrTotal.Value * qryRateioGXIPERCENTRATEIO.AsFloat / 100, 2);

   //      Rateio do Rateio = se o imóvel possuir mais de um contrato então o
   //      rateio deve ser rateado novamente pelo campo CONTRATOxIMOVEL.CimPercentRateio.
   //      So que neste caso o usuário pode não ter cadastrado um rateio de contrato
   //      com 100% gerando talvez uma inconsistência no último lançamento

         fValorRateado := Arredonda(fValorRateado * qryRateioPERCENT_RATEIO.AsFloat / 100, 2);

         qryRateio.Edit;

         // se for o ultimo registro da query colocar o valor restante nela
         if iContador = qryRateio.RecordCount then begin
            qryRateioVALOR.AsFloat := fTotalRateado;
         end else begin
            qryRateioVALOR.AsFloat := fValorRateado;
         end;

         qryRateio.Post;
         qryRateio.Next;

         fTotalRateado := fTotalRateado - fValorRateado;
         inc(iContador);
      end;

   end;
end;



//--------------------------------------------------------------------------------------------------
// Retorno:  0 :  lançamentos gerados sem ocorrências
//          -1 :  lançamentos gerados mas houve ocorrências
//          -2 :  erro fatal: lançamentos NÃO gerados
//--------------------------------------------------------------------------------------------------
function TfrmExecLancRateio.GeraLancamentos: shortint;
var
   fPercentRateio, fSobraRateio  : double;
   fCount, fAtual                : double;
   sErro, sTextoProgresso        : string;

begin
   Result := 0;

   fCount := qryRateio.RecordCount;

   sTextoProgresso := 'Gerando Lançamentos...';
   if chkRefazRateio.Checked then sTextoProgresso := 'Gerando Lançamentos e Recalculando Percentuais de Rateio...';

   // ProgressBar
   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, sTextoProgresso);

   try
      fSobraRateio   := edtTotalLanc.Value;

      // insere a Observação na tabela ObsLancImovel
      if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

      fAtual := 0;
      qryRateio.First;
      while ( (Result > -2) and not(qryRateio.EOF) ) do begin

         // ProgressBar
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fCount);

         // verifica se o Contrato está indicado (se for necessário)
         ParametrosSistema;
         if ModuloImobiliario.AdminImob.bFlgObrigaContrato then begin
            if qryRateioIDCONTRATOIMOVEL.isNULL then begin

               // Registro de ocorrência (é ERRO) por falta de contrato
               sErro := '- Contrato NÃO Informado --> ' + qryRateioIMOVEL_EXTENSO.AsString;
               memErro.Lines.Add(sErro + ';' + #13);

               Result := -2;

            end;
         end;

         if Result > -2 then begin

            // Se o resultado for ZERO, não gerar lançamento
            // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
            if qryRateioVALOR.AsFloat <> 0 then begin

               if GravaLancamento(iDocumento) then begin

                  // se for para recalcular o rateio...
                  if chkRefazRateio.Checked then begin

                     if fAtual = fCount then begin
                        fPercentRateio := fSobraRateio;
                        fSobraRateio   := 0;
                     end else begin
                        fPercentRateio := Arredonda(qryRateioVALOR.asFloat / edtTotalLanc.Value * 100, 4);
                        fSobraRateio   := fSobraRateio - fPercentRateio;
                     end;

                     GravaRateio(fPercentRateio);
                  end;

               end;

            end else begin

               // Registro de ocorrência (NÃO ERRO) por valor fZERO
               sErro := '- Valor ZERO --> ' + qryRateioIMOVEL_EXTENSO.AsString;
               if not(qryRateioIDCONTRATOIMOVEL.isNULL) then sErro := sErro + ', ' + qryRateio_CONTRATOEXTENSO.asString;
               memErro.Lines.Add(sErro + ';' + #13);

               Result := -1;

            end;

         end;

         qryRateio.Next;
         fAtual := fAtual + 1;
      end;

      EscondeProgresso(ProgressBar, lblProgress, lblContador);

   except
      Result := -2;

      Raise;
      Repaint;

      MsgDlg('Houve ERRO na tentativa de Lançamento! Os Lançamentos não foram gerados.', 'Erro', mtError, [mbOk], 0);
      Repaint;
   end;
end;



function TfrmExecLancRateio.GravaLancamento(iDocumento: integer): boolean;
begin
   Result := True;

   try
      with dtmLancImovel.qryInsertLancImovel do begin
         LimpaParametros(dtmLancImovel.qryInsertLancImovel);

         ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');

         if dbCboContaBancaria.Value <> '' then
            ParamByName('PIDCBANCARIA').AsInteger    := StrToInt(dbCboContaBancaria.LookupValue);

         ParamByName('PRECPAG').AsString             := 'P';

         ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
         ParamByName('PIDFORCLI').AsInteger          := molFornecedor1.iFornecedor;

         ParamByName('PIDIMOVEL').AsInteger          := qryRateioIDIMOVEL.AsInteger;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

         // Contrato pode ser preenchido ou não
         if ( not(qryRateioIDCONTRATOIMOVEL.isNULL) and (qryRateioIDCONTRATOIMOVEL.AsInteger > 0) ) then
         ParamByName('PIDCONTRATOIMOVEL').AsInteger   := qryRateioIDCONTRATOIMOVEL.AsInteger;

         ParamByName('PDATALANCAMENTO').AsDateTime    := edtDataLanc.Date;
         ParamByName('PDATAVENCIMENTO').AsDateTime    := edtDataVenc.Date;

         ParamByName('PVLRLANCOMPAGAR').AsFloat       := qryRateioVALOR.AsFloat;
         ParamByName('PVLRLANCPAGAR').AsFloat         := qryRateioVALOR.AsFloat;
         ParamByName('PMESREFERENCIA').AsInteger      := DiasInUteis.ExtraiMes(edtDataVenc.Date);
         ParamByName('PANOREFERENCIA').AsInteger      := DiasInUteis.ExtraiAno(edtDataVenc.Date);
         ParamByName('PMESCOMPETENCIA').AsInteger     := cboMes.ItemIndex + 1;
         ParamByName('PANOCOMPETENCIA').AsInteger     := word(trunc(DBspnAno.Value));
         ParamByName('PMOEDAPAGAR').AsInteger         := Modulo.iMoedaCorrente;
         ParamByName('PFLGINTEGRADO').AsInteger       := 0;   // lançamento não integrado.
         ParamByName('PIDUSUARIOSISTEMA').AsInteger   := Sistema.IdUsuario;
         ParamByName('PFLGORIGEMLANC').AsString       := 'T'; // T = Lançamentos de Rateio
         ParamByName('PNODOCUMENTO').AsFloat          := StrToFloat(edtNumDocumento.Text);
         ParamByName('PIDDocumento').AsInteger        := iDocumento;

         // campos novos (André Pontes)
         ParamByName('PCODFORMA').AsInteger           := StrToInt(DBcboFormaRecPag.LookupValue);
         ParamByName('PREFERENCIAAP').AsString        := edtReferenciaAP.Text;
         ParamByName('PCODCENTROCUSTO').AsString      := DBcboCentroCusto.LookupValue;
         ParamByName('PIDMODULO').AsInteger           := Sistema.IdModulo;

         // Daniel - 24781
         ParamByName('PCODTIPIMOVEL').AsString        := qryRateioCODTIPIMOVEL.AsString;

         ExecSQL;
      end;

   except
      Result := False;
   end;
end;



function TfrmExecLancRateio.GravaRateio(fPercentRateio: double): boolean;
begin
   Result := True;

   try
      with qryUpdateRateio do begin
         LimpaParametros(qryUpdateRateio);

         ParamByName('PIDGRUPORATEIO').AsInteger   := StrToInt(DBcboGrupo.LookupValue);
         ParamByName('PIDIMOVEL').AsInteger        := qryRateioIDIMOVEL.AsInteger;
         ParamByName('PGXIPERCENTRATEIO').AsFloat  := fPercentRateio;

         ExecSQL;
      end;

   except
      Result := False;
   end;
end;



procedure TfrmExecLancRateio.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   // Abre a query de rateio imovel
   if VerificaPreenchimento then begin

      try
         DesabilitaBotoes;

         if CalculaRateio then begin

            ntbPrincipal.PageIndex := 1;
            Repaint;

         end;

      finally
         HabilitaBotoes;
      end;

   end;
end;



procedure TfrmExecLancRateio.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmExecLancRateio.btnConfirmaClick(Sender: TObject);
begin
   inherited;

   // Checar se rateio é igual ao valor digitado
   if VerificaTotal then begin

      StartTransacao;

      iResult := GeraLancamentos;
      if iResult > -2 then begin

         CommitTransacao;

         if ( (iResult = 0) and (length(trim(memErro.Text)) = 0) ) then begin

            // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
            // na contabilidade e no contas a pagar
            iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

            // preenche o número do documento = id.doc. 18/07/2001
            edtNumDocumento.Text := FormatFloat('#0', iDocumento);

            qryRateio.Close;
            ntbPrincipal.PageIndex := 0;

            Screen.Cursor := crDefault;
            MsgDlg('Lançamento concluído.', 'Informação', mtInformation, [mbOK], 0);
            Repaint;

         end else begin

         end;

      end else begin
         RollBackTransacao;
      end;

   end;
end;



procedure TfrmExecLancRateio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( (qryRateio.Active) and (qryRateio.UpdatesPending) ) then qryRateio.CancelUpdates;
   FechaTabelas;
   FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
   inherited;
end;



procedure TfrmExecLancRateio.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex := 0;
   Repaint;

   AbreTabelas;

   // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a pagar
   iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);

   // preenche o número do documento
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);

   // competência default
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date)-1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
end;



procedure TfrmExecLancRateio.DBgrdLancRateioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

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



procedure TfrmExecLancRateio.DBgrdLancRateioTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancRateio.DBgrdLancRateioEnter(Sender: TObject);
begin
   inherited;
   if (qryRateio.Active) and (not(qryRateio.isEmpty)) and (qryRateio.State = dsBrowse) then qryRateio.Edit;
end;



procedure TfrmExecLancRateio.DBgrdLancRateioExit(Sender: TObject);
begin
   inherited;
   if (qryRateio.Active) and (not(qryRateio.isEmpty)) and (qryRateio.State = dsEdit) then qryRateio.Post;
end;



procedure TfrmExecLancRateio.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   FazerRefresh;
end;



procedure TfrmExecLancRateio.edtVlrTotalExit(Sender: TObject);
begin
   inherited;
   edtTotalInformado.Value := Arredonda(edtVlrTotal.Value, 2);
end;



procedure TfrmExecLancRateio.cboMesChange(Sender: TObject);
begin
   inherited;
   edtDataLanc.Date := FuncoesImob.DataLancamento((cboMes.ItemIndex + 1), word(trunc(DBspnAno.Value)), edtDataVenc.Date);
end;



procedure TfrmExecLancRateio.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;

   case ntbPrincipal.PageIndex of
      0: lblTitulo.Caption := 'Lançamento com Rateio [Seleção]';
      1: lblTitulo.Caption := 'Lançamento com Rateio [Lançamentos]';
      2: lblTitulo.Caption := 'Lançamento com Rateio [Alteradores]';
   else
         lblTitulo.Caption := 'Lançamento com Rateio';
   end;
end;



procedure TfrmExecLancRateio.qryRateio_CONTRATOEXTENSOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   inherited;

   if qryRateioCONNUMERO.isNULL then begin
      Text := qryRateioCONNOME.AsString;
   end else begin
      Text := qryRateioCONNUMERO.AsString + ' - ' + qryRateioCONNOME.AsString;
   end;
end;



procedure TfrmExecLancRateio.DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

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



procedure TfrmExecLancRateio.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
   inherited;

   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancRateio.btnTotalizaClick(Sender: TObject);
begin
   inherited;
   TotalizaRateio;
end;



procedure TfrmExecLancRateio.btnContinuarLancClick(Sender: TObject);
begin
   inherited;

   if VerificaTipoImoveisLanc then begin

      AbreTipoAlterador;

      with qryAlterador do begin
         LimpaParametros(qryAlterador);
         ParamByName('PIDDOCUMEnTO').asInteger := iDocumento;
         Open;
      end;

   end;
end;



procedure TfrmExecLancRateio.FormCreate(Sender: TObject);
begin
   inherited;
   molFornecedor1.iFornecedor := -1;

   ParametrosSistema;
   if dtmImobiliario.qryParamImobFLGHISTCONTDIFAP.AsInteger = 1 then
      memObs.MaxLength := 1000    // histórico contábil (concatenado) <> obs ap
   else
      memObs.MaxLength := 200;    // histórico contábil = obs ap
   // Helen - SOL: 172902 KTN: 1577381
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;

procedure TfrmExecLancRateio.VerificaContaBancaria;
begin
   if (molFornecedor1.iFornecedor <> -1) and (DBcboFormaRecPag.LookupValue <> '') and (dtmLookImobiliario.qryLookFormaRecPagFLGDADOSBANCARIOS.AsString = 'S') then begin

      lblContaBancaria.Enabled := true;
      dbCboContaBancaria.Enabled := true;

      LimpaParametros(dtmLookImobiliario.qryLookContaBancaria);
      dtmLookImobiliario.qryLookContaBancaria.ParamByName('PIDPESSOA').AsInteger := molFornecedor1.iFornecedor;
      dtmLookImobiliario.qryLookContaBancaria.Open;
      if dtmLookImobiliario.qryLookContaBancaria.RecordCount > 1 then begin
         dtmLookImobiliario.qryLookContaBancaria.First;
         while not dtmLookImobiliario.qryLookContaBancaria.Eof do begin
            if dtmLookImobiliario.qryLookContaBancariaFLGCONTAPREF.AsInteger = 1 then begin
               dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
               exit;
            end;
            dtmLookImobiliario.qryLookContaBancaria.Next;
         end;
      end else if dtmLookImobiliario.qryLookContaBancaria.RecordCount = 1 then begin
         dbCboContaBancaria.LookupValue := inttostr(dtmLookImobiliario.qryLookContaBancariaIDCBANCARIA.AsInteger);
      end;
   end else begin
      lblContaBancaria.Enabled := false;
      dbCboContaBancaria.Enabled := false;
      dtmLookImobiliario.qryLookContaBancaria.Close;
      dbCboContaBancaria.LookupValue := '';
   end;
end;


procedure TfrmExecLancRateio.molFornecedor1btnBuscaFornClick(
  Sender: TObject);
begin
  inherited;
  molFornecedor1.btnBuscaFornClick(Sender);
  VerificaContaBancaria;
end;

procedure TfrmExecLancRateio.DBcboFormaRecPagExit(Sender: TObject);
begin
  inherited;
  VerificaContaBancaria;
end;

end.
