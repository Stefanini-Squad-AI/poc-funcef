unit CRelFalecimentoSemQuitacao;

// Alterações:
{

Pendência   : -SIG 92063
Responsável : Rafael Vasconcelos
Data        : 16/10/2019
Descrição   : Criação do campo data registro de falecimento
***************************************************************************************
Nº SOL............: 270218
Nº PPM............: 1325422
Data da Alteração.: 11/03/2016
Responsável.......: Peterson Victor
Descrição.........: Alterar query no FiltraRelatorio
***************************************************************************************
Nº SOL............: 258985/18024
Nº PPM............: 1228935
Data da Alteração.: 06/01/2016
Alteração Form....: Alterada parte da query antiga pela query enviada no chamado.
Responsável.......: William Santana
Descrição.........: Alterar query do relatório Mutuários Falecidos com Contratos não Quitados
**************************************************************************************
--------------------------------------------------------------------------------------------------
Pendência   : SOL 258985 PPM 1179388
Responsável : Andre Imakawa
Data        : 27/11/2015
Descrição   : Alterada toda query antiga pela query enviada no chamado.
--------------------------------------------------------------------------------------------------
Pendência   : SOL 251414 PPM 741467
Responsável : Wylliam Leite da Silva
Data        : 07/04/2015
Descrição   : Incluir a coluna com a informação de Data de Crédito e alteração
              no campo no relatório Data de Concessão para receber o valor de
              Data de Solicitação no relatório "Mutuários Falecidos com Contratos não Quitados"
--------------------------------------------------------------------------------------------------
Pendência   : SOL 193866 Kintana 1846517
Responsável : William Moreira da Silva
Data        : 17/11/2011
Descrição   : Incluir a coluna com a informação de Situação do Contrato no relatorio
              "Mutuários Falecidos com Contratos não Quitados"
--------------------------------------------------------------------------------------------------
Pendência   : SOL 168571 Kintana 1487391
Responsável : Fanuel Junior
Data        : 17/11/2011
Descrição   : O relatório de empréstimo "Falecimentos/Seguros - Mutuários falecidos com contratos não
              quitados" não está trazendo os contratos de empréstimo "Pendentes de quitação" - situação
              "Em Quitação"
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 Kintana 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-----------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendência :
Descrição :
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, mContratoEmptmo, Mask, wwdbedit, Wwdbspin, CheckLst,
   wwdblook, db, fcCombo, fcColorCombo, wwdbdatetimepicker, mListaPlano,
   mListaPatro;

type
   TcfgRelFalecimentoSemQuitacao = class(TcfgRel)
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Label2: TLabel;
      GroupBox1: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      rdgOrdenacao: TRadioGroup;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);


   private  // Private declarations

      procedure AbreQueries;

      procedure MontaQuery; override;
      procedure FiltraRelatorio;


   public   // Public declarations

   end;



var
   cfgRelFalecimentoSemQuitacao: TcfgRelFalecimentoSemQuitacao;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   dEmptmo,
   USistema,
   UfuncoesEmptmo,
   dRelFalecimentoSemQuitacao, dRelFalecimento;



procedure TcfgRelFalecimentoSemQuitacao.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



procedure TcfgRelFalecimentoSemQuitacao.FormShow(Sender: TObject);
begin
   inherited;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



procedure TcfgRelFalecimentoSemQuitacao.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;

      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TcfgRelFalecimentoSemQuitacao.MontaQuery;
begin
   inherited;

   with dtmRelFalecimento do
   begin
      bSeparador  := chkLinhas.Checked;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   with dtmRelFalecimentoSemQuitacao do
   begin
      // -------------------------------------------------------------------------------------------
         lblTipoEmptmo.Caption := ' < todos > ';
         if DBcboTipoEmptmo.LookupValue <> ''   then lblTipoEmptmo.Caption := DBcboTipoEmptmo.Text;

         lblTipoContr.Caption  := ' < todos > ';
         if DBcboTipoContrato.LookupValue <> ''    then lblTipoContr.Caption  := DBcboTipoContrato.Text;

         memPatro.RichText := molListaPatro.ListaPatro;
         memPlano.RichText := molListaPlano.ListaPlano;
      // -------------------------------------------------------------------------------------------
   end;

   FiltraRelatorio;
