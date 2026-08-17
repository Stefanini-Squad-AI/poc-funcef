//******************************************************************************
//Atender.........: WO18060
//Data............: 11/04/2025
//Responsável.....: Luis Ferrari
//Descrição.......: Ajuste no order by da query qryCCConsolidado do relatorio.
//******************************************************************************
//N. SIG..........: 82382
//Data............: 25/02/2019
//Responsável.....: Taffarel Sevaybriker
//Descrição.......: Ajuste no relatório para ordernar pela competência.
//******************************************************************************
//Nº SOL: 260971/17874
//Nº KINTANA/PPM 1140219/1104944
//Data da Alteração: 03/11/2015
//Alteração Form: Inclusão de três linhas OrderBy
//Responsável: Michelle Suellyn Mota
//Descrição:Ordenação dos Lançamentos do Contrato
//1º.Número do documento; 2º.Competência; 3º.Data.
//******************************************************************************

unit CRelCCConsolidado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, wwdblook, ExtCtrls, StdCtrls, Mask, wwdbedit, 
  MontaSelect, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcCombo, fcColorCombo, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario;
type
  TcfgRelCCConsolidado = class(TcfgRel)
    Label1: TLabel;
    Label4: TLabel;
    btnBuscaContrato: TBitBtn;
    chkEmAberto: TCheckBox;
    edtConNome: TEdit;
    edtConNumero: TEdit;
    btnLimpaContrato: TBitBtn;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    chkVigente: TCheckBox;
    rdgLancamentos: TRadioGroup;
    rdgValores: TRadioGroup;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label3: TLabel;
    edtAdminImovel: TEdit;
    btnBuscaAdm: TBitBtn;
    Label6: TLabel;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    btnLimpaAdminImovel: TBitBtn;
    Label2: TLabel;
    rdgTipoData: TRadioGroup;
    chkCompetencia: TCheckBox;
    Bevel1: TBevel;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label8: TLabel;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;


    // procedimentos definidos
    function VerificaPreenchimento: boolean;

    procedure FiltraContrato;
    procedure MontaQuery; override;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure btnBuscaAdmClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure rdgValoresExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);


  private { Private declarations }
   sContrato      : string;
   iAdminImovel   : integer;
   iImovelMestre  : integer;

  public { Public declarations }

  end;


var
  cfgRelCCConsolidado: TcfgRelCCConsolidado;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, uFuncoesImob, DMS;



function TcfgRelCCConsolidado.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if ( ((length(trim(edtDataIni.Text)) = 0) or (length(trim(edtDataFim.Text)) = 0)) and
         ((cboMesCompetencia.ItemIndex = -1) or (DBspnAnoCompetencia.Value = 0)) ) then
         raise EValidacao.CreateVal('É necessário indicar o Período ou o Mês de Competência!', edtDataIni);

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
end;



procedure TcfgRelCCConsolidado.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
           ppLogoCCContrato.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else ppLogoCCContrato.Picture := nil;

      rptCCConsolidado_lblDatas.Caption := '';
      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptCCConsolidado_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);

         case rdgTipoData.ItemIndex of
            0: rptCCConsolidado_lblDatas.Caption := rptCCConsolidado_lblDatas.Caption + ' (datas de baixa)';
            1: rptCCConsolidado_lblDatas.Caption := rptCCConsolidado_lblDatas.Caption + ' (datas de inclusão)';
            2: rptCCConsolidado_lblDatas.Caption := rptCCConsolidado_lblDatas.Caption + ' (datas de lançamento)';
            3: rptCCConsolidado_lblDatas.Caption := rptCCConsolidado_lblDatas.Caption + ' (datas de vencimento)';
         end;

      end;

      rptCCConsolidado_lblCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
      rptCCConsolidado_lblCompetencia.Visible := not(chkCompetencia.Checked);

      if DBcboTipoImovel.LookupValue <> '' then begin
         rptCCConsolidado_lblTipoImovel.Caption := DBcboTipoImovel.Text;
      end else begin
         rptCCConsolidado_lblTipoImovel.Caption := 'Todos os Tipos de Imóvel / Segmentos';
      end;

      if edtAdminImovel.Text <> '' then begin
         rptCCConsolidado_lblAdministradora.Caption := edtAdminImovel.Text;
      end else begin
         rptCCConsolidado_lblAdministradora.Caption := '< Todas >';
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptCCConsolidado_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptCCConsolidado_lblTipoRecDes.Caption := '< Todos >';
      end;

      case rdgLancamentos.ItemIndex of
         0: rptCCConsolidado_lblRecPag.Caption        := '';
         1: rptCCConsolidado_lblRecPag.Caption        := 'Apenas lançamentos a Pagar';
         2: rptCCConsolidado_lblRecPag.Caption        := 'Apenas lançamentos a Receber';
      else
         rptCCConsolidado_lblRecPag.Caption           := '';
      end;

      case rdgValores.ItemIndex of
         0: rptCCConsolidado_lblPrevEfetivo.Caption   := '';
         1: rptCCConsolidado_lblPrevEfetivo.Caption   := 'Apenas valores Previstos';
         2: rptCCConsolidado_lblPrevEfetivo.Caption   := 'Apenas valores Efetivos';
      else
         rptCCConsolidado_lblPrevEfetivo.Caption      := '';
      end;

      rptCCConsolidado_lblContratosVigentes.Visible   := chkVigente.Checked;
      rptCCConsolidado_lblEmAberto.Visible            := chkEmAberto.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraContrato;
