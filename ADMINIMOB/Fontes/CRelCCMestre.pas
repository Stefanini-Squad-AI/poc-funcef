{//******************************************************************************
//Nº SOL: 260971/17874
//Nº KINTANA/PPM 1140219/1104944
//Data da Alteração: 03/11/2015
//Alteração Form: Inclusão de três linhas OrderBy
//Responsável: Michelle Suellyn Mota
//Descrição:Adicionado dois radiobuttons e alterada a ordenação dos Lançamentos 
//do Imóvel Mestre:
//5º.Código do Documento, Competência, Data 
//6º.Competência, Código do Documento, Data.
//******************************************************************************
-------------------------------------------------------------------------------
Rotina : FiltraImovel
N. SOL: 176454
N. Kintana: 1612321
Data: 19/03/2012
Responsável: Helen V. Bianchi
Descrição : Correção no UNION
--------------------------------------------------------------------------------
Rotina : FiltraImovel
N. SOL: 152676
N. Kintana: 1138237
Data: 24/03/2011
Responsável: Felipe de Oliveira
Descrição : Alterar o Relatório para mostrar documentos sem financeiro

--------------------------------------------------------------------------------}

unit CRelCCMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, StdCtrls, Mask, wwdbedit, wwdblook,
  Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcCombo, fcColorCombo, MontaSelect, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario;

type
  TcfgRelCCMestre = class(TcfgRel)
    Label1: TLabel;
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
    chkCompetencia: TCheckBox;
    rdgTipoData: TRadioGroup;
    DBcboTipoImovel: TwwDBLookupCombo;
    Label8: TLabel;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure rdgValoresExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);



  private { Private declarations }
    iAdminImovel  : integer;
    iImovelMestre : integer;

    function VerificaPreenchimento: boolean;

    procedure FiltraImovel;
    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelCCMestre: TcfgRelCCMestre;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, uFuncoesImob, DMS;



function TcfgRelCCMestre.VerificaPreenchimento: boolean;
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



