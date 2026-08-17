{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Rotina.............: FiltraImovel
Atender............: WO16764
Data...............: 14/04/2025
Responsável........: Luis Ferrari
Descrição..........: Trocar a consulta pelo
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
Pendência   : 22531
Responsável : Daniel Simões
Data        : 06/06/2006
Descrição   : Passa a utilizar a data de limite de inadimplência na busca dos
              valores de movimentação do documento e validação da data limite
              para pagamento...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelInadimplenciaMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, ExtCtrls, StdCtrls, Mask, wwdbedit, wwdblook,
  Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, fcCombo, fcColorCombo, Wwdbspin, wwdbdatetimepicker,                uCmFileUtils,
  CMDateTimePicker, uModuloImobiliario;
type
  TcfgRelInadimplenciaMestre = class(TcfgRel)
    Label1: TLabel;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataFim: TCMDateTimePicker;
    rdgOrdenacao: TRadioGroup;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    Label4: TLabel;
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

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }
    iImovelMestre : integer;

    function VerificaPreenchimento: boolean;

    procedure FiltraImovel;
    procedure FiltraImovelNovo;   // WO16764 Ferrari
    procedure MontaQuery; override;

  public { Public declarations }
    dDtAtualiza : TDateTime; // Daniel Simões - 29/03/2006 ...
  end;



var
  cfgRelInadimplenciaMestre: TcfgRelInadimplenciaMestre;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
   dRelAdminImobCC, uDiasInUteis, dLookImobiliario, DMS;



function TcfgRelInadimplenciaMestre.VerificaPreenchimento: boolean;
begin
  Result := False;

  try
    // Verifica se a Data de Atualização está preenchida...
    // Daniel Simões - 29/03/2006 ...
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

// CRIAR OUTRO FILTRAIMOVEL NOVO  WO16764


procedure TcfgRelInadimplenciaMestre.FiltraImovel;
var edDataOper : TDateTime; // Daniel Simões - 29/03/2006 ...
    sParamOper : string;    // Daniel Simões - 29/03/2006 ...
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

   // Carrega as variáveis por Daniel Simões - 29/03/2006 ...
   edDataOper := edDataAtualiza.Date;
   sParamOper := '';
   sParamOper := '                     AND ( LO2.DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13;


   with dtmRelAdminImobCC.qryInadimplenciaMestre do begin

      Close;

