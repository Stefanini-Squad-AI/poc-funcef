//******************************************************************************
//N. SIG..........: 82382
//Data............: 25/02/2019
//Responsável.....: Taffarel Sevaybriker
//Descrição.......: Ajuste no relatório para ordernar pela competência.
//******************************************************************************************

unit CRelCCPlanoPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, Mask, wwdbedit, wwdblook, Db, DBTables, Wwquery, fcCombo,
  fcColorCombo, MontaSelect, Wwdbspin, wwdbdatetimepicker, CMDateTimePicker,
  dRelAdminImobCC, uModuloImobiliario;

type
  TcfgRelCCPlanoPatro = class(TcfgRel)
    lblImovelouMestre: TLabel;
    chkEmAberto: TCheckBox;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    rdgLancamentos: TRadioGroup;
    rdgValores: TRadioGroup;
    Label3: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    Label6: TLabel;
    chkCompetencia: TCheckBox;
    rdgTipoData: TRadioGroup;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label8: TLabel;
    edtImovelouMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    DBcboPatrocinadora: TwwDBLookupCombo;
    DBcboPlanoPrev: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    chkLinhas: TCheckBox;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure rdgValoresExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);


  private { Private declarations }
    iAdminImovel  : integer;
    iImovelMestre : integer;
    iImovel       : integer;

    function VerificaPreenchimento: boolean;

    procedure FiltraImovel;

    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelCCPlanoPatro: TcfgRelCCPlanoPatro;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   uDiasInUteis, dLookImobiliario, uFuncoesImob, DMS;



function TcfgRelCCPlanoPatro.VerificaPreenchimento: boolean;
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



procedure TcfgRelCCPlanoPatro.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoCCPlanoPatro.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoCCPlanoPatro.Picture := nil;

      rptCCPlanoPatro_lblDatas.Visible := edtDataIni.Text <> '';

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptCCPlanoPatro_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);

         case rdgTipoData.ItemIndex of
            0: rptCCPlanoPatro_lblDatas.Caption := rptCCPlanoPatro_lblDatas.Caption + ' (datas de baixa)';
            1: rptCCPlanoPatro_lblDatas.Caption := rptCCPlanoPatro_lblDatas.Caption + ' (datas de inclusão)';
            2: rptCCPlanoPatro_lblDatas.Caption := rptCCPlanoPatro_lblDatas.Caption + ' (datas de lançamento)';
            3: rptCCPlanoPatro_lblDatas.Caption := rptCCPlanoPatro_lblDatas.Caption + ' (datas de vencimento)';
         end;

      end;

      rptCCPlanoPatro_lblCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
      rptCCPlanoPatro_lblCompetencia.Visible := not(chkCompetencia.Checked);

      if DBcboTipoImovel.LookupValue <> '' then begin
         rptCCContrato_lblTipoImovel.Caption := DBcboTipoImovel.Text;
      end else begin
         rptCCContrato_lblTipoImovel.Caption := 'Todos os Tipos de Imóvel / Segmentos';
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptCCPlanoPatro_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptCCPlanoPatro_lblTipoRecDes.Caption := '< Todos >';
      end;

      case rdgLancamentos.ItemIndex of
         0: rptCCPlanoPatro_lblRecPag.Caption       := '';
         1: rptCCPlanoPatro_lblRecPag.Caption       := 'Apenas lançamentos a Pagar';
         2: rptCCPlanoPatro_lblRecPag.Caption       := 'Apenas lançamentos a Receber';
      else
         rptCCPlanoPatro_lblRecPag.Caption          := '';
      end;

      case rdgValores.ItemIndex of
         0: rptCCPlanoPatro_lblPrevEfetivo.Caption  := '';
         1: rptCCPlanoPatro_lblPrevEfetivo.Caption  := 'Apenas valores Previstos';
         2: rptCCPlanoPatro_lblPrevEfetivo.Caption  := 'Apenas valores Efetivos';
      else
         rptCCPlanoPatro_lblPrevEfetivo.Caption     := '';
      end;

      rptCCPlanoPatro_lblEmAberto.Visible           := chkEmAberto.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraImovel;
end;