procedure TcfgRelCCMestre.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoCCImovelMestre.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoCCImovelMestre.Picture := nil;

      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         rptCCMestre_lblDatas.Caption := FormatDateTime('DD/MM/YYYY', edtDataIni.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', edtDataFim.Date);

         case rdgTipoData.ItemIndex of
            0: rptCCMestre_lblDatas.Caption := rptCCMestre_lblDatas.Caption + ' (datas de baixa)';
            1: rptCCMestre_lblDatas.Caption := rptCCMestre_lblDatas.Caption + ' (datas de inclusão)';
            2: rptCCMestre_lblDatas.Caption := rptCCMestre_lblDatas.Caption + ' (datas de lançamento)';
            3: rptCCMestre_lblDatas.Caption := rptCCMestre_lblDatas.Caption + ' (datas de vencimento)';
         end;

      end;

      rptCCMestre_lblCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
      rptCCMestre_lblCompetencia.Visible := not(chkCompetencia.Checked);

      if DBcboTipoImovel.LookupValue <> '' then begin
         rptCCContrato_lblTipoImovel.Caption := DBcboTipoImovel.Text;
      end else begin
         rptCCContrato_lblTipoImovel.Caption := 'Todos os Tipos de Imóvel / Segmentos';
      end;

      if DBcboTipoRecDes.LookupValue <> '' then begin
         rptCCMestre_lblTipoRecDes.Caption := DBcboTipoRecDes.Text;
      end else begin
         rptCCMestre_lblTipoRecDes.Caption := '< Todos >';
      end;

      case rdgLancamentos.ItemIndex of
         0: rptCCMestre_lblRecPag.Caption       := '';
         1: rptCCMestre_lblRecPag.Caption       := 'Apenas lançamentos a Pagar';
         2: rptCCMestre_lblRecPag.Caption       := 'Apenas lançamentos a Receber';
      else
         rptCCMestre_lblRecPag.Caption          := '';
      end;

      case rdgValores.ItemIndex of
         0: rptCCMestre_lblPrevEfetivo.Caption  := '';
         1: rptCCMestre_lblPrevEfetivo.Caption  := 'Apenas valores Previstos';
         2: rptCCMestre_lblPrevEfetivo.Caption  := 'Apenas valores Efetivos';
      else
         rptCCMestre_lblPrevEfetivo.Caption     := '';
      end;

      rptCCMestre_lblEmAberto.Visible           := chkEmAberto.Checked;

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraImovel;
end;



procedure TcfgRelCCMestre.FiltraImovel;
begin
   with dtmRelAdminImobCC.qryCCMestre do begin

      Close;
// SOL 152676  Felipe de Oliveira

      SQL.Text :=  ' SELECT * FROM ' + #13 +
      ' ( SELECT ' + #13 +
      '   I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '   I.IMONOME, ' + #13 +
      '   I.CODTIPIMOVEL, ' + #13 +
      '   T.DESCCUSTORECIMO, ' + #13 +
      '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +
      '   LI.IDLANCIMOVEL, TA.DESCRICAO, ' + #13 +
      '   D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR, ' + #13 +
      '   PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, ' + #13 +
      '   LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO, ' + #13 +
      '   LD.VALOR, ' + #13 +
      '   LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO, ' + #13 +
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

      'FROM                                        ' + #13 +
      '   PESSOA PFC,                              ' + #13 +
      '   DOCUMENTO D, LANCTODOCUM LD,             ' + #13 +
      '  ( SELECT CODDOCUMENTO, VALOR              ' + #13 +
      '    FROM LANCTODOCUM                        ' + #13 +
      '   WHERE RTRIM(OPERACAO) = ''1'' OR         ' + #13 +
      '         RTRIM(OPERACAO) = ''2'' OR         ' + #13 +
      '         RTRIM(OPERACAO) = ''3'' OR         ' + #13 +
      '         RTRIM(OPERACAO) = ''12'') TRD,     ' + #13 +
      '   RECBTOPAGTO RP, TIPOALTERADOR TA,        ' + #13 +
      '   IMOVEL I, IMOVEL IM,                     ' + #13 +
      '   TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI ' + #13 +
      'WHERE                                       ' + #13;

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

      if edtImovelMestre.Text <> '' then
      SQL.Text := SQL.Text + #13 +
      '   ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) AND ' + #13;

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
      SQL.Text := SQL.Text + #13 +
      '   ( (D.STATUS <> ''2'') OR (D.STATUS IS NULL) ) AND ';

      SQL.Text := SQL.Text +
      '   ( I.IDIMOVELMESTRE = IM.IDIMOVEL )                  ' + #13 +
      '   AND ( LI.IDIMOVEL = I.IDIMOVEL )                    ' + #13 +
      '   AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )            ' + #13 +
      '   AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )            ' + #13 +
      '   AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) )        ' + #13 +
      '   AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )           ' + #13 +
      '   AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) )              ' + #13 +
      '   AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )        ' + #13 +
      '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )  ' + #13 +
      '   AND ( D.IDFORCLI = PFC.IDPESSOA(+) )                ' + #13;


      SQL.Text := SQL.Text +
      '   UNION ALL                                                                                      ' + #13 +
      'SELECT DISTINCT                                                                                   ' + #13 +
      '      I.IDIMOVEL,                                                                                 ' + #13 +
      '      I.IDIMOVELMESTRE,                                                                           ' + #13 +
      '      IM.IMONOME AS NOME_MESTRE,                                                                  ' + #13 +
      '      I.IMONOME ,                                                                                 ' + #13 +
      '      I.CODTIPIMOVEL,                                                                             ' + #13 +
      '      ''SEM FINANCEIRO'',                                                                         ' + #13 +
      '      LI.DATALANCAMENTO,                                                                          ' + #13 +
      '      LI.DATAVENCIMENTO,                                                                          ' + #13 +
      '      LI.MESCOMPETENCIA,                                                                          ' + #13 +
      '      LI.ANOCOMPETENCIA,                                                                          ' + #13 +
      '      LI.IDLANCIMOVEL,                                                                            ' + #13 +
      '      '''' AS DESCRICAO,                                                                          ' + #13 +
      '      LI.RECPAG,                                                                                  ' + #13 +
      '      '''' AS STATUS,                                                                             ' + #13 +
      '      LI.NODOCUMENTO,                                                                             ' + #13 +
      '      0 AS NUMAPGR,                                                                               ' + #13 +
      '      PFC.NOME        AS NF_FORCLI,                                                               ' + #13 +
      '      PFC.RAZAOSOCIAL AS RS_FORCLI,                                                               ' + #13 +
      '      LI.CODDOCUMENTO,                                                                            ' + #13 +
      '      0 AS CODALTERADOR,                                                                          ' + #13 +
      '      '''' AS OPERACAO,                                                                           ' + #13 +
      '      0 AS VALOR,                                                                                 ' + #13 +
      '      LA.LACDEBCRE AS DEBCRE,                                                                     ' + #13 +
      '      '''' AS HISTORICOCOMPL,                                                                     ' + #13 +
      '      LI.DATAEMISSAO,                                                                             ' + #13 +
      '      LI.DATAVENCIMENTO AS DATA,                                                                  ' + #13 +
      '      DECODE(LI.RECPAG,''R'',DECODE(LA.LACDEBCRE,''D'',LI.VLRLANCRECEB, 0),0) AS TOT_RECEBER,     ' + #13 +
      '      DECODE(LI.RECPAG,''R'',DECODE(LA.LACDEBCRE,''C'',LI.VLRLANCRECEB, 0),0) AS TOT_RECEBIDO,    ' + #13 +
      '      DECODE(LI.RECPAG,''P'',DECODE(LA.LACDEBCRE,''C'',LI.VLRLANCPAGAR, 0),0) AS TOT_PAGAR,       ' + #13 +
      '      DECODE(LI.RECPAG,''P'',DECODE(LA.LACDEBCRE,''D'',LI.VLRLANCPAGAR, 0),0) AS TOT_PAGO,        ' + #13 +
      ' 0 AS SALDO_RECEB,' + #13 +
      ' 0 AS SALDO_PAGAR ' + #13 +
      'FROM   PESSOA PFC,                                                                                ' + #13 +
      '       IMOVEL I,                                                                                  ' + #13 +
      '       IMOVEL IM,                                                                                 ' + #13 +
      '       TIPOCUSTORECIMOV  T,                                                                       ' + #13 +
      '       LANCAMENTOSIMOVEL LI,                                                                      ' + #13 +
      '       PLANILHA PLN,                                                                              ' + #13 +
      '       LANCAMENTO LA                                                                              ' + #13 +
      'WHERE                                                                                             ' + #13 ;
      if ( (length(trim(edtDataIni.Text)) > 0) and (length(trim(edtDataFim.Text)) > 0) ) then begin
         case rdgTipoData.ItemIndex of
            //HELEN - SOL : 176454 KINTANA 1612321 - INICIO
            0: SQL.Text := SQL.Text + '   ( PLN.PLNDATDIA BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            //HELEN - SOL : 176454 KINTANA 1612321 - FIM
            1: SQL.Text := SQL.Text + '   ( LI.TRGDTINCLUSAO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            2: SQL.Text := SQL.Text + '   ( LI.DATALANCAMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
            3: SQL.Text := SQL.Text + '   ( LI.DATAVENCIMENTO BETWEEN TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataIni.Date) + ''', ''DD/MM/YYYY'') AND TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'') ) AND ';
         end;
      end;

      if not(chkCompetencia.Checked) then begin
      SQL.Text := SQL.Text +
      '   ( LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ' AND LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ' ) AND ';
      end;

      if edtImovelMestre.Text <> '' then
      SQL.Text := SQL.Text + #13 +
      '   ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) AND ' + #13;

      if edtAdminImovel.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( I.IDADMINIMOVEL = ' + IntToStr(iAdminImovel) + ' ) AND ' + #13;

      if DBcboTipoImovel.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( I.CODTIPIMOVEL = ''' + DBcboTipoImovel.LookupValue + ''' ) AND ' + #13;

      if DBcboTipoRecDes.LookupValue <> '' then
      SQL.Text := SQL.Text +
      '   ( LI.IDTIPOCUSTORECIMO = ' + DBcboTipoRecDes.LookupValue + ' ) AND ' + #13;



      SQL.Text := SQL.Text +
      ' (LI.PLNCODIGO = PLN.PLNCODIGO)                  ' + #13 +
      'AND (LI.PLNCODIGO = LA.PLNCODIGO)                ' + #13 +
      'AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)             ' + #13 +
      'AND (LI.IDIMOVEL = I.IDIMOVEL)                   ' + #13 +
      'AND (LI.CODDOCUMENTO IS NULL)                    ' + #13 +
      'AND (LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO) ' + #13 +
      'AND (LI.IDFORCLI = PFC.IDPESSOA(+))              ' + #13 +
      ')                                                ' + #13 +
      'ORDER BY                                         ' + #13;

      case rdgOrdenacao.ItemIndex of

         0:
         begin
            SQL.Text := SQL.Text +
            '   IMONOME, ' + #13 +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DATA , ' + #13 +
            '   DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;

         1:
         begin
            SQL.Text := SQL.Text +
            '   IMONOME, ' + #13 +
            '   DATA, ' + #13 +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   RTRIM(LD.OPERACAO), ' + #13 +
            '   DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;

         2: begin
            SQL.Text := SQL.Text +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DATA, ' + #13 +
            '   IMONOME, ' + #13 +
            '   DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;

         3:
         begin
            SQL.Text := SQL.Text +
            '   DATA, ' + #13 +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   IMONOME, ' + #13 +
            '   DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;
      // Início - Michelle Mota - SOL: 260971/17874 - PPM: 1140219/1104944
         4: //5º.Código do Documento, Competência, Data;
         begin
            SQL.Text := SQL.Text +
            '   CODDOCUMENTO, ' + #13 +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13;


            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DATA, ' + #13 +
            '   DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;

         5: //6º.Competência, Código do Documento, Data.
         begin
            SQL.Text := SQL.Text +
            '   ANOCOMPETENCIA, MESCOMPETENCIA, ' + #13 +
            '   CODDOCUMENTO, ' + #13 ;

            if chkAgrupar.Checked then
            SQL.Text := SQL.Text +
            '   IDLANCIMOVEL, ' + #13;

            SQL.Text := SQL.Text +
            '   DATA, ' + #13 +
            '   DESCCUSTORECIMO ' + #13;

            if not(chkAgrupar.Checked) then
            SQL.Text := SQL.Text +
            '   , IDLANCIMOVEL ';
         end;
      // Término - Michelle Mota - SOL: 260971/17874 - PPM: 1140219/1104944   
      end;
      
      Open;
   end;
end;



procedure TcfgRelCCMestre.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelCCMestre.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
   dtmLookImobiliario.qryLookTipoRecDes.Open;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   iImovelMestre := -1;
end;



procedure TcfgRelCCMestre.btnBuscaAdminImovelClick(Sender: TObject);
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



procedure TcfgRelCCMestre.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelCCMestre.rdgValoresExit(Sender: TObject);
begin
   inherited;

   case rdgValores.ItemIndex of
      1: rdgTipoData.ItemIndex := 3;
      2: rdgTipoData.ItemIndex := 0;
   end;
end;



procedure TcfgRelCCMestre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookImobiliario.qryLookTipoRecDes.Close;

   inherited;
end;



procedure TcfgRelCCMestre.btnBuscaImovelMestreClick(Sender: TObject);
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



procedure TcfgRelCCMestre.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



end.