// Daniel Simões - P: 21815 - 29/03/2006 - Início ------------------------------

      SQL.Text :=
      'SELECT ' + #13 +

      '       IM.IDIMOVEL, IM.IMONOME AS NOME_MESTRE, IM.IMOCODIGO, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Campo Descr_SitContr
      '        SC.DESCRICAO AS DESCR_SITCONTR,  ' + #13 +

      '        ROUND (REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0),2) AS TOT_RECEBER ' + #13 +

      'FROM IMOVEL IM, ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado a Tabela SitContImob
      '     SITCONTIMOB SC,                 ' + #13 +
      '   ( SELECT I.IDIMOVELMESTRE, ' + #13 +

      '            C.FLGTIPOCONTRATO, C.IDSITCONTIMOB, ' +#13+ // Daniel - 24878

      '            SUM( ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '                DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '                ) AS TOT_RECEBER, ' + #13 +
      '            SUM(DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS RECEBIDO ' + #13 +
      '   FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T, CONTRATOIMOVEL C, IMOVEL I,' + #13 +
      '      ( SELECT CODDOCUMENTO, VALOR ' + #13 +
      '        FROM LANCTODOCUM ' + #13 +
      '        WHERE RTRIM(OPERACAO) = ''1'' OR RTRIM(OPERACAO) = ''2'' OR RTRIM(OPERACAO) = ''3'') TRD ' + #13 +

      '   WHERE ' + #13 +
      '         ( LI.CODDOCUMENTO    = D.CODDOCUMENTO ) ' + #13 +
      '     AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) ' + #13 +

      // Vinicius - Ajustes incluidos por analise na CBS 01/11/2006
      '     AND ( LI.FLGESTORNADO IS NULL ) ' + #13 +
      '     AND ( LI.CODDOCUMENTO NOT IN ( SELECT IDDOCUMENTO              ' + #13 +
      '                                      FROM CONCILIADOC              ' + #13 +
      '                                     WHERE FLGTIPO = ''A''          ' + #13 +
      '                                       AND IDPARCFINANCIMOV IS NULL ' + #13 +
      '                                       AND DATA <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) )' + #13 +
      // Fim - Vinicius 01/11/2006

      // Daniel Simões - 22531
      '     AND ( LD.DATALANCTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataLanc) + ''', ''DD/MM/YYYY'') ) ' + #13 +
      // Daniel Simões - Adicionei " OR LI.IDCONTRATOIMOVEL IS NULL e ( LD.ESTORNO IS NULL ) " ...
      '     AND ( C.FLGTIPOCONTRATO = ''L'' OR LI.IDCONTRATOIMOVEL IS NULL ) AND ( LD.ESTORNO IS NULL ) ' + #13 +
      '     AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
      '     AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO ) ' + #13 +
      '     AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL ) ' + #13 +
      '     AND ( LI.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
      '     AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN (T.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON) ' + #13 +
      '     AND LD.DATALANCTO < TO_DATE(''31/12/2004'',''DD/MM/YYYY'') ' + #13 +
      '     AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODDOCUMENTO = LD.CODDOCUMENTO AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')) ) OR (LD.CODALTERADOR <> NVL(T.CODALTMULTA,0) ' + #13 +
      '     AND LD.CODALTERADOR <> NVL(T.CODALTJUROS,0) ' + #13 +
      '     AND LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) ) ' + #13 ;

      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
        SQL.Text := SQL.Text +
        '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) OR ' + #13 +
        '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) )  ' + #13 ;
      end else begin
        SQL.Text := SQL.Text +
        '       AND ( (LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ') AND (LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ') ) ' + #13 ;
      end;

      SQL.Text := SQL.Text +
      '   GROUP BY I.IDIMOVELMESTRE, ' + #13 +

      '            C.FLGTIPOCONTRATO, C.IDSITCONTIMOB ' +#13+ // Daniel - 24878

      ' ) REC_DES ,' + #13 +

      ' ( SELECT I.IDIMOVELMESTRE, ' + #13 +
      '          ROUND( SUM(OP.VLRCORRECAO * LI.VLRLANCRECEB / TOT.VLR_TOTAL), 2) AS VLRCORRECAO ' + #13 +
      '   FROM LANCAMENTOSIMOVEL LI, IMOVEL I, ' + #13 +
      '      ( SELECT CODDOCUMENTO, SUM(VLRLANCRECEB) AS VLR_TOTAL ' + #13 +
      '        FROM LANCAMENTOSIMOVEL ' + #13 +
      '        WHERE IDMODULO = ''64'' ' + #13 +
      '        AND RECPAG = ''R'' ' + #13 +
      '        GROUP BY CODDOCUMENTO   ) TOT, ' + #13 +
      '      ( SELECT LO.CODDOCUMENTO, SUM(LO.VLRACUM) AS VLRCORRECAO ' + #13 +
      '        FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI, ' + #13 +
      '           ( SELECT LO2.CODDOCUMENTO, LO2.IDOPERACAO, MAX(LO2.DATAOPER) AS ULTDIA ' + #13 +
      '             FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2 ' + #13 +
      '             WHERE ( LO2.IDOPERACAO = PI2.IDOPERATUALCM OR LO2.IDOPERACAO = PI2.IDOPERATUALJUROS OR LO2.IDOPERACAO = PI2.IDOPERATUALMULTA ) AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') ' + sParamOper +
      '             GROUP BY LO2.CODDOCUMENTO, LO2.IDOPERACAO ) UD ' + #13 +
      '        WHERE ( LO.IDOPERACAO = PI.IDOPERATUALCM OR LO.IDOPERACAO = PI.IDOPERATUALJUROS OR LO.IDOPERACAO = PI.IDOPERATUALMULTA ) ' + #13 +
      '          AND LO.DATAOPER     = UD.ULTDIA AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') ' + #13 +
      '          AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+) ' + #13 +
      '          AND LO.IDOPERACAO   = UD.IDOPERACAO (+) ' + #13 +
      '        GROUP BY LO.CODDOCUMENTO ) OP ' + #13 +
      '   WHERE LI.CODDOCUMENTO = OP.CODDOCUMENTO ' + #13 +
      '     AND LI.CODDOCUMENTO = TOT.CODDOCUMENTO ' + #13 +
      '     AND LI.IDIMOVEL = I.IDIMOVEL ' + #13 +
      '   GROUP BY I.IDIMOVELMESTRE ) COR ' + #13 +

      'WHERE ' + #13 +
      // SOL: 61969 Kintana: 523506 - Alterado por Arnaldo V. Scarin
      // Foi adicionado o Join entre as tabelas
      '      ( REC_DES.IDSITCONTIMOB      = SC.IDSITCONTIMOB (+) ) AND   ' + #13;

      if edtImovelMestre.Text <> '' then
      SQL.Text := SQL.Text +
      '   ( IM.IDIMOVEL = ' + IntToStr(iImovelMestre) + ' ) AND ';

      SQL.Text := SQL.Text +
      '      ( IM.IDIMOVEL = REC_DES.IDIMOVELMESTRE ) ' + #13 +
      '  AND ( IM.IDIMOVEL = COR.IDIMOVELMESTRE(+) ) ' + #13 ;//+

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
         '  AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) > 0 )  ' + #13;
      end else begin
        SQL.Text := SQL.Text +
         '  AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) <> 0 )  ' + #13;
      end;
        SQL.Text := SQL.Text +
