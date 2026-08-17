unit CRelCCContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, wwdblook, ExtCtrls, StdCtrls, Mask, wwdbedit, 
  MontaSelect, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcCombo, fcColorCombo, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario;

type
  TcfgRelCCContrato = class(TcfgRel)
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
    rdgOrdenacao1: TRadioGroup;
    rdgValores: TRadioGroup;
    rdgOrdenacao2: TRadioGroup;
    Image2: TImage;
    DBcboTipoRecDes: TwwDBLookupCombo;
    Label3: TLabel;
    edtAdminImovel: TEdit;
    btnBuscaAdm: TBitBtn;
    chkAgrupar: TCheckBox;
    Label6: TLabel;
    chkLinhas: TCheckBox;
    Label7: TLabel;
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
  cfgRelCCContrato: TcfgRelCCContrato;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, uFuncoesImob, DMS;



function TcfgRelCCContrato.VerificaPreenchimento: boolean;
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



procedure TcfgRelCCContrato.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
           ppLogoCCContrato.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else ppLogoCCContrato.Picture := nil;

      rptCCContrato_lblDatas.Caption := '';
      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptCCContrato_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);

         case rdgTipoData.ItemIndex of
            0: rptCCContrato_lblDatas.Caption := rptCCContrato_lblDatas.Caption + ' (datas de baixa)';
            1: rptCCContrato_lblDatas.Caption := rptCCContrato_lblDatas.Caption + ' (datas de inclusão)';
            2: rptCCContrato_lblDatas.Caption := rptCCContrato_lblDatas.Caption + ' (datas de lançamento)';
            3: rptCCContrato_lblDatas.Caption := rptCCContrato_lblDatas.Caption + ' (datas de vencimento)';
         end;

      end;

      rptCCContrato_lblCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
      rptCCContrato_lblCompetencia.Visible := not(chkCompetencia.Checked);

      if DBcboTipoImovel.LookupValue <> '' then begin
         rptCCContrato_lblTipoImovel.Caption := DBcboTipoImovel.Text;
      end else begin
         rptCCContrato_lblTipoImovel.Caption := 'Todos os Tipos de Imóvel / Segmentos';
      end;

      if edtAdminImovel.Text <> '' then begin
         rptCCContrato_lblAdministradora.Caption := edtAdminImovel.Text;
      end else begin
         rptCCContrato_lblAdministradora.Caption := '< Todas >';
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptCCContrato_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptCCContrato_lblTipoRecDes.Caption := '< Todos >';
      end;

      case rdgLancamentos.ItemIndex of
         0: rptCCContrato_lblRecPag.Caption        := '';
         1: rptCCContrato_lblRecPag.Caption        := 'Apenas lançamentos a Pagar';
         2: rptCCContrato_lblRecPag.Caption        := 'Apenas lançamentos a Receber';
      else
         rptCCContrato_lblRecPag.Caption           := '';
      end;

      case rdgValores.ItemIndex of
         0: rptCCContrato_lblPrevEfetivo.Caption   := '';
         1: rptCCContrato_lblPrevEfetivo.Caption   := 'Apenas valores Previstos';
         2: rptCCContrato_lblPrevEfetivo.Caption   := 'Apenas valores Efetivos';
      else
         rptCCContrato_lblPrevEfetivo.Caption      := '';
      end;

      rptCCContrato_lblContratosVigentes.Visible   := chkVigente.Checked;
      rptCCContrato_lblEmAberto.Visible            := chkEmAberto.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraContrato;
end;



procedure TcfgRelCCContrato.FiltraContrato;
begin
   with dtmRelAdminImobCC.qryCCContrato do begin

      Close;

      SQL.Text :=
      'SELECT ' + #13 +
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, ' + #13 +

      '   P.NOME AS LOCATARIO, ' + #13 +

      '   I.IDIMOVEL, I.IDIMOVELMESTRE, I.CODTIPIMOVEL, ' + #13 +
      '   IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '   (IM.IMONOME||'' - ''||I.IMONOME) AS IMOVEL_EXTENSO, ' + #13 +

      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +

      '   T.DESCCUSTORECIMO, TA.DESCRICAO, ' + #13 +

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
      '   PESSOA P, PESSOA PFC, ' + #13 +
      '   DOCUMENTO D, LANCTODOCUM LD, ' + #13 +

      '  ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '    FROM LANCTODOCUM ' + #13 +
      '    WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'' OR RTRIM(OPERACAO) = ''12'') TRD, ' + #13 +

      '   RECBTOPAGTO RP, TIPOALTERADOR TA, ' + #13 +
      '   CONTRATOIMOVEL C, IMOVEL I, IMOVEL IM, ' + #13 +
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI ' + #13;

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

      if sContrato <> '' then
      SQL.Text := SQL.Text + #13 +
      '   ( C.IDCONTRATOIMOVEL = ' + sContrato + ' ) AND ' + #13;

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( C.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

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

      if chkVigente.Checked then
      SQL.Text := SQL.Text +
      '   ( ( C.CONDATAFIM >= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''', ''DD/MM/YYYY'') ) OR ' + #13 +
      '   ( C.FLGINDETERMINADO = ''S'' ) ) AND ' + #13;

      if chkEmAberto.Checked then
      SQL.Text := SQL.Text +
      '   ( (D.STATUS <> ''2'') OR (D.STATUS IS NULL) ) AND ';

      SQL.Text := SQL.Text +
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
      '   AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) ' + #13 +
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) ) ' + #13 +
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO ) ' + #13 +
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) ) ' + #13 +
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) ) ' + #13 +
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
      '   AND ( C.IDLOCATARIO = P.IDPESSOA ) ' + #13 +
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) ) ' + #13;

      if edtImovelMestre.Text <> '' then
      SQL.Text := SQL.Text +
      '   AND ( C.IDCONTRATOIMOVEL IN (' + #13 +
      '   SELECT DISTINCT ' + #13 +
      '      CX.IDCONTRATOIMOVEL ' + #13 +
      '   FROM ' + #13 +
      '      IMOVEL I, CONTRATOXIMOVEL CX ' + #13 +
      '   WHERE ' + #13 +
      '      ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) ' + #13 +
      '      AND ( CX.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
      '   ) ) ' + #13;

      SQL.Text := SQL.Text +
      'ORDER BY ' + #13;

      case rdgOrdenacao1.ItemIndex of
         0: SQL.Text := SQL.Text + '   C.CONNUMERO, C.CONNOME, ' + #13;
         1: SQL.Text := SQL.Text + '   C.CONNOME, C.CONNUMERO, ' + #13;
      end;

      case rdgOrdenacao2.ItemIndex of

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

      Open;
   end;
end;



procedure TcfgRelCCContrato.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCCContrato.btnBuscaContratoClick(Sender: TObject);
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



procedure TcfgRelCCContrato.FormShow(Sender: TObject);
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



procedure TcfgRelCCContrato.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   sContrato := '';

   edtConNumero.Clear;
   edtConNome.Clear;
end;



procedure TcfgRelCCContrato.btnBuscaAdmClick(Sender: TObject);
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



procedure TcfgRelCCContrato.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelCCContrato.rdgValoresExit(Sender: TObject);
begin
   inherited;

   case rdgValores.ItemIndex of
      1: rdgTipoData.ItemIndex := 3;
      2: rdgTipoData.ItemIndex := 0;
   end;
end;



procedure TcfgRelCCContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;

   inherited;
end;



procedure TcfgRelCCContrato.btnBuscaImovelMestreClick(Sender: TObject);
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



procedure TcfgRelCCContrato.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



end.
