{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina.............: FiltraContrato
N. Sol.............: 147289
N. Kintana.........: 1017104
Data...............: 14/04/2011
Responsável........: Felipe de Oliveira
Descrição..........: Quando relatórios de inadimplencia não possuirem
                     inadinplencia, imprimir mensagem no relatório
--------------------------------------------------------------------------------
Pendências  : 24878
Responsável : Daniel Simões
Data        : 04/06/2007
Descrição   : Implementação de filtro e quebra de grupo por tipo de contrato
             ( Locação ou Confissão de Dívida) e situação contratual.
--------------------------------------------------------------------------------
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : Mudança na 'qryParamOper'. Passa a buscar a Data do último
              fechamento na tabela PARAMIMOVEL...
--------------------------------------------------------------------------------
Pendência   : 25182
Responsável : Daniel Simões
Data        : 27/04/2007
Descrição   : Estava passando L.IDLOCATARIO como parâmetro quando selecionava o
              Locatário como filtro. Troquei pelo L.IDFORCLI...
--------------------------------------------------------------------------------
Pendência   : 22531
Responsável : Daniel Simões
Data        : 06/06/2006
Descrição   : Passa a utilizar a data de limite de inadimplência na busca dos
              valores de movimentação do documento e validação da data limite
              para pagamento...
-------------------------------------------------------------------------------}

unit CRelInadimplenciaLocatario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, MontaSelect, ExtCtrls, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcCombo, fcColorCombo, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, uModuloImobiliario, Db, DBTables, uCMFileUtils,
  wwdblook;

type
  TcfgRelInadimplenciaLocatario = class(TcfgRel)
    Label1: TLabel;
    btnBuscaLocatario: TBitBtn;
    btnLimpaLocatario: TBitBtn;
    grpDatas: TGroupBox;
    Label4: TLabel;
    edtDataFim: TCMDateTimePicker;
    rdgOrdenacao: TRadioGroup;
    edtLocatario: TEdit;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    Label2: TLabel;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    GroupBox1: TGroupBox;
    edDataAtualiza: TCMDateTimePicker;
    qryParamOper: TQuery;
    dsParamOper: TDataSource;
    chkVlrPositivo: TCheckBox;
    qryParamOperDTULTFECH: TDateTimeField;
    Label3: TLabel;
    dbCboSituacaoContratual: TwwDBLookupCombo;
    gbTipoContrato: TGroupBox;
    cbLocacao: TCheckBox;
    cbConfissao: TCheckBox;
    qrySitContratual: TQuery;
    qrySitContratualDESCRICAO: TStringField;
    qrySitContratualIDSITCONTIMOB: TFloatField;
    dsSitContratual: TDataSource;

    // prodecimentos definidos
    function VerificaPreenchimento: boolean;

    procedure FiltraLocatario;
    procedure MontaQuery; override;

    // outros procedimentos
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaLocatarioClick(Sender: TObject);
    procedure btnLimpaLocatarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private { Private declarations }
    sLocatario: string;

  public { Public declarations }
    dDtAtualiza : TDateTime;
  end;



var
  cfgRelInadimplenciaLocatario: TcfgRelInadimplenciaLocatario;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, DMS;



function TcfgRelInadimplenciaLocatario.VerificaPreenchimento: boolean;
begin
  Result := False;

  try
    if (length(trim(edDataAtualiza.Text)) = 0) then
      raise EValidacao.CreateVal('Preencha a data de atualização.',edDataAtualiza);

    if ( (length(trim(edtDataFim.Text)) = 0) and
       ( (cboMesCompetencia.ItemIndex = -1) or (DBspnAnoCompetencia.Value = 0) ) ) then
      raise EValidacao.CreateVal('É necessário indicar a Data ou o Mês de Competência!', edtDataFim);

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



procedure TcfgRelInadimplenciaLocatario.FiltraLocatario;
var edDataOper : TDateTime; // Daniel - 27/03/2006
    sParamOper : string;    // Daniel - 27/03/2006
    edDataLanc : TDateTime;
    iAnoComp, iMesComp : Integer;