end;



procedure TcfgRelCCConsolidado.FiltraContrato;
begin
   with dtmRelAdminImobCC.qryCCConsolidado do begin

      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, ' + #13 +

      '   P.NOME AS LOCATARIO, ' + #13 +

      '   I.IDIMOVELMESTRE, I.CODTIPIMOVEL,       ' + #13 +
      '   IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '   TI.DESCTIPOIMOVEL,                                  ' + #13 +

      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +

      '   T.DESCCUSTORECIMO, TA.DESCRICAO, ' + #13 +

      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,        ' + #13 +
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, ' + #13 +

      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,         ' + #13 +
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, ' + #13 +

// Daniel Simões - P: 19142 - 16/05/2006
      '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.DATALANCTO, RP.DATABAIXA) ) AS DATA, ' + #13 +

      '   SUM( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS TOT_RECEBER, ' + #13 +

      '   SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS TOT_RECEBIDO, ' + #13 +

      '   SUM( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS TOT_PAGAR, ' + #13 +

      '   SUM(DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)) AS TOT_PAGO, ' + #13 +

      '   SUM( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS SALDO_RECEB, ' + #13 +

      '   SUM( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS SALDO_PAGAR ' + #13 +

      'FROM ' + #13 +
      '   PESSOA P, PESSOA PFC, ' + #13 +
      '   DOCUMENTO D, LANCTODOCUM LD, ' + #13 +

      '  ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '    FROM LANCTODOCUM ' + #13 +
      '    WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'' OR RTRIM(OPERACAO) = ''12'') TRD, ' + #13 +

      '   RECBTOPAGTO RP, TIPOALTERADOR TA, ' + #13 +
      '   CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, ' + #13 +
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI, ' + #13 +
      '   TIPOIMOVEL TI  ' + #13;

      SQL.Text := SQL.Text +
      'WHERE ' + #13;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         case rdgTipoData.ItemIndex of
            0: SQL.Text := SQL.Text + '   ( RP.DATABAIXA BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            1: SQL.Text := SQL.Text + '   ( LI.TRGDTINCLUSAO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            2: SQL.Text := SQL.Text + '   ( LI.DATALANCAMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            3: SQL.Text := SQL.Text + '   ( LI.DATAVENCIMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
         end;
      end;

      if not(chkCompetencia.Checked) then begin
      SQL.Text := SQL.Text +
      '   ( LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ' AND LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ' ) AND ';
      end;

      // Filtro contrato
      if sContrato <> '' then
      SQL.Text := SQL.Text + #13 +
      '   ( C.IDCONTRATOIMOVEL = ' + sContrato + ' ) AND ' + #13;

      // Filtro Administradora (do Contrato)
      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

      // Filtro Tipo de Imóvel (Segmento)
      if DBcboTipoImovel.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( I.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) AND ' + #13;

      // Filtro Tipo de Receita ou Despesa
      if DBcboTipoRecDes.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( LI.IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) AND ' + #13;

      // Filtro Lançamentos
      Case rdgLancamentos.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( D.RECPAG = ''P'' ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( D.RECPAG = ''R'' ) AND ' + #13;
      end;

      // Filtro Valores
      Case rdgValores.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( (RTRIM(LD.OPERACAO) = ''1'') OR (RTRIM(LD.OPERACAO) = ''2'') OR (RTRIM(LD.OPERACAO) = ''4'') ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( RTRIM(LD.OPERACAO) = ''5'' ) AND ' + #13;
      end;

      // Filtro Apresentar apenas lançamentos referentes a Contratos atualmente vigentes
      if chkVigente.Checked then
      SQL.Text := SQL.Text +
      '   ( ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
      '   ( C.FLGINDETERMINADO = ''S'' ) ) AND ' + #13;

      // Filtro Apresentar apenas lançamentos em aberto
      if chkEmAberto.Checked then
      SQL.Text := SQL.Text +
      '   ( (D.STATUS <> ''2'') OR (D.STATUS IS NULL) ) AND ';

      SQL.Text := SQL.Text +
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL )                 ' + #13 +
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )                   ' + #13 +
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )   ' + #13 +
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )           ' + #13 +
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )           ' + #13 +
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) )       ' + #13 +
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )          ' + #13 +
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) )             ' + #13 +
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )       ' + #13 +
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
      '   AND ( C.IDLOCATARIO = P.IDPESSOA )                 ' + #13 +
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) )               ' + #13 +
      '   AND ( TI.CODTIPIMOVEL = I.CODTIPIMOVEL (+) )       ' + #13;

      // Filtro Imóvel Mestre
      if edtImovelMestre.Text <> '' then
      SQL.Text := SQL.Text +
      '   AND ( C.IDCONTRATOIMOVEL IN (                             ' + #13 +
      '   SELECT DISTINCT                                           ' + #13 +
      '      CX.IDCONTRATOIMOVEL                                    ' + #13 +
      '   FROM                                                      ' + #13 +
      '      IMOVEL I, CONTRATOXIMOVEL CX                           ' + #13 +
      '   WHERE                                                     ' + #13 +
      '      ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) ' + #13 +
      '      AND ( CX.IDIMOVEL = I.IDIMOVEL )                       ' + #13 +
      '   ) )                                                       ' + #13;

      SQL.Text := SQL.Text +
      'GROUP BY                                      ' + #13 +
      '  C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, ' + #13 +
      '  P.NOME,                                     ' + #13 +
      '  I.CODTIPIMOVEL,                             ' + #13 +
      '  IM.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME,  ' + #13 +
      '  TI.DESCTIPOIMOVEL,                          ' + #13 +
      '  LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +
      '  T.DESCCUSTORECIMO, TA.DESCRICAO,                                            ' + #13 +
      '  D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,                               ' + #13 +
      '  PFC.NOME, PFC.RAZAOSOCIAL,                                                  ' + #13 +
      '  LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,                              ' + #13 +
      '  LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,                      ' + #13 +
      '  DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.DATALANCTO, RP.DATABAIXA) ) ' + #13;

      SQL.Text := SQL.Text +
      // Inicio WO18060 Ferrari
      'ORDER BY           ' + #13 +
      'C.CONNUMERO, C.CONNOME,  ' + #13 +
      'LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA,  ' + #13 +
      'DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO,  ' + #13 +
      'DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)),  ' + #13 +
      'IM.IMONOME,  ' + #13 +
      'RTRIM(LD.OPERACAO),  ' + #13 +
      'T.DESCCUSTORECIMO   ' + #13;
{   retirado para substituir por novo order by enviado pela Barbara WO18060 Ferrari
      '  I.CODTIPIMOVEL,  ' + #13 +
      '  IM.IMONOME,      ' + #13 +
      '  C.CONNOME,       ' + #13 +
     // Início - Michelle Mota - SOL: 260971/17874 - PPM: 1140219/1104944
      '  P.NOME,          ' + #13 +
      '  LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13 + //Taffarel - SIG82302
      '  coddocumento,    ' + #13 +
      //'  LI.MESCOMPETENCIA||''/''||LI.ANOCOMPETENCIA,       ' + #13 +
      '  data ' + #13;
}
      // Fim WO18060 Ferrari
     // Término - Michelle Mota - SOL: 260971/17874 - PPM: 1140219/1104944