// Daniel Simões - 04/05/2006 - ------------------------------------------------

      'ORDER BY ' + #13 ;

// Daniel Simões - P: 21815 - 29/03/2006 - Fim ---------------------------------
      case rdgOrdenacao.ItemIndex of
         0: SQL.Text := SQL.Text + '   IM.IMONOME ';
         1: SQL.Text := SQL.Text + '   IM.IMOCODIGO ';
         2: SQL.Text := SQL.Text + '   IM.IMOMATRICULA ';
      end;
     SQL.SaveToFile(Sistema.TempDir + 'INADIMPLENCIAMESTRE.TXT');
     Open;

//Felipe de Oliveira  SOL147289 KTN1017104 - Início
     if IsEmpty then
     begin
        if iImovelMestre > 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Text :=
          'SELECT ' + #13 +

          '       IM.IDIMOVEL, IM.IMONOME AS NOME_MESTRE, ' + #13 +
          '       IM.IMOCODIGO,                           ' + #13 +
          '       '' '' AS DESCR_SITCONTR,                ' + #13 +
          '       0 AS TOT_RECEBER                        ' + #13 +
          '       FROM IMOVEL IM                          ' + #13 +
          '       WHERE IM.IDIMOVELMESTRE IS NULL         ' + #13 +
          ' AND IM.IDIMOVEL = ' + IntToStr(iImovelMestre) ;
          Open;
          dtmRelAdminImobCC.ppLabel231.Caption := '"Não há débitos para este Imóvel"';
        end
        else
          dtmRelAdminImobCC.ppLabel231.Caption := '"Não há débitos para este Período"';

        dtmRelAdminImobCC.ppLabel231.Visible := True;
        dtmRelAdminImobCC.ppShape15.Visible := False;
        dtmRelAdminImobCC.ppLabel266.Visible := False;
        dtmRelAdminImobCC.ppDBCalc50.Visible := False;
     end
     else
     begin
        dtmRelAdminImobCC.ppLabel231.Visible := False;
        dtmRelAdminImobCC.ppShape15.Visible := True;
        dtmRelAdminImobCC.ppLabel266.Visible := True;
        dtmRelAdminImobCC.ppDBCalc50.Visible := True;
     end;

