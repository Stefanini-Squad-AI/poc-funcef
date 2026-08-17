unit CRelItensEnvioCapCarPP;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina      : FiltraRelatorio
Pendência   : SIG131775
Responsável : Leandro
Data        : 02/08/2023
Descrição   : Ajustar queries para adequação a segregação da HISTMOVEMPTMO->HEMORIGEM = 11
--------------------------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
----------------------------------------------------------------------------------------------------
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
   TB97, ExtCtrls, mListaPlano, mListaPatro, fcCombo, fcColorCombo,
   mMutuario, Mask, wwdbedit, Wwdbspin, wwdblook, Db, DBTables, Wwquery,
   mContratoEmptmo, wwdbdatetimepicker, CMDateTimePicker;

type
   TcfgRelItensEnvioCapCarPP = class(TcfgRel)
      GroupBox1: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      GroupBox2: TGroupBox;
      chkCorLinha: TCheckBox;
      cboCorLinha: TfcColorCombo;
      chkLinhas: TCheckBox;
      GroupBox3: TGroupBox;
      chkValorDiverg: TCheckBox;
      chkValorZero: TCheckBox;
      chkValorNAOZero: TCheckBox;
      chkSintetico: TCheckBox;
      GroupBox4: TGroupBox;
      edtDataFim: TCMDateTimePicker;
      edtDataIni: TCMDateTimePicker;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      molContratoEmptmo: TmolContratoEmptmo;
      chkQuebra: TCheckBox;
      Label7: TLabel;
      cboEvento: TComboBox;
      btnLimpaEvento: TBitBtn;
    chkValorAbsoluto: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure btnLimpaEventoClick(Sender: TObject);
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
  cfgRelItensEnvioCapCarPP: TcfgRelItensEnvioCapCarPP;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   uFuncoesEmptmo,
   dEmptmo,
   uMensErro,
   dRelConciliaCapCar, dRelItensEnvioCapCarPP;




procedure TcfgRelItensEnvioCapCarPP.AbreQueries;
begin
   //
end;



procedure TcfgRelItensEnvioCapCarPP.MontaQuery;
begin
   inherited;

   with dtmRelItensEnvioCapCarPP do
   begin
      lblDataIni.Caption   := edtDataIni.Text;
      lblDataFim.Caption   := edtDataFim.Text;
      lblEvento.Caption    := '< todos >';

      if cboEvento.ItemIndex > -1 then lblEvento.Caption := cboEvento.Text;

      lblValorAbsoluto.Visible := chkValorAbsoluto.Checked; 

      // preenche a label do mês de cobrança
      bSeparador  := chkLinhas.Checked;

      bSintetico  := chkSintetico.Checked;
      bQuebra     := not(chkQuebra.Checked);


      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

   FiltraRelatorio;
end;



procedure TcfgRelItensEnvioCapCarPP.FiltraRelatorio;
var
   sSQL        : String;
   sArquivo    : String;
   Arquivo     : TextFile;
