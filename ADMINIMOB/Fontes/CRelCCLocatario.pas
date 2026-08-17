unit CRelCCLocatario;

//	-------------------------------------------------------------------------------------------------
//
//	   Relatório de Conta Corrente por Locatário
//
//	Autor          :  André Pontes
//	Data de Início :
//	Data de Término:
//
//	Modificações   :  07/02/2001  1) Ajuste na combo de Receitas e Despesas e filtro por Locatário (Alex);
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, StdCtrls, Mask, wwdbedit, 
  MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, DB, wwdblook, DBTables, Wwquery, fcCombo, fcColorCombo, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario;

type
  TcfgRelCCLocatario = class(TcfgRel)
    Label1: TLabel;
    btnBuscaLocatario: TBitBtn;
    edtLocatario: TEdit;
    btnLimpaLocatario: TBitBtn;
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
    Label6: TLabel;
    Label7: TLabel;
    chkEmAberto: TCheckBox;
    chkVigente: TCheckBox;
    chkAgrupar: TCheckBox;
    chkLinhas: TCheckBox;
    Label3: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label4: TLabel;
    btnBuscaContrato: TBitBtn;
    edtConNome: TEdit;
    edtConNumero: TEdit;
    btnLimpaContrato: TBitBtn;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    rdgTipoData: TRadioGroup;
    chkCompetencia: TCheckBox;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label8: TLabel;

    // prodecimentos definidos
    function VerificaPreenchimento: boolean;
    procedure FiltraLocatario;
    procedure MontaQuery; override;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaLocatarioClick(Sender: TObject);
    procedure btnLimpaLocatarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure rdgValoresExit(Sender: TObject);



  private { Private declarations }
   sContrato   : string;
   sLocatario  : string;

  public { Public declarations }

  end;



var
  cfgRelCCLocatario: TcfgRelCCLocatario;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, uFuncoesImob, DMS;



function TcfgRelCCLocatario.VerificaPreenchimento: boolean;
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



procedure TcfgRelCCLocatario.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoCCLocatario.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoCCLocatario.Picture := nil;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptCCLocatario_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);

         case rdgTipoData.ItemIndex of
            0: rptCCLocatario_lblDatas.Caption := rptCCLocatario_lblDatas.Caption + ' (datas de baixa)';
            1: rptCCLocatario_lblDatas.Caption := rptCCLocatario_lblDatas.Caption + ' (datas de inclusão)';
            2: rptCCLocatario_lblDatas.Caption := rptCCLocatario_lblDatas.Caption + ' (datas de lançamento)';
            3: rptCCLocatario_lblDatas.Caption := rptCCLocatario_lblDatas.Caption + ' (datas de vencimento)';
         end;

      end;

      rptCCLocatario_lblCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
      rptCCLocatario_lblCompetencia.Visible := not(chkCompetencia.Checked);

      if DBcboTipoImovel.LookupValue <> '' then begin
         rptCCContrato_lblTipoImovel.Caption := DBcboTipoImovel.Text;
      end else begin
         rptCCContrato_lblTipoImovel.Caption := 'Todos os Tipos de Imóvel / Segmentos';
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptCCLocatario_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptCCLocatario_lblTipoRecDes.Caption := '< Todos >';
      end;

      case rdgLancamentos.ItemIndex of
         0: rptCCLocatario_lblRecPag.Caption        := '';
         1: rptCCLocatario_lblRecPag.Caption        := 'Apenas lançamentos a Pagar';
         2: rptCCLocatario_lblRecPag.Caption        := 'Apenas lançamentos a Receber';
      else
         rptCCLocatario_lblRecPag.Caption           := '';
      end;

      case rdgValores.ItemIndex of
         0: rptCCLocatario_lblPrevEfetivo.Caption   := '';
         1: rptCCLocatario_lblPrevEfetivo.Caption   := 'Apenas valores Previstos';
         2: rptCCLocatario_lblPrevEfetivo.Caption   := 'Apenas valores Efetivos';
      else
         rptCCLocatario_lblPrevEfetivo.Caption      := '';
      end;

      rptCCLocatario_lblContratosVigentes.Visible   := chkVigente.Checked;
      rptCCLocatario_lblEmAberto.Visible            := chkEmAberto.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraLocatario;
end;



procedure TcfgRelCCLocatario.FiltraLocatario;
begin
   with dtmRelAdminImobCC.qryCCLocatario do begin

      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, ' + #13 +

      '   P.NOME AS LOCATARIO, ' + #13 +

      '   I.IDIMOVEL, I.IDIMOVELMESTRE, ' + #13 +
      '   IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '   I.CODTIPIMOVEL, ' + #13 +

      '   (IM.IMONOME||'' - ''||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, CX.CIMDESCRICAO)) AS IMOVEL_EXTENSO, ' + #13 +

      '   T.DESCCUSTORECIMO, ' + #13 +

      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +

      '   TA.DESCRICAO, ' + #13 +

      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR, ' + #13 +

      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, ' + #13 +

      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO, ' + #13 +
      '   LD.VALOR, LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, ' + #13 +