begin
// Daniel Simões - 27/06/2006 - ------------------------------------------------
   iAnoComp := trunc(DBspnAnoCompetencia.Value);
   iMesComp := cboMesCompetencia.ItemIndex+1;

   if ( edtDataFim.Date > 0 ) then
     edDataLanc := edtDataFim.Date
   else
     edDataLanc := DiasUteis.UltDiaMes(iAnoComp,iMesComp);
// Daniel Simões - 27/06/2006 - ------------------------------------------------

// Daniel Simões - 27/03/2006
   edDataOper := edDataAtualiza.Date;
   sParamOper := '';
   sParamOper := '                     AND ( LO2.DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13;
// Daniel Simões - 27/03/2006

   with dtmRelAdminImobCC.qryInadimplenciaLocatario do begin
      Close;

// Daniel Simões - P: 21816 - 27/03/2006 - Início ------------------------------
      SQL.Text :=
      'SELECT PL.NOME AS NF_LOCATARIO, PL.RAZAOSOCIAL AS RS_LOCATARIO, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Campo Descr_SitContr
      '       SC.DESCRICAO AS DESCR_SITCONTR,  ' + #13 +
      '       ROUND (REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ,2) AS TOT_RECEBER ' + #13 +
      // Daniel Simões - Troquei a tabela "LOCATARIO" por "EMPRESACLIENTE" - 09/05/2006
      'FROM PESSOA PL, EMPRESACLIENTE L, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado a Tabela SitContImob
      '     SITCONTIMOB SC,                 ' + #13 +
      '   ( SELECT LI.IDFORCLI, ' + #13 + 

      '            C.FLGTIPOCONTRATO, C.IDSITCONTIMOB, ' +#13+ // Daniel - 24878

      '            SUM( ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '                ) AS TOT_RECEBER, ' + #13 +
      '            SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS RECEBIDO ' + #13 +
      '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T, CONTRATOIMOVEL C, ' + #13 +
      '        ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '          FROM LANCTODOCUM ' + #13 +
      '          WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD ' + #13 +
      '     WHERE ' + #13 +// Daniel Simões - Retirei o filtro "LI.IDCONTRATOIMOVEL IS NOT NULL" - 09/05/2006
      '           ( LI.CODDOCUMENTO   = D.CODDOCUMENTO ) ' + #13 +
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL (+) ) ' + #13 +// Daniel Simões - Adicionado OUTER JOIN no filtro - 09/05/2006

      // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006
      '       AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +
      '       AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO              ' + #13 +
      '                                      FROM CONCILIADOC              ' + #13 +
      '                                      WHERE FLGTIPO = ''A''          ' + #13 +
      '                                        AND IDPARCFINANCIMOV IS NULL ' + #13 +
      '                                        AND DATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) )' + #13 +
      // Fim - Vinicius 01/11/2006

      // Daniel Simões - 22531
      '       AND ( LD.DATALANCTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) ' + #13 +
      '       AND ( C.FLGTIPOCONTRATO = ''L'' OR LI.IDCONTRATOIMOVEL IS NULL ) AND ( LD.ESTORNO IS NULL )  ' + #13 +// Daniel Simões - Adicionado a cláusula "OR" - 09/05/2006
      '       AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '       AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO ) ' + #13 +
      '       AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL ) ' + #13 +
      '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN(T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON) ' + #13 +
      '       AND LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') ' + #13 +
      '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODDOCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ) OR (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) ' + #13 +
      '       AND LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) ' + #13 +
      '       AND LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) ) ' + #13;

      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
        SQL.Text := SQL.Text +
        '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) OR ' + #13 +
        '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) )  ' + #13;
      end else begin
        SQL.Text := SQL.Text +
        '       AND ( (LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ') AND (LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ') ) ' + #13;
      end;

      SQL.Text := SQL.Text +
      '     GROUP BY LI.IDFORCLI, ' +#13+

      '              C.FLGTIPOCONTRATO, C.IDSITCONTIMOB ' +#13+ // Daniel - 24878

      ' ) REC_DES, ' + #13 +

      '   ( SELECT LI.IDFORCLI, ROUND( SUM(OP.VLRCORRECAO), 2) AS VLRCORRECAO ' + #13 +
      '     FROM ' + #13 +
      '        ( SELECT DISTINCT CODDOCUMENTO, IDFORCLI ' + #13 +
      '          FROM LANCAMENTOSIMOVEL ' + #13 +
      '          WHERE IDMODULO = ''64'' ' + #13 +
      '            AND RECPAG = ''R'' ) LI, ' + #13 +
      '        ( SELECT LO.CODDOCUMENTO, SUM(LO.VLRACUM) AS VLRCORRECAO ' + #13 +
      '          FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, ' + #13 +
      '             ( SELECT LO2.CODDOCUMENTO, LO2.IDOPERACAO, MAX(LO2.DATAOPER) AS ULTDIA ' + #13 +
      '               FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 ' + #13 +
      '               WHERE ( LO2.IDOPERACAO = PI2.IDOPERATUALCM OR LO2.IDOPERACAO = PI2.IDOPERATUALJUROS OR LO2.IDOPERACAO = PI2.IDOPERATUALMULTA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ' + #13 + sParamOper +
      '               GROUP BY LO2.CODDOCUMENTO, LO2.IDOPERACAO ) UD ' + #13 +
      '          WHERE ( LO.IDOPERACAO = PI.IDOPERATUALCM OR LO.IDOPERACAO = PI.IDOPERATUALJUROS OR LO.IDOPERACAO = PI.IDOPERATUALMULTA ) ' + #13 +
      '            AND LO.DATAOPER     = UD.ULTDIA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')' + #13 +
      '            AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+) ' + #13 +
      '            AND LO.IDOPERACAO   = UD.IDOPERACAO (+) ' + #13 +
      '          GROUP BY LO.CODDOCUMENTO ) OP ' + #13 +
      '     WHERE LI.CODDOCUMENTO = OP.CODDOCUMENTO ' + #13 +
      '     GROUP BY LI.IDFORCLI ) COR ' + #13 +
      'WHERE ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Join entre as tabelas
      '      ( REC_DES.IDSITCONTIMOB      = SC.IDSITCONTIMOB (+) ) AND   ' + #13;

      if sLocatario <> '' then
      SQL.Text := SQL.Text +
      '       ( L.IDFORCLI = ' + sLocatario + ' ) AND '; // Daniel - 25182

      SQL.Text := SQL.Text +
      '       ( L.IDFORCLI       = PL.IDPESSOA ) ' + #13 +
      '   AND ( L.IDFORCLI       = REC_DES.IDFORCLI ) ' + #13 +
      '   AND ( REC_DES.IDFORCLI = COR.IDFORCLI(+) ) ' + #13 ; 

