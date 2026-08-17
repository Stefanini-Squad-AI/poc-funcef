unit fImpFunCEFImoveis3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls, Gauges, Bde,
  Wwtable, CMSQLScript, Wwdatsrc, fcLabel, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmImpFunCEFImoveis3 = class(TfrmOkCancelar)
    qryConjunto: TwwQuery;
    qryConjuntoIDCONJUNTO: TFloatField;
    qryConjuntoIDPESSOA: TFloatField;
    qryConjuntoIDRESPONSAVEL: TFloatField;
    qryConjuntoIDLOCALIZACAO: TFloatField;
    qryConjuntoDISPONIVEL: TFloatField;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoALUGADO: TFloatField;
    qryGrupo: TwwQuery;
    qryClasse: TwwQuery;
    qrySituacao: TwwQuery;
    qrySituacaoIDSITUACAO: TFloatField;
    qrySituacaoDESCSITUACAO: TStringField;
    qryFornec: TwwQuery;
    qrySubConta: TwwQuery;
    qrySubContaIDPESSOA: TFloatField;
    qrySubContaCODSUBCONTA: TFloatField;
    qryConjNovo: TwwQuery;
    qryConjNovoIDCONJUNTO: TFloatField;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespFLGATIVOFIXO: TFloatField;
    qryLocal: TwwQuery;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    pnlStatus: TPanel;
    qryParamCaf: TwwQuery;
    qryParamCafNUMDIASANO: TFloatField;
    qryParamCafIDPESSOA: TFloatField;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryCotacao: TwwQuery;
    qryFornecIDPESSOA: TFloatField;
    qryPlaca: TwwQuery;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoCLASSE: TStringField;
    qryClasseIDCLASSEBEM: TFloatField;
    qryClasseCODHIERARQ: TStringField;
    qryClasseANASINT: TStringField;
    qryClasseDESCRICAO: TStringField;
    qryClasseIDGRUPO: TFloatField;
    qryGrupoTAXADEP: TFloatField;
    lblPlaca: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoCOTDATA: TDateTimeField;
    qryCotacaoCOTVALOR: TFloatField;
    qryCotacaoCOTMESREF: TStringField;
    qryCotacaoTIPO: TStringField;
    qryAux: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField1: TStringField;
    FloatField6: TFloatField;
    edArqDBMov: TEdit;
    btnSelMov: TSpeedButton;
    tblHistorico: TwwTable;
    opDlgDB: TOpenDialog;
    qryCMImovel: TwwQuery;
    qryCMImovelIDPESSOA: TFloatField;
    qryCMImovelIDIMOVELMESTRE: TFloatField;
    qryCMImovelIDIMOVEL: TFloatField;
    qryCMImovelIMOCODIGO: TStringField;
    qryCMImovelIMOAREA: TFloatField;
    qryCMImovelIMONOME: TStringField;
    qryCMImovelIMODATACOMPRA: TDateTimeField;
    qryCMImovelIMOPERCENTRATEIO: TFloatField;
    scrRemImpBens: TCMSQLScript;
    tblCad96: TwwTable;
    tblCad99: TwwTable;
    tblReav99: TwwTable;
    lblPasso: TLabel;
    lblStatus: TLabel;
    tblReav96: TwwTable;
    tblCad96CODIGO: TStringField;
    tblCad96PARTE: TStringField;
    tblCad96VALORG: TFloatField;
    tblCad96CMBEM: TFloatField;
    tblCad96DEPLANC: TFloatField;
    tblCad96SLDREAVAL: TFloatField;
    tblCad96VLCTB: TFloatField;
    tblCad96CODPAI: TStringField;
    tblCad96IDGRUPO: TFloatField;
    tblCad96GRUPO: TStringField;
    tblCad96IMOVEL: TStringField;
    tblCad96JUROS: TFloatField;
    tblCad96DEPENCARG: TStringField;
    tblCad99CODIGO: TStringField;
    tblCad99PARTE: TStringField;
    tblCad99VALORG: TFloatField;
    tblCad99CMBEM: TFloatField;
    tblCad99DEPLANC: TFloatField;
    tblCad99SLDREAVAL: TFloatField;
    tblCad99VALCTB: TFloatField;
    tblCad99CODPAI: TStringField;
    tblCad99IDGRUPO: TFloatField;
    tblCad99GRUPO: TStringField;
    tblCad99IMOVEL: TStringField;
    tblCad99CIDADE: TStringField;
    tblCad99CMMES: TFloatField;
    tblCad99DEPENCARG: TFloatField;
    tblCad99JUROS: TFloatField;
    tblCad99CMDEP: TFloatField;
    tblCad99JUROSACUM: TFloatField;
    tblReav96IMOVEL: TStringField;
    tblReav96EDIFICACAO: TFloatField;
    tblReav96INSTALACAO: TFloatField;
    tblReav96TERRENO: TFloatField;
    tblReav96SOMA: TFloatField;
    tblReav96VU_EDIF: TFloatField;
    tblReav96VU_INST: TFloatField;
    tblReav96DATAREAVAL: TDateField;
    tblReav99IMOVEL: TStringField;
    tblReav99EDIFICACAO: TFloatField;
    tblReav99INSTALACAO: TFloatField;
    tblReav99TERRENO: TFloatField;
    tblReav99SOMA: TFloatField;
    tblReav99VU_EDIF: TFloatField;
    tblReav99VU_INST: TFloatField;
    tblReav99DATAREAVAL: TDateField;
    lblProgress: TLabel;
    updCMImovel: TUpdateSQL;
    qryCMImovelCODTIPIMOVEL: TStringField;
    dsHistorico: TwwDataSource;
    tblHistoricoIMOVEL: TStringField;
    tblHistoricoTIPO: TStringField;
    tblHistoricoANOMES: TStringField;
    tblHistoricoVALORG: TFloatField;
    tblHistoricoDEPACUM: TFloatField;
    tblHistoricoDEPMES: TFloatField;
    tblHistoricoAJUSTES: TFloatField;
    tblHistoricoRESIDUAL: TFloatField;
    tblHistoricoVLREAVAL: TFloatField;
    tblHistoricoVIDAUTIL: TFloatField;
    tblHistoricoDATAREAVAL: TStringField;
    tblHistoricoREAVALANT: TFloatField;
    ckbClean: TCheckBox;
    Label1: TLabel;
    bbtnBatchMove: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelMovClick(Sender: TObject);
    procedure scrRemImpBensProgress(Sender: TCMSQLScript;
      var Cancel: Boolean; Line: Integer; cmd: String);
    procedure scrRemImpBensScriptError(cmd: String; e: Exception;
      var Action: TScriptErrorAction);
    procedure bbtnBatchMoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bScriptOk : Boolean;
    arqBem,                 // BEM
    arqConjunto,            // CONJUNTO
    arqRateio,              // RATEIODEPRECIACAO
    arqImovelxBem,          // IMOVELXBEM
    arqReavaliacao,         // REAVALIACAO
    arqAcrescimo,           // ACRESCIMOVALOR
    arqHistMov,             // HISTORICOMOVIMENTACAO
    arqValMov,              // VALORMOVIMENTACAO
    arqDeprec : TextFile;   // DEPRECIACAOBEM
    sLinha    : String;
    //------------------------------------------------------------------------------------
    //procedure RegistraCadastro;
    //procedure RegistraMovimentacao;
    //------------------------------------------------------------------------------------
    Procedure GeraConjunto(Var sIdConjunto : String; sDescConjunto : String;
                           dDataEnt : tDateTime);

    Procedure GeraRateioCustos(sIdConjunto : string; dDataEnt : tDateTime);

    procedure RegistraMovInicial(fIdBem, fIdPessoa, fIdModulo : Double;
                                 dDataMov : tDateTime; fValOrg, fCmBem,
                                 fDepLanc, fCmDep : Double);

    procedure RegistraMovReav(fIdBem, fIdPessoa, fIdModulo : Double;
                              dDataMov : tDateTime; fReavValOrg, fReavTaxaDep : Double;
                              bFlgUltReaval : boolean);

    procedure RegistraMovAcresc(fIdBem, fIdPessoa, fIdModulo : Double;
                                dDataMov : tDateTime;
                                fValAcresc, fTaxaDep : Double);

    procedure RegistraMovDeprec(fIdBem, fIdPessoa, fIdModulo : Double;
                                dDataMov : tDateTime; fValDep : Double);

    function RegistraMovimentacao(fBem, fEmpresaProp, fTipoMovimentacao,
                                  fModulo : Double; dDataMovimentacao: TDate) : Double;

    function RegistraValorMovimentacao(fSeqHist,
                                       fValOfi,fValFis,fValGer : Double) : Boolean;

    function InttoFloat(iNumber : Integer) : Extended;
  end;

  eExcessaoCAF = Class(Exception);

