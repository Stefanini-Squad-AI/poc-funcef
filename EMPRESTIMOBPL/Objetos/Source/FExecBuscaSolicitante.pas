// Alterações:
{
--------------------------------------------------------------------------------
Pendência   : SOL 160334 KINTANA 1346045
Responsável : Fanuel Junior
Data        : 28/06/2011
Descrição   : Retornada a consulta original alterada pelo SOL160060
--------------------------------------------------------------------------------
Pendência   : SOL 160060 KINTANA 1331758
Responsável : Fanuel Junior
Data        : 21/06/2011
Descrição   : Corrigido o erro de preenchimento da situação do participante na tela de
              Inscrição, provocando erro na busca da margem consignável.
--------------------------------------------------------------------------------
Pendência   : SOL 155043 KINTANA 1196999
Responsável : BRUNO AZEVEDO
Data        : 06/04/2011
Descrição   : Ajuste na query principal e secundario de pesquisa.
--------------------------------------------------------------------------------
Pendência   : SOL 149892 KINTANA 1081368
Responsável : BRUNO AZEVEDO
Data        : 04/01/2011
Descrição   : Ajuste na query secundária de pesquisa.
--------------------------------------------------------------------------------
Pendência   : SOL 148419 Kintana 1042059
Responsável : Fernando Santana
Descrição   : Algumas matriculas não estavam sendo consideradas.
--------------------------------------------------------------------------------
Pendência   : SOL 147712 Kintana 1023925
Responsável : Fernando Santana
Descrição   : query que busca os dados principais está duplicando o resultado
              quando há planos cancelados.
--------------------------------------------------------------------------------
Pendência   : SOL 145348 Kintana 973013
Responsável : Ádler Souza
Data        : 07/10/2010
Descrição   : Ajuste na query a fim de buscar o plano correto.
--------------------------------------------------------------------------------
Pendência   : SOL 119589 Kintana 569493
Responsável : Renato Visoni
Data        : 10/06/2009
Descrição   : Quando o participante tinha 2 beneficios a consulta estava duplicando os registros.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jésica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Rotina    : MontaQueryComum e MontaQueryPrincipal
Data      : 30/04/2008
Pendência : 27803
Autor     : Marchetti
Descrição : Inclusão do join pelo IDTITULAR na BENEFBFCIARIO para evitar duplicidade de registros
            quando o participante for aposentado e pensionista em planos diferentes
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : MontaFiltro
Data      : 06/08/2004
Pendência :
Autor     : André Pontes
Descrição : correção da busca por matrícula da ElegPatro para matrícula da DepenTit
---------------------------------------------------------------------------------------------------}

unit FExecBuscaSolicitante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Db, DBTables, Wwquery, uFuncoesEmptmo;

type
   TfrmExecBuscaSolicitante = class(TFrmOkCancelarImob)
      qryResultado: TwwQuery;
      qryResultadoNOME: TStringField;
      qryResultadoMATRICULA_TIT: TStringField;
      qryResultadoMATRICULA: TStringField;
      qryResultadoINSCRICAO_TIT: TFloatField;
      qryResultadoCPF: TStringField;
      qryResultadoTIPO: TStringField;
      qryResultadoNOME_TIT: TStringField;
      qryResultadoCPF_TIT: TStringField;
      qryResultadoSIT_PART: TStringField;
      qryResultadoSIT_PLANO: TStringField;
      qryResultadoNOME_PATRO: TStringField;
      qryResultadoNOME_PLANO: TStringField;
      qryResultadoC12: TFloatField;
      qryResultadoC13: TFloatField;
      qryResultadoC14: TStringField;
      qryResultadoC15: TStringField;
      qryResultadoC16: TStringField;
      qryResultadoC17: TStringField;
      qryResultadoC18: TStringField;
      qryResultadoC19: TStringField;
      qryResultadoC20: TFloatField;
      qryResultadoC21: TStringField;
      qryResultadoC22: TStringField;
      qryResultadoC23: TFloatField;
      qryResultadoC24: TFloatField;
      qryResultadoC25: TStringField;
      qryResultadoC26: TFloatField;
      qryResultadoC27: TStringField;
      qryResultadoC28: TStringField;
      dsResultado: TDataSource;
      btnOK: TBitBtn;
      PageControl: TPageControl;
      TabSheet1: TTabSheet;
      Panel1: TPanel;
      Label11: TLabel;
      cboPlano: TComboBox;
      edtPlano: TEdit;
      chkPlano: TCheckBox;
      Panel2: TPanel;
      Label10: TLabel;
      cboPatro: TComboBox;
      edtPatro: TEdit;
      chkPatro: TCheckBox;
      Panel3: TPanel;
      Label9: TLabel;
      cboSituacaoPlano: TComboBox;
      edtSitPlano: TEdit;
      chkSitPlano: TCheckBox;
      Panel4: TPanel;
      Label8: TLabel;
      cboSituacaoFund: TComboBox;
      edtSituacao: TEdit;
      chkSitFund: TCheckBox;
      Panel5: TPanel;
      Label7: TLabel;
      cboCPFTIT: TComboBox;
      edtCPFTit: TEdit;
      chkCPFTit: TCheckBox;
      Panel6: TPanel;
      Label6: TLabel;
      cboNomeTitular: TComboBox;
      edtNomeTit: TEdit;
      chkNomeTit: TCheckBox;
      Panel7: TPanel;
      Label5: TLabel;
      cboCPF: TComboBox;
      edtCPF: TEdit;
      chkCPF: TCheckBox;
      Panel8: TPanel;
      Label4: TLabel;
      cboInscricao: TComboBox;
      edtInscricaoPrev: TEdit;
      chkInscricao: TCheckBox;
      Panel9: TPanel;
      Label3: TLabel;
      cboMatricula: TComboBox;
      edtMatricula: TEdit;
      chkMatricula: TCheckBox;
      Panel10: TPanel;
      Label2: TLabel;
      cboMatrTit: TComboBox;
      edtMatrTit: TEdit;
      chkMatrTit: TCheckBox;
      Panel11: TPanel;
      Label1: TLabel;
      cboNome: TComboBox;
      edtNome: TEdit;
      chkNome: TCheckBox;
      TabSheet2: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      qrySituacaoParticipante: TwwQuery;
      qrySituacaoParticipanteFLGINTERNO: TStringField;

      procedure bbtnCancelarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure PageControlChange(Sender: TObject);
      procedure btnOKClick(Sender: TObject);
      procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure bbtnSairClick(Sender: TObject);
      procedure FormShow(Sender: TObject);

   private  // Private declarations

      FRetornouValor : Boolean;
      sSql           : String;

      procedure MontaQueryComum;
      function  MontaQueryPrincipal : Boolean;
      procedure MontaQuerySecundaria;
      function  MontaFiltro : Boolean;
      function  RetornaTabela(sMatricula : String) : String;


   public   // Public declarations

      ValoresChave : array[0..16] of String;
      property RetornouValor : Boolean   read FRetornouValor  write FRetornouValor;


   end;