//     SQL.SaveToFile(Sistema.TempDir + 'relatorio_20168.txt');   // WO18060 Ferrari
      Open;
   end;
end;



procedure TcfgRelCCConsolidado.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCCConsolidado.btnBuscaContratoClick(Sender: TObject);
begin
	inherited;

   dtmMS.MS_Contrato.Executar;
   // dtmMS.MS_Contrato.CamposChave
   //    [0] C.IDCONTRATOIMOVEL
   //    [1] C.CONNUMERO
   //    [2] C.CONNOME

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor     := crHourGlass;

      sContrato         := dtmMS.MS_Contrato.ValoresChave[0];
      edtConNumero.Text := dtmMS.MS_Contrato.ValoresChave[1];
      edtConNome.Text   := dtmMS.MS_Contrato.ValoresChave[2];

      Screen.Cursor     := crDefault;
   end;
end;



procedure TcfgRelCCConsolidado.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de lançamento e o ano de referência/competência
   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   iAdminImovel   := -1;
   iImovelMestre  := -1;
end;



procedure TcfgRelCCConsolidado.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   sContrato := '';

   edtConNumero.Clear;
   edtConNome.Clear;
end;



procedure TcfgRelCCConsolidado.btnBuscaAdmClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_AdminImovel.Executar;
   // dtmMS.MS_AdminImovel.CamposChave
   //    [0] A.IDADMINIMOVEL
   //    [1] P.NOME
   //    [2] P.RAZAOSOCIAL

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdm.SetFocus;
end;



procedure TcfgRelCCConsolidado.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelCCConsolidado.rdgValoresExit(Sender: TObject);
begin
   inherited;

   case rdgValores.ItemIndex of
      1: rdgTipoData.ItemIndex := 3;
      2: rdgTipoData.ItemIndex := 0;
   end;
end;



procedure TcfgRelCCConsolidado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;

   inherited;
end;



procedure TcfgRelCCConsolidado.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovelMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelCCConsolidado.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



end.
