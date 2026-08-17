{
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
}
//------------------------------------------------------------------------------
//Pendência   : SOL 208708 Kintana 2015644
//Responsável : William Moreira da Silva
//Data        : 04/06/2013
//Descrição   : Recompilação para melhora no desempenho
//------------------------------------------------------------------------------
//Pendência   : SOL 207995 Kintana 2010105
//Responsável : Otacilio Aquino
//Data        : 27/05/2013
  //Descrição   : Retirar alterações do SOL 206204 e SOL 201440
//------------------------------------------------------------------------------
//Pendência   : SOL 207206 Kintana 2002016
//Responsável : William Moreira da Silva
//Data        : 14/05/2013
//Descrição   : Contratos aparecim duplicados nas consultas
//------------------------------------------------------------------------------
//Pendência   : SOL 206204 Kintana 1995909
//Responsável : William Moreira da Silva
//Data        : 06/05/2013
//Descrição   : Informações do contrato 300000180081 não estavam sendo exibidas
//------------------------------------------------------------------------------
//Pendência   : SOL 205300 Kintana 1986077
//Responsável : Otacilio Aquino
//Data        : 19/02/2013
//Descrição   : Inconsistência na busca de informações de contrato concedidos
//              pela internet através do conector web
//------------------------------------------------------------------------------
//Pendência   : SOL 204839 Kintana 1981463
//Responsável : Otacilio Aquino
//Data        : 15/02/2013
//Descrição   : Inconsistência na busca de informações de contrato concedidos
//              pela internet através do conector web
//------------------------------------------------------------------------------
//Pendência   : SOL 201440 Kintana 1947640
//Responsável : Thiago Melo
//Data        : 28/02/2013
//Descrição   : Inconsistência na busca de informações de contrato através da
//              matrícula 1212
//------------------------------------------------------------------------------
//Pendência   : SOL 151886 Kintana 1120287
//Responsável : Fanuel Junior
//Data        : 28/01/2011
//Descrição   : Corrigido o erro "IS NOT A VALID FLOATING POINT VALUE" ao
//fechar a tela de SELECIONAR
//------------------------------------------------------------------------------
//Pendência   : SOL 140062 KINTANA 873341
//Responsável : Ádler Souza
//Data        : 20/07/2010
//Descrição   : Ao invés de utilizar a condição FLGDESATIVADO, utilizar join
//              entre a contratoemptmo e a partprevplan.
//------------------------------------------------------------------------------
//Pendência   : SOL 121503 Kintana 586687
//Responsável : Ádler Teodoro de Souza
//Data        : 08/07/2009
//Descrição   : Alteração na Cláusula WHERE conforme solicitado.
//------------------------------------------------------------------------------
//Pendência   : SOL 114575 KINTANA 535771
//Responsável : Jésica Lana
//Data        : 24/04/2009
//Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
//------------------------------------------------------------------------------
//Autor(a)    :  Jéssica Lana
//Data        :  26/02/2009
//Pendência   :  SOL 109421 KINTANA 496332
//Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
unit FExecBuscaContrato;
{
// Alterações:
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: MontaQueryPrincipal
N. Sol..........: 117071
N. Kintana......: 550995
Data............: 15/05/2009
Responsável.....: Renato Visoni
Descrição.......: Para participantes com todos os planos destavidas (PARTPREVPLAN com FLGDESATIVADO = 1)
a tela de consulta contratos e parcelas não retorna nenhum contrato
}


interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   Db, DBTables, Wwquery, uFuncoesEmptmo;

