unit CRelCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, StdCtrls, Mask, wwdbedit, wwdblook,
  Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcCombo, fcColorCombo, MontaSelect, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario;

type
  TcfgRelCC = class(TcfgRel)
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
    rdgOrdenacao: TRadioGroup;
    Label7: TLabel;
    chkLinhas: TCheckBox;
    chkAgrupar: TCheckBox;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label3: TLabel;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label2: TLabel;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    rdgTipoData: TRadioGroup;
    chkCompetencia: TCheckBox;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label1: TLabel;


    // prodecimentos definidos
    function VerificaPreenchimento: boolean;

    procedure FiltraCC;
    procedure MontaQuery; override;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);



  private { Private declarations }
   iAdminImovel   : integer;

  public { Public declarations }

  end;



var
  cfgRelCC: TcfgRelCC;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dImobiliario, dLookImobiliario, uFuncoesImob,
  DMS;



function TcfgRelCC.VerificaPreenchimento: boolean;
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



procedure TcfgRelCC.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoContaCorrente.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoContaCorrente.Picture := nil;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptCC_lblCompetencia.Clear;
         rptCC_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);
      end else begin
         rptCC_lblCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
         rptCC_lblDatas.Clear;
      end;

      if DBcboTipoImovel.LookupValue <> '' then begin
         rptCCContrato_lblTipoImovel.Caption := DBcboTipoImovel.Text;
      end else begin
         rptCCContrato_lblTipoImovel.Caption := 'Todos os Tipos de Imóvel / Segmentos';
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptCC_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptCC_lblTipoRecDes.Caption := '< Todos >';
      end;

      case rdgLancamentos.ItemIndex of
         0: rptCC_lblRecPag.Caption       := '';
         1: rptCC_lblRecPag.Caption       := 'Apenas lançamentos a Pagar';
         2: rptCC_lblRecPag.Caption       := 'Apenas lançamentos a Receber';
      else
         rptCC_lblRecPag.Caption          := '';
      end;

      case rdgValores.ItemIndex of
         0: rptCC_lblPrevEfetivo.Caption  := '';
         1: rptCC_lblPrevEfetivo.Caption  := 'Apenas valores Previstos';
         2: rptCC_lblPrevEfetivo.Caption  := 'Apenas valores Efetivos';
      else
         rptCC_lblPrevEfetivo.Caption     := '';
      end;

      rptCC_lblEmAberto.Visible           := chkEmAberto.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraCC;
end;



procedure TcfgRelCC.FiltraCC;
begin
   with dtmRelAdminImobCC.qryCC do begin

      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '   I.IMONOME, ' + #13 +
      '   I.CODTIPIMOVEL, ' + #13 +

      '   T.DESCCUSTORECIMO, ' + #13 +

      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +

      '   TA.DESCRICAO, ' + #13 +

      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR, ' + #13 +

      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, ' + #13 +

      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO, ' + #13 +
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, ' + #13 +

      '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, RP.DATABAIXA) AS DATA, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS TOT_RECEBER, ' + #13 +

      '   DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) AS TOT_RECEBIDO, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS TOT_PAGAR, ' + #13 +

      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) AS TOT_PAGO, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS SALDO_RECEB, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  - ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS SALDO_PAGAR ' + #13 +

      'FROM ' + #13 +
      '   PESSOA PFC, ' + #13 +
      '   DOCUMENTO D, LANCTODOCUM LD, ' + #13 +

      '  ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '    FROM LANCTODOCUM ' + #13 +
      '    WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'' OR RTRIM(OPERACAO) = ''12'') TRD, ' + #13 +

      '   RECBTOPAGTO RP, TIPOALTERADOR TA, ' + #13 +
      '   IMOVEL I, IMOVEL IM, ' + #13 +
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI ' + #13 +

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

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( I.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

      if DBcboTipoImovel.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( I.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) AND ' + #13;

      if DBcboTipoRecDes.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( LI.IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) AND ' + #13;

      Case rdgLancamentos.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( D.RECPAG = ''P'' ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( D.RECPAG = ''R'' ) AND ' + #13;
      end;

      Case rdgValores.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( (RTRIM(LD.OPERACAO) = ''1'') OR (RTRIM(LD.OPERACAO) = ''2'') OR (RTRIM(LD.OPERACAO) = ''4'') ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( RTRIM(LD.OPERACAO) = ''5'' ) AND ' + #13;
      end;

      if chkEmAberto.Checked then
      SQL.Text := SQL.Text +
      '   ( (RTRIM(D.STATUS <> ''2'')) OR (D.STATUS IS NULL) ) AND ';

      SQL.Text := SQL.Text +
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) ) ' + #13 +
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) ) ' + #13 +
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) ) ' + #13 +

      'ORDER BY ' + #13;

      case rdgOrdenacao.ItemIndex of

         0:
         begin
            SQL.Text := SQL.Text +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , LI.IDLANCIMOVEL ';
         end;

         1:
         begin
            SQL.Text := SQL.Text +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , LI.IDLANCIMOVEL ';
         end;

         2: begin
            SQL.Text := SQL.Text +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , LI.IDLANCIMOVEL ';
         end;

         3:
         begin
            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , LI.IDLANCIMOVEL ';
         end;

      end;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
      ParamByName('DATAINI').DataType     := ftDateTime;
      ParamByName('DATAFIM').DataType     := ftDateTime;
      end;

      LimpaParametros(dtmRelAdminImobCC.qryCC);

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
      ParamByName('DATAINI').asDateTime   := edtDataIni.Date;
      ParamByName('DATAFIM').asDateTime   := edtDataFim.Date;
      end;

      Open;
   end;
end;



procedure TcfgRelCC.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCC.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;



procedure TcfgRelCC.btnBuscaAdminImovelClick(Sender: TObject);
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



procedure TcfgRelCC.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelCC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;

   inherited;
end;



end.