var
  frmExecBuscaSolicitante: TfrmExecBuscaSolicitante;



implementation
{$R *.DFM}
uses
   USistema, dEmptmo;


procedure TfrmExecBuscaSolicitante.bbtnCancelarClick(Sender: TObject);
begin
   qryResultado.Close;
end;



procedure TfrmExecBuscaSolicitante.bbtnConfirmarClick(Sender: TObject);
begin
   if MontaQueryPrincipal then
   begin
      if qryResultado.IsEmpty then
      begin
         MontaQuerySecundaria;
      end;

      PageControl.ActivePageIndex := 1;
      PageControlChange(Self);

      FRetornouValor := not(qryResultado.IsEmpty);
   end;
end;



procedure TfrmExecBuscaSolicitante.MontaQueryComum;
begin
   sSql :=
   'SELECT '                                                                                                         + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME, '                                            + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                                                                             + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, '''', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA, '                 + #13 +
   '   PPP.INSCRICAONUMERO AS INSCRICAO_TIT, '                                                                       + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF, '                             + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, ''Não Participante'', DEP.IDPESSOA, ''Participante'', ''Dependente'') AS TIPO, '  + #13 +
   '   PEP.NOME AS NOME_TIT, '                                                                                       + #13 +
   '   PEP.NUMDOCUMENTO AS CPF_TIT, '                                                                                + #13 +
   '   SIP.DESCRICAO AS SIT_PART, '                                                                                  + #13 +
   '   SPP.DESCRICAO AS SIT_PLANO, '                                                                                 + #13 +
   '   PPA.NOME AS NOME_PATRO, '                                                                                     + #13 +
   '   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO, '                                                                     + #13 +
   '   DEP.IDPESSOA AS C12, '                                                                                        + #13 +
   '   DEP.IDTITULAR AS C13, '                                                                                       + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS C14, '                                             + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS C15, '                             + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, '''', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS C16, '                       + #13 +
   '   PEP.NOME AS C17, '                                                                                            + #13 +
   '   PEP.NUMDOCUMENTO AS C18, '                                                                                    + #13 +
   '   ELP.MATRICULA AS C19, '                                                                                       + #13 +
   '   PPP.INSCRICAONUMERO AS C20, '                                                                                 + #13 +
   '   PPA.NOME AS C21, '                                                                                            + #13 +
   '   NVL(PLP2.NOME, PLP.NOME) AS C22, '                                                                            + #13 +
   '   ELP.IDPESSJUR AS C23, '                                                                                       + #13 +
   '   NVL(BFC.IDPLANOPREV, PPP.IDPLANOPREV) AS C24, '                                                               + #13 +
   '   SIP.DESCRICAO AS C25, '                                                                                       + #13 +
   '   SIP.IDSITPART AS C26, '                                                                                       + #13 +
   '   SPP.DESCRICAO AS C27, '                                                                                       + #13 +
   '   SIP.FLGINTERNO AS C28 '                                                                                       + #13 +
   'FROM '                                                                                                           + #13;
   {'   PESSOA       PDP, '                                                                                           + #13 +
   '   PESSOA       PEP, '                                                                                           + #13 +
   '   PESSOA       PPA, '                                                                                           + #13 +
   '   DEPENTIT     DEP, '                                                                                           + #13 +
   '   ELEGPATRO    ELP, '                                                                                           + #13 +
   '   PARTPREVPLAN PPP, '                                                                                           + #13 +
   '   PLANPREV     PLP, '                                                                                           + #13 +
   '   PLANPREV     PLP2, '                                                                                          + #13 +
   '   SITPART      SIP, '                                                                                           + #13 +
   '   SITPLANOPREV SPP, '                                                                                           + #13 +
   '   ( '                                                                                                           + #13 +
   '   SELECT DISTINCT '                                                                                             + #13 +
   '      BNF.IDPESSOA, BNF.IDTITULAR, BNF.IDPLANOPREV, BNF.IDPLANOORIGEM  '                                                        + #13 +
   '   FROM '                                                                                                        + #13 +
   '      BENEFBFCIARIO BNF,  '                                                                                      + #13 +
   '      PARTPREVPLAN PRV  '                                                                                        + #13 +
   '   WHERE '                                                                                                       + #13 +
   '          (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)  '                                                  + #13 +
   ' AND BNF.IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO) FROM BENEFBFCIARIO SB1 WHERE BNF.IDPESSOA = SB1.IDPESSOA AND SB1.IDSITBENEFICIO IN (1, 2, 7))' + #13 +
   '      AND BNF.IDTITULAR = PRV.IDPESSOA  '                                                                        + #13 +
   '      AND BNF.IDPLANOORIGEM = PRV.IDPLANOPREV  '                                                                 + #13 +
   '      AND PRV.FLGDESATIVADO  = 0  '                                                                              + #13 +
   '   ) BFC ' + #13;}
end;

function TfrmExecBuscaSolicitante.MontaQueryPrincipal : Boolean;
begin
   Result := True;

   MontaQueryComum;                                                                                

   //BRUNO AZEVEDO SOL 155043 KINTANA 1196999
   sSql := sSql + #13 +
   'ELEGPATRO ELP ' + #13 +
   '    JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA ' + #13 +
   '    JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA ' + #13 +
   '    JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR ' + #13 +
   '                         AND ELP.IDPESSOA = PPP.IDPESSOA ' + #13 +
   '    JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV ' + #13 +
   '    JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART ' + #13 +
   '    JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ' + #13 +
   '    JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA ' + #13 +
   '    JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA ' + #13 +
   '    LEFT JOIN (SELECT DISTINCT BNF.IDPESSOA, ' + #13 +
   '                               BNF.IDTITULAR, ' + #13 +
   '                               BNF.IDPLANOPREV, ' + #13 +
   '                               BNF.IDPLANOORIGEM, ' + #13 +
   '                               BNF.IDPLANPREVCONTAB ' + #13 +
   '                 FROM BENEFBFCIARIO BNF ' + #13 +
   '                WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE) ' + #13 +
   '                  AND BNF.FONTEPAGADORA = 1 ' + #13 +
   '                  AND BNF.IDSITBENEFICIO IN ' + #13 +
   '                      (SELECT MIN(SB1.IDSITBENEFICIO) ' + #13 +
   '                         FROM BENEFBFCIARIO SB1 ' + #13 +
   '                        WHERE BNF.IDPESSOA = SB1.IDPESSOA ' + #13 +
   '                          AND BNF.IDTITULAR = SB1.IDTITULAR ' + #13 +
   '                          AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = ' + #13 +
   '                                                                       DEP.IDPESSOA ' + #13 +
   '                                                                   AND BFC.IDTITULAR = ' + #13 +
   '                                                                       DEP.IDTITULAR ' + #13 +
   '                                                                   AND bfc.Idplanoprev = ppp.idplanoprev ' + #13 +
   '    LEFT JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV ' + #13 +
   '  WHERE dep.idtitular = dep.idpessoa ' + #13 +
   '  AND  (PPP.IDSITPLANOPREV = 25 OR ' + #13 +
   '     PPP.IDPLANOPREV = ' + #13 +
   '     (SELECT MAX(PPP2.IDPLANOPREV) ' + #13 +
   '          FROM PARTPREVPLAN PPP2 ' + #13 +
   '         WHERE PPP2.FLGDESATIVADO = 0 ' + #13 +
   '           AND PPP2.Idsitplanoprev <> 25 ' + #13 +
   '           AND PPP2.IDPESSOA = PPP.IDPESSOA ' + #13 +
   '           AND NOT EXISTS (SELECT 1 ' + #13 +
   '                  FROM PARTPREVPLAN PPP3 ' + #13 +
   '                 WHERE PPP3.IDPESSOA = PPP2.IDPESSOA ' + #13 +
   '                   AND PPP3.IDSITPLANOPREV = 25)))';
   //BRUNO AZEVEDO SOL 155043 KINTANA 1196999

   if not(MontaFiltro) then
   begin
      if MessageDlg('Nenhum filtro foi especificado para a pesquisa. Isso pode levar algum tempo de processamento!. ', mtConfirmation, [mbYes,mbNo],0) = mrNo then
      begin
         Result := False;
         PageControl.ActivePageIndex := 0;
         Exit;
      end;
   end;

   with qryResultado do
   begin
      Sql.Text := sSql;
  //  Jéssica Lana SOL 114575 24/04/2009
  //  Sql.SaveToFile(Sistema.TempDir + 'EP-BuscaSolicitante.txt');
      Sql.SaveToFile(ftempregra + '\' + 'EP-BuscaSolicitante.txt');
      Open;
   end;
end;



procedure TfrmExecBuscaSolicitante.MontaQuerySecundaria;
begin
   MontaQueryComum;

   sSQL := sSQL +
   'ELEGPATRO ELP ' + #13 +
   '   JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA ' + #13 +
   '   JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA ' + #13 +
   '   JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR ' + #13 +
   '                        AND ELP.IDPESSOA = PPP.IDPESSOA ' + #13 +
   '   JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV ' + #13 +
   '   JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART ' + #13 +
   '   JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV ' + #13 +
   '   JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA ' + #13 +
   '   JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA ' + #13 +
   '   JOIN (SELECT DISTINCT BNF.IDPESSOA, ' + #13 +
   '                         BNF.IDTITULAR, ' + #13 +
   '                         BNF.IDPLANOPREV, ' + #13 +
   '                         BNF.IDPLANOORIGEM, ' + #13 +
   '                         BNF.IDPLANPREVCONTAB ' + #13 +
   '           FROM BENEFBFCIARIO BNF ' + #13 +
   '          WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE) ' + #13 +
   '            AND BNF.FONTEPAGADORA = 1 ' + #13 +
   '            AND BNF.IDSITBENEFICIO IN ' + #13 +
   '                     (SELECT MIN(SB1.IDSITBENEFICIO) ' + #13 +
   '                        FROM BENEFBFCIARIO SB1 ' + #13 +
   '                       WHERE BNF.IDPESSOA = SB1.IDPESSOA ' + #13 +
   '                         AND BNF.IDTITULAR = SB1.IDTITULAR ' + #13 +
   '                         AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = ' + #13 +
   '                                                                      DEP.IDPESSOA ' + #13 +
   '                                                                  AND BFC.IDTITULAR = ' + #13 +
   '                                                                      DEP.IDTITULAR ' + #13 +
   '   JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV ' + #13 +
   ' WHERE ((BFC.IDPLANPREVCONTAB = 28 OR ' + #13 +
   '       (BFC.IDPLANPREVCONTAB <> 28) AND NOT EXISTS ' + #13 +
   '       (SELECT 1 ' + #13 +
   '          FROM BENEFBFCIARIO BF ' + #13 +
   '         WHERE (BF.DATAFINAL IS NULL OR BF.DATAFINAL > SYSDATE) ' + #13 +
   '           AND BF.IDPESSOA = BFC.IDPESSOA ' + #13 +
   '           AND BF.IDTITULAR = BFC.IDTITULAR ' + #13 +
   '           AND BF.FONTEPAGADORA = 1 ' + #13 +
   '           AND BF.IDTPPAGTOBENEFIC = 1 ' + #13 +
   '           AND BF.IDPLANPREVCONTAB = 28 ' + #13 +
   '           AND BF.IDSITBENEFICIO IN ' + #13 +
   '               (SELECT MIN(SB1.IDSITBENEFICIO) ' + #13 +
   '                  FROM BENEFBFCIARIO SB1 ' + #13 +
   '                 WHERE BF.IDPESSOA = SB1.IDPESSOA ' + #13 +
   '                   AND BF.IDTITULAR = SB1.IDTITULAR ' + #13 +
   '                   AND SB1.IDSITBENEFICIO IN (1, 2, 7))))) ' + #13 +
   '  AND bfc.idpessoa <> bfc.idtitular ' + #13 +
   '  AND ppp.idplanoprev = (SELECT MAX(PPP2.IDPLANOPREV) ' + #13 +
   '                           FROM PARTPREVPLAN PPP2 ' + #13 +
   '                          WHERE PPP2.IDPESSOA = PPP.IDPESSOA)';
   MontaFiltro;

   with qryResultado do
   begin
      SQL.Text := sSQL;
      Open;
   end;
end;



function TfrmExecBuscaSolicitante.MontaFiltro : Boolean;
var
   sTabela : String;
begin
   Result := False;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   //Pendência 23312 - 25/09/2006 - Alberto
   //Troca de PEP.NOME por PDP.NOME
   if edtNome.Text <> '' then
   begin
      Result := True;

      case cboNome.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkNome.Checked then
            sSql := sSql +  'AND UPPER(PDP.NOME) LIKE ''' + UpperCase(edtNome.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PDP.NOME LIKE ''' + edtNome.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkNome.Checked then
            sSql := sSql +  'AND UPPER(PDP.NOME) LIKE %''' + UpperCase(edtNome.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PDP.NOME LIKE %''' + edtNome.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkNome.Checked then
            sSql := sSql +  'AND UPPER(PDP.NOME) = ' + QuotedStr(UpperCase(edtNome.Text)) + #13
         else
            sSql := sSql +  'AND PDP.NOME = ' + QuotedStr(edtNome.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkNome.Checked then
            sSql := sSql +  'AND UPPER(PDP.NOME) < ' + QuotedStr(UpperCase(edtNome.Text)) + #13
         else
            sSql := sSql +  'AND PDP.NOME < ' + QuotedStr(edtNome.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkNome.Checked then
            sSql := sSql +  'AND UPPER(PDP.NOME) > ' + QuotedStr(UpperCase(edtNome.Text)) + #13
         else
            sSql := sSql +  'AND PDP.NOME > ' + QuotedStr(edtNome.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkNome.Checked then
            sSql := sSql +  'AND UPPER(PDP.NOME) <= ' + QuotedStr(UpperCase(edtNome.Text)) + #13
         else
            sSql := sSql +  'AND PDP.NOME <= ' + QuotedStr(edtNome.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkNome.Checked then
            sSql := sSql +  'AND UPPER(PDP.NOME) >= ' + QuotedStr(UpperCase(edtNome.Text)) + #13
         else
            sSql := sSql +  'AND PDP.NOME >= ' + QuotedStr(edtNome.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   //Fim Pendência 23312

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtMatrTit.Text <> '' then
   begin
      Result := True;

      case cboMatrTit.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkMatrTit.Checked then
            sSql := sSql +  'AND UPPER(ELP.MATRICULA) LIKE ''' + UpperCase(edtMatrTit.Text) + '%''' + #13
         else
            sSql := sSql +  'AND ELP.MATRICULA LIKE ''' + edtMatrTit.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkMatrTit.Checked then
            sSql := sSql +  'AND UPPER(ELP.MATRICULA) LIKE %''' + UpperCase(edtMatrTit.Text) + '%''' + #13
         else
            sSql := sSql +  'AND ELP.MATRICULA LIKE %''' + edtMatrTit.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkMatrTit.Checked then
             sSql := sSql +  'AND UPPER(ELP.MATRICULA) = ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
         else
             sSql := sSql +  'AND ELP.MATRICULA = ' + QuotedStr(edtMatrTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkMatrTit.Checked then
            sSql := sSql +  'AND UPPER(ELP.MATRICULA) < ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
         else
            sSql := sSql +  'AND ELP.MATRICULA < ' + QuotedStr(edtMatrTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkMatrTit.Checked then
            sSql := sSql +  'AND UPPER(ELP.MATRICULA) > ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
         else
            sSql := sSql +  'AND ELP.MATRICULA > ' + QuotedStr(edtMatrTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkMatrTit.Checked then
            sSql := sSql +  'AND UPPER(ELP.MATRICULA) <= ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
         else
            sSql := sSql +  'AND ELP.MATRICULA <= ' + QuotedStr(edtMatrTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkMatrTit.Checked then
            sSql := sSql +  'AND UPPER(ELP.MATRICULA) >= ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
         else
            sSql := sSql +  'AND ELP.MATRICULA >= ' + QuotedStr(edtMatrTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtMatricula.Text <> '' then
   begin
      sTabela := 'DEP';

      Result := True;

      case cboMatricula.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkMatricula.Checked then
            sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) = ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
         else
            sSql := sSql +  'AND ' + sTabela + '.MATRICULA = ' + QuotedStr(edtMatricula.Text) + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkMatricula.Checked then
            sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) LIKE ''' + UpperCase(edtMatricula.Text) + '%''' + #13
         else
            sSql := sSql +  'AND ' + sTabela + '.MATRICULA LIKE ''' + edtMatricula.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkMatricula.Checked then
            sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) LIKE %''' + UpperCase(edtMatricula.Text) + '%''' + #13
         else
            sSql := sSql +  'AND ' + sTabela + '.MATRICULA LIKE %''' + edtMatricula.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkMatricula.Checked then
            sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) < ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
         else
            sSql := sSql +  'AND ' + sTabela + '.MATRICULA < ' + QuotedStr(edtMatricula.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkMatricula.Checked then
            sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) > ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
         else
            sSql := sSql +  'AND ' + sTabela + '.MATRICULA > ' + QuotedStr(edtMatricula.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkMatricula.Checked then
            sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) <= ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
         else
            sSql := sSql +  'AND ' + sTabela + '.MATRICULA <= ' + QuotedStr(edtMatricula.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkMatricula.Checked then
            sSql := sSql +  'AND UPPER(' + sTabela + '.MATRICULA) >= ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
         else
            sSql := sSql +  'AND ' + sTabela + '.MATRICULA >= ' + QuotedStr(edtMatricula.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;  // case cboMatricula.ItemIndex
   end;  // if edtMatricula.Text <> ''

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtInscricaoPrev.Text <> '' then
   begin
      Result := True;

      case cboInscricao.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkInscricao.Checked then
            sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) LIKE ''' + UpperCase(edtInscricaoPrev.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PPP.INSCRICAONUMERO LIKE ''' + edtInscricaoPrev.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkInscricao.Checked then
            sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) LIKE %''' + UpperCase(edtInscricaoPrev.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PPP.INSCRICAONUMERO LIKE %''' + edtInscricaoPrev.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkInscricao.Checked then
             sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) = ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
         else
             sSql := sSql +  'AND PPP.INSCRICAONUMERO = ' + QuotedStr(edtInscricaoPrev.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkInscricao.Checked then
            sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) < ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
         else
            sSql := sSql +  'AND PPP.INSCRICAONUMERO < ' + QuotedStr(edtInscricaoPrev.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkInscricao.Checked then
            sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) > ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
         else
            sSql := sSql +  'AND PPP.INSCRICAONUMERO > ' + QuotedStr(edtInscricaoPrev.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkInscricao.Checked then
            sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) <= ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
         else
            sSql := sSql +  'AND PPP.INSCRICAONUMERO <= ' + QuotedStr(edtInscricaoPrev.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkInscricao.Checked then
            sSql := sSql +  'AND UPPER(PPP.INSCRICAONUMERO) >= ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
         else
            sSql := sSql +  'AND PPP.INSCRICAONUMERO >= ' + QuotedStr(edtInscricaoPrev.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtCPF.Text <> '' then
   begin
      Result := True;

      case cboCPF.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkCPF.Checked then
            sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE ''' + UpperCase(edtCPF.Text) + '%''' + #13
         else
            sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) LIKE ''' + edtCPF.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkCPF.Checked then
            sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE %''' + UpperCase(edtCPF.Text) + '%''' + #13
         else
            sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) LIKE %''' + edtCPF.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkCPF.Checked then
             sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) = ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
         else
             sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) = ' + QuotedStr(edtCPF.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkCPF.Checked then
            sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) < ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
         else
            sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) < ' + QuotedStr(edtCPF.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkCPF.Checked then
            sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) > ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
         else
            sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) > ' + QuotedStr(edtCPF.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkCPF.Checked then
            sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) <= ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
         else
            sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) <= ' + QuotedStr(edtCPF.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkCPF.Checked then
            sSql := sSql +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) >= ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
         else
            sSql := sSql +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) >= ' + QuotedStr(edtCPF.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtNomeTit.Text <> '' then
   begin
      Result := True;

      case cboNomeTitular.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkNomeTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NOME) LIKE ''' + UpperCase(edtNomeTit.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PEP.NOME LIKE ''' + edtNomeTit.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkNomeTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NOME) LIKE %''' + UpperCase(edtNomeTit.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PEP.NOME LIKE %''' + edtNomeTit.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkNomeTit.Checked then
             sSql := sSql +  'AND UPPER(PEP.NOME) = ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
         else
             sSql := sSql +  'AND PEP.NOME = ' + QuotedStr(edtNomeTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkNomeTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NOME) < ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NOME < ' + QuotedStr(edtNomeTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkNomeTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NOME) > ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NOME > ' + QuotedStr(edtNomeTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkNomeTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NOME) <= ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NOME <= ' + QuotedStr(edtNomeTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkNomeTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NOME) >= ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NOME >= ' + QuotedStr(edtNomeTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;  // case cboNomeTitular.ItemIndex
   end;  // if edtNomeTit.Text <> ''

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtCPFTit.Text <> '' then
   begin
      Result := True;

      case cboCPFTIT.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkCPFTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) LIKE ''' + UpperCase(edtCPFTit.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PEP.NUMDOCUMENTO LIKE ''' + edtCPFTit.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkCPFTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) LIKE %''' + UpperCase(edtCPFTit.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PEP.NUMDOCUMENTO LIKE %''' + edtCPFTit.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkCPFTit.Checked then
             sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) = ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
         else
             sSql := sSql +  'AND PEP.NUMDOCUMENTO = ' + QuotedStr(edtCPFTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkCPFTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) < ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NUMDOCUMENTO < ' + QuotedStr(edtCPFTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkCPFTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) > ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NUMDOCUMENTO > ' + QuotedStr(edtCPFTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkCPFTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) <= ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NUMDOCUMENTO <= ' + QuotedStr(edtCPFTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkCPFTit.Checked then
            sSql := sSql +  'AND UPPER(PEP.NUMDOCUMENTO) >= ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
         else
            sSql := sSql +  'AND PEP.NUMDOCUMENTO >= ' + QuotedStr(edtCPFTit.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtSituacao.Text <> '' then
   begin
      Result := True;

      case cboSituacaoFund.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkSitFund.Checked then
            sSql := sSql +  'AND UPPER(SIP.DESCRICAO) LIKE ''' + UpperCase(edtSituacao.Text) + '%''' + #13
         else
            sSql := sSql +  'AND SIP.DESCRICAO LIKE ''' + edtSituacao.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkSitFund.Checked then
            sSql := sSql +  'AND UPPER(SIP.DESCRICAO) LIKE %''' + UpperCase(edtSituacao.Text) + '%''' + #13
         else
            sSql := sSql +  'AND SIP.DESCRICAO LIKE %''' + edtSituacao.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkSitFund.Checked then
            sSql := sSql +  'AND UPPER(SIP.DESCRICAO) = ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SIP.DESCRICAO = ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkSitFund.Checked then
            sSql := sSql +  'AND UPPER(SIP.DESCRICAO) < ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SIP.DESCRICAO < ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkSitFund.Checked then
            sSql := sSql +  'AND UPPER(SIP.DESCRICAO) > ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SIP.DESCRICAO > ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkSitFund.Checked then
            sSql := sSql +  'AND UPPER(SIP.DESCRICAO) <= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SIP.DESCRICAO <= ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkSitFund.Checked then
            sSql := sSql +  'AND UPPER(SIP.DESCRICAO) >= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SIP.DESCRICAO >= ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtSitPlano.Text <> '' then
   begin
      Result := True;

      case cboSituacaoPlano.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkSitPlano.Checked then
            sSql := sSql +  'AND UPPER(SPP.DESCRICAO) LIKE ''' + UpperCase(edtSituacao.Text) + '%''' + #13
         else
            sSql := sSql +  'AND SPP.DESCRICAO LIKE ''' + edtSituacao.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkSitPlano.Checked then
            sSql := sSql +  'AND UPPER(SPP.DESCRICAO) LIKE %''' + UpperCase(edtSituacao.Text) + '%''' + #13
         else
            sSql := sSql +  'AND SPP.DESCRICAO LIKE %''' + edtSituacao.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkSitPlano.Checked then
            sSql := sSql +  'AND UPPER(SPP.DESCRICAO) = ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SPP.DESCRICAO = ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkSitPlano.Checked then
            sSql := sSql +  'AND UPPER(SPP.DESCRICAO) < ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SPP.DESCRICAO < ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkSitPlano.Checked then
            sSql := sSql +  'AND UPPER(SPP.DESCRICAO) > ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SPP.DESCRICAO > ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkSitPlano.Checked then
            sSql := sSql +  'AND UPPER(SPP.DESCRICAO) <= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SPP.DESCRICAO <= ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkSitPlano.Checked then
            sSql := sSql +  'AND UPPER(SPP.DESCRICAO) >= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
         else
            sSql := sSql +  'AND SPP.DESCRICAO >= ' + QuotedStr(edtSituacao.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtPatro.Text <> '' then
   begin
      Result := True;

      case cboPatro.ItemIndex of

         0:
         if chkPatro.Checked then
            sSql := sSql +  'AND UPPER(PPA.NOME) LIKE ''' + UpperCase(edtPatro.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PPA.NOME LIKE ''' + edtPatro.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkPatro.Checked then
            sSql := sSql +  'AND UPPER(PPA.NOME) LIKE %''' + UpperCase(edtPatro.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PPA.NOME LIKE %''' + edtPatro.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkPatro.Checked then
            sSql := sSql +  'AND UPPER(PPA.NOME) = ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
         else
            sSql := sSql +  'AND PPA.NOME = ' + QuotedStr(edtPatro.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkPatro.Checked then
            sSql := sSql +  'AND UPPER(PPA.NOME) < ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
         else
            sSql := sSql +  'AND PPA.NOME < ' + QuotedStr(edtPatro.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkPatro.Checked then
            sSql := sSql +  'AND UPPER(PPA.NOME) > ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
         else
            sSql := sSql +  'AND PPA.NOME > ' + QuotedStr(edtPatro.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkPatro.Checked then
            sSql := sSql +  'AND UPPER(PPA.NOME) <= ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
         else
            sSql := sSql +  'AND PPA.NOME <= ' + QuotedStr(edtPatro.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkPatro.Checked then
            sSql := sSql +  'AND UPPER(PPA.NOME) >= ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
         else
            sSql := sSql +  'AND PPA.NOME >= ' + QuotedStr(edtPatro.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if edtPlano.Text <> '' then
   begin
      Result := True;

      case cboPlano.ItemIndex of

         // ----------------------------------------------------------------------------------------
         0:
         if chkPlano.Checked then
            sSql := sSql +  'AND UPPER(PLP.NOME) LIKE ''' + UpperCase(edtPlano.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PLP.NOME LIKE ''' + edtPlano.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         1:
         if chkPlano.Checked then
            sSql := sSql +  'AND UPPER(PLP.NOME) LIKE %''' + UpperCase(edtPlano.Text) + '%''' + #13
         else
            sSql := sSql +  'AND PLP.NOME LIKE %''' + edtPlano.Text + '%''' + #13;
         // ----------------------------------------------------------------------------------------
         2:
         if chkPlano.Checked then
            sSql := sSql +  'AND UPPER(PLP.NOME) = ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
         else
            sSql := sSql +  'AND PLP.NOME = ' + QuotedStr(edtPlano.Text) + #13;
         // ----------------------------------------------------------------------------------------
         3:
         if chkPlano.Checked then
            sSql := sSql +  'AND UPPER(PLP.NOME) < ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
         else
            sSql := sSql +  'AND PLP.NOME < ' + QuotedStr(edtPlano.Text) + #13;
         // ----------------------------------------------------------------------------------------
         4:
         if chkPlano.Checked then
            sSql := sSql +  'AND UPPER(PLP.NOME) > ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
         else
            sSql := sSql +  'AND PLP.NOME > ' + QuotedStr(edtPlano.Text) + #13;
         // ----------------------------------------------------------------------------------------
         5:
         if chkPlano.Checked then
            sSql := sSql +  'AND UPPER(PLP.NOME) <= ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
         else
            sSql := sSql +  'AND PLP.NOME <= ' + QuotedStr(edtPlano.Text) + #13;
         // ----------------------------------------------------------------------------------------
         6:
         if chkPlano.Checked then
            sSql := sSql +  'AND UPPER(PLP.NOME) >= ' + QuotedStr(UpperCase(edtPlano.Text)) + #13
         else
            sSql := sSql +  'AND PLP.NOME >= ' + QuotedStr(edtPlano.Text) + #13;
         // ----------------------------------------------------------------------------------------
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecBuscaSolicitante.PageControlChange(Sender: TObject);
begin
   inherited;

   bbtnConfirmar.Visible := PageControl.ActivePageIndex = 0;
   btnOK.Visible         := PageControl.ActivePageIndex = 1;

   Application.ProcessMessages;
end;



procedure TfrmExecBuscaSolicitante.btnOKClick(Sender: TObject);
var
   i : Integer;
begin
   for i := 0 to 16 do ValoresChave[i] := '';

   if FRetornouValor then
   begin
      ValoresChave[0]  := qryResultadoC12.AsString;           // IDBEnef
      ValoresChave[1]  := qryResultadoC13.AsString;           // IDPEssoa
      ValoresChave[2]  := qryResultadoNOME.AsString;          // Nome mutuário
      ValoresChave[3]  := qryResultadoCPF.AsString;           // CPF
      ValoresChave[4]  := qryResultadoMATRICULA.AsString;     // Matricula
      ValoresChave[5]  := qryResultadoNOME_TIT.AsString;      // Nome Titular
      ValoresChave[6]  := qryResultadoCPF_TIT.AsString;       // CPF Titular
      ValoresChave[7]  := qryResultadoMATRICULA_TIT.AsString; // Matricula Titular
      ValoresChave[8]  := qryResultadoC20.AsString;           // Inscricao Prev
      ValoresChave[9]  := qryResultadoC21.AsString;           // Nome Patrocinadora
      ValoresChave[10] := qryResultadoC22.AsString;           // Plano Prev
      ValoresChave[11] := qryResultadoC23.AsString;           // IDPatro
      ValoresChave[12] := qryResultadoC24.AsString;           // IDPlanoPrev
      ValoresChave[13] := qryResultadoSIT_PART.AsString;      // Situação Participante
      ValoresChave[14] := qryResultadoC26.AsString;           // IDSitPart
      ValoresChave[15] := '';                                 // Não utilizado
      ValoresChave[16] := qryResultadoC28.AsString;           // FlgInterno
   end;

   FRetornouValor := True;

   //Pendência 27875
      if ( Sistema.IdUsuario = 47891 ) then
   begin
      dtmEmptmo.vBuscaMutuario[0]    := edtNome.Text;
      dtmEmptmo.vBuscaMutuario[1]    := edtMatrTit.Text;
      dtmEmptmo.vBuscaMutuario[2]    := edtMatricula.Text;
      dtmEmptmo.vBuscaMutuario[3]    := edtInscricaoPrev.Text;
      dtmEmptmo.vBuscaMutuario[4]    := edtCPF.Text;
      dtmEmptmo.vBuscaMutuario[5]    := edtNomeTit.Text;
      dtmEmptmo.vBuscaMutuario[6]    := edtCPFTit.Text;
      dtmEmptmo.vBuscaMutuario[7]    := edtSituacao.Text;
      dtmEmptmo.vBuscaMutuario[8]    := edtSitPlano.Text;
      dtmEmptmo.vBuscaMutuario[9]    := edtPatro.Text;
      dtmEmptmo.vBuscaMutuario[10]   := edtPlano.Text;
   end;

   frmExecBuscaSolicitante.Close;
end;



procedure TfrmExecBuscaSolicitante.wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   if Key = VK_RETURN then btnOKClick(Self);
end;



procedure TfrmExecBuscaSolicitante.bbtnSairClick(Sender: TObject);
begin
   FRetornouValor := False;
   QryResultado.Close;
   Close;
end;



procedure TfrmExecBuscaSolicitante.FormShow(Sender: TObject);
begin
   inherited;

   cboNome.ItemIndex          := 0;
   cboMatrTit.ItemIndex       := 0;
   cboMatricula.ItemIndex     := 0;
   cboInscricao.ItemIndex     := 0;
   cboCPF.ItemIndex           := 0;
   cboNomeTitular.ItemIndex   := 0;
   cboCPFTIT.ItemIndex        := 0;
   cboSituacaoFund.ItemIndex  := 0;
   cboSituacaoPlano.ItemIndex := 0;
   cboPatro.ItemIndex         := 0;
   cboPlano.ItemIndex         := 0;

   //Pendência 27875
   if ( Sistema.IdUsuario = 47891 ) then
   begin
      edtNome.Text               := dtmEmptmo.vBuscaMutuario[0];
      edtMatrTit.Text            := dtmEmptmo.vBuscaMutuario[1];
      edtMatricula.Text          := dtmEmptmo.vBuscaMutuario[2];
      edtInscricaoPrev.Text      := dtmEmptmo.vBuscaMutuario[3];
      edtCPF.Text                := dtmEmptmo.vBuscaMutuario[4];
      edtNomeTit.Text            := dtmEmptmo.vBuscaMutuario[5];
      edtCPFTit.Text             := dtmEmptmo.vBuscaMutuario[6];
      edtSituacao.Text           := dtmEmptmo.vBuscaMutuario[7];
      edtSitPlano.Text           := dtmEmptmo.vBuscaMutuario[8];
      edtPatro.Text              := dtmEmptmo.vBuscaMutuario[9];
      edtPlano.Text              := dtmEmptmo.vBuscaMutuario[10];
   end;
end;

function TfrmExecBuscaSolicitante.RetornaTabela(sMatricula : String) : String;
begin
   Result := 'ELP';

   LimpaParametros(qrySituacaoParticipante);
   qrySituacaoParticipante.ParamByName('PMATRICULA').AsString := sMatricula;
   qrySituacaoParticipante.Open;

   if (qrySituacaoParticipante.IsEmpty) or (qrySituacaoParticipanteFLGINTERNO.IsNull) then Result := 'DEP';
end;



end.