begin
  //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
  //sArquivo := Sistema.TempDir + 'EP-RelItensEnvioCapCarPP.txt';
    sArquivo := ftempregra + '\' + 'EP-RelItensEnvioCapCarPP.txt';

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   DOC.CODDOCUMENTO, DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, '                              + #13 +
   '   (TO_CHAR(DOC.NODOCUMENTO, ''9999990'') || DOC.COMPLDOCUMENTO) AS NODOCUMENTO_COMPL, ' + #13 +
   '   HME.IDHISTMOVEMPTMO, CON.IDCONTRATOEMPTMO, '                                          + #13 +
   '   PPC.NOME AS NOME_PLANO, '                                                             + #13;

   sSQL := sSQL +
   '   NVL(CED.NOME, PTR.NOME) AS NOME_PATRO, '                                              + #13 +
   '   (PPC.NOME || '' - '' || NVL(CED.NOME, PTR.NOME)) AS NOME_PLANOPATRO, '                + #13;

   sSQL := sSQL +
   '   TCE.TCEDESCRICAO, '                                                                   + #13 +
   '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, PPP.INSCRICAONUMERO, '                + #13 +
   '   MUT.NOME AS NOME_MUTUARIO, '                                                          + #13 +
   '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SIT_PART, '      + #13 +

   '   DECODE(HME.HMETIPOMOV, '                                                              + #13 +
   '          0, ''Concessão/Renovação'', '                                                  + #13 +
   '          1, ''Prestação '', '                                                           + #13 +
   '          2, ''Amortização/Refinanciamento'', '                                          + #13 +
   '          3, DECODE(HME.HMEORIGEM, 8, ''Quitação por Falecimento'', ''Quitação''), '     + #13 +
   '          4, ''Atualização de Débito'', '                                                + #13 +
   '          5, ''Atualização de Saldo (Diária)'' , '                                       + #13 +
   '          6, ''Importação/Migração'', '                                                  + #13 +
   '          7, ''Ajustes (Cobrança/Devolução)'', '                                         + #13 +
   '          8, ''Ajustes (Saldo Devedor)'' '                                               + #13 +
   '         ) AS EVENTO, '                                                                  + #13 +

   '   DECODE(HME.HMEORIGEM, '                                                               + #13 +
   '           0, ''Concessão/Renovação'', '                                                 + #13 +        
   '           1, ''Geração de Parcelas'', '                                                 + #13 +
   '           2, ''Amortização/Refinanciamento'', '                                         + #13 +
   '           3, ''Quitação Antecipada'', '                                                 + #13 +
   '           4, ''Tratamento de Divergências'', '                                          + #13 +
   '           5, ''Atualização de Saldo (Diária)'', '                                       + #13 +
   '           6, ''Recálculo Diário'', '                                                    + #13 +
   '           7, ''Tratamento Individual'', '                                               + #13 +
   '           8, ''Quitação por Morte/Invalidez'', '                                        + #13 +
   '           9, ''Importação/Migração'', '                                                 + #13 +
   '          10, ''Quitação por Resgate'', '                                                + #13 +
   //'          11, ''Recebimento'', '                                                         + #13 + //LEANDRO SIG131775
   '          11, DECODE(TMP_ORI.PRESTPARCIAL,''1'', ''Prestação Parcial'', NULL , ''Recebimento''), ' + #13 +    //LEANDRO SIG131775
   '          12, ''Entrada Manual'', '                                                      + #13 +
   '          13, ''Alteração de Concessão'', '                                              + #13 +
   '          14, ''Tratamento de Valores Não Programados'', '                               + #13 +
   '          15, ''Consulta de Contratos'', '                                               + #13 +
   '          16, ''Cancelamento de Concessão'', '                                           + #13 +
   '          17, ''Alteração Contratual'', '                                                + #13 +
   '          18, ''Liberação de Concessão'', '                                              + #13 +
   '          19, ''Envio'', '                                                               + #13 +
   '          41, ''Contabilização em Lote de Concessão'', '                                 + #13 +
   '          42, ''Contabilização em Lote de Prestação'', '                                 + #13 +
   '          43, ''Contabilização em Lote de Amortização'', '                               + #13 +
   '          44, ''Contabilização em Lote de Quitação'', '                                  + #13 +
   '          45, ''Contabilização em Lote de Encargos'', '                                  + #13 +
   '          46, ''Contabilização em Lote de Atualização Diária'', '                        + #13 +
   '          47, ''Contabilização em Lote de Ajustes'', '                                   + #13 +
   '          51, ''Desfazer Geração de Parcelas'', '                                        + #13 +
   '          52, ''Cancelamento de Amortização'', '                                         + #13 +
   '          53, ''Cancelamento de Quitação'', '                                            + #13 +
   '          61, ''Desfazer Envio'', '                                                      + #13 +
   '          62, ''Desfazer Recebimento'' '                                                 + #13 +
   '         ) AS ORIGEM, '                                                                  + #13 +

   '   NVL(HME.HMEDATAEFETIVA, HME.HMEDATAVENCTO) AS DATA_REF, '                             + #13;

   // ----------------------------------------------------------------------------------------------

   if chkValorAbsoluto.Checked then
   begin
      sSQL := sSQL +
   '   ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                        + #13 +
   '   ABS(NVL(HME.HMEVLREFETIVO, 0)) AS HMEVLREFETIVO, '                                          + #13 +
   '   ( ABS(NVL(HME.HMEVLRPREVISTO, 0)) - ABS(NVL(HME.HMEVLREFETIVO, 0)) ) AS VLRNAORECEBIDO, '   + #13;
   end
   else
   begin
      sSQL := sSQL +
   '   HME.HMEVLRPREVISTO, HME.HMEVLREFETIVO, '                                                    + #13 +
   '   ( NVL(HME.HMEVLRPREVISTO, 0) - NVL(HME.HMEVLREFETIVO, 0) ) AS VLRNAORECEBIDO, '             + #13;
   end;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   DECODE(NVL(PEP.FLGEXCEPCIONAL, 0), 0, ( '                                                         + #13 +
   '                                         TO_CHAR(NVL(HME.HMEPARCELA, 0),      ''00'') || '' / '' ||' + #13 +
   '                                         TO_CHAR(NVL(HME.HMENUMPARCELAS, 0),  ''00'') '              + #13 +
   '                                         ), '                                                        + #13 +
   '                                      1, ( '                                                         + #13 +
   '                                         TO_CHAR(NVL(HME.HMEPARCELAALT, 0),   ''00'') || '' / '' ||' + #13 +
   '                                         TO_CHAR(NVL(HME.HMEPARCELA, 0),      ''00'') || '' / '' ||' + #13 +
   '                                         TO_CHAR(NVL(HME.HMENUMPARCELAS, 0),  ''00'') '              + #13 +
   '                                         ) '                                                         + #13 +
   '         ) AS PARCELA, '                                                                             + #13 +

   '   DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') AS REC_PAG, '     + #13 +

   '   (DECODE(DOC.RECPAG, ''R'', ''A Receber'', ''P'', ''A Pagar'', '' '') || '' - '' '     +
      '|| NVL(HME.HMEDATAEFETIVA, HME.HMEDATAVENCTO)) AS REC_PAG_DATA '                      + #13 +

   'FROM '                                                                                   + #13 +
   '   PARAMEMPTMO       PEP, '                                                              + #13 +
   '   DOCUMENTO         DOC, '                                                              + #13 +
   '   HISTMOVEMPTMO     HME, '                                                              + #13 +
//   '   TIPOSUSPEMPTMO    TSE, '                                                              + #13 +
   '   PESSOA            MUT, '                                                              + #13 +
   '   PESSOA            PTR, '                                                              + #13 +
   '   PESSOA            CED, '                                                              + #13 +
   '   DEPENTIT          DEP, '                                                              + #13 +
   '   PARTPREVPLAN      PPP, '                                                              + #13 +
   '   ELEGPATRO         ELP, '                                                              + #13 +
   '   SITPART           SIT, '                                                              + #13 +
   '   TIPOCONTREMPTMO   TCE, '                                                              + #13 +
   '   TIPOEMPTMO        TEP, '                                                              + #13 +
   '   PLANPREVXCONTABIL PXC, '                                                              + #13 +
   '   PLANPREVCONTABIL  PPC, '                                                              + #13 +
   '   CONTRATOEMPTMO    CON, '                                                              + #13 +

   // Pendência 23260 - Marcos Topini em 14/11/2006
   '   VWMIGRACONTRATOEP MIG, '                                                                    + #13 +
   // Fim Pendência 23260

   //LEANDRO SIG131775 INICIO
   '     (SELECT ''1'' AS PRESTPARCIAL , TMP.*   '                                                   + #13 +
   '                             FROM TMPDESC TMP    '                                             + #13 +
   '                             WHERE ((TMP.VALORRECEBIDO > 0 AND TMP.VALORRECEBIDO < VALOR)  '   + #13 +
   '                             AND  TMP.DATARECEBIMENTO IS NOT NULL)) as TMP_ORI'                + #13 +
   //LEANDRO SIG131775 FIM

   'WHERE '                                                                                  + #13 +
   '       TEP.IDEMPRESAPROP         = ' + IntToStr(Sistema.IDEmpresa)                       + #13 +

   '   AND ( MIG.IDPATROATU          IN (' + molListaPatro.PegaPatro + ') '                  +
        ' OR ELP.IDPESSJURCEDIDO     IN (' + molListaPatro.PegaPatro + ') ) '                + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then sSQL := sSQL +
   '   AND PXC.IDPLANOPREV           IN (' + molListaPlano.PegaPlano + ') '                  + #13
   else sSQL := sSQL +
   '   AND MIG.IDPLANOCONTATU           IN (' + molListaPlano.PegaPlano + ') '                  + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND TCE.IDTIPOEMPTMO          = ' + DBcboTipoEmptmo.LookupValue                       + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND CON.IDTIPOCONTREMPTMO     = ' + DBcboTipoContrato.LookupValue                     + #13;

   sSQL := sSQL +
   '   AND CON.FLGSITUACAO         <> ''C'' '                                                + #13 +
   '   AND PPP.FLGDESATIVADO        = 0 '                                                    + #13 +
   '   AND DOC.IDMODULO             = 15 '                                                   + #13 +

   '   AND NVL(HME.HMEDATAEFETIVA, HME.HMEDATAPREVISTA) BETWEEN ' + OraData(edtDataIni.Date) +
           ' AND ' + OraData(edtDataFim.Date)                                                + #13 +

   '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1) '                           + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0) = 0 '                                                    + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)   = 0 '                                                    + #13 +
   '   AND NVL(HME.FLGABONADO, 0)   = 0 '                                                    + #13;

   if chkValorDiverg.Checked     then sSQL := sSQL +
   '   AND HME.HMEVLREFETIVO        <> HME.HMEVLRPREVISTO '                                  + #13;

   if chkValorNAOZero.Checked    then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0) <> 0 '                                                  + #13;

   if chkValorZero.Checked       then sSQL := sSQL +
   '   AND NVL(HME.HMEVLREFETIVO, 0)  = 0 '                                                  + #13;