end;



// Monta o select de contratos por faixa de meses, de acordo com a tela de parametros.
procedure TcfgRelFalecimentoSemQuitacao.FiltraRelatorio;
var
   sSQL        : String;
   sOrdenacao  : String;
   sEmpresa    : String;
begin
   sEmpresa := IntToStr(Sistema.IDEmpresa);

   sSQL :=
   // Andre Imakawa SOL 258985 PPM 1179388 - Removido query antiga e implementada query nova - Inicio
   {
   'SELECT '                                                                                       + #13 +
   '  CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME, '                                             + #13 +
   '  TCE.TCEDESCRICAO, '                                                                          + #13 +
   '  CON.VLRCONTRATO, '                                                                           + #13 +
   // Wylliam Leite da Silva SOL 251414 PPM 741467 - Inicio
   '  insc.datainsc AS "Data de Concessão", '                                                      + #13 +
   // Wylliam Leite da Silva SOL 251414 PPM 741467 - Fim
   '  CON.DATACREDITO, PFI.DATAMORTE, '                                                            + #13 +

   //William Moreira da Silva SOL 193866 Kintana 1846517
   '  DECODE(CON.FLGSITUACAO,                                              '                       + #13 +
   '	''A'', ''Ativo'', ''C'', ''Cancelado'', ''E'', ''Encerrado'',      '                       + #13 +
   '	''Q'', ''Quitado'', ''R'', ''Refinanciado'', ''S'', ''Suspenso'',  '                       + #13 +
   '	''P'', ''Pendente de Liberação'', ''K'', ''Pendente de Quitação'') '                       + #13 +
   '     AS "SITUAÇÃO DO CONTRATO"                                        '                       + #13 +
   //William Moreira da Silva SOL 193866 Kintana 1846517

   'FROM '                                                                                         + #13 +
   '   PESSOA          MUT, '                                                                      + #13 +
   '   PESSOAFISICA    PFI, '                                                                      + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   DEPENTIT        DEP, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
   '   TIPOEMPTMO      TEP,  '                                                                      + #13 +
   // Wylliam Leite da Silva SOL 251414 PPM 741467 - Inicio
   '   inscricaoemptmo insc  '                                                                     + #13 +
   // Wylliam Leite da Silva SOL 251414 PPM 741467 - Fim
   'WHERE '                                                                                        + #13 +
   '      TEP.IDEMPRESAPROP            = ' + IntToStr(Sistema.IdEmpresa)                           + #13 +
   '  AND PFI.DATAMORTE                IS NOT NULL '                                               + #13 +
   '  AND CON.FLGSITUACAO              NOT IN (''C'',''Q'') '                              + #13 +  //Fanuel Junior SOL 168571 Kintana 1487391
   '  AND CON.IDPATRO                  IN (' + molListaPatro.PegaPatro + ') '                      + #13 +
   '  AND CON.IDPLANOPREV              IN (' + molListaPlano.PegaPlano + ') '                      + #13;
    }


    'SELECT'                                                                                                                      + #13#10 +
    '  CON.IDCONTRATOEMPTMO,'                                                                                                     + #13#10 +
    '  DEP.MATRICULA,'                                                                                                            + #13#10 +
    '  MUT.NOME,'                                                                                                                 + #13#10 +
    '  ppc.nome AS PLANOORIGEM,'                                                                                                  + #13#10 +
    '  TCE.TCEDESCRICAO,'                                                                                                         + #13#10 +
    '  CON.VLRCONTRATO,'                                                                                                          + #13#10 +
    '  con.dataassinatura AS "Data de Concessão",'                                                                                + #13#10 +
    '  CON.DATACREDITO,'                                                                                                          + #13#10 +
    '  PFI.DATAMORTE,'                                                                                                            + #13#10 +
    '  DECODE(CON.FLGSITUACAO, ''A'', ''Ativo'','                                                                                 + #13#10 +
    '                          ''C'', ''Cancelado'','                                                                             + #13#10 +
    '                          ''E'', ''Encerrado'','                                                                             + #13#10 +
    '                          ''Q'', ''Quitado'','                                                                               + #13#10 +
    '                          ''R'', ''Refinanciado'','                                                                          + #13#10 +
    '                          ''S'', ''Suspenso'','                                                                              + #13#10 +
    '                          ''P'', ''Pendente de Liberação'','                                                                 + #13#10 +
    '                          ''K'', ''Pendente de Quitação'') AS "SITUAÇÃO DO CONTRATO",'                                       + #13#10 +
    '  NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(con.idcontratoemptmo, pfi.datamorte),0) AS SALDO_DEVEDOR,'                           + #13#10 +
    '  NVL(CM.PCK_EMPRESTIMO.FN_SALDOINADIMPLENTE(con.idcontratoemptmo, pfi.datamorte),0) AS SALDO_INAD,'                         + #13#10 +  //Peterson Victor - SOL 270218 PPM 1325422
    '  (SELECT COUNT(hp.idhistmovemptmo)'                                                                                         + #13#10 +
    '   FROM hmeprestacao hp'                                                                                                     + #13#10 +
    '   WHERE hp.idcontratoemptmo = con.idcontratoemptmo'                                                                         + #13#10 +
    '   AND   (hp.flgquitabonoestorno = 0 OR hp.dataquitabonoestorno > pfi.datamorte)'                                            + #13#10 +
    '   AND   (hp.vlrefetivo IS NULL OR hp.dataefetiva > pfi.datamorte)'                                                          + #13#10 +
    '   AND   hp.iditememptmo = 13'                                                                                               + #13#10 +
    '   AND   hp.vlrprevisto > 0'                                                                                                 + #13#10 +
    '   AND   hp.dataprevista < pfi.datamorte'                                                                                    + #13#10 +
    '   AND   (hp.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemaberto FROM tiposuspemptmo ts'                                  + #13#10 +
    '                                              WHERE ts.idtiposuspemptmo = hp.idtiposuspemptmo))) AS QUANT_PREST_ABERTA,'     + #13#10 +
    //'  NVL2(hq.idhistmovemptmo,''Sim'',''Não'') AS POSSUI_QUITACAO,'                                                                         //William Santana - SOL 258985/18024 PPM 1228935
    '  NVL2(COALESCE(hq.idhistmovemptmo, hqf.idhistmovemptmo), ''Sim'', ''Não'') AS POSSUI_QUITACAO, '                            + #13#10 +   //William Santana - SOL 258985/18024 PPM 1228935
    '  DECODE(hq.vlrprevisto,  NULL, hqf.vlrprevisto,hq.vlrprevisto)     AS VLR_QUITACAO, '                                       + #13#10 +   //Peterson Victor - SOL 270218 PPM 1325422
    '  DECODE(hq.datavencto, NULL, hqf.datavencto, hq.datavencto) AS VENC_QUITACAO,'                                               + #13#10 +   //Peterson Victor - SOL 270218 PPM 1325422
    ' NVL(e.dataregistro,doc.trgdtinclusao) as "Data Registro Morte" '                                                            + #13#10 +   //Rafael SIG92063                                                                                                                     
    'FROM CONTRATOEMPTMO  CON'                                                                                                    + #13#10 +
    '     JOIN TIPOCONTREMPTMO TCE ON CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'                                              + #13#10 +
    '     JOIN TIPOEMPTMO TEP ON TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO'                                                             + #13#10 +
    '     JOIN planprevcontabil ppc ON ppc.idplanoprev = con.idplanoorigem'                                                       + #13#10 +
    '     JOIN PESSOA MUT ON CON.IDBENEF = MUT.IDPESSOA'                                                                          + #13#10 +
    '     JOIN PESSOAFISICA PFI ON CON.IDBENEF = PFI.IDPESSOA'                                                                    + #13#10 +
    '     JOIN DEPENTIT DEP ON  CON.IDBENEF = DEP.IDPESSOA'                                                                       + #13#10 +
    '                       AND CON.IDPESSOA = DEP.IDTITULAR'                                                                     + #13#10 +
    '     LEFT JOIN hmequitacao hq ON hq.idcontratoemptmo = con.idcontratoemptmo'                                                 + #13#10 +
    '                              AND hq.flgestornado = 0'                                                                       + #13#10 +
    '                              AND hq.iditememptmo = 17'                                                                      + #13#10 +
    '                              AND hq.vlrefetivo IS NULL'                                                                     + #13#10 +
    //Início - William Santana - SOL 258985/18024 PPM 1228935
    '     LEFT JOIN hmequitacao hqf ON hqf.idcontratoemptmo = con.idcontratoemptmo '                                              + #13#10 +
    '                               AND hqf.flgestornado = 0  '                                                                   + #13#10 +
    '                               AND hqf.iditememptmo = 112 '                                                                  + #13#10 +
    //Término - William Santana - SOL 258985/18024 PPM 1228935
     'LEFT JOIN eventosprev e ON e.idpessoa=CON.IDBENEF  and e.ideventogerador = 4 and e.idplanoprev=CON.IDPLANOPREV'             + #13#10 + //Rafael SIG92063   
        'LEFT JOIN docpessoa doc on doc.idpessoa=CON.IDBENEF and doc.iddocumento = 44'                                            + #13#10 + //Rafael SIG92063   
    'WHERE'                                                                                                                       + #13#10 +
    '      TEP.IDEMPRESAPROP            = ' + IntToStr(Sistema.IdEmpresa)                                                         + #13#10 +
    '  AND PFI.DATAMORTE                IS NOT NULL'                                                                              + #13#10 +
    '  AND CON.FLGSITUACAO              NOT IN (''C'',''Q'') '                                                                    + #13#10 +
    '  AND CON.IDPATRO                  IN (' + molListaPatro.PegaPatro + ') '                                                    + #13#10 +
    '  AND CON.IDPLANOPREV              IN (' + molListaPlano.PegaPlano + ') '                                                    + #13#10 ;

    // Andre Imakawa SOL 258985 PPM 1179388 - Removido query antiga e implementada query nova - Fim

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'  AND CON.IDTIPOEMPTMO             = ' + DBcboTipoEmptmo.LookupValue                           + #13;
   '  AND TEP.IDTIPOEMPTMO             = ' + DBcboTipoEmptmo.LookupValue                           + #13;
   //Fim Pendência 27205

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO        = ' + DBcboTipoContrato.LookupValue + ' '                 + #13;

   sSQL := sSQL +

   // Andre Imakawa SOL 258985 PPM 1179388 - Removido query antiga e implementada query nova - Inicio
   {
   '  AND CON.IDBENEF                  = MUT.IDPESSOA '                                            + #13 +
   '  AND CON.IDBENEF                  = PFI.IDPESSOA '                                            + #13 +
   '  AND CON.IDBENEF                  = DEP.IDPESSOA '                                            + #13 +
   '  AND CON.IDPESSOA                 = DEP.IDTITULAR '                                           + #13 +
   // Wylliam Leite da Silva SOL 251414 PPM 741467 - Inicio
   '  AND CON.IDINSCRICAOEMPTMO        = INSC.IDINSCRICAOEMPTMO(+) '                               + #13 +
   // Wylliam Leite da Silva SOL 251414 PPM 741467 - Fim
   '  AND CON.IDTIPOCONTREMPTMO        = TCE.IDTIPOCONTREMPTMO '                                   + #13 +
   '  AND TCE.IDTIPOEMPTMO             = TEP.IDTIPOEMPTMO '                                        + #13 +
   }
   // Andre Imakawa SOL 258985 PPM 1179388 - Removido query antiga e implementada query nova - Fim

   'ORDER BY '                                                                                     + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '  MUT.NOME, CON.IDCONTRATOEMPTMO ';
      1: sSQL := sSQL + '  DEP.MATRICULA, CON.IDCONTRATOEMPTMO ';
      2: sSQL := sSQL + '  CON.IDCONTRATOEMPTMO ';
   end;

   with dtmRelFalecimentoSemQuitacao.qryFalecimentoSemQuitacao do
   begin
      Close;
      SQL.Text := sSQL;
   //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   //SQL.SaveToFile(Sistema.TempDir + 'EP-RelFalecimentoSemQuitacao.txt');
     //SQL.SaveToFile(ftempregra + '\' + 'EP-RelFalecimentoSemQuitacao.txt');
      Open;
   end;
end;



procedure TcfgRelFalecimentoSemQuitacao.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelFalecimentoSemQuitacao.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelFalecimentoSemQuitacao.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelFalecimentoSemQuitacao.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