procedure TcfgRelCCPlanoPatro.FiltraImovel;
begin
   with dtmRelAdminImobCC.qryCCPlanoPatro do begin

      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   FT.NOME_PLANO, ' + #13 +
      '   FT.NOME_PATRO, ' + #13 +
      '   I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '   T.DESCCUSTORECIMO, ' + #13 +
      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +
      '   TA.DESCRICAO, ' + #13 +
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR, ' + #13 +
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO, ' + #13 +
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, ' + #13 +
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, ' + #13 +

// Daniel Simões - P: 19142 - 16/05/2006
      '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.DATALANCTO, RP.DATABAIXA) ) AS DATA, ' + #13 +

      '   SUM(( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) * NVL(FT.FATOR,1) ) AS TOT_RECEBER, ' + #13 +

      '   SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) * NVL(FT.FATOR,1))AS TOT_RECEBIDO, ' + #13 +

      '   SUM(( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) * NVL(FT.FATOR,1)) AS TOT_PAGAR, ' + #13 +

      '   SUM(DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) * NVL(FT.FATOR,1)) AS TOT_PAGO, ' + #13 +

      '   SUM(( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) * NVL(FT.FATOR,1)) AS SALDO_RECEB, ' + #13 +

      '   SUM(( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) * NVL(FT.FATOR,1)) AS SALDO_PAGAR ' + #13 +

      'FROM ' + #13 +
      '   PESSOA PFC, ' + #13 +
      '   DOCUMENTO D, LANCTODOCUM LD, ' + #13 +

      '  ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '    FROM LANCTODOCUM ' + #13 +
      '    WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'' OR RTRIM(OPERACAO) = ''12'') TRD, ' + #13 +

      '   RECBTOPAGTO RP, TIPOALTERADOR TA, '                                  + #13 +
      '   IMOVEL I, IMOVEL IM, '                                               + #13 +
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI, '                          + #13 +

      '   (SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV,'                    + #13 +
      '       PE.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,'                   + #13 +
      '       PI.FLGTIPO, PI.PPIPERCENTRATEIO, TT.TOTAL,'                      + #13 +
      '       ROUND(DECODE(PI.FLGTIPO,''P'',(PI.PPIPERCENTRATEIO / 100),'      + #13 +
      '                               ''C'',(PI.PPIPERCENTRATEIO / TT.TOTAL),' + #13 +
      '                               1), 4) AS FATOR'                         + #13 +
      '      FROM PLANOPATROXIMOVEL PI, PESSOA PE, PLANPREVCONTABIL PL,'       + #13 +
      '          (SELECT IDIMOVEL,'                                            + #13 +
      '                  SUM(PPIPERCENTRATEIO) AS TOTAL'                       + #13 +
      '             FROM PLANOPATROXIMOVEL'                                    + #13 +
      '             GROUP BY IDIMOVEL) TT'                                     + #13 +
      '     WHERE PI.IDIMOVEL    = TT.IDIMOVEL'                                + #13 +
      '       AND PI.IDPATRO     = PE.IDPESSOA'                                + #13 +
      '       AND PI.IDPLANOPREV = PL.IDPLANOPREV ) FT'                        + #13 +


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

      if iImovelMestre > 0 then
      SQL.Text := SQL.Text + #13 +
      '   ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) AND ' + #13;

      if iImovel > 0 then
      SQL.Text := SQL.Text +
      '   ( I.IDIMOVEL = ' + IntToStr(iImovel) + ' ) AND ' + #13;

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( I.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

      if DBcboTipoImovel.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( I.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) AND ' + #13;

      if DBcboTipoRecDes.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( LI.IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) AND ' + #13;

      if DBcboPlanoPrev.LookupValue <> '' then
      SQL.Text := SQL.Text + #13 +
      '   ( FT.IDPLANOPREV = ' + DBcboPlanoPrev.LookupValue + ') AND ' + #13;

      if DBcboPatrocinadora.LookupValue <> '' then
      SQL.Text := SQL.Text + #13 +
      '   ( FT.IDPATRO = ' + DBcboPatrocinadora.LookupValue + ') AND ' + #13;

      Case rdgLancamentos.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( D.RECPAG = ''P'' ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( D.RECPAG = ''R'' ) AND ' + #13;
      end;

      Case rdgValores.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( (RTRIM(LD.OPERACAO) = ''1'') OR (RTRIM(LD.OPERACAO) = ''2'') OR (RTRIM(LD.OPERACAO) = ''4'') ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( RTRIM(LD.OPERACAO) = ''5'' ) AND ' + #13;
      end;

      if chkEmAberto.Checked then
      SQL.Text := SQL.Text + #13 +
      '   ( (D.STATUS <> ''2'') OR (D.STATUS IS NULL) ) AND ';

      SQL.Text := SQL.Text +
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) ) ' + #13 +
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) ) ' + #13 +
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) ) ' + #13 +
      '   AND ( I.IDIMOVEL = FT.IDIMOVEL(+) ) ' + #13 +

      ' GROUP BY ' + #13 +
      '   FT.NOME_PLANO, ' + #13 +
      '   FT.NOME_PATRO, ' + #13 +
      '   I.IDIMOVELMESTRE, IM.IMONOME, ' + #13 +
      '   T.DESCCUSTORECIMO, ' + #13 +
      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +
      '   TA.DESCRICAO, ' + #13 +
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR, ' + #13 +
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO, ' + #13 +
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, ' + #13 +
      '   PFC.NOME, PFC.RAZAOSOCIAL, ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.DATALANCTO, RP.DATABAIXA) ) ' + #13 +

      'ORDER BY ' + #13 +
      '   FT.NOME_PATRO,' + #13 +
      '   FT.NOME_PLANO,' + #13 +
      '   NOME_MESTRE,  ' + #13 +
      '   NF_FORCLI,    ' + #13 +
      '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13 + //Taffarel - SIG82302
      '   NODOCUMENTO,  ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO) ';

      Open;
   end;