//Felipe de Oliveira  SOL147289 KTN1017104 - Fim

   end;
end;



procedure TcfgRelInadimplenciaMestre.MontaQuery;
begin
   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoInadimplImovelM.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoInadimplImovelM.Picture := nil;

      // preenche as labels do relatório
      if ( length(trim(edtDataFim.Text)) > 0 ) then begin
         rptInadimplenciaMestrelblMesCompetencia.Caption := '';
         rptInadimplenciaMestrelblDataLimite.Caption     := edtDataFim.Text;
      end else begin
         rptInadimplenciaMestrelblMesCompetencia.Caption := cboMesCompetencia.Text + ' / ' + FormatFloat('0000', DBspnAnoCompetencia.Value);
         rptInadimplenciaMestrelblDataLimite.Caption     := '';
      end;

// Pendência: 21815
// Daniel Simões - -------------------------------------------------------------

      if ( edDataAtualiza.Text <> '' ) then
           rptInadimplenciaMestrelblDataAtualiza1.Caption := DateToStr(dDtAtualiza)
      else rptInadimplenciaMestrelblDataAtualiza1.Caption := '';

// Daniel Simões - -------------------------------------------------------------

      bSeparador := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;

//   FiltraImovel;    // WO16764 Ferrari
   FiltraImovelNovo;  // WO16764 Ferrari
   
end;



procedure TcfgRelInadimplenciaMestre.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then inherited;
end;



procedure TcfgRelInadimplenciaMestre.FormShow(Sender: TObject);
begin
   inherited;

   cboMesCompetencia.ItemIndex   := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAnoCompetencia.Value     := DiasInUteis.ExtraiAno(Date);

   iImovelMestre  := -1;
end;



procedure TcfgRelInadimplenciaMestre.btnBuscaImovelMestreClick(Sender: TObject);
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



procedure TcfgRelInadimplenciaMestre.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



procedure TcfgRelInadimplenciaMestre.FormCreate(Sender: TObject);
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

procedure TcfgRelInadimplenciaMestre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryParamOper.Close;
end;


// Inicio WO16764 Ferrari
procedure TcfgRelInadimplenciaMestre.FiltraImovelNovo;
var edDataOper : TDateTime;
    sParamOper : string;
    edDataLanc : TDateTime;
    iAnoComp, iMesComp : Integer;
begin
   iAnoComp := trunc(DBspnAnoCompetencia.Value);
   iMesComp := cboMesCompetencia.ItemIndex+1;

   if ( edtDataFim.Date > 0 ) then
     edDataLanc := edtDataFim.Date
   else
     edDataLanc := DiasUteis.UltDiaMes(iAnoComp,iMesComp);

   edDataOper := edDataAtualiza.Date;
   sParamOper := '';
   sParamOper := '                     AND ( LO2.DATAOPER <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edDataOper) + ''', ''DD/MM/YYYY'') ) ' + #13;


   with dtmRelAdminImobCC.qryInadimplenciaMestre do begin

      Close;


      SQL.Text :=
      'SELECT ' + #13 +

      '       A.IDIMOVELMESTRE AS IDIMOVEL,A.NOME_MESTRE,A.IMOCODIGO, A.DESCR_SITCONTR, ' + #13 +