// Daniel - 24878 - Início -----------------------------------------------------
     if (dbCboSituacaoContratual.LookupValue<>'') then
       SQL.Text := SQL.Text+'   AND ( REC_DES.IDSITCONTIMOB = '+QuotedStr(dbCboSituacaoContratual.LookupValue)+' ) ';

     if (cbLocacao.Checked) and not (cbConfissao.Checked) then
       SQL.Text := SQL.Text+'   AND ( REC_DES.FLGTIPOCONTRATO = ''L'' ) ';

     if (cbConfissao.Checked) and not (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( REC_DES.FLGTIPOCONTRATO = ''D'' ) ';

     if (cbConfissao.Checked) and (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( REC_DES.FLGTIPOCONTRATO IN(''L'',''D'') ) ';
// Daniel - 24878 - Fim --------------------------------------------------------

// Daniel Simões - 04/05/2006 - ------------------------------------------------
      if ChkVlrPositivo.Checked then begin
        SQL.Text := SQL.Text +
         '   AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) > 0 )  ' + #13;
      end else begin
        SQL.Text := SQL.Text +
         '   AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) <> 0 )  ' + #13;
      end;
        SQL.Text := SQL.Text +
// Daniel Simões - 04/05/2006 - ------------------------------------------------

      'ORDER BY ' + #13;

      case rdgOrdenacao.ItemIndex of
         0: SQL.Text := SQL.Text + '   PL.NOME ';
         1: SQL.Text := SQL.Text + '   PL.RAZAOSOCIAL ';
      end;
// Daniel Simões - P: 21816 - 27/03/2006 - Fim ---------------------------------

      Open;
   if IsEmpty then
   begin
      if sLocatario <> '' then
      begin
          Close;
          SQL.Clear;
          SQL.Text :=' SELECT PL.NOME AS NF_LOCATARIO, ' + #13 +
          '            PL.RAZAOSOCIAL AS RS_LOCATARIO, ' + #13 +
          '            '' '' AS DESCR_SITCONTR,        ' + #13 +
          '            0 AS TOT_RECEBER                ' + #13 +
          '          FROM PESSOA PL                    ' + #13 +
          '          WHERE  PL.IDPESSOA = ' + sLocatario ;
          Open;

          dtmRelAdminImobCC.ppLabel235.Caption := '" Não há inadimplência para esse locatário "' ;
      end
      else
          dtmRelAdminImobCC.ppLabel235.Caption := '" Não há inadimplência para esse período "' ;

      dtmRelAdminImobCC.ppLabel235.Visible := True;
      dtmRelAdminImobCC.ppShape16.Visible := False;
      dtmRelAdminImobCC.ppLabel280.Visible := False;
      dtmRelAdminImobCC.ppDBCalc51.Visible := False;

   end
   else
   begin
      dtmRelAdminImobCC.ppLabel235.Visible := False;
      dtmRelAdminImobCC.ppShape16.Visible := True;
      dtmRelAdminImobCC.ppLabel280.Visible := True;
      dtmRelAdminImobCC.ppDBCalc51.Visible := True;
   end;


// Felipe de Oliveira SOL147289  KTN1017104 - Fim

   end;
end;



procedure TcfgRelInadimplenciaLocatario.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoInadimplLocatario.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoInadimplLocatario.Picture := nil;

      // preenche as labels do relatório
      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
         rptInadimplenciaLocatariolblMesCompetencia.Caption := '';
         rptInadimplenciaLocatariolblDataLimite.Caption     := edtDataFim.Text;
      end else begin
         rptInadimplenciaLocatariolblMesCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
         rptInadimplenciaLocatariolblDataLimite.Caption     := '';
      end;

// Pendência: 21816
// Daniel Simões - -------------------------------------------------------------

      if ( edDataAtualiza.Text <> '' ) then
           rptInadimplenciaLocatariolblDataAtualiza1.Caption := DateToStr(dDtAtualiza)
      else rptInadimplenciaLocatariolblDataAtualiza1.Caption := '';

// Daniel Simões - -------------------------------------------------------------

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

   FiltraLocatario;
end;



procedure TcfgRelInadimplenciaLocatario.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelInadimplenciaLocatario.btnBuscaLocatarioClick(Sender: TObject);
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



procedure TcfgRelInadimplenciaLocatario.btnLimpaLocatarioClick(Sender: TObject);
begin
   inherited;
   sLocatario := '';

   edtLocatario.Clear;
end;



procedure TcfgRelInadimplenciaLocatario.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de lançamento e o ano de referência/competência
   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);
end;



procedure TcfgRelInadimplenciaLocatario.FormCreate(Sender: TObject);
begin
  inherited;

  // Daniel - 24878
  qrySitContratual.Close;
  qrySitContratual.Open;
  // Fim.

  qryParamOper.Close;
  qryParamOper.Open;

  edDataAtualiza.Date := qryParamOper.FieldByName('DTULTFECH').AsDateTime;
  dDtAtualiza         := edDataAtualiza.Date;
end;

procedure TcfgRelInadimplenciaLocatario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryParamOper.Close;
end;

end.