end;



procedure TcfgRelCCPlanoPatro.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCCPlanoPatro.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   // Marcio Motta - 03/06/2004 - 16860
   LimpaParametros(dtmLookImobiliario.qryLookPatrocinadora);
   dtmLookImobiliario.qryLookPatrocinadora.ParamByName('pIdEmpresa').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookPatrocinadora.Open;
   // Marcio Motta - 03/06/2004 - 16860
   LimpaParametros(dtmLookImobiliario.qryLookPlanoPrev);
   dtmLookImobiliario.qryLookPlanoPrev.Open;

   iAdminImovel  := -1;
   iImovelMestre := -1;
   iImovel       := -1;
end;



procedure TcfgRelCCPlanoPatro.btnBuscaAdminImovelClick(Sender: TObject);
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

   btnBuscaAdminImovel.SetFocus;
end;



procedure TcfgRelCCPlanoPatro.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelCCPlanoPatro.rdgValoresExit(Sender: TObject);
begin
   inherited;

   case rdgValores.ItemIndex of
      1: rdgTipoData.ItemIndex := 3;
      2: rdgTipoData.ItemIndex := 0;
   end;
end;



procedure TcfgRelCCPlanoPatro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;

   inherited;
end;



procedure TcfgRelCCPlanoPatro.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   lblImovelouMestre.Caption  := 'Imóvel Mestre e/ou Imóvel';

   iImovelMestre  := -1;
   iImovel        := -1;

   edtImovelouMestre.Clear;
end;



procedure TcfgRelCCPlanoPatro.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelouMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelouMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      if dtmMS.MS_ImovelouMestre.ValoresChave[9] = '1' then begin

         iImovelMestre              := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[1]);
         iImovel                    := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[0]);
         lblImovelouMestre.Caption  := 'Imóvel';
         edtImovelouMestre.Text     := dtmMS.MS_ImovelouMestre.ValoresChave[2] + ' - ' +
                                       dtmMS.MS_ImovelouMestre.ValoresChave[3];
      end else begin

         lblImovelouMestre.Caption  := 'Imóvel Mestre';

         iImovelMestre              := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[1]);
         iImovel                    := -1;
         edtImovelouMestre.Text := dtmMS.MS_ImovelouMestre.ValoresChave[2];

      end;

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



end.