//      '       SUM(A.TOT_RECEBER) AS TOT_RECEBER,SUM(TOT_RECEBIDO) AS TOT_RECEBIDO, ' + #13 +
      '       ROUND (SUM(A.TOT_RECEBER - A.TOT_RECEBIDO)) AS TOT_RECEBER  ' + #13 +
      '   FROM  ' + #13 +
      '   ( SELECT ' + #13 +
      '     I.IDIMOVEL, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
      '     I.IMONOME,          ' + #13 +
      '     IM.IMOCODIGO,        ' + #13 +
      '     I.CODTIPIMOVEL,     ' + #13 +
      '     T.DESCCUSTORECIMO,  ' + #13 +
      '     LI.DATALANCAMENTO, LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +
      '     LI.IDLANCIMOVEL, TA.DESCRICAO, SC.DESCRICAO AS DESCR_SITCONTR, ' + #13 +
      '     D.RECPAG, D.STATUS, D.NODOCUMENTO, D.NUMAPGR,        ' + #13 +
      '     PFC.NOME AS NF_FORCLI, PFC.RAZAOSOCIAL AS RS_FORCLI, ' + #13 +
      '     LD.CODDOCUMENTO, LD.CODALTERADOR, LD.OPERACAO,       ' + #13 +
      '     LD.VALOR,                                            ' + #13 +
      '     LD.DEBCRE, LD.HISTORICOCOMPL, LD.DATALANCTO,         ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ''2'', LI.DATAVENCIMENTO, ''4'', LD.DATALANCTO, DECODE(RP.DATABAIXA, NULL, LD.DATALANCTO, RP.DATABAIXA) ) AS DATA, ' + #13 +
      '     ( ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ' + #13 +
      '     ) AS TOT_RECEBER, ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) AS TOT_RECEBIDO, ' + #13 +
      '     ( ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) ' + #13 +
      '     ) AS TOT_PAGAR, ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0) AS TOT_PAGO, ' + #13 +
      '     ( ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0) - ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''R'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)   ' + #13 +
      '     ) AS SALDO_RECEB, ' + #13 +
      '     ( ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO), ''12'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LI.VLRLANCPAGAR, LI.VLRLANCPAGAR * (-1)), 0), 0) + ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''C'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)  - ' + #13 +
      '     DECODE(RTRIM(LD.OPERACAO),  ''5'', DECODE(D.RECPAG, ''P'', DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCPAGAR / TRD.VALOR, LD.VALOR * (-1) * LI.VLRLANCPAGAR / TRD.VALOR), 0), 0)    ' + #13 +
      '     ) AS SALDO_PAGAR                           ' + #13 +
      '  FROM                                          ' + #13 +
      '     PESSOA PFC,                                ' + #13 +
      '     DOCUMENTO D, LANCTODOCUM LD,               ' + #13 +
      '    ( SELECT CODDOCUMENTO, VALOR                ' + #13 +
      '      FROM LANCTODOCUM                          ' + #13 +
      '     WHERE RTRIM(OPERACAO) = ''1'' OR             ' + #13 +
      '           RTRIM(OPERACAO) = ''2'' OR             ' + #13 +
      '           RTRIM(OPERACAO) = ''3'' OR             ' + #13 +
      '           RTRIM(OPERACAO) = ''12'') TRD,         ' + #13 +
      '     RECBTOPAGTO RP, TIPOALTERADOR TA,          ' + #13 +
      '     IMOVEL I, IMOVEL IM,                       ' + #13 +
      '     TIPOCUSTORECIMOV T, LANCAMENTOSIMOVEL LI,  ' + #13 +
      '     CONTRATOIMOVEL C, SITCONTIMOB SC           ' + #13 +
      '  WHERE ' + #13 ;
      if ( length(trim(edtDataFim.Text)) > 0 ) then
       begin
        SQL.Text := SQL.Text +
        '  ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) OR ' + #13 +
        '    (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_DATE(''' + FormatDateTime('dd/mm/yyyy', edtDataFim.Date) + ''', ''DD/MM/YYYY'')) ) AND ' + #13 ;
       end
      else
       begin
        SQL.Text := SQL.Text +
        '  ( (LI.MESCOMPETENCIA = ' + IntToStr(cboMesCompetencia.ItemIndex + 1) + ') AND (LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAnoCompetencia.Value) + ') ) AND ' + #13 ;
       end;

      if edtImovelMestre.Text <> '' then
       SQL.Text := SQL.Text +
       '   ( I.IDIMOVELMESTRE = ' + IntToStr(iImovelMestre) + ' ) AND ';

      SQL.Text := SQL.Text +

      ' ( I.IDIMOVELMESTRE = IM.IDIMOVEL )  ' + #13 +

      '     AND ( LI.IDIMOVEL = I.IDIMOVEL )                    ' + #13 +
      '     AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )            ' + #13 +
      '     AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )            ' + #13 +
      '     AND ( LD.CODDOCUMENTO = RP.CODDOCUMENTO(+) )        ' + #13 +
      '     AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )           ' + #13 +
      '     AND ( LD.NUMLANCTO = RP.NUMLANCTO(+) )              ' + #13 +
      '     AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) )        ' + #13 +
      '     AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )  ' + #13 +
      '     AND ( D.IDFORCLI = PFC.IDPESSOA(+) )                ' + #13 +
      '     AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )    ' + #13 +
      '     AND ( C.IDSITCONTIMOB      = SC.IDSITCONTIMOB (+) ) ' + #13 ;



     if (dbCboSituacaoContratual.LookupValue<>'') then
       SQL.Text := SQL.Text+'   AND ( C.IDSITCONTIMOB = '+QuotedStr(dbCboSituacaoContratual.LookupValue)+' ) ';

     if (cbLocacao.Checked) and not (cbConfissao.Checked) then
       SQL.Text := SQL.Text+'   AND ( C.FLGTIPOCONTRATO = ''L'' ) ';

     if (cbConfissao.Checked) and not (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( C.FLGTIPOCONTRATO = ''D'' ) ';

     if (cbConfissao.Checked) and (cbLocacao.Checked) then
       SQL.Text := SQL.Text+'   AND ( C.FLGTIPOCONTRATO IN(''L'',''D'') ) ';

     SQL.Text := SQL.Text+' ) A ' + #13 +
     '  GROUP BY A.IDIMOVELMESTRE,A.NOME_MESTRE,A.DESCR_SITCONTR,A.IMOCODIGO   ' + #13;
{
     if ChkVlrPositivo.Checked then begin
       SQL.Text := SQL.Text +
        '  AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) > 0 )  ' + #13;
     end else begin
       SQL.Text := SQL.Text +
        '  AND ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - NVL(REC_DES.RECEBIDO,0) ),2) <> 0 )  ' + #13;
     end;
}
     SQL.SaveToFile(Sistema.TempDir + 'INADIMPLENCIAMESTRENOVO.TXT');
     Open;

{     if IsEmpty then
     begin
        if iImovelMestre > 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Text :=
          'SELECT ' + #13 +

          '       IM.IDIMOVEL, IM.IMONOME AS NOME_MESTRE, ' + #13 +
          '       IM.IMOCODIGO,                           ' + #13 +
          '       '' '' AS DESCR_SITCONTR,                ' + #13 +
          '       0 AS TOT_RECEBER                        ' + #13 +
          '       FROM IMOVEL IM                          ' + #13 +
          '       WHERE IM.IDIMOVELMESTRE IS NULL         ' + #13 +
          ' AND IM.IDIMOVEL = ' + IntToStr(iImovelMestre) ;
          Open;
          dtmRelAdminImobCC.ppLabel231.Caption := '"Não há débitos para este Imóvel"';
        end
        else
          dtmRelAdminImobCC.ppLabel231.Caption := '"Não há débitos para este Período"';

        dtmRelAdminImobCC.ppLabel231.Visible := True;
        dtmRelAdminImobCC.ppShape15.Visible := False;
        dtmRelAdminImobCC.ppLabel266.Visible := False;
        dtmRelAdminImobCC.ppDBCalc50.Visible := False;
     end
     else
     begin
        dtmRelAdminImobCC.ppLabel231.Visible := False;
        dtmRelAdminImobCC.ppShape15.Visible := True;
        dtmRelAdminImobCC.ppLabel266.Visible := True;
        dtmRelAdminImobCC.ppDBCalc50.Visible := True;
     end;
}
   end;

end;

end.