type
   TOperacao = (opNada, opSair);
   TfrmExecBuscaContrato = class(TFrmOkCancelarImob)
      PageControl: TPageControl;
      TabSheet1: TTabSheet;
      Panel1: TPanel;
      Label11: TLabel;
      cboContrato: TComboBox;
      edtContrato: TEdit;
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
      edtCpf: TEdit;
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
      btnOK: TBitBtn;
      qryResultado: TwwQuery;
      qryResultadoNOME: TStringField;
      qryResultadoMATRICULA_TIT: TStringField;
      qryResultadoMATRICULA: TStringField;
      qryResultadoTIPO: TStringField;
      qryResultadoINSCRICAO_TIT: TFloatField;
      qryResultadoCPF: TStringField;
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
      qryResultadoIDCONTRATOEMPTMO: TFloatField;
      qryResultadoDATAASSINATURA: TDateTimeField;
      qryResultadoDATACREDITO: TDateTimeField;
      qryResultadoSIT_CONTRATO: TStringField;
      qryResultadoTCEDESCRICAO: TStringField;
      qryResultadoDESCTIPOEMPTMO: TStringField;
      qrySituacaoParticipante: TwwQuery;
      qrySituacaoParticipanteFLGINTERNO: TStringField;
      qryResultadoIDTIPOCONTREMPTMO: TFloatField;
      Panel12: TPanel;
      Label12: TLabel;
      cboInternet: TComboBox;
      edtInternet: TEdit;
      chkInternet: TCheckBox;
      qryResultadoFLGINTERNET: TStringField;

      procedure bbtnCancelarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure PageControlChange(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure btnOKClick(Sender: TObject);
      procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private  // Private declarations

      FRetornouValor : Boolean;
      sSQL           : String;

      procedure MontaQueryComum;
      function  MontaQueryPrincipal : Boolean;
      procedure MontaQuerySecundaria;
      function  MontaFiltro : Boolean;
      function  RetornaTabela(sMatricula : String) : String;


   public   // Public declarations

      ValoresChave : array[0..5] of String;
      Filtro       : String;
      Tabelas      : String;

      property RetornouValor : Boolean   read FRetornouValor  write FRetornouValor;

   end;



var
  frmExecBuscaContrato: TfrmExecBuscaContrato;
  Operacao : TOperacao;


implementation
{$R *.DFM}
uses
   uSistema, dEmptmo;

procedure TfrmExecBuscaContrato.bbtnCancelarClick(Sender: TObject);
begin
   qryResultado.Close;
   Operacao := opNada;
end;

procedure TfrmExecBuscaContrato.bbtnConfirmarClick(Sender: TObject);
begin
   if MontaQueryPrincipal then
   begin
      if qryResultado.IsEmpty then MontaQuerySecundaria;

      PageControl.ActivePageIndex := 1;
      PageControlChange(Self);
      FRetornouValor := not(qryResultado.IsEmpty);
   end;
end;

procedure TfrmExecBuscaContrato.MontaQueryComum;
begin
   sSQL :=
   'SELECT '                                                      + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                    + #13 +
   '   CON.DATAASSINATURA, CON.DATACREDITO,  '                    + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                   + #13 +
   '   TCE.TCEDESCRICAO, TEP.DESCTIPOEMPTMO, '                    + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                          + #13 +
   '   PPP.INSCRICAONUMERO AS INSCRICAO_TIT, '                    + #13 +

   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME, '                                            + #13 +
   // SOL 207995 KTN 2010105 Otacilio ** INICIO **
   //William Moreira da Silva - SOL 206204 KTN 1995909

   '   DECODE(DEP.IDTITULAR, NULL, ELP.MATRICULA, DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA, '        + #13 +


   //'   NVL(DECODE(DEP.IDTITULAR, NULL, ELP.MATRICULA, DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA), ELP.MATRICULA) AS MATRICULA, '        + #13 +
   //William Moreira da Silva - SOL 206204 KTN 1995909
   // SOL 207995 KTN 2010105 Otacilio ** FIM **
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF, '                             + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, ''Não Participante'', DEP.IDPESSOA, ''Participante'', ''Dependente'') AS TIPO, '  + #13 +

   '   DECODE(CON.FLGSITUACAO, ''A'', ''ATIVO'', ''E'', ''ENCERRADO'', ''J'', ''EM COBRANÇA JURÍDICA'', ''K'', ''EM QUITAÇÃO'', ''Q'', ''QUITADO'', ''R'', ''RENOVADO'',''C'',''CANCELADO'') AS SIT_CONTRATO, ' + #13 +

   '   PEP.NOME AS NOME_TIT, '                                          + #13 +
   '   PEP.NUMDOCUMENTO AS CPF_TIT, '                                   + #13 +
   '   SIP.DESCRICAO AS SIT_PART, '                                     + #13 +
   '   SPP.DESCRICAO AS SIT_PLANO, '                                    + #13 +
   '   PPA.NOME AS NOME_PATRO, '                                        + #13 +
   '   PLP.NOME AS NOME_PLANO, '                                        + #13 +
   // SOL 205300 KTN 1986077 ** Inicio **
   // SOL 204839 KTN 1981463 ** Inicio **
   //'   DECODE( INS.FLGINTERNET, 1,''Sim'', ''Não'' ) as FLGINTERNET, ' + #13 +
   '   DECODE(DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET, INS.FLGINTERNET), 1, ''Sim'', ''Não'') AS FLGINTERNET, ' + #13 +
   // SOL 204839 KTN 1981463 ** Fim **
   // SOL 205300 KTN 1986077 ** Fim **
   '   DEP.IDPESSOA AS C12, '                                           + #13 +
   '   DEP.IDTITULAR AS C13, '                                          + #13 +

   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS C14, '                        + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS C15, '        + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, '''', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS C16, '  + #13 +

   '   PEP.NOME AS C17, '                                         + #13 +
   '   PEP.NUMDOCUMENTO AS C18, '                                 + #13 +
   '   ELP.MATRICULA AS C19, '                                    + #13 +
   '   PPP.INSCRICAONUMERO AS C20, '                              + #13 +
   '   PPA.NOME AS C21, '                                         + #13 +
   '   PLP.NOME AS C22, '                                         + #13 +
   '   ELP.IDPESSJUR AS C23, '                                    + #13 +
   '   CON.IDPLANOPREV AS C24, '                                  + #13 +
   '   SIP.DESCRICAO AS C25, '                                    + #13 +
   '   SIP.IDSITPART AS C26, '                                    + #13 +
   '   SPP.DESCRICAO AS C27, '                                    + #13 +
   '   SIP.FLGINTERNO AS C28 '                                    + #13 +

   'FROM '                                                        + #13 +
   '   PESSOA          PDP, '                                     + #13 +
   '   PESSOA          PEP, '                                     + #13 +
   '   PESSOA          PPA, '                                     + #13 +
   '   DEPENTIT        DEP, '                                     + #13 +

   //'   DEPENTIT        DEP1, '                                    + #13 +//William Moreira da Silva - SOL 206204 KTN 1995909
   //William Moreira da Silva - SOL 207206 KTN 2002016

   '   ELEGPATRO       ELP, '                                     + #13 +
   '   PARTPREVPLAN    PPP, '                                     + #13 +
   '   PLANPREV        PLP, '                                     + #13 +
   '   SITPART         SIP, '                                     + #13 +
   '   SITPLANOPREV    SPP, '                                     + #13 +
   '   CONTRATOEMPTMO  CON, '                                     + #13 +
   '   TIPOCONTREMPTMO TCE, '                                     + #13 +
   '   TIPOEMPTMO      TEP, '                                     + #13 +
   '   INSCRICAOEMPTMO INS  '                                     + #13 ;

   if Tabelas <> '' then
      sSQL := sSQL + Tabelas;
end;



function TfrmExecBuscaContrato.MontaQueryPrincipal : Boolean;
begin
   Result := True;

   MontaQueryComum;

   sSQL := sSQL +
   'WHERE '                                                       + #13 +
   '       ELP.IDPESSOA          = PEP.IDPESSOA '                 + #13 +
   '   AND ELP.IDPESSJUR         = PPA.IDPESSOA '                 + #13 +
   '   AND ELP.IDPESSJUR         = PPP.IDPESSJUR '                + #13 +
   '   AND ELP.IDPESSOA          = PPP.IDPESSOA '                 + #13 +
   '   AND ELP.IDPESSOA          = DEP.IDTITULAR '                + #13 +
   '   AND DEP.IDPESSOA          = PDP.IDPESSOA '                 + #13 +
   '   AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '              + #13 +
   '   AND PPP.IDSITPART         = SIP.IDSITPART '                + #13 +
   '   AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '           + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '        + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO  '            + #13 +
   '   AND CON.IDBENEF           = PDP.IDPESSOA '                 + #13 +
   '   AND CON.IDPESSOA          = PEP.IDPESSOA '                 + #13 +
   '   AND CON.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO '        + #13 +
   //Ádler Souza - SOL N° 121503 KTN N°586687 - Início

   {   //Renato Visoni SOL 117071 Kintana 550995
   ' AND (PPP.FLGDESATIVADO    = 0'                               + #13 +
   '     OR (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1'      + #13 +
   '                                                 FROM partprevplan ppp1'+ #13 +
   '                                                WHERE ppp1.idpessoa = ppp.idpessoa'+ #13 +
   '                                                  AND ppp1.flgdesativado = 0)'+ #13 +
   '                               AND (ppp.idsitplanoprev = 25 OR'+ #13 +
   '                                   (ppp.idsitplanoprev <> 25 AND ppp.datacancelamento = (SELECT MAX(ppp1.datacancelamento)'+ #13 +
   '                                                                                         FROM partprevplan ppp1'+ #13 +
   '                                                                                         WHERE ppp1.idpessoa = ppp.idpessoa)'+ #13 +
   '                                                             AND NOT EXISTS (SELECT 1'+ #13 +
   '                                                                             FROM partprevplan ppp1'+ #13 +
   '                                                                             WHERE ppp1.idpessoa = ppp.idpessoa'+ #13 +
   '                                                                             AND ppp1.idsitplanoprev = 25)))))';
   //Renato Visoni SOL 117071 Kintana 550995 }

   {'     AND (PPP.FLGDESATIVADO  = 0'+ #13 +
   '     OR'+ #13 +
   '    (PPP.FLGDESATIVADO = 1 AND NOT EXISTS (SELECT 1 FROM partprevplan ppp1'              + #13 +
   '                                           WHERE ppp1.idpessoa = ppp.idpessoa'           + #13 +
   '                                             AND ppp1.flgdesativado = 0)'                + #13 +
   '                           AND (ppp.idsitplanoprev = 25'                                 + #13 +
   '                                OR'                                                      + #13 +
   '                               (ppp.idplanoprev = (select max(ppp1.idplanoprev) from partprevplan ppp1'                + #13 +
   '                                                   where ppp1.idpessoa = ppp.idpessoa'                                 + #13 +
   '                                                   and   ppp1.datacancelamento = (SELECT MAX(ppp2.datacancelamento)'   + #13 +
   '                                                                                  FROM partprevplan ppp2'              + #13 +
   '                                                                                  WHERE ppp2.idpessoa = ppp1.idpessoa)'+ #13 +
   '                                                   and   not exists (select 1 from partprevplan ppp2'                  + #13 +
   '                                                                     where ppp2.idpessoa = ppp1.idpessoa'              + #13 +
   '                                                                     and   ppp2.idsitplanoprev = 25))))))'             + #13;}

//Ádler Souza - SOL N° 121503 KTN N°586687 - Fim

//Ádler Souza - SOL 140062 KINTANA 873341
   '          AND (ppp.idplanoprev = '                                           + #13 +
   '        (SELECT MAX(ppp2.idplanoprev) '                                      + #13 +
   '          FROM partprevplan ppp2 '                                           + #13 +
   '         WHERE ppp2.flgdesativado = 0 '                                      + #13 +
   '           AND ppp2.idpessoa = ppp.idpessoa) OR '                            + #13 +
   '        (PPP.FLGDESATIVADO = 1 AND NOT EXISTS '                              + #13 +
   '        (SELECT 1 '                                                          + #13 +
   '           FROM partprevplan ppp1 '                                          + #13 +
   '          WHERE ppp1.idpessoa = ppp.idpessoa '                               + #13 +
   '            AND ppp1.flgdesativado = 0) AND '                                + #13 +
   '        (ppp.idsitplanoprev = 25 OR '                                        + #13 +
   '        (ppp.idplanoprev = '                                                 + #13 +
   '        (SELECT MAX(ppp1.idplanoprev)'                                       + #13 +
   '             FROM partprevplan ppp1 '                                        + #13 +
   '            WHERE ppp1.idpessoa = ppp.idpessoa '                             + #13 +
   '              AND nvl(ppp1.datacancelamento, TRIM(SYSDATE)) = '              + #13 +
   '                  (SELECT nvl(MAX(ppp2.datacancelamento), TRIM(SYSDATE)) '   + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa) '                   + #13 +
   '              AND NOT EXISTS (SELECT 1 '                                     + #13 +
   '                     FROM partprevplan ppp2 '                                + #13 +
   '                    WHERE ppp2.idpessoa = ppp1.idpessoa '                    + #13 +
   '                      AND ppp2.idsitplanoprev = 25)))))) '                   + #13;

//Fim - Ádler Souza - SOL 140062 KINTANA 873341

   if Filtro <> '' then sSQL := sSQL + Filtro + ' ' + #13;

   if not(MontaFiltro) then
   begin
      if MessageDlg('Nenhum filtro foi especificado para a pesquisa. Isso pode levar algum tempo de processamento!. ', mtConfirmation, [mbYes,mbNo],0) = mrNo then
      begin
         Result := False;
         PageControl.ActivePageIndex := 0;
         Exit;
      end;
   end;

   sSQL := sSQL +
   'ORDER BY '                                                                                                    + #13 +
   '   DECODE(CON.FLGSITUACAO, ''A'', ''A'', ''K'', ''B'', ''E'', ''C'', ''Q'', ''D'', ''C'', ''Z'', ''Y''), '    + #13 +
   '   CON.DATACREDITO DESC ';

   with qryResultado do
   begin
      SQL.Text := sSQL;
   // Jéssica Lana SOL 114575 24/04/2009
   // SQL.SaveToFile(Sistema.TempDir + 'EP-BuscaContrato.txt');
      SQL.SaveToFile(ftempregra + '\' + 'EP-BuscaContrato.txt');
      Open;
   end;
end;

procedure TfrmExecBuscaContrato.MontaQuerySecundaria;
begin
   //William Moreira da Silva - SOL 207206 KTN 2002016 - INICIO
   MontaQueryComum;
   // SOL 207995 KTN 2010105
   { sSQL := 'SELECT '                                             + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                    + #13 +
   '   CON.DATAASSINATURA, CON.DATACREDITO,  '                    + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                   + #13 +
   '   TCE.TCEDESCRICAO, TEP.DESCTIPOEMPTMO, '                    + #13 +
   '   ELP.MATRICULA AS MATRICULA_TIT, '                          + #13 +
   '   PPP.INSCRICAONUMERO AS INSCRICAO_TIT, '                    + #13 +

   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME, '                                            + #13 +
   //William Moreira da Silva - SOL 206204 KTN 1995909
   '   DECODE(DEP.IDTITULAR, NULL, ELP.MATRICULA, DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA, '        + #13 +
   //'   NVL(DECODE(DEP.IDTITULAR, NULL, ELP.MATRICULA, DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA), ELP.MATRICULA) AS MATRICULA, '        + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, ELP.MATRICULA, DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA, '        + #13 +
   //SOL 207995 KTN 2010105
   //William Moreira da Silva - SOL 206204 KTN 1995909
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF, '                             + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, ''Não Participante'', DEP.IDPESSOA, ''Participante'', ''Dependente'') AS TIPO, '  + #13 +

   '   DECODE(CON.FLGSITUACAO, ''A'', ''ATIVO'', ''E'', ''ENCERRADO'', ''J'', ''EM COBRANÇA JURÍDICA'', ''K'', ''EM QUITAÇÃO'', ''Q'', ''QUITADO'', ''R'', ''RENOVADO'',''C'',''CANCELADO'') AS SIT_CONTRATO, ' + #13 +

   '   PEP.NOME AS NOME_TIT, '                                          + #13 +
   '   PEP.NUMDOCUMENTO AS CPF_TIT, '                                   + #13 +
   '   SIP.DESCRICAO AS SIT_PART, '                                     + #13 +
   '   SPP.DESCRICAO AS SIT_PLANO, '                                    + #13 +
   '   PPA.NOME AS NOME_PATRO, '                                        + #13 +
   '   PLP.NOME AS NOME_PLANO, '                                        + #13 +
   // SOL 205300 KTN 1986077 ** Inicio **
   // SOL 204839 KTN 1981463 ** Inicio **
   //'   DECODE( INS.FLGINTERNET, 1,''Sim'', ''Não'' ) as FLGINTERNET, ' + #13 +
   '   DECODE(DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET, INS.FLGINTERNET), 1, ''Sim'', ''Não'') AS FLGINTERNET, ' + #13 +
   // SOL 204839 KTN 1981463 ** Fim **
   // SOL 205300 KTN 1986077 ** Fim **
   '   DEP.IDPESSOA AS C12, '                                           + #13 +
   '   DEP.IDTITULAR AS C13, '                                          + #13 +

   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS C14, '                        + #13 +
   '   DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS C15, '        + #13 +
   '   DECODE(DEP.IDTITULAR, NULL, '''', DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS C16, '  + #13 +

   '   PEP.NOME AS C17, '                                         + #13 +
   '   PEP.NUMDOCUMENTO AS C18, '                                 + #13 +
   '   ELP.MATRICULA AS C19, '                                    + #13 +
   '   PPP.INSCRICAONUMERO AS C20, '                              + #13 +
   '   PPA.NOME AS C21, '                                         + #13 +
   '   PLP.NOME AS C22, '                                         + #13 +
   '   ELP.IDPESSJUR AS C23, '                                    + #13 +
   '   CON.IDPLANOPREV AS C24, '                                  + #13 +
   '   SIP.DESCRICAO AS C25, '                                    + #13 +
   '   SIP.IDSITPART AS C26, '                                    + #13 +
   '   SPP.DESCRICAO AS C27, '                                    + #13 +
   '   SIP.FLGINTERNO AS C28 '                                    + #13 +

   'FROM '                                                        + #13 +
   '   PESSOA          PDP, '                                     + #13 +
   '   PESSOA          PEP, '                                     + #13 +
   '   PESSOA          PPA, '                                     + #13 +
   '   DEPENTIT        DEP, '                                     + #13 +

   //'   DEPENTIT        DEP1, '                                    + #13 +//William Moreira da Silva - SOL 206204 KTN 1995909
   // SOL 207995 KTN 2010105

   '   ELEGPATRO       ELP, '                                     + #13 +
   '   PARTPREVPLAN    PPP, '                                     + #13 +
   '   PLANPREV        PLP, '                                     + #13 +
   '   SITPART         SIP, '                                     + #13 +
   '   SITPLANOPREV    SPP, '                                     + #13 +
   '   CONTRATOEMPTMO  CON, '                                     + #13 +
   '   TIPOCONTREMPTMO TCE, '                                     + #13 +
   '   TIPOEMPTMO      TEP, '                                     + #13 +
   '   INSCRICAOEMPTMO INS  '                                     + #13 ;
   //William Moreira da Silva - SOL 207206 KTN 2002016 - FIM}
   // SOL 207995 KTN 2010105

   sSQL := sSQL +
   'WHERE '                                                       + #13 +
   '       ELP.IDPESSOA          = PEP.IDPESSOA '                 + #13 +
   '   AND ELP.IDPESSJUR         = PPA.IDPESSOA '                 + #13 +
   '   AND ELP.IDPESSJUR         = PPP.IDPESSJUR(+) '             + #13 +
   '   AND ELP.IDPESSOA          = PPP.IDPESSOA(+) '              + #13 +
   '   AND ELP.IDPESSOA          = DEP.IDTITULAR(+) '             + #13 +

   // SOL 207995 KTN 2010105 Otacilio ** Inicio **

   '   AND DEP.IDPESSOA          = PDP.IDPESSOA(+) '              + #13 +

   //'   AND DEP1.IDPESSOA(+)          = PDP.IDPESSOA '              + #13 +
   //William Moreira da Silva - SOL 206204 KTN 1995909
   // SOL 207995 KTN 2010105 Otacilio ** Fim **

   '   AND CON.IDPLANOPREV       = PLP.IDPLANOPREV(+) '           + #13 +
   '   AND PPP.IDSITPART         = SIP.IDSITPART(+) '             + #13 +
   '   AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV(+) '        + #13 +
   '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '        + #13 +
   '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '             + #13 +
   '   AND CON.IDBENEF           = PDP.IDPESSOA '                 + #13 +
   '   AND CON.IDPESSOA          = PEP.IDPESSOA '                 + #13 +
   '   AND CON.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO '        + #13 +   

   '   AND PPP.FLGDESATIVADO     = 0 '                            + #13;

   if Filtro <> '' then sSQL := sSQL + Filtro + ' ' + #13;

   MontaFiltro;

   sSQL := sSQL +
   'ORDER BY '                                                                                                    + #13 +
   '   DECODE(CON.FLGSITUACAO, ''A'', ''A'', ''K'', ''B'', ''E'', ''C'', ''Q'', ''D'', ''C'', ''Z'', ''Y''), '    + #13 +
   '   CON.DATACREDITO DESC ';

   with qryResultado do
   begin
      SQL.Text := sSQL;
      Open;
   end;
end;

function TfrmExecBuscaContrato.MontaFiltro : Boolean;
var
   sTabela : String;
begin
   Result := False;

   // Marchetti - pendencia 26499
   // Alterado de PEP.NOME para PDP.NOME, pois quando se informa o nome, não pode ser o nome ligado diretamente
   // a ELEGPATRO, mas sim a DEPENTIT 
   if trim(edtNome.Text) <> EmptyStr then
   begin
      Result := True;

      case cboNome.ItemIndex of

         0: if chkNome.Checked then
               sSQL := sSQL +  'AND UPPER(PDP.NOME) LIKE ''' + UpperCase(edtNome.Text) + '%''' + #13
            else
               sSQL := sSQL +  'AND PDP.NOME LIKE ''' + edtNome.Text + '%''' + #13;

         1: if chkNome.Checked then
               sSQL := sSQL +  'AND UPPER(PDP.NOME) LIKE ''%' + UpperCase(edtNome.Text) + '%''' + #13
            else
               sSQL := sSQL +  'AND PDP.NOME LIKE ''%' + edtNome.Text + '%''' + #13;

         2: if chkNome.Checked then
               sSQL := sSQL +  'AND UPPER(PDP.NOME) = ' + QuotedStr(UpperCase(edtNome.Text)) + #13
            else
               sSQL := sSQL +  'AND PDP.NOME = ' + QuotedStr(edtNome.Text) + #13;

         3: if chkNome.Checked then
               sSQL := sSQL +  'AND UPPER(PDP.NOME) < ' + QuotedStr(UpperCase(edtNome.Text)) + #13
            else
               sSQL := sSQL +  'AND PDP.NOME < ' + QuotedStr(edtNome.Text) + #13;

         4: if chkNome.Checked then
               sSQL := sSQL +  'AND UPPER(PDP.NOME) > ' + QuotedStr(UpperCase(edtNome.Text)) + #13
            else
               sSQL := sSQL +  'AND PDP.NOME > ' + QuotedStr(edtNome.Text) + #13;

         5: if chkNome.Checked then
               sSQL := sSQL +  'AND UPPER(PDP.NOME) <= ' + QuotedStr(UpperCase(edtNome.Text)) + #13
            else
               sSQL := sSQL +  'AND PDP.NOME <= ' + QuotedStr(edtNome.Text) + #13;

         6: if chkNome.Checked then
               sSQL := sSQL +  'AND UPPER(PDP.NOME) >= ' + QuotedStr(UpperCase(edtNome.Text)) + #13
            else
               sSQL := sSQL +  'AND PDP.NOME >= ' + QuotedStr(edtNome.Text) + #13;

      end;
   end;
   // Fim Marchetti - pendencia 26499

   if trim(edtMatrTit.Text) <> EmptyStr then
   begin
      Result := True;

      case cboMatrTit.ItemIndex of

           0 : begin
                 if chkMatrTit.Checked then
                    sSQL := sSQL +  'AND UPPER(ELP.MATRICULA) LIKE ''' + UpperCase(edtMatrTit.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND ELP.MATRICULA LIKE ''' + edtMatrTit.Text + '%''' + #13;
               end;
           1 : begin
                 if chkMatrTit.Checked then
                    sSQL := sSQL +  'AND UPPER(ELP.MATRICULA) LIKE ''%' + UpperCase(edtMatrTit.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND ELP.MATRICULA LIKE ''%' + edtMatrTit.Text + '%''' + #13;
               end;
           2 : begin
                 if chkMatrTit.Checked then
                     sSQL := sSQL +  'AND UPPER(ELP.MATRICULA) = ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                  else
                     sSQL := sSQL +  'AND ELP.MATRICULA = ' + QuotedStr(edtMatrTit.Text) + #13;
               end;
           3 : begin
                 if chkMatrTit.Checked then
                    sSQL := sSQL +  'AND UPPER(ELP.MATRICULA) < ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND ELP.MATRICULA < ' + QuotedStr(edtMatrTit.Text) + #13;
               end;
           4 : begin
                 if chkMatrTit.Checked then
                    sSQL := sSQL +  'AND UPPER(ELP.MATRICULA) > ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                 else
                     sSQL := sSQL +  'AND ELP.MATRICULA > ' + QuotedStr(edtMatrTit.Text) + #13;
               end;
           5 : begin
                 if chkMatrTit.Checked then
                    sSQL := sSQL +  'AND UPPER(ELP.MATRICULA) <= ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND ELP.MATRICULA <= ' + QuotedStr(edtMatrTit.Text) + #13;
               end;
           6 : begin
                 if chkMatrTit.Checked then
                     sSQL := sSQL +  'AND UPPER(ELP.MATRICULA) >= ' + QuotedStr(UpperCase(edtMatrTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND ELP.MATRICULA >= ' + QuotedStr(edtMatrTit.Text) + #13;
               end;
      end;

   end;

   if edtMatricula.Text <> '' then begin
      sTabela := RetornaTabela(edtMatricula.Text);
      Result := True;
      case cboMatricula.ItemIndex of
           0 : begin
                 // SOL 207995 KTN 2010105 Otacilio ** Inicio **
                 // Thiago Melo SOL 201440 Kintana 1947640 INI
                 if chkMatricula.Checked then
                     sSQL := sSQL +  'AND UPPER(' + sTabela + '.MATRICULA) = ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                 else
                  {begin
                     if sTabela = 'DEP' then begin
                       sSQL := sSQL +  'AND (' + sTabela + '.MATRICULA = ' + QuotedStr(edtMatricula.Text) + ' OR ELP.MATRICULA = ' + QuotedStr(edtMatricula.Text) + ')' + #13;
                     end
                     else begin }
                   sSQL := sSQL +  'AND ' + sTabela + '.MATRICULA = ' + QuotedStr(edtMatricula.Text) + #13;
                     //end;
                  //end;
                 // Thiago Melo SOL 201440 Kintana 1947640 FIM
                 // SOL 207995 KTN 2010105 Otacilio ** FIM **
               end;
           1 : begin
                 if chkMatricula.Checked then
                    sSQL := sSQL +  'AND UPPER(' + sTabela + '.MATRICULA) LIKE ''' + UpperCase(edtMatricula.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND ' + sTabela + '.MATRICULA LIKE ''' + edtMatricula.Text + '%''' + #13;
               end;
           2 : begin
                 if chkMatricula.Checked then
                    sSQL := sSQL +  'AND UPPER(' + sTabela + '.MATRICULA) LIKE ''%' + UpperCase(edtMatricula.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND ' + sTabela + '.MATRICULA LIKE ''%' + edtMatricula.Text + '%''' + #13;
               end;
           3 : begin
                 if chkMatricula.Checked then
                    sSQL := sSQL +  'AND UPPER(' + sTabela + '.MATRICULA) < ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                 else
                    sSQL := sSQL +  'AND ' + sTabela + '.MATRICULA < ' + QuotedStr(edtMatricula.Text) + #13;
               end;
           4 : begin
                 if chkMatricula.Checked then
                    sSQL := sSQL +  'AND UPPER(' + sTabela + '.MATRICULA) > ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                 else
                     sSQL := sSQL +  'AND ' + sTabela + '.MATRICULA > ' + QuotedStr(edtMatricula.Text) + #13;
               end;
           5 : begin
                 if chkMatricula.Checked then
                    sSQL := sSQL +  'AND UPPER(' + sTabela + '.MATRICULA) <= ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                 else
                    sSQL := sSQL +  'AND ' + sTabela + '.MATRICULA <= ' + QuotedStr(edtMatricula.Text) + #13;
               end;
           6 : begin
                 if chkMatricula.Checked then
                     sSQL := sSQL +  'AND UPPER(' + sTabela + '.MATRICULA) >= ' + QuotedStr(UpperCase(edtMatricula.Text)) + #13
                 else
                    sSQL := sSQL +  'AND ' + sTabela + '.MATRICULA >= ' + QuotedStr(edtMatricula.Text) + #13;
               end;
      end;

   end;

   if trim(edtInscricaoPrev.Text) <> EmptyStr then begin
      Result := True;
      case cboInscricao.ItemIndex of
           0 : begin
                 if chkInscricao.Checked then
                    sSQL := sSQL +  'AND UPPER(PPP.INSCRICAONUMERO) LIKE ''' + UpperCase(edtInscricaoPrev.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PPP.INSCRICAONUMERO LIKE ''' + edtInscricaoPrev.Text + '%''' + #13;
               end;
           1 : begin
                 if chkInscricao.Checked then
                    sSQL := sSQL +  'AND UPPER(PPP.INSCRICAONUMERO) LIKE ''%' + UpperCase(edtInscricaoPrev.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PPP.INSCRICAONUMERO LIKE ''%' + edtInscricaoPrev.Text + '%''' + #13;
               end;
           2 : begin
                 if chkInscricao.Checked then
                     sSQL := sSQL +  'AND UPPER(PPP.INSCRICAONUMERO) = ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                  else
                     sSQL := sSQL +  'AND PPP.INSCRICAONUMERO = ' + QuotedStr(edtInscricaoPrev.Text) + #13;
               end;
           3 : begin
                 if chkInscricao.Checked then
                    sSQL := sSQL +  'AND UPPER(PPP.INSCRICAONUMERO) < ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PPP.INSCRICAONUMERO < ' + QuotedStr(edtInscricaoPrev.Text) + #13;
               end;
           4 : begin
                 if chkInscricao.Checked then
                    sSQL := sSQL +  'AND UPPER(PPP.INSCRICAONUMERO) > ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                 else
                     sSQL := sSQL +  'AND PPP.INSCRICAONUMERO > ' + QuotedStr(edtInscricaoPrev.Text) + #13;
               end;
           5 : begin
                 if chkInscricao.Checked then
                    sSQL := sSQL +  'AND UPPER(PPP.INSCRICAONUMERO) <= ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PPP.INSCRICAONUMERO <= ' + QuotedStr(edtInscricaoPrev.Text) + #13;
               end;
           6 : begin
                 if chkInscricao.Checked then
                     sSQL := sSQL +  'AND UPPER(PPP.INSCRICAONUMERO) >= ' + QuotedStr(UpperCase(edtInscricaoPrev.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PPP.INSCRICAONUMERO >= ' + QuotedStr(edtInscricaoPrev.Text) + #13;
               end;
      end;
   end;

   if trim(edtCpf.Text) <> EmptyStr then begin
      Result := True;
      case cboCPF.ItemIndex of
           0 : begin
                 if chkCPF.Checked then
                    sSQL := sSQL +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE ''' + UpperCase(edtCPF.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) LIKE ''' + edtCPF.Text + '%''' + #13;
               end;
           1 : begin
                 if chkCPF.Checked then
                    sSQL := sSQL +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) LIKE ''%' + UpperCase(edtCPF.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) LIKE ''%' + edtCPF.Text + '%''' + #13;
               end;
           2 : begin
                 if chkCPF.Checked then
                     sSQL := sSQL +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) = ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                  else
                     sSQL := sSQL +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) = ' + QuotedStr(edtCPF.Text) + #13;
               end;
           3 : begin
                 if chkCPF.Checked then
                    sSQL := sSQL +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) < ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                 else
                    sSQL := sSQL +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) < ' + QuotedStr(edtCPF.Text) + #13;
               end;
           4 : begin
                 if chkCPF.Checked then
                    sSQL := sSQL +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) > ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                 else
                     sSQL := sSQL +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) > ' + QuotedStr(edtCPF.Text) + #13;
               end;
           5 : begin
                 if chkCPF.Checked then
                    sSQL := sSQL +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) <= ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                 else
                    sSQL := sSQL +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) <= ' + QuotedStr(edtCPF.Text) + #13;
               end;
           6 : begin
                 if chkCPF.Checked then
                     sSQL := sSQL +  'AND UPPER(DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO)) >= ' + QuotedStr(UpperCase(edtCPF.Text)) + #13
                 else
                    sSQL := sSQL +  'AND DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) >= ' + QuotedStr(edtCPF.Text) + #13;
               end;
      end;
   end;

   if edtNomeTit.Text <> '' then begin
      Result := True;
      case cboNomeTitular.ItemIndex of
           0 : begin
                 if chkNomeTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NOME) LIKE ''' + UpperCase(edtNomeTit.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PEP.NOME LIKE ''' + edtNomeTit.Text + '%''' + #13;
               end;
           1 : begin
                 if chkNomeTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NOME) LIKE ''%' + UpperCase(edtNomeTit.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PEP.NOME LIKE ''%' + edtNomeTit.Text + '%''' + #13;
               end;
           2 : begin
                 if chkNomeTit.Checked then
                     sSQL := sSQL +  'AND UPPER(PEP.NOME) = ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                  else
                     sSQL := sSQL +  'AND PEP.NOME = ' + QuotedStr(edtNomeTit.Text) + #13;
               end;
           3 : begin
                 if chkNomeTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NOME) < ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PEP.NOME < ' + QuotedStr(edtNomeTit.Text) + #13;
               end;
           4 : begin
                 if chkNomeTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NOME) > ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                 else
                     sSQL := sSQL +  'AND PEP.NOME > ' + QuotedStr(edtNomeTit.Text) + #13;
               end;
           5 : begin
                 if chkNomeTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NOME) <= ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PEP.NOME <= ' + QuotedStr(edtNomeTit.Text) + #13;
               end;
           6 : begin
                 if chkNomeTit.Checked then
                     sSQL := sSQL +  'AND UPPER(PEP.NOME) >= ' + QuotedStr(UpperCase(edtNomeTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PEP.NOME >= ' + QuotedStr(edtNomeTit.Text) + #13;
               end;
      end;

   end;

   if trim(edtCPFTit.Text) <> EmptyStr then begin
      Result := True;
      case cboCPFTIT.ItemIndex of
           0 : begin
                 if chkCPFTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NUMDOCUMENTO) LIKE ''' + UpperCase(edtCPFTit.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PEP.NUMDOCUMENTO LIKE ''' + edtCPFTit.Text + '%''' + #13;
               end;
           1 : begin
                 if chkCPFTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NUMDOCUMENTO) LIKE ''%' + UpperCase(edtCPFTit.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PEP.NUMDOCUMENTO LIKE ''%' + edtCPFTit.Text + '%''' + #13;
               end;
           2 : begin
                 if chkCPFTit.Checked then
                     sSQL := sSQL +  'AND UPPER(PEP.NUMDOCUMENTO) = ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                  else
                     sSQL := sSQL +  'AND PEP.NUMDOCUMENTO = ' + QuotedStr(edtCPFTit.Text) + #13;
               end;
           3 : begin
                 if chkCPFTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NUMDOCUMENTO) < ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PEP.NUMDOCUMENTO < ' + QuotedStr(edtCPFTit.Text) + #13;
               end;
           4 : begin
                 if chkCPFTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NUMDOCUMENTO) > ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                 else
                     sSQL := sSQL +  'AND PEP.NUMDOCUMENTO > ' + QuotedStr(edtCPFTit.Text) + #13;
               end;
           5 : begin
                 if chkCPFTit.Checked then
                    sSQL := sSQL +  'AND UPPER(PEP.NUMDOCUMENTO) <= ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PEP.NUMDOCUMENTO <= ' + QuotedStr(edtCPFTit.Text) + #13;
               end;
           6 : begin
                 if chkCPFTit.Checked then
                     sSQL := sSQL +  'AND UPPER(PEP.NUMDOCUMENTO) >= ' + QuotedStr(UpperCase(edtCPFTit.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PEP.NUMDOCUMENTO >= ' + QuotedStr(edtCPFTit.Text) + #13;
               end;
      end;

   end;

   if trim(edtSituacao.Text) <> EmptyStr then begin
      Result := True;
      case cboSituacaoFund.ItemIndex of
           0 : begin
                 if chkSitFund.Checked then
                    sSQL := sSQL +  'AND UPPER(SIP.DESCRICAO) LIKE ''' + UpperCase(edtSituacao.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND SIP.DESCRICAO LIKE ''' + edtSituacao.Text + '%''' + #13;
               end;
           1 : begin
                 if chkSitFund.Checked then
                    sSQL := sSQL +  'AND UPPER(SIP.DESCRICAO) LIKE ''%' + UpperCase(edtSituacao.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND SIP.DESCRICAO LIKE ''%' + edtSituacao.Text + '%''' + #13;
               end;
           2 : begin
                 if chkSitFund.Checked then
                     sSQL := sSQL +  'AND UPPER(SIP.DESCRICAO) = ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSQL := sSQL +  'AND SIP.DESCRICAO = ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           3 : begin
                 if chkSitFund.Checked then
                    sSQL := sSQL +  'AND UPPER(SIP.DESCRICAO) < ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                    sSQL := sSQL +  'AND SIP.DESCRICAO < ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           4 : begin
                 if chkSitFund.Checked then
                    sSQL := sSQL +  'AND UPPER(SIP.DESCRICAO) > ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                     sSQL := sSQL +  'AND SIP.DESCRICAO > ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           5 : begin
                 if chkSitFund.Checked then
                    sSQL := sSQL +  'AND UPPER(SIP.DESCRICAO) <= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                    sSQL := sSQL +  'AND SIP.DESCRICAO <= ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           6 : begin
                 if chkSitFund.Checked then
                     sSQL := sSQL +  'AND UPPER(SIP.DESCRICAO) >= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                    sSQL := sSQL +  'AND SIP.DESCRICAO >= ' + QuotedStr(edtSituacao.Text) + #13;
               end;
      end;

   end;

   if trim(edtSitPlano.Text) <> EmptyStr then begin
      Result := True;
      case cboSituacaoPlano.ItemIndex of
           0 : begin
                 if chkSitPlano.Checked then
                    sSQL := sSQL +  'AND UPPER(SPP.DESCRICAO) LIKE ''' + UpperCase(edtSituacao.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND SPP.DESCRICAO LIKE ''' + edtSituacao.Text + '%''' + #13;
               end;
           1 : begin
                 if chkSitPlano.Checked then
                    sSQL := sSQL +  'AND UPPER(SPP.DESCRICAO) LIKE ''%' + UpperCase(edtSituacao.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND SPP.DESCRICAO LIKE ''%' + edtSituacao.Text + '%''' + #13;
               end;
           2 : begin
                 if chkSitPlano.Checked then
                     sSQL := sSQL +  'AND UPPER(SPP.DESCRICAO) = ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                  else
                     sSQL := sSQL +  'AND SPP.DESCRICAO = ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           3 : begin
                 if chkSitPlano.Checked then
                    sSQL := sSQL +  'AND UPPER(SPP.DESCRICAO) < ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                    sSQL := sSQL +  'AND SPP.DESCRICAO < ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           4 : begin
                 if chkSitPlano.Checked then
                    sSQL := sSQL +  'AND UPPER(SPP.DESCRICAO) > ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                     sSQL := sSQL +  'AND SPP.DESCRICAO > ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           5 : begin
                 if chkSitPlano.Checked then
                    sSQL := sSQL +  'AND UPPER(SPP.DESCRICAO) <= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                    sSQL := sSQL +  'AND SPP.DESCRICAO <= ' + QuotedStr(edtSituacao.Text) + #13;
               end;
           6 : begin
                 if chkSitPlano.Checked then
                     sSQL := sSQL +  'AND UPPER(SPP.DESCRICAO) >= ' + QuotedStr(UpperCase(edtSituacao.Text)) + #13
                 else
                    sSQL := sSQL +  'AND SPP.DESCRICAO >= ' + QuotedStr(edtSituacao.Text) + #13;
               end;
      end;
   end;

   if trim(edtPatro.Text) <> EmptyStr then begin
      Result := True;
      case cboPatro.ItemIndex of
           0 : begin
                 if chkPatro.Checked then
                    sSQL := sSQL +  'AND UPPER(PPA.NOME) LIKE ''' + UpperCase(edtPatro.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PPA.NOME LIKE ''' + edtPatro.Text + '%''' + #13;
               end;
           1 : begin
                 if chkPatro.Checked then
                    sSQL := sSQL +  'AND UPPER(PPA.NOME) LIKE ''%' + UpperCase(edtPatro.Text) + '%''' + #13
                 else
                    sSQL := sSQL +  'AND PPA.NOME LIKE ''%' + edtPatro.Text + '%''' + #13;
               end;
           2 : begin
                 if chkPatro.Checked then
                     sSQL := sSQL +  'AND UPPER(PPA.NOME) = ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                  else
                     sSQL := sSQL +  'AND PPA.NOME = ' + QuotedStr(edtPatro.Text) + #13;
               end;
           3 : begin
                 if chkPatro.Checked then
                    sSQL := sSQL +  'AND UPPER(PPA.NOME) < ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PPA.NOME < ' + QuotedStr(edtPatro.Text) + #13;
               end;
           4 : begin
                 if chkPatro.Checked then
                    sSQL := sSQL +  'AND UPPER(PPA.NOME) > ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                 else
                     sSQL := sSQL +  'AND PPA.NOME > ' + QuotedStr(edtPatro.Text) + #13;
               end;
           5 : begin
                 if chkPatro.Checked then
                    sSQL := sSQL +  'AND UPPER(PPA.NOME) <= ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PPA.NOME <= ' + QuotedStr(edtPatro.Text) + #13;
               end;
           6 : begin
                 if chkPatro.Checked then
                     sSQL := sSQL +  'AND UPPER(PPA.NOME) >= ' + QuotedStr(UpperCase(edtPatro.Text)) + #13
                 else
                    sSQL := sSQL +  'AND PPA.NOME >= ' + QuotedStr(edtPatro.Text) + #13;
               end;
      end;

   end;

   if trim(edtContrato.Text) <> EmptyStr then begin
      Result := True;
      case cboContrato.ItemIndex of
           0 : begin
                    sSQL := sSQL +  'AND CON.IDCONTRATOEMPTMO LIKE ''' + edtContrato.Text + '%''' + #13;
               end;
           1 : begin
                    sSQL := sSQL +  'AND CON.IDCONTRATOEMPTMO LIKE ''%' + edtContrato.Text + '%''' + #13;
               end;
           2 : begin
                    sSQL := sSQL +  'AND CON.IDCONTRATOEMPTMO = ' + edtContrato.Text + #13;
               end;
           3 : begin
                    sSQL := sSQL +  'AND CON.IDCONTRATOEMPTMO < ' + edtContrato.Text + #13;
               end;
           4 : begin
                     sSQL := sSQL + 'AND CON.IDCONTRATOEMPTMO > ' + edtContrato.Text + #13;
               end;
           5 : begin
                    sSQL := sSQL +  'AND CON.IDCONTRATOEMPTMO <= ' + edtContrato.Text + #13;
               end;
           6 : begin
                    sSQL := sSQL +  'AND CON.IDCONTRATOEMPTMO >= ' + edtContrato.Text + #13;
               end;
      end;

   end;

   if edtInternet.Text <> '' then begin
      Result := True;
      // SOL 204839 KTN 1981463 ** Inicio **
      case cboInternet.ItemIndex of
           0 : begin
                 if chkInternet.Checked then
                    //sSQL := sSQL +  'AND UPPER(DECODE( INS.FLGINTERNET, 1, ''SIM'', ''NÃO'' )) LIKE ''' + UpperCase(edtInternet.Text) + '%''' + #13
                    sSQL := sSQL +  ' AND UPPER(DECODE(DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''SIM'', ''NÃO'' )) LIKE ''' + UpperCase(edtInternet.Text) + '%''' + #13
                 else
                    //sSQL := sSQL +  'AND DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) LIKE ''' + edtInternet.Text + '%''' + #13;
                      sSQL := sSQL +  ' AND DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''Sim'', ''Não'' ) LIKE ''' + edtInternet.Text + '%''' + #13;
               end;
           1 : begin
                 if chkInternet.Checked then
                    //sSQL := sSQL +  'AND UPPER(DECODE( INS.FLGINTERNET, 1, ''SIM'', ''NÃO'' )) LIKE ''%' + UpperCase(edtInternet.Text) + '%''' + #13
                    sSQL := sSQL +  ' AND UPPER(DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''SIM'', ''NÃO'' )) LIKE ''%' + UpperCase(edtInternet.Text) + '%''' + #13
                 else
                    //sSQL := sSQL +  'AND DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) LIKE ''%' + edtInternet.Text + '%''' + #13;
                    sSQL := sSQL +  ' AND DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''Sim'', ''Não'' ) LIKE ''%' + edtInternet.Text + '%''' + #13;
               end;
           2 : begin
                 if chkInternet.Checked then
                     //sSQL := sSQL +  'AND UPPER(DECODE( INS.FLGINTERNET, 1, ''SIM'', ''NÃO'' )) = ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                     sSQL := sSQL +  ' AND UPPER(DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''SIM'', ''NÃO'' )) = ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                 else
                     //sSQL := sSQL +  'AND DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) = ' + QuotedStr(edtInternet.Text) + #13;
                     sSQL := sSQL +  ' AND DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''Sim'', ''Não'' ) = ' + QuotedStr(edtInternet.Text) + #13;
               end;
           3 : begin
                 if chkInternet.Checked then
                    //sSQL := sSQL +  'AND UPPER(DECODE( INS.FLGINTERNET, 1, ''SIM'', ''NÃO'' )) < ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                    sSQL := sSQL +  ' AND UPPER(DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''SIM'', ''NÃO'' )) < ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                 else
                    //sSQL := sSQL +  'AND DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) < ' + QuotedStr(edtInternet.Text) + #13;
                    sSQL := sSQL +  ' AND DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''Sim'', ''Não'' ) < ' + QuotedStr(edtInternet.Text) + #13;
               end;
           4 : begin
                 if chkInternet.Checked then
                    //sSQL := sSQL +  'AND UPPER(DECODE( INS.FLGINTERNET, 1, ''SIM'', ''NÃO'' )) > ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                    sSQL := sSQL +  ' AND UPPER(DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''SIM'', ''NÃO'' )) > ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                 else
                     //sSQL := sSQL +  'AND DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) > ' + QuotedStr(edtInternet.Text) + #13;
                     sSQL := sSQL +  ' AND DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''Sim'', ''Não'' ) > ' + QuotedStr(edtInternet.Text) + #13;
               end;
           5 : begin
                 if chkInternet.Checked then
                    //sSQL := sSQL +  'AND UPPER(DECODE( INS.FLGINTERNET, 1, ''SIM'', ''NÃO'' )) <= ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                    sSQL := sSQL +  ' AND UPPER(DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''SIM'', ''NÃO'' )) <= ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                 else
                    //sSQL := sSQL +  'AND DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) <= ' + QuotedStr(edtInternet.Text) + #13;
                    sSQL := sSQL +  ' AND DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''Sim'', ''Não'' ) <= ' + QuotedStr(edtInternet.Text) + #13;
               end;
           6 : begin
                 if chkInternet.Checked then
                     //sSQL := sSQL +  'AND UPPER(DECODE( INS.FLGINTERNET, 1, ''SIM'', ''NÃO'' )) >= ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                     sSQL := sSQL +  ' AND UPPER(DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''SIM'', ''NÃO'' )) >= ' + QuotedStr(UpperCase(edtInternet.Text)) + #13
                 else
                    //sSQL := sSQL +  'AND DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) >= ' + QuotedStr(edtInternet.Text) + #13;
                    sSQL := sSQL +  ' AND DECODE( DECODE(INS.FLGINTERNET, NULL, CON.FLGINTERNET), 1, ''Sim'', ''Não'' ) >= ' + QuotedStr(edtInternet.Text) + #13;
               end;
      end;
      // SOL 204839 KTN 1981463 ** Fim **

   end;

end;

procedure TfrmExecBuscaContrato.PageControlChange(Sender: TObject);
begin
   inherited;

   bbtnConfirmar.Visible := PageControl.ActivePageIndex = 0;
   btnOK.Visible         := PageControl.ActivePageIndex = 1;

   Application.ProcessMessages;
end;

procedure TfrmExecBuscaContrato.bbtnSairClick(Sender: TObject);
begin
   FRetornouValor := False;
   Operacao := opSair;
   QryResultado.Close;

   Close;
end;

procedure TfrmExecBuscaContrato.btnOKClick(Sender: TObject);
var
   i : Integer;
begin
   for i := 0 to 5 do ValoresChave[i] := '';

   if FRetornouValor then
   begin
      ValoresChave[0]  := qryResultadoIDCONTRATOEMPTMO.AsString;
      ValoresChave[1]  := qryResultadoMATRICULA.AsString;         // Matricula
      ValoresChave[2]  := qryResultadoNOME.AsString;              // Nome mutuário
      ValoresChave[3]  := qryResultadoC20.AsString;               // Inscricao Prev
      ValoresChave[4]  := qryResultadoC12.AsString;               // IDBEnef
      ValoresChave[5]  := qryResultadoIDTIPOCONTREMPTMO.AsString;
   end;

   FRetornouValor := True;

   //Pendência 27875
   if (Sistema.IdUsuario = 47891) then
   begin
      dtmEmptmo.vBuscaContrato[0]    := edtContrato.Text;
      dtmEmptmo.vBuscaContrato[1]    := edtNome.Text;
      dtmEmptmo.vBuscaContrato[2]    := edtMatrTit.Text;
      dtmEmptmo.vBuscaContrato[3]    := edtMatricula.Text;
      dtmEmptmo.vBuscaContrato[4]    := edtInscricaoPrev.Text;
      dtmEmptmo.vBuscaContrato[5]    := edtCpf.Text;
      dtmEmptmo.vBuscaContrato[6]    := edtNomeTit.Text;
      dtmEmptmo.vBuscaContrato[7]    := edtCPFTit.Text;
      dtmEmptmo.vBuscaContrato[8]    := edtSituacao.Text;
      dtmEmptmo.vBuscaContrato[9]    := edtSitPlano.Text;
      dtmEmptmo.vBuscaContrato[10]   := edtPatro.Text;
   end;
   Operacao := opSair;
   frmExecBuscaContrato.Close;
end;


procedure TfrmExecBuscaContrato.wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   if Key = VK_RETURN then btnOKClick(Self);
end;

procedure TfrmExecBuscaContrato.FormShow(Sender: TObject);
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
   cboContrato.ItemIndex      := 2;

   //Pendência 27875
   if ( Sistema.IdUsuario = 47891 ) then
   begin
      edtContrato.Text           := dtmEmptmo.vBuscaContrato[0];
      edtNome.Text               := dtmEmptmo.vBuscaContrato[1];
      edtMatrTit.Text            := dtmEmptmo.vBuscaContrato[2];
      edtMatricula.Text          := dtmEmptmo.vBuscaContrato[3];
      edtInscricaoPrev.Text      := dtmEmptmo.vBuscaContrato[4];
      edtCpf.Text                := dtmEmptmo.vBuscaContrato[5];
      edtNomeTit.Text            := dtmEmptmo.vBuscaContrato[6];
      edtCPFTit.Text             := dtmEmptmo.vBuscaContrato[7];
      edtSituacao.Text           := dtmEmptmo.vBuscaContrato[8];
      edtSitPlano.Text           := dtmEmptmo.vBuscaContrato[9];
      edtPatro.Text              := dtmEmptmo.vBuscaContrato[10];
   end;
end;

function TfrmExecBuscaContrato.RetornaTabela(sMatricula : String) : String;
begin
   Result := 'DEP';
end;

procedure TfrmExecBuscaContrato.FormCreate(Sender: TObject);
begin
  Operacao := opNada;
  inherited;

end;

procedure TfrmExecBuscaContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Operacao = opNada then
     FRetornouValor := false;
  inherited;

end;

end.