//   '   AND ( '                                                                               + #13 +
//   '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR '                                                 + #13 +
//   '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGEMABERTO, 0) = 1) '                 + #13 +
//   '       ) '                                                                               + #13 +

   sSQL := sSQL +
   '   AND CON.IDPLANOORIGEM         = PXC.IDPLANPREVC '                                     + #13 +
   '   AND PXC.IDPLANOPREV           = PPC.IDPLANOPREV '                                     + #13 +

   '   AND CON.IDPATRO               = PTR.IDPESSOA '                                        + #13 +
   '   AND ELP.IDPESSJURCEDIDO       = CED.IDPESSOA(+) '                                     + #13 +

   '   AND CON.IDBENEF               = MUT.IDPESSOA '                                        + #13 +
   '   AND CON.IDBENEF               = DEP.IDPESSOA '                                        + #13 +
   '   AND CON.IDPESSOA              = DEP.IDTITULAR '                                       + #13 +

   '   AND CON.IDPESSOA              = PPP.IDPESSOA '                                        + #13 +
   '   AND PPP.IDSITPART             = SIT.IDSITPART '                                       + #13 +

   '   AND CON.IDPESSOA              = ELP.IDPESSOA '                                        + #13 +
   '   AND CON.IDPATRO               = PPP.IDPESSJUR '                                       + #13 +

   '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO '                               + #13 +
   '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO '                                    + #13 +

   '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '                                + #13 +
   '   AND HME.CODDOCUMENTO          = DOC.CODDOCUMENTO '                                    + #13 +

   // Pendência 23260 - Marcos Topini
   '  AND MIG.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO '                              + #13 +
   '  AND MIG.DATAMIGRA                = (SELECT MAX(DATAMIGRA) '                            + #13 +
   '                                        FROM VWMIGRACONTRATOEP '                         + #13 +
   '                                       WHERE IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '   + #13 +
   '                                         AND DATAMIGRA       <= HME.HMEDATAPREVISTA) '   + #13 +
   // Fim Pendência 23260

   '   AND (HME.idcontratoemptmo = TMP_ORI.IDDESCONTO(+) AND HME.HMEPARCELAALT    = TMP_ORI.PARCELA(+) ) ' + #13 +  // LEANDRO SIG131775

   'ORDER BY '                                                                               + #13;

   sSQL := sSQL +
   '   NVL(HME.HMEDATAEFETIVA, HME.HMEDATAVENCTO), DOC.RECPAG, '                             + #13;

   if not(chkQuebra.Checked) then sSQL := sSQL +
   '   PPC.NOME, NVL(CED.NOME, PTR.NOME), '                                                  + #13;

   sSQL := sSQL +
   '   MUT.NOME, HME.CODDOCUMENTO';

   // ----------------------------------------------------------------------------------------------

   dtmRelItensEnvioCapCarPP.qryItensEnvioCapCarPP.Close;
   dtmRelItensEnvioCapCarPP.qryItensEnvioCapCarPP.SQL.Text := sSQL;
   dtmRelItensEnvioCapCarPP.qryItensEnvioCapCarPP.SQL.SaveToFile(sArquivo);

   AssignFile(Arquivo, sArquivo);

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, ' ');
      Writeln(Arquivo, 'Início  : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      CloseFile(Arquivo);
   end;

   dtmRelItensEnvioCapCarPP.qryItensEnvioCapCarPP.Open;

   if FileExists(sArquivo) then
   begin
      Append(Arquivo);
      Writeln(Arquivo, 'Término : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      CloseFile(Arquivo);
   end;

   // ----------------------------------------------------------------------------------------------
end;



procedure TcfgRelItensEnvioCapCarPP.FormShow(Sender: TObject);
var
   dDataHoje : TDateTime;
   dDataIni  : TDateTime;
begin
   inherited;

   // preenche as datas - período sempre de Domingo a Sábado
   dDataHoje         :=  Sysdate;

   case DayOfWeek(dDataHoje) of
      1, 2, 3, 4: dDataIni := dDataHoje - (DayOfWeek(dDataHoje) + 6);
      5, 6, 7:    dDataIni := dDataHoje - (DayOfWeek(dDataHoje) - 1);
   end;

   edtDataIni.Date   := dDataIni;
   edtDataFim.Date   := dDataIni + 6;

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



procedure TcfgRelItensEnvioCapCarPP.btnLimpaEventoClick(Sender: TObject);
begin
   inherited;
   cboEvento.ItemIndex := -1;
end;



procedure TcfgRelItensEnvioCapCarPP.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelItensEnvioCapCarPP.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelItensEnvioCapCarPP.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelItensEnvioCapCarPP.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