var
  frmImpFunCEFImoveis3: TfrmImpFunCEFImoveis3;

implementation

uses dBaseDados, uDataBase, uMensErro, uAtivoFixo, uSistema;

{$R *.DFM}

//========================================================================================
procedure TfrmImpFunCEFImoveis3.FormCreate(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Cria um alias temporário no local onde estão as tabelas base
   //-------------------------------------------------------------------------------------
   with Session do
   begin
      ConfigMode := cmSession;
      try
         AddStandardAlias('IMOVEIS', ExtractFilePath(ParamStr(0)), 'PARADOX');
      finally
         ConfigMode := cmAll;
      end;   
   end;
   //-------------------------------------------------------------------------------------
   qryCMImovel.Prepare;
   qryGrupo.Prepare;
   qryClasse.Prepare;
   qryConjunto.Prepare;
   qrySituacao.Prepare;
   qryFornec.Prepare;
   qryLocal.Prepare;
   qryResp.Prepare;
   qryConjNovo.Prepare;
   qryPlaca.Prepare;
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.btnSelMovClick(Sender: TObject);
begin
   inherited;
   OpDlgDB.Execute;
   edArqDBMov.Text  := OpDlgDB.FileName;
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.bbtnConfirmarClick(Sender: TObject);
Var
   ArquivoTexto                                         : TextFile;
   sRegistro, sControle, sIdLocalizacao,
   sPeriodo, sImovelSAF, sTipoImovel, sCadAno, sDesBem,
   sAnoIni, sAnoFim, sIdConjunto, sPlaca, sPlacaOk,
   sDesConjunto, sCodGrupo, sImoDataCompra, sImoTipo    : String;
   i, iClasseBem, iSituacao, iTotReg, iGrupo, iIdBem,
   iMeses, iLinMOV, iLinCAD96, iLinCAD99, iLinMovIni,
   iLinReav99, iLinReav96, iContaPlaca                  : Integer;
   bGeraConjunto, bFlgMovIni, bCad96, bCad99,
   bReav96, bReav99                                     : Boolean;
   fValOrg99, fCmBem99, fDepLanc99, fCmDep99,
   fTaxaDep, fValOrg96, fCmBem96, fDepLanc96, fCmDep96,
   fReavalAnt, fPropArea, fValOrgIni, fDepLancIni,
   fCmBemIni, fCmDepIni, fSldReavIni, fDeprec,
   fValOrgAnt, fDepLancAnt, fCmBemAnt, fCmDepAnt,
   fSldReavAnt, fAcrescimo, fReaval, fValOrg, fDepLanc,
   fCmBem, fCmDep, fSldReav, fTotDiaAno, fReavTaxaDep,
   fPlaca                                               : Double;
   dDataInclusao                                        : tDateTime;
   cSeparador : Char;

begin
   inherited;
   Screen.Cursor := crSQLWait;
   bbtnConfirmar.Enabled := False;
   //-------------------------------------------------------------------------------------
   // Remoção da Importação Anterior
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crSQLWait;
   if ckbClean.Checked then
   begin
      prgBar.Progress   := 0;
      prgbar.MaxValue   := 116;
      lblStatus.Caption := 'Removendo Importação Anterior';
      pnlStatus.Visible := True;
      frmImpFunCEFImoveis3.Invalidate;
      frmImpFunCEFImoveis3.Repaint;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      bScriptOk := True;
      scrRemImpBens.Execute;
      pnlStatus.Visible := False;
      if not bScriptOk then
      begin
         Screen.Cursor := crDefault;
         bbtnConfirmar.Enabled := True;
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Abre os arquivos dbf (CADASTRO, HISTORICO MENSAL e as REAVALIAÇÕES de 1996 e 1999
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Abrindo as Tabelas';
   pnlStatus.Visible := True;
   frmImpFunCEFImoveis3.Invalidate;
   frmImpFunCEFImoveis3.Repaint;
   Application.ProcessMessages;
   tblHistorico.Open;
   tblCad96.Open;
   tblCad99.Open;
   tblReav96.Open;
   tblReav99.Open;
   //-------------------------------------------------------------------------------------
   // Inicializa as variáveis comuns a todos os imóveis
   //-------------------------------------------------------------------------------------
   iClasseBem     := 516;
   iSituacao      := 9;
   sRegistro      := 'I';
   sControle      := 'T';
   sIdLocalizacao := '01'; // GEACI
   //-------------------------------------------------------------------------------------
   // Posiciona a tabela de Localização no Departamento de Invest.Imobiliário
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Localização...';
   lblPlaca.Caption  := '';
   frmImpFunCEFImoveis3.Invalidate;
   frmImpFunCEFImoveis3.Repaint;
   Application.ProcessMessages;
   qryLocal.Close;
   qryLocal.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryLocal.ParamByName('PIDLOCAL').AsString   := sIdLocalizacao;
   qryLocal.Open;
   //-------------------------------------------------------------------------------------
   // Abre a tabela IMOVEL e calcula a quantidade de linhas que serão processadas
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Imoveis TotalPrev...';
   lblPlaca.Caption  := '';
   frmImpFunCEFImoveis3.Invalidate;
   frmImpFunCEFImoveis3.Repaint;
   Application.ProcessMessages;
   qryCMImovel.Open;
   iTotReg := qryCMImovel.RecordCount;
   //-------------------------------------------------------------------------------------
   // Atualizando a Barra de Status
   //-------------------------------------------------------------------------------------
   prgbar.MaxValue   := iTotReg - 1;
   prgBar.Progress   := 0;
   lblProgress.Caption := floattostr(prgBar.Progress) + ' em ' + floattostr(prgbar.MaxValue);
   lblStatus.Caption := 'Importando o Cadastro de Imóveis...';
   lblPlaca.Caption  := '';
   pnlStatus.Visible := True;
   frmImpFunCEFImoveis3.Invalidate;
   frmImpFunCEFImoveis3.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      cSeparador       := DecimalSeparator;
      DecimalSeparator := '.';
      //----------------------------------------------------------------------------------
      AssignFile(arqBem,         'C:\PROJETOSCOMDPL\CAF\BEM.DAT');
      Rewrite(arqBem);
      AssignFile(arqConjunto,    'C:\PROJETOSCOMDPL\CAF\CONJUNTO.DAT');
      Rewrite(arqConjunto);
      AssignFile(arqRateio,      'C:\PROJETOSCOMDPL\CAF\RATEIODEPRECIACAO.DAT');
      Rewrite(arqRateio);
      AssignFile(arqImovelxBem,  'C:\PROJETOSCOMDPL\CAF\IMOVELXBEM.DAT');
      Rewrite(arqImovelxBem);
      AssignFile(arqReavaliacao, 'C:\PROJETOSCOMDPL\CAF\REAVALIACAO.DAT');
      Rewrite(arqReavaliacao);
      AssignFile(arqAcrescimo,   'C:\PROJETOSCOMDPL\CAF\ACRESCIMOVALOR.DAT');
      Rewrite(arqAcrescimo);
      AssignFile(arqHistMov,     'C:\PROJETOSCOMDPL\CAF\HISTORICOMOVIMENTACAO.DAT');
      Rewrite(arqHistMov);
      AssignFile(arqValMov,      'C:\PROJETOSCOMDPL\CAF\VALORMOVIMENTACAO.DAT');
      Rewrite(arqValMov);
      AssignFile(arqDeprec,      'C:\PROJETOSCOMDPL\CAF\DEPRECIACAOBEM.DAT');
      Rewrite(arqDeprec);
      //----------------------------------------------------------------------------------
      AssignFile(ArquivoTexto,   'C:\IMPORTACAOIMOVEIS.LOG');
      Rewrite(ArquivoTexto);
      //----------------------------------------------------------------------------------
      qryCMImovel.First;
      while not qryCMImovel.EOF do
      begin
         sImovelSAF    := qryCMImovelIMOCODIGO.AsString;
         bGeraConjunto := True;
         sImoTipo      := '';
         iContaPlaca   := 0;
         //-------------------------------------------------------------------------------
         // Calcula a proporção deste Imóvel CM em relação imóvel SAF pela ÁREA
         //-------------------------------------------------------------------------------
         fPropArea := qryCMImovelIMOPERCENTRATEIO.AsFloat / 100;
         //-------------------------------------------------------------------------------
         // Posiciona no Historico Inicial do Imóvel
         //-------------------------------------------------------------------------------
         if not tblHistorico.FindKey([sImovelSAF]) then
         begin
            sLinha := '';
            sLinha := sLinha + 'O Imovel ' + sImovelSAF + ' não possui Histórico no SAF';
            WriteLn(ArquivoTexto,sLinha);
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + 1;
            lblProgress.Caption := floattostr(prgBar.Progress) + ' em ' + floattostr(prgbar.MaxValue);
            frmImpFunCEFImoveis3.Invalidate;
            frmImpFunCEFImoveis3.Repaint;
            qryCMImovel.Next;
            Continue;
         end;
         //-------------------------------------------------------------------------------
         while (not tblHistorico.EOF) and
               (tblHistoricoIMOVEL.AsString = sImovelSAF) do
         begin
            sTipoImovel := tblHistoricoTIPO.AsString;
            iContaPlaca := iContaPlaca + 1;
            //----------------------------------------------------------------------------
            lblPlaca.Caption := 'IMOVEL SAF ' + sImovelSAF + ' Parte ' + sTipoImovel +
                                ' Rateio ' + trim(floattostr(fPropArea * 100)) + ' %' +
                                ' IMOVEL TotalPrev ' + qryCMImovelIDIMOVEL.AsString;
            lblPasso.Caption := 'Processa Movimentação';
            frmImpFunCEFImoveis3.Invalidate;
            frmImpFunCEFImoveis3.Repaint;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Posiciona os cadastros no imóvel que será processado
            //----------------------------------------------------------------------------
            lblPasso.Caption := 'Pesquisa CAD96';
            Application.ProcessMessages;
            tblCad96.IndexName := '';
            tblCad96.EditKey;
            tblCad96CODIGO.AsString := tblHistoricoIMOVEL.AsString;
            tblCad96PARTE.AsString  := tblHistoricoTIPO.AsString;
            bCad96 := tblCad96.GotoKey;
            if not bCad96 then
            begin
               tblCad96.IndexName := 'Cadastro96';
               bCad96 := tblCad96.FindKey([sImovelSAF]);
            end;
            //----------------------------------------------------------------------------
            lblPasso.Caption := 'Pesquisa CAD99';
            Application.ProcessMessages;
            tblCad99.IndexName := '';
            tblCad99.EditKey;
            tblCad99CODIGO.AsString := tblHistoricoIMOVEL.AsString;
            tblCad99PARTE.AsString  := tblHistoricoTIPO.AsString;
            bCad99 := tblCad99.GotoKey;
            if not bCad99 then
            begin
               tblCad99.IndexName := 'Cadastro99';
               bCad99 := tblCad99.FindKey([sImovelSAF]);
            end;
            //----------------------------------------------------------------------------
            // Se não achou dados cadastrais em 1996, captura os dados em 1999
            //----------------------------------------------------------------------------
            if bCad96 then
            begin
               sCadAno  := '96';
               dDataInclusao := strtodate('31/12/1996');
               sDesConjunto  := tblCad96IMOVEL.AsString;
               iGrupo        := tblCad96IDGRUPO.AsInteger;
               if tblCad96PARTE.AsString = 'C' then
                  sDesBem := trim(tblCad96IMOVEL.AsString + ' - EDIFICAÇÃO')
               else
               if tblCad96PARTE.AsString = 'T' then
                  sDesBem := trim(tblCad96IMOVEL.AsString + ' - TERRENO')
               else
               if tblCad96PARTE.AsString = 'I' then
                  sDesBem := trim(tblCad96IMOVEL.AsString + ' - INSTALAÇÕES')
               else
               if tblCad96PARTE.AsString = 'R' then
                  sDesBem := trim(tblCad96IMOVEL.AsString + ' - A RECEBER')
               else
                  sDesBem := trim(tblCad96IMOVEL.AsString + ' - ' + tblCad96PARTE.AsString);
            end else
            if bCad99 then
            begin
               sCadAno  := '99';
               dDataInclusao := strtodate('31/12/1999');
               sDesConjunto  := tblCad99IMOVEL.AsString;
               sDesBem       := tblCad99IMOVEL.AsString + ' ' + tblCad99PARTE.AsString;
               iGrupo        := tblCad99IDGRUPO.AsInteger;
               if tblCad99PARTE.AsString = 'C' then
                  sDesBem := trim(tblCad99IMOVEL.AsString + ' - EDIFICAÇÃO')
               else
               if tblCad99PARTE.AsString = 'T' then
                  sDesBem := trim(tblCad99IMOVEL.AsString + ' - TERRENO')
               else
               if tblCad99PARTE.AsString = 'I' then
                  sDesBem := trim(tblCad99IMOVEL.AsString + ' - INSTALAÇÕES')
               else
               if tblCad99PARTE.AsString = 'R' then
                  sDesBem := trim(tblCad99IMOVEL.AsString + ' - A RECEBER')
               else
                  sDesBem := trim(tblCad99IMOVEL.AsString + ' - ' + tblCad99PARTE.AsString);
            end else
            begin
               iGrupo := -1;
               sLinha := '';
               sLinha := sLinha + 'O Imovel SAF ' + sImovelSAF + ' está no Historico e '+
                                  'não está cadastrado em CAD96 ou CAD99';
               WriteLn(ArquivoTexto,sLinha);
               //-------------------------------------------------------------------------
               while (not tblHistorico.EOF) and
                     (tblHistoricoIMOVEL.AsString = sImovelSAF) do tblHistorico.Next;
               Continue;
            end;
            //----------------------------------------------------------------------------
            // Posicionar a tabela GRUPO para a composição das Placas de Patrimonio
            //----------------------------------------------------------------------------
            lblPasso.Caption := 'Pesquisa GRUPO';
            Application.ProcessMessages;
            qryGrupo.Close;
            qryGrupo.ParamByName('PIDGRUPO').AsInteger := iGrupo;
            qryGrupo.Open;
            if (qryGrupo.IsEmpty) then
            begin
               sLinha := '';
               sLinha := sLinha + 'O Imóvel SAF ' + sImovelSAF + ' está sem Grupo Contábil definido';
               WriteLn(ArquivoTexto,sLinha);
               //-------------------------------------------------------------------------
               while (not tblHistorico.EOF) and
                     (tblHistoricoIMOVEL.AsString = sImovelSAF) do tblHistorico.Next;
               Continue;
            end;
            sCodGrupo := qryGrupoCLASSE.AsString;
            //----------------------------------------------------------------------------
            // Calcula a Taxa de Depreciacao, pela última reavaliacao
            //----------------------------------------------------------------------------
            lblPasso.Caption := 'Pesquisa REAV99';
            Application.ProcessMessages;
            tblReav99.EditKey;
            tblReav99IMOVEL.AsString := tblHistoricoIMOVEL.AsString;
            bReav99 := tblReav99.GotoKey;
            //----------------------------------------------------------------------------
            if bReav99 then
            begin
               if (sTipoImovel = 'C') then
               begin
                  iMeses := tblReav99VU_EDIF.AsInteger;
               end else
               if (sTipoImovel = 'I') then
               begin
                  iMeses := tblReav99VU_INST.AsInteger;
               end else
               begin
                  iMeses := 0;
               end;
               //-------------------------------------------------------------------------
               // Se o número de meses for diferente de zero, calcular a taxa de
               // depreciação
               //-------------------------------------------------------------------------
               if (iMeses <> 0) then
               begin
                  fValOrg99  := tblCad99VALORG.AsFloat;
                  fCmBem99   := tblCad99CMBEM.AsFloat;
                  fDepLanc99 := tblCad99DEPLANC.AsFloat;
                  fCmDep99   := 0;
                  fTaxaDep   := (((fValOrg99 + fCmBem99) - (fDepLanc99 + fCmDep99)) /
                                  (iMeses / 12) / (fValOrg99 + fCmBem99));
               end else
               begin
                  fTaxaDep := 0;
               end;
            end else
            //----------------------------------------------------------------------------
            // Se não achar a Reavaliacao em 1999, pesquisar em 1996
            //----------------------------------------------------------------------------
            begin
               lblPasso.Caption := 'Pesquisa REAV96';
               Application.ProcessMessages;
               tblReav96.EditKey;
               tblReav96IMOVEL.AsString := tblHistoricoIMOVEL.AsString;
               bReav96 := tblReav96.GotoKey;
               //-------------------------------------------------------------------------
               if bReav96 then
               begin
                  if (sTipoImovel = 'C') then
                  begin
                     iMeses := tblReav99VU_EDIF.AsInteger;
                  end else
                  if (sTipoImovel = 'I') then
                  begin
                     iMeses := tblReav99VU_INST.AsInteger;
                  end else
                  begin
                     iMeses := 0;
                  end;
               end else
               begin
                  iMeses := 0;
               end;
               //-------------------------------------------------------------------------
               // Se o número de meses for diferente de zero, calcular a taxa de
               // depreciação
               //-------------------------------------------------------------------------
               if (iMeses <> 0) then
               begin
                  fValOrg96  := tblCad99VALORG.AsFloat;
                  fCmBem96   := tblCad99CMBEM.AsFloat;
                  fDepLanc96 := tblCad99DEPLANC.AsFloat;
                  fCmDep96   := 0;
                  fTaxaDep   := (((fValOrg96 + fCmBem96) - (fDepLanc96 + fCmDep96)) /
                                 (iMeses / 12) / (fValOrg96 + fCmBem96));
               end else
               begin
                  fTaxaDep := 0;
               end;
            end;
            //----------------------------------------------------------------------------
            // Gera o Conjunto para o Imóvel SAF
            //----------------------------------------------------------------------------
            if bGeraConjunto then
            begin
               lblPasso.Caption := 'Gera Conjunto';
               Application.ProcessMessages;
               sIdConjunto := '';
               GeraConjunto(sIdConjunto,sDesConjunto,dDataInclusao);
               bGeraConjunto := False;
            end;
            //----------------------------------------------------------------------------
            // Captura o Tipo de Imóvel
            //----------------------------------------------------------------------------
            if (sImoTipo = '') then
            begin
               if (iGrupo >= 62) and (iGrupo <= 63) then
               begin
                  sImoTipo := 'TERR'
               end else
               if (iGrupo >= 64) and (iGrupo <= 67) then
               begin
                  sImoTipo := 'CONST'
               end else
               if (iGrupo >= 68) and (iGrupo <= 71) then
               begin
                  sImoTipo := 'PROP'
               end else
               if (iGrupo >= 73) and (iGrupo <= 76) then
               begin
                  sImoTipo := 'PATRO'
               end else
               if (iGrupo >= 77) and (iGrupo <= 80) then
               begin
                  sImoTipo := 'RENDA'
               end else
               if (iGrupo >= 81) and (iGrupo <= 84) then
               begin
                  sImoTipo := 'SHOPP'
               end else
               if (iGrupo >= 85) and (iGrupo <= 88) then
               begin
                  sImoTipo := 'HOTEL'
               end else
               if (iGrupo >= 89) and (iGrupo <= 92) then
               begin
                  sImoTipo := 'ENTRE'
               end else
               if (iGrupo >= 93) and (iGrupo <= 96) then
               begin
                  sImoTipo := 'HOSP'
               end;
            end;
            //----------------------------------------------------------------------------
            // Gera um Id para essa parte do imóvel
            //----------------------------------------------------------------------------
            iIdBem := LeUltRegistro(nil,'BEM');
            //----------------------------------------------------------------------------
            // Cálculo do valor acumulado das Reavaliações Anteriores
            //----------------------------------------------------------------------------
            fReavalAnt := ((tblHistoricoVLREAVAL.AsFloat) - (tblHistoricoREAVALANT.AsFloat));
            //----------------------------------------------------------------------------
            // Leitura dos Valores iniciais
            //----------------------------------------------------------------------------
            fValOrgIni := (tblHistoricoVALORG.AsFloat) + fReavalAnt;
            //----------------------------------------------------------------------------
            if (fTaxaDep <> 0) then
               fDepLancIni := (tblHistoricoDEPACUM.AsFloat)
            else
               fDepLancIni := 0;
            //----------------------------------------------------------------------------
            fCmBemIni   := 0;
            fCmDepIni   := 0;
            fSldReavIni := tblHistoricoREAVALANT.AsFloat;
            fValOrgAnt  := fValOrgIni;
            fDepLancAnt := fDepLancIni;
            fCmBemAnt   := fCmBemIni;
            fCmDepAnt   := fCmDepIni;
            fSldReavAnt := fSldReavIni;
            bFlgMovIni  := True;
            //----------------------------------------------------------------------------
            fValOrg  := 0;
            fCmBem   := 0;
            fDepLanc := 0;
            fCmDep   := 0;
            //----------------------------------------------------------------------------
            // Processa o Histórico da Parte do Imóvel
            //----------------------------------------------------------------------------
            lblPasso.Caption := 'Processando Periodos';
            Application.ProcessMessages;
            while (not tblHistorico.EOF) and
                  (tblHistoricoIMOVEL.AsString = sImovelSAF) and
                  (tblHistoricoTIPO.AsString   = sTipoImovel) do
            begin
               //-------------------------------------------------------------------------
               // Ignora o periodo anterior a 12/1996
               //-------------------------------------------------------------------------
               if (tblHistoricoANOMES.AsInteger < 199612) then
               begin
                  tblHistorico.Next;
                  Continue;
               end;
               //-------------------------------------------------------------------------
               // Registra com zero os campos numéricos com nulo
               //-------------------------------------------------------------------------
               if (tblHistoricoVALORG.IsNull) or (tblHistoricoDEPACUM.IsNull) or
                  (tblHistoricoRESIDUAL.IsNull) or (tblHistoricoVLREAVAL.IsNull) or
                  (tblHistoricoREAVALANT.IsNull) then
               begin
                  tblHistorico.Edit;
                  if (tblHistoricoVALORG.IsNull)    then tblHistoricoVALORG.AsFloat := 0;
                  if (tblHistoricoDEPACUM.IsNull)   then tblHistoricoDEPACUM.AsFloat := 0;
                  if (tblHistoricoRESIDUAL.IsNull)  then tblHistoricoRESIDUAL.AsFloat := 0;
                  if (tblHistoricoVLREAVAL.IsNull)  then tblHistoricoVLREAVAL.AsFloat := 0;
                  if (tblHistoricoREAVALANT.IsNull) then tblHistoricoREAVALANT.AsFloat := 0;
                  tblHistorico.Post;
               end;
               //-------------------------------------------------------------------------
               // Ignora os registros com valores zerados
               //-------------------------------------------------------------------------
               if (tblHistoricoVALORG.AsFloat = 0) AND
                  (tblHistoricoDEPACUM.AsFloat = 0) AND
                  (tblHistoricoRESIDUAL.AsFloat = 0) AND
                  (tblHistoricoVLREAVAL.AsFloat = 0) AND
                  (tblHistoricoREAVALANT.AsFloat = 0) then
               begin
                  tblHistorico.Next;
                  Continue;
               end;
               //-------------------------------------------------------------------------
               // Calcula a data da movimentação
               //-------------------------------------------------------------------------
               sPeriodo := tblHistoricoANOMES.AsString;
               //-------------------------------------------------------------------------
               if ((copy(sPeriodo,5,2) = '01') or (copy(sPeriodo,5,2) = '03') or
                   (copy(sPeriodo,5,2) = '05') or (copy(sPeriodo,5,2) = '07') or
                   (copy(sPeriodo,5,2) = '08') or (copy(sPeriodo,5,2) = '10') or
                   (copy(sPeriodo,5,2) = '12')) then
               begin
                  sPeriodo := '31/' + copy(sPeriodo,5,2) + '/' + copy(sPeriodo,1,4);
               end else
               if ((copy(sPeriodo,5,2) = '04') or (copy(sPeriodo,5,2) = '06') or
                   (copy(sPeriodo,5,2) = '09') or (copy(sPeriodo,5,2) = '11')) then
               begin
                  sPeriodo := '30/' + copy(sPeriodo,5,2) + '/' + copy(sPeriodo,1,4);
               end else
               begin
                  sAnoIni    := '01/01/' + copy(sPeriodo,1,4);
                  sAnoFim    := '31/12/' + copy(sPeriodo,1,4);
                  fTotDiaAno := (strtodate(sAnoFim) - strtodate(sAnoIni)) + 1;
                  //----------------------------------------------------------------------
                  if (fTotDiaAno = 365) then
                  begin
                     sPeriodo := '28/' + copy(sPeriodo,5,2) + '/' + copy(sPeriodo,1,4);
                  end else
                  begin
                     sPeriodo := '29/' + copy(sPeriodo,5,2) + '/' + copy(sPeriodo,1,4);
                  end;
               end;
               //-------------------------------------------------------------------------
               // Cálculo do valor acumulado das Reavaliações Anteriores
               //-------------------------------------------------------------------------
               fReavalAnt := ((tblHistoricoVLREAVAL.AsFloat) -
                              (tblHistoricoREAVALANT.AsFloat));
               //-------------------------------------------------------------------------
               // Leitura dos valores do histórico no periodo
               //-------------------------------------------------------------------------
               fValOrg := tblHistoricoVALORG.AsFloat + fReavalAnt;
               if (fTaxaDep <> 0) then
                  fDepLanc := tblHistoricoDEPACUM.AsFloat
               else
                  fDeplanc := 0;
               fCmBem := 0;
               fCmDep := 0;
               fSldReav := tblHistoricoREAVALANT.AsFloat;
               if (tblHistoricoVIDAUTIL.AsFloat <> 0) then
                  fReavTaxaDep := (100 / (tblHistoricoVIDAUTIL.AsFloat / 12))
               else
                  fReavTaxaDep := 0;
               //-------------------------------------------------------------------------
               if bFlgMovIni then
               begin
                  //----------------------------------------------------------------------
                  // Calcula o Lançamento Inicial
                  //----------------------------------------------------------------------
                  RegistraMovInicial(inttofloat(iIdBem),
                                     Sistema.IdEmpresa,
                                     Sistema.IDModulo,
                                     strtodate(sPeriodo),
                                     (fValOrg  * fPropArea),
                                     (fCmBem   * fPropArea),
                                     (fDepLanc * fPropArea),
                                     (fCmDep   * fPropArea));
                  //----------------------------------------------------------------------
                  // Calcula a Reavaliação Inicial
                  //----------------------------------------------------------------------
                  if (fSldReav <> 0) then
                  begin
                     RegistraMovReav(inttofloat(iIdBem),
                                     Sistema.IdEmpresa,
                                     Sistema.IdModulo,
                                     strtodate(sPeriodo),
                                     (fSldReav * fPropArea),
                                     fReavTaxaDep,
                                     True);
                  end;
                  bFlgMovIni := False;
               end else
               begin
                  //----------------------------------------------------------------------
                  // Registra Acréscimo de Valor (Se existir)
                  //----------------------------------------------------------------------
                  fAcrescimo := fValOrg - fValOrgAnt;
                  if (fAcrescimo <> 0) then
                  begin
                     RegistraMovAcresc(inttofloat(iIdBem),
                                       Sistema.IdEmpresa,
                                       Sistema.IdModulo,
                                       strtodate(sPeriodo),
                                       (fAcrescimo * fPropArea),
                                       fTaxaDep);
                  end;
                  //----------------------------------------------------------------------
                  // Registra Depreciacao (Se Existir)
                  //----------------------------------------------------------------------
                  fDeprec := tblHistoricoDEPMES.AsFloat;
                  if (fDeprec <> 0) then
                  begin
                     RegistraMovDeprec(inttofloat(iIdBem),
                                       Sistema.IdEmpresa,
                                       Sistema.IdModulo,
                                       strtodate(sPeriodo),
                                       (fDeprec * fPropArea));
                  end;
                  //----------------------------------------------------------------------
                  // Registra Reavaliacao (Se Existir)
                  //----------------------------------------------------------------------
                  fReaval := fSldReav - fSldReavAnt;
                  if (fReaval <> 0) then
                  begin
                     RegistraMovReav(inttofloat(iIdBem),
                                     Sistema.IdEmpresa,
                                     Sistema.IdModulo,
                                     strtodate(sPeriodo),
                                     (fSldReav * fPropArea),
                                     fReavTaxaDep,
                                     True);
                  end;
               end;
               //-------------------------------------------------------------------------
               fValOrgAnt  := fValOrg;
               fSldReavAnt := fSldReav;
               //-------------------------------------------------------------------------
               tblHistorico.Next;
            end;
            //----------------------------------------------------------------------------
            // Calcula o Código da Placa
            //----------------------------------------------------------------------------
            sPlaca := sImovelSAF + '0' + StringOfChar('0',(4 - length(trim(inttostr(iContaPlaca))))) +
                      trim(inttostr(iContaPlaca)) + '0' + sCodGrupo;
            sPlacaOk := '';
            for i := 1 to length(sPlaca) do
            begin
               if sPlaca[i] <> '.' then
                  sPlacaOk := sPlacaOk + sPlaca[i];
            end;
            fPlaca := strtofloat(sPlacaOK);
            //----------------------------------------------------------------------------
            // Tratamento das Datas
            //----------------------------------------------------------------------------
            if qryCMImovelIMODATACOMPRA.IsNull then
               sImoDataCompra := qryCMImovelIMODATACOMPRA.AsString
            else
               sImoDataCompra := StringOfChar(' ',10);
            //----------------------------------------------------------------------------
            // Grava o Cadastro (Tabela BEM)
            //----------------------------------------------------------------------------
            lblPasso.Caption := 'Insere BEM';
            Application.ProcessMessages;
            sLinha := '';
            sLinha := sLinha + formatfloat('0000000000',inttofloat(iIdBem));           // IDBEM
            sLinha := sLinha + formatfloat('0000000000',inttofloat(Sistema.IdEmpresa));// IDPESSOA
            sLinha := sLinha + sImovelSAF + StringOfChar(' ',20 - length(sImovelSAF)); // IDOPCIONAL
            sLinha := sLinha + formatfloat('0000000000',strtofloat(sIdConjunto));      // IDCONJUNTO
            sLinha := sLinha + formatfloat('000000',inttofloat(iGrupo));               // IDGRUPO
            sLinha := sLinha + formatfloat('000000',inttofloat(Sistema.IdModulo));     // IDMODULO
            sLinha := sLinha + formatfloat('000000',inttofloat(iClasseBem));           // IDCLASSEBEM
            sLinha := sLinha + formatfloat('000000',inttofloat(iSituacao));            // IDSITUACAO
            sLinha := sLinha + sRegistro;                                              // REGISTRO
            sLinha := sLinha + sControle;                                              // CONTROLE
            sLinha := sLinha + formatfloat('00000000000000000000',fPlaca);             // PLACA
            sLinha := sLinha + copy(sDesBem+' '+
                                    StringOfChar(' ',200-length(sDesBem)),1,200);      // DESBEM
            sLinha := sLinha + sImoDataCompra;                                         // DTAINCLUSAO
            sLinha := sLinha + sImoDataCompra;                                         // DATAINICIODEP
            sLinha := sLinha + formatfloat('000000000000.00',fDepLancIni);             // VALDEPINI
            sLinha := sLinha + sPeriodo;                                               // DATAULTDEP
            sLinha := sLinha + formatfloat('000.000000',fTaxaDep);                     // TAXADEP
            sLinha := sLinha + formatfloat('000000000000.00',0);                       // VALHISTORICO
            sLinha := sLinha + formatfloat('000000000000.00',fValOrg);                 // VALORG
            sLinha := sLinha + formatfloat('000000000000.00',fCmBem);                  // CMBEM
            sLinha := sLinha + formatfloat('000000000000.00',fDepLanc);                // DEPLANC
            sLinha := sLinha + formatfloat('000000000000.00',fCmDep);                  // CMDEP
            sLinha := sLinha + 'N';                                                    // BAIXATOTAL
            sLinha := sLinha + formatfloat('000.000000',0);                            // PROPBAIXA
            sLinha := sLinha + '0';                                                    // FLGDEPREC
            Writeln(arqBem, sLinha);
            Flush(arqBem);
            //----------------------------------------------------------------------------
            // Grava o Relacionamento entre o Imóvel e o Bem
            //----------------------------------------------------------------------------
            lblPasso.Caption := 'Insere ImovelxBem';
            Application.ProcessMessages;
            sLinha := '';
            sLinha := sLinha + formatfloat('0000000000',qryCMImovelIDIMOVEL.AsFloat);   // IDIMOVEL
            sLinha := sLinha + formatfloat('0000000000',inttofloat(iIdBem));            // IDBEM
            sLinha := sLinha + formatfloat('0000000000',inttofloat(Sistema.IdEmpresa)); // IDPESSOA
            Writeln(arqImovelxBem, sLinha);
            Flush(arqImovelxBem);
         end;
         //-------------------------------------------------------------------------------
         // Registra o Tipo do Imovel
         //-------------------------------------------------------------------------------
         if (sImoTipo <> '') then
         begin
            qryCMImovel.Edit;
            qryCMImovelCODTIPIMOVEL.AsString := sImoTipo;
            qryCMImovel.Post;
            qryCMImovel.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryCMImovel.Next;
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + 1;
         lblProgress.Caption := floattostr(prgBar.Progress) + ' em ' + floattostr(prgbar.MaxValue);
         frmImpFunCEFImoveis3.Invalidate;
         frmImpFunCEFImoveis3.Repaint;
         Application.ProcessMessages;
      end;
      //----------------------------------------------------------------------------------
      msgdlg('Importação Completada', 'Informação', mtInformation, [mbOk], 0);
      //----------------------------------------------------------------------------------
      // Fecha os Arquivos
      //----------------------------------------------------------------------------------
      CloseFile(ArquivoTexto);
      CloseFile(arqBem);
      CloseFile(arqConjunto);
      CloseFile(arqRateio);
      CloseFile(arqImovelxBem);
      CloseFile(arqReavaliacao);
      CloseFile(arqAcrescimo);
      CloseFile(arqHistMov);
      CloseFile(arqValMov);
      CloseFile(arqDeprec);
      //----------------------------------------------------------------------------------
      tblHistorico.Close;
      tblCad96.Close;
      tblCad99.Close;
      tblReav96.Close;
      tblReav99.Close;
      //----------------------------------------------------------------------------------
      DecimalSeparator := cSeparador;
      //----------------------------------------------------------------------------------
      pnlStatus.Visible := False;
      prgBar.Progress := 0;
      bbtnConfirmar.Enabled := True;
   except
      msgdlg('ATENÇÃO! Importação Abortada.' + #13 +
             'VERIFIQUE O IMOVEL SAF -> [' + sImovelSAF + ']',
             'Erro', mtError, [mbOk], 0);
      //----------------------------------------------------------------------------------
      // Fecha os Arquivos
      //----------------------------------------------------------------------------------
      CloseFile(ArquivoTexto);
      CloseFile(arqBem);
      CloseFile(arqConjunto);
      CloseFile(arqRateio);
      CloseFile(arqImovelxBem);
      CloseFile(arqReavaliacao);
      CloseFile(arqAcrescimo);
      CloseFile(arqHistMov);
      CloseFile(arqValMov);
      CloseFile(arqDeprec);
      //----------------------------------------------------------------------------------
      tblHistorico.Close;
      tblCad96.Close;
      tblCad99.Close;
      tblReav96.Close;
      tblReav99.Close;
      //----------------------------------------------------------------------------------
      DecimalSeparator := cSeparador;
      //----------------------------------------------------------------------------------
      Raise;
   end;
end;
//========================================================================================
Procedure TfrmImpFunCEFImoveis3.GeraConjunto(Var sIdConjunto : String;
                                             sDescConjunto : String;
                                             dDataEnt : tDateTime);
Var
   sDescConj  : String;
begin
   if sIdConjunto = '' then
   begin
      sIdConjunto := inttostr(LeUltRegistro(nil,'CONJUNTO'));
   end;
   sDescConj  := sDescConjunto + StringOfChar(' ',200 - length(sDescConjunto));
   //-------------------------------------------------------------------------------------
   sLinha := '';
   sLinha := sLinha + formatfloat('0000000000',strtofloat(sIdConjunto));         // IDCONJUNTO
   sLinha := sLinha + formatfloat('0000000000',inttofloat(Sistema.IdEmpresa));   // IDPESSOA
   sLinha := sLinha + formatfloat('0000000000',qryLocalIDLOCALIZACAO.AsInteger); // IDLOCALIZACAO
   sLinha := sLinha + formatfloat('0000000000',qryLocalIDRESPONSAVEL.AsInteger); // IDRESPONSAVEL
   sLinha := sLinha + '1';                                                       // DISPONIVEL
   sLinha := sLinha + sDescConj;                                                 // DESCCONJUNTO
   sLinha := sLinha + '0';                                                       // ALUGADO
   WriteLn(arqConjunto, sLinha);
   Flush(arqConjunto);
   //-------------------------------------------------------------------------------------
   GeraRateioCustos(sIdConjunto,dDataEnt);
end;
//========================================================================================
Procedure TfrmImpFunCEFImoveis3.GeraRateioCustos(sIdConjunto : String; dDataEnt : tDateTime);
begin
   sLinha := '';
   sLinha := sLinha + formatfloat('0000000000',strtofloat(sIdConjunto));       // IDCONJUNTO
   sLinha := sLinha + formatfloat('0000000000',inttofloat(Sistema.IdEmpresa)); // IDPESSOA
   sLinha := sLinha + qryLocalCODCENTROCUSTO.AsString;                         // CODCENTROCUSTO
   sLinha := sLinha + '100';                                                   // PARTICIPACAO
   sLinha := sLinha + datetostr(dDataEnt);                                     // DTAINICIO
   WriteLn(arqRateio, sLinha);
   Flush(arqRateio);
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.RegistraMovInicial(fIdBem,fIdPessoa,fIdModulo : Double;
                                                   dDataMov : tDateTime; fValOrg, fCmBem,
                                                   fDepLanc, fCmDep : Double);
var
   fSeqHist : Double;

begin
   fSeqHist := RegistraMovimentacao(fIdBem,fIdPessoa,1,Sistema.IdModulo,dDataMov);
   //-------------------------------------------------------------------------------------
   RegistraValorMovimentacao(fSeqHist,fValOrg,fValOrg,fValOrg);
   //=====================================================================================
   if (fDepLanc <> 0) then
   begin
      fSeqHist := RegistraMovimentacao(fIdBem,fIdPessoa,17,Sistema.IdModulo,dDataMov);
      //----------------------------------------------------------------------------------
      RegistraValorMovimentacao(fSeqHist,fDepLanc,fDepLanc,fDepLanc);
      //----------------------------------------------------------------------------------
      sLinha := '';
      sLinha := sLinha + formatfloat('0000000000',fSeqHist);             // IDMOVIMENTACAO
      sLinha := sLinha + datetostr(dDataMov);                            // DATAULTDEP
      WriteLn(arqDeprec,sLinha);
      Flush(arqDeprec);
   end;
   //=====================================================================================
   if (fCmBem <> 0) then
   begin
      fSeqHist := RegistraMovimentacao(fIdBem,fIdPessoa,15,Sistema.IdModulo,dDataMov);
      //----------------------------------------------------------------------------------
      RegistraValorMovimentacao(fSeqHist,fCmBem,fCmBem,fCmBem);
      //----------------------------------------------------------------------------------
      sLinha := '';
      sLinha := sLinha + formatfloat('0000000000',fSeqHist);             // IDMOVIMENTACAO
      sLinha := sLinha + datetostr(dDataMov);                            // DATAULTDEP
      WriteLn(arqDeprec,sLinha);
      Flush(arqDeprec);
   end;
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.RegistraMovDeprec(fIdBem,fIdPessoa,fIdModulo : Double;
                                                  dDataMov : tDateTime; fValDep : Double);
var
   fSeqHist : Double;

begin
   fSeqHist := RegistraMovimentacao(fIdBem,fIdPessoa,17,Sistema.IdModulo,dDataMov);
   //-------------------------------------------------------------------------------------
   RegistraValorMovimentacao(fSeqHist,fValDep,0,0);
   //-------------------------------------------------------------------------------------
   sLinha := '';
   sLinha := sLinha + formatfloat('0000000000',fSeqHist);             // IDMOVIMENTACAO
   sLinha := sLinha + datetostr(dDataMov);                            // DATAULTDEP
   WriteLn(arqDeprec,sLinha);
   Flush(arqDeprec);
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.RegistraMovAcresc(fIdBem,fIdPessoa,fIdModulo : Double;
                                                 dDataMov : tDateTime;
                                                 fValAcresc, fTaxaDep : Double);
var
   fSeqHist, fIdAcresc : Double;

begin
   fSeqHist := RegistraMovimentacao(fIdBem,fIdPessoa,09,Sistema.IdModulo,dDataMov);
   //-------------------------------------------------------------------------------------
   fIdAcresc := LeUltRegistro(nil,'ACRESCIMOVALOR');
   sLinha := '';
   sLinha := sLinha + formatfloat('0000000000'     , fIdAcresc);      // IDACRESCIMO
   sLinha := sLinha + formatfloat('0000000000'     , fSeqHist);       // IDMOVIMENTACAO
   sLinha := sLinha + formatfloat('0000000000'     , fIdBem);         // IDBEM
   sLinha := sLinha + formatfloat('0000000000'     , fIdPessoa);      // IDPESSOA
   sLinha := sLinha + datetostr(dDataMov);                            // DATAACRESCIMO
   sLinha := sLinha + formatfloat('000.000000'     , fTaxaDep);       // TAXADEP
   sLinha := sLinha + formatfloat('000000000000.00', fValAcresc);     // VALORG
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // CMBEM
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // VALFIS
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // VALGER
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // DEPLANC
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // CMDEP
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // DEPFIS
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // DEPGER
   sLinha := sLinha + datetostr(dDataMov);                            // DATAULTDEP
   sLinha := sLinha + formatfloat('0', 0);                            // FLGDEPREC
   WriteLn(arqAcrescimo,sLinha);
   Flush(arqAcrescimo);
   //-------------------------------------------------------------------------------------
   RegistraValorMovimentacao(fSeqHist,fValAcresc, 0, 0);
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.RegistraMovReav(fIdBem,fIdPessoa,fIdModulo : Double;
                                               dDataMov : tDateTime; fReavValOrg,
                                               fReavTaxaDep : Double;
                                               bFlgUltReaval : boolean);
var
   fSeqHist, fIdReaval : Double;

begin
   fSeqHist := RegistraMovimentacao(fIdBem,fIdPessoa,32,Sistema.IdModulo,dDataMov);
   //-------------------------------------------------------------------------------------
   fIdReaval := LeUltRegistro(nil,'REAVALIACAO');
   sLinha := '';
   sLinha := sLinha + formatfloat('0000000000'     , fIdReaval);      // IDREAVALIACAO
   sLinha := sLinha + formatfloat('0000000000'     , fSeqHist);       // IDMOVIMENTACAO
   sLinha := sLinha + formatfloat('0000000000'     , fIdBem);         // IDBEM
   sLinha := sLinha + formatfloat('0000000000'     , fIdPessoa);      // IDPESSOA
   sLinha := sLinha + datetostr(dDataMov);                            // DATAREAVALIACAO
   sLinha := sLinha + formatfloat('000.000000'     , fReavTaxaDep);   // TAXADEP
   if fReavValOrg < 0 then
      sLinha := sLinha + formatfloat('00000000000.00', fReavValOrg)   // VALORG
   else
      sLinha := sLinha + formatfloat('000000000000.00', fReavValOrg);
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // CMBEM
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // VALFIS
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // VALGER
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // DEPLANC
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // CMDEP
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // DEPFIS
   sLinha := sLinha + formatfloat('000000000000.00', 0);              // DEPGER
   sLinha := sLinha + datetostr(dDataMov);                            // DATAULTDEP
   sLinha := sLinha + formatfloat('0', 0);                            // FLGDEPREC
   if bFlgUltReaval then
      sLinha := sLinha + formatfloat('0', 1)                          // FLGULTREAVAL
   else
      sLinha := sLinha + formatfloat('0', 0);
   WriteLn(arqReavaliacao,sLinha);
   Flush(arqReavaliacao);
   //-------------------------------------------------------------------------------------
   RegistraValorMovimentacao(fSeqHist,fReavValOrg,0,0);
end;
//========================================================================================
function TfrmImpFunCEFImoveis3.RegistraMovimentacao(fBem, fEmpresaProp, fTipoMovimentacao,
                                                    fModulo : Double; dDataMovimentacao: TDate) : Double;
var
   fMovimentacao : Extended;

begin
   //-------------------------------------------------------------------------------------
   fMovimentacao := LeUltRegistro(nil, 'HISTORICOMOVIMENTACAO');
   //-------------------------------------------------------------------------------------
   try
      sLinha := '';
      sLinha := sLinha + formatfloat('0000000000',fMovimentacao);
      sLinha := sLinha + formatfloat('0000000000',fBem);
      sLinha := sLinha + formatfloat('0000000000',fEmpresaProp);
      sLinha := sLinha + formatfloat('000'       ,fTipoMovimentacao);
      sLinha := sLinha + formatfloat('000'       ,fModulo);
      sLinha := sLinha + datetostr(dDataMovimentacao);
      WriteLn(arqHistMov,sLinha);
      Flush(arqHistMov);
      result := fMovimentacao;
   //-------------------------------------------------------------------------------------
   except
      Raise;
      result := -1;
   end;
end;
//========================================================================================
Function TfrmImpFunCEFImoveis3.RegistraValorMovimentacao(fSeqHist,fValOfi,fValFis,fValGer : Double) : Boolean;
begin
   try
      sLinha := '';
      sLinha := sLinha + formatfloat('0000000000'     ,fSeqHist);
      if fValOfi < 0 then
      begin
         sLinha := sLinha + formatfloat('00000000000.00',fValOfi) ;
         sLinha := sLinha + formatfloat('00000000000.00',fValFis) ;
         sLinha := sLinha + formatfloat('00000000000.00',fValGer) ;
      end else
      begin
         sLinha := sLinha + formatfloat('000000000000.00',fValOfi) ;
         sLinha := sLinha + formatfloat('000000000000.00',fValFis) ;
         sLinha := sLinha + formatfloat('000000000000.00',fValGer) ;
      end;
      WriteLn(arqValMov,sLinha);
      Flush(arqValMov);
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Raise;
      Result := False;
   end;
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
   inherited;
   qryGrupo.Close;
   qryClasse.Close;
   qryConjunto.Close;
   qrySituacao.Close;
   qryFornec.Close;
   qryLocal.Close;
   qryResp.Close;
   qryConjNovo.Close;
   qryPlaca.Close;
   tblHistorico.Close;
   tblCad96.Close;
   tblCad99.Close;
   tblReav96.Close;
   tblReav99.Close;
   //-------------------------------------------------------------------------------------
   qryGrupo.UnPrepare;
   qryClasse.UnPrepare;
   qryConjunto.UnPrepare;
   qrySituacao.UnPrepare;
   qryFornec.UnPrepare;
   qryLocal.UnPrepare;
   qryResp.UnPrepare;
   qryConjNovo.UnPrepare;
   qryPlaca.UnPrepare;
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.scrRemImpBensProgress(Sender: TCMSQLScript;
  var Cancel: Boolean; Line: Integer; cmd: String);
begin
   inherited;
   prgBar.Progress := Line;
   frmImpFunCEFImoveis3.Invalidate;
   frmImpFunCEFImoveis3.Repaint;
   Application.ProcessMessages
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.scrRemImpBensScriptError(cmd: String; e: Exception;
                                                         var Action: TScriptErrorAction);
begin
   inherited;
   { Valores para Action : eaRepeat, eaSkip, eaAbort }
   MsgDlg(E.Message + #13+#10 + #13+#10 + 'GERAÇÃO ABORTADA!',
          'Erro', mtError, [mbOk], 0);
   Action := eaAbort;
   bScriptOk := False;
end;
//========================================================================================
function TfrmImpFunCEFImoveis3.IntToFloat(iNumber : Integer) : Extended;
begin
   result := strtofloat(inttostr(iNumber));
end;
//========================================================================================
procedure TfrmImpFunCEFImoveis3.bbtnBatchMoveClick(Sender: TObject);
Var
   ArquivoTexto                                     : TextFile;
   sLinha, dDataReaval,
   sImovel, sTipo, sAnoMes, sAux                    : String;
   iTotReg, iPos, iField                            : Integer;
   fValorg, fDepAcum, fDepMes, fAjustes, fResidual,
   fVlReaval, fVidaUtil, fReavalAnt                 : Currency;

begin
   inherited;
   // TAB = 9
   //-------------------------------------------------------------------------------------
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Reinicializando Tabela de Historico...';
   prgBar.Progress   := 0;
   lblPlaca.Caption  := '';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   tblHistorico.Active := False;
   tblHistorico.EmptyTable;
   prgBar.Progress := 1;
   //-------------------------------------------------------------------------------------
   AssignFile(ArquivoTexto,edArqDBMov.Text);
   Reset(ArquivoTexto);
   iTotReg := 1;
   while not eof(ArquivoTexto) do
   begin
      ReadLn(ArquivoTexto,sLinha);
      iTotReg := iTotReg + 1;
   end;
   Reset(ArquivoTexto);
   //-------------------------------------------------------------------------------------
   prgbar.MaxValue   := iTotReg - 1;
   lblStatus.Caption := 'Traduzindo arquivo texto de movimentações...';
   prgBar.Progress   := 0;
   lblPlaca.Caption  := '';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      tblHistorico.Open;
      while not eof(ArquivoTexto) do
      begin
         ReadLn(ArquivoTexto,sLinha);
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if sLinha <> '' then
         begin
            sImovel     := '';
            sTipo       := '';
            sAnoMes     := '';
            fValorg     := 0;
            fDepAcum    := 0;
            fDepMes     := 0;
            fAjustes    := 0;
            fResidual   := 0;
            fVlReaval   := 0;
            fVidaUtil   := 0;
            dDataReaval := '';
            fReavalAnt  := 0;
            iPos := 1;
            iField := 1;
            while iPos <= length(sLinha) do
            begin
               sAux := '';
               while (iPos <= length(sLinha)) and (ord(sLinha[iPos]) <> 9) do
               begin
                  sAux := sAux + copy(sLinha,iPos,1);
                  iPos := iPos + 1;
               end;
               iPos := iPos + 1;
               //-------------------------------------------------------------------------
               if (sAux = '') and (((iField >= 04) and (iField <= 10)) or (iField = 12)) then
                  sAux := '0';
               //-------------------------------------------------------------------------
               case iField of
                  1 : sImovel     := sAux;
                  2 : sTipo       := sAux;
                  3 : sAnoMes     := sAux;
                  4 : fValorg     := strtofloat(sAux) / 100;
                  5 : fDepAcum    := strtofloat(sAux) / 100;
                  6 : fDepMes     := strtofloat(sAux) / 100;
                  7 : fAjustes    := strtofloat(sAux) / 100;
                  8 : fResidual   := strtofloat(sAux) / 100;
                  9 : fVlReaval   := strtofloat(sAux) / 100;
                 10 : fVidaUtil   := strtofloat(sAux);
                 11 : dDataReaval := sAux;
                 12 : fReavalAnt  := strtofloat(sAux) / 100;
               end;
               iField := iField + 1;
            end;
            //----------------------------------------------------------------------------
            tblHistorico.Append;
            tblHistoricoIMOVEL.AsString      := sImovel    ;
            tblHistoricoTIPO.AsString        := sTipo      ;
            tblHistoricoANOMES.AsString      := sAnoMes    ;
            tblHistoricoVALORG.AsCurrency    := fValorg    ;
            tblHistoricoDEPACUM.AsCurrency   := fDepAcum   ;
            tblHistoricoDEPMES.AsCurrency    := fDepMes    ;
            tblHistoricoAJUSTES.AsCurrency   := fAjustes   ;
            tblHistoricoRESIDUAL.AsCurrency  := fResidual  ;
            tblHistoricoVLREAVAL.AsCurrency  := fVlReaval  ;
            tblHistoricoVIDAUTIL.AsCurrency  := fVidaUtil  ;
            tblHistoricoDATAREAVAL.AsString  := dDataReaval;
            tblHistoricoREAVALANT.AsCurrency := fReavalAnt ;
            tblHistorico.Post;
         end;
      end;
   except
      tblHistorico.CancelUpdates;
   end;
   pnlStatus.Visible := False;
   tblHistorico.Close;
   Closefile(ArquivoTexto);
end;

end.