// Daniel Simões - P: 19142 - 16/05/2006
      '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.DATALANCTO, RP.DATABAIXA) ) AS DATA, ' + #13 +

      '   ( ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '   ) AS TOT_RECEBER, ' + #13 +

      '   DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) AS TOT_RECEBIDO, ' + #13 +

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
      '   DECODE(RTRIM(LD.OPERACAO),  ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '   DECODE(RTRIM(LD.OPERACAO), ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  - ' + #13 +
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
      '   CONTRATOXIMOVEL CX ' + #13 +

      'WHERE ' + #13;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         case rdgTipoData.ItemIndex of
            0: SQL.Text := SQL.Text + '   ( RP.DATABAIXA BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            1: SQL.Text := SQL.Text + '   ( LI.TRGDTINCLUSAO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            2: SQL.Text := SQL.Text + '   ( LI.DATALANCAMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            3: SQL.Text := SQL.Text + '   ( LI.DATAVENCIMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
         end;
      end;

      if length(trim(edtLocatario.Text)) > 0 then begin
      SQL.Text := SQL.Text +
      '   ( C.IDLOCATARIO = ' + sLocatario + ' ) AND ' + #13;
      end;

      if not(chkCompetencia.Checked) then begin
      SQL.Text := SQL.Text +
      '   ( LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ' AND LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ' ) AND ';
      end;

      if sContrato <> '' then begin
      SQL.Text := SQL.Text + #13 +
      '   ( C.IDCONTRATOIMOVEL = ' + sContrato + ' ) AND ' + #13;
      end;

      if DBcboTipoImovel.LookupValue <> '' then begin
      SQL.Text := SQL.Text +
      '   ( I.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) AND ' + #13;
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
      SQL.Text := SQL.Text +
      '   ( LI.IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) AND ' + #13;
      end;

      Case rdgLancamentos.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( D.RECPAG = ''P'' ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( D.RECPAG = ''R'' ) AND ' + #13;
      end;

      Case rdgValores.ItemIndex of
         1: SQL.Text := SQL.Text + '   ( (RTRIM(LD.OPERACAO) = ''1'') OR (RTRIM(LD.OPERACAO) = ''2'') OR (RTRIM(LD.OPERACAO) = ''4'') ) AND ' + #13;
         2: SQL.Text := SQL.Text + '   ( RTRIM(LD.OPERACAO) = ''5'' ) AND ' + #13;
      end;

      if chkVigente.Checked then begin
      SQL.Text := SQL.Text +
      '   ( ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
      '   ( C.FLGINDETERMINADO = ''S'' ) ) AND ' + #13;
      end;

      if chkEmAberto.Checked then begin
      SQL.Text := SQL.Text +
      '   ( (D.STATUS <> ''2'') OR (D.STATUS IS NULL) ) AND ';
      end;

      SQL.Text := SQL.Text +
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) ' + #13 +
      '   AND ( I.IDIMOVEL = CX.IDIMOVEL ) ' + #13 +
      '   AND ( C.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL ) ' + #13 +
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) ) ' + #13 +
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) ) ' + #13 +
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
      '   AND ( C.IDLOCATARIO = P.IDPESSOA ) ' + #13 +
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) ) ' + #13 +

      'ORDER BY ' + #13 +
      '   P.NOME, ' + #13;

      case rdgOrdenacao.ItemIndex of

         0: begin
            SQL.Text := SQL.Text +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

         1: begin
            SQL.Text := SQL.Text +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

         2: begin
            SQL.Text := SQL.Text +
            '   C.CONNUMERO, ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

         3: begin
            SQL.Text := SQL.Text +
            '   C.CONNUMERO, ' + #13 +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

         4: begin
            SQL.Text := SQL.Text +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

         5: begin
            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   IM.IMONOME, I.IMONOME, ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

         6: begin
            SQL.Text := SQL.Text +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   C.CONNUMERO, ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

         7: begin
            SQL.Text := SQL.Text +
            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
            '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then SQL.Text := SQL.Text + '   LI.IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   C.CONNUMERO, ' + #13 +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   T.DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then SQL.Text := SQL.Text + '   , LI.IDLANCIMOVEL ';
         end;

      end;

      Open;
   end;
end;



procedure TcfgRelCCLocatario.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCCLocatario.btnBuscaLocatarioClick(Sender: TObject);
begin
	inherited;

   dtmMS.MS_Locatario.Executar;

	// redesenha o form na volta do MontaSelect
	Repaint;

	// se houve busca, abre a query principal com apenas o registro buscado
	if dtmMS.MS_Locatario.RetornouValor then begin

      Screen.Cursor     := crHourGlass;

      sLocatario        := dtmMS.MS_Locatario.ValoresChave[0];
      edtLocatario.Text := dtmMS.MS_Locatario.ValoresChave[1];

      Screen.Cursor     := crDefault;
   end;
end;



procedure TcfgRelCCLocatario.btnLimpaLocatarioClick(Sender: TObject);
begin
   inherited;
   sLocatario := '';

   edtLocatario.Clear;
end;



procedure TcfgRelCCLocatario.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de lançamento e o ano de referência/competência
   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;



procedure TcfgRelCCLocatario.btnBuscaContratoClick(Sender: TObject);
begin
	inherited;

   dtmMS.MS_Contrato.Executar;

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



procedure TcfgRelCCLocatario.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   sContrato := '';

   edtConNumero.Clear;
   edtConNome.Clear;
end;



procedure TcfgRelCCLocatario.rdgValoresExit(Sender: TObject);
begin
   inherited;

   case rdgValores.ItemIndex of
      1: rdgTipoData.ItemIndex := 3;
      2: rdgTipoData.ItemIndex := 0;
   end;
end;



end.
