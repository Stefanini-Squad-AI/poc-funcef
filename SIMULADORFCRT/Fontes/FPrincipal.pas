unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, ImgList, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti,
  IvEMulti, fcLabel, SConnect, MConnect, DBClient, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, fcStatusBar, uResource,
  CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuProcessos: TMenuItem;
    mnuSimulacao: TMenuItem;
    mnuProcAcertoManual: TMenuItem;
    N3: TMenuItem;
    mnuProcEfetivaMigracao: TMenuItem;
    mnuProcExcluiMigracao: TMenuItem;
    N4: TMenuItem;
    mnuProcAcertaPeculio: TMenuItem;
    mnuSimulacaoSub: TMenuItem;
    mnuAuxiliar: TMenuItem;
    N1: TMenuItem;
    mnuSimulacaoSub2Periodo: TMenuItem;
    mnuExportaDados: TMenuItem;
    mnuImportaDados: TMenuItem;
    N2: TMenuItem;
    mnuAcertaReserva: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    DemonstrativodeClculodoSRBeINSS1: TMenuItem;
    mnuRelExtratoMovReserva: TMenuItem;
    procedure mnuUtilProblemaContribClick(Sender: TObject);
    procedure mnuImportarClick(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuProcAcertoManualClick(Sender: TObject);
    procedure mnuProcEfetivaMigracaoClick(Sender: TObject);
    procedure mnuProcExcluiMigracaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mnuProcAcertaPeculioClick(Sender: TObject);
    procedure mnuSimulacaoSubClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuAuxiliarClick(Sender: TObject);
    procedure mnuSimulacaoSub2PeriodoClick(Sender: TObject);
    procedure mnuExportaDadosClick(
      Sender: TObject);
    procedure mnuImportaDadosClick(Sender: TObject);
    procedure mnuAcertaReservaClick(Sender: TObject);
    procedure DemonstrativodeClculodoSRBeINSS1Click(Sender: TObject);
    procedure mnuRelExtratoMovReservaClick(
      Sender: TObject);
  private
  public
    //P.RAMOS-05.07.2005-DESATIVADO POIS SE IDENTIFICA A SIMULAÇÃO PELO EVENTO GERADOR GRAVADO NA TABELA DE SIMULAMIGRACAO
    //sTipoSimulador    : char; // CAMILLE - 23.11.2004
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UMensErro,DBaseDados, {FExportaSimulador, }
     FVerificaContribuicoes, FImportaSimulador,
     FEventoTransfPlanoNOVO, DRelTransfPlano,
     FAcertoManualSimulacao, FMigraPlanoFCRT, FApagaPreviaMigraPlano,
     FExportaSimuladorATUARIAL, DAPrev, FAcertaPeculio, {FSimulaAuxiliar,}
     USimuladorBrTPREV, FExportaSimuladorNOVO, fAcertaReservaMigracao,
  FParamRelDemonsSRB, DRelSRB, FParamRelMovReserva_EspFCRT,
  DRelTransfPlanoFCRT, FEventoTransfPlanoFCRT;

{$R *.DFM}

procedure TfrmPrincipal.mnuUtilProblemaContribClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmVerificaContribuicoes, TfrmVerificaContribuicoes,False);
end;

procedure TfrmPrincipal.mnuImportarClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaSimulador,TfrmImportaSimulador,False);
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmRelTransfPlanoFCRT,     dtmRelTransfPlanoFCRT);
end;

procedure TfrmPrincipal.mnuProcAcertoManualClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal(frmAcertoManualSimulacao, TfrmAcertoManualSimulacao);
end;

procedure TfrmPrincipal.mnuProcEfetivaMigracaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMigraPlanoFCRT, TfrmMigraPlanoFCRT, False);
end;

procedure TfrmPrincipal.mnuProcExcluiMigracaoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmApagaPreviaMigraPlano, TfrmApagaPreviaMigraPlano, False);
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var SAUX, idpessoa, IDPLANOprev, IDPESSJUR, idtiporeserva : string;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
{
  // query 1
  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT CHAVEPRIMARIA, ARQUIVO, VALORANTERIOR FROM LOGTABELAS '+
             ' WHERE  DATAHORA >= TO_DATE(''09/12/2002'',''DD/MM/YYYY'')    '+
             ' AND    USUARIO = ''CM0''                                     '+
             ' ORDER BY CHAVEPRIMARIA                                       ');
     Open;
     First;
     while not Eof do
     begin
        if UPPERCASE(trim(fieldbyname('arquivo').asstring)) = 'RESERVAPART'
        then begin
// /IdPlanoPrev:16/IdTipoReserva:7/IdPessoa:1709/SeqProposta:1/IdPessJur:50031
           SAUX     := Copy( Fieldbyname('CHAVEPRIMARIA').asstring,
                             Pos('IdPlanoPrev:',fieldbyname('CHAVEPRIMARIA').asstring)+12,
                             Pos('/IdTipoReserva',fieldbyname('CHAVEPRIMARIA').asstring)-
                             Pos('IdPlanoPrev:',fieldbyname('CHAVEPRIMARIA').asstring)+12 );
           SAUX     := COPY(SAUX,1,POS('/', SAUX)-1);
           IDPLANOPREV := SAUX;

           SAUX     := Copy( Fieldbyname('CHAVEPRIMARIA').asstring,
                             Pos('IdPessoa:',fieldbyname('CHAVEPRIMARIA').asstring)+9,
                             Pos('/SeqProposta',fieldbyname('CHAVEPRIMARIA').asstring)-
                             Pos('IdPessoa:',fieldbyname('CHAVEPRIMARIA').asstring)+9 );
           SAUX     := COPY(SAUX,1,POS('/', SAUX)-1);
           IDPESSOA := SAUX;

           SAUX     := Copy( Fieldbyname('CHAVEPRIMARIA').asstring,
                             Pos('IdTipoReserva:',fieldbyname('CHAVEPRIMARIA').asstring)+14,
                             Pos('/IdPessoa',fieldbyname('CHAVEPRIMARIA').asstring)-
                             Pos('IdTipoReserva:',fieldbyname('CHAVEPRIMARIA').asstring)+14 );
           SAUX     := COPY(SAUX,1,POS('/', SAUX)-1);
           IDTIPORESERVA := SAUX;

           SAUX     := Copy( Fieldbyname('CHAVEPRIMARIA').asstring,
                             Pos('IdPessJur:',fieldbyname('CHAVEPRIMARIA').asstring)+10,
                             Length(Fieldbyname('CHAVEPRIMARIA').asstring)-
                             Pos('IdTipoReserva:',fieldbyname('CHAVEPRIMARIA').asstring)+14 );
          idpessjur := SAUX;

           dtmAPrev.qryAux.Close;
           dtmAPrev.qryAux.SQL.CLEAR;
           dtmAPrev.qryAux.SQL.ADD(' UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero(FieldByname('VALORANTERIOR').AsString)+
                                   ' WHERE  IDPLANOPREV = '+IDPLANOPREV +
                                   ' AND    IDPESSJUR   = '+IDPESSJUR  +
                                   ' AND    IDTIPORESERVA = '+IDTIPORESERVA+
                                   ' AND    IDPESSOA = '+IDPESSOA+
                                   ' AND    SEQPROPOSTA = 1 ');

           dtmaprev.qryaux.execsql;

        end;

        Next;
     end

  end;
}

{
  // query 2
  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT RANT.IDPESSJUR, RANT.IDPLANOPREV, RANT.IDPESSOA, RANT.IDTIPORESERVA, RANT.VALORRESERVA ANTES, R.VALORRESERVA ATUAL  '+
             ' FROM   CM.RESERVASEX RANT, RESERVAPART R                                                 '+
             ' WHERE  RANT.IDPLANOPREV = 33                                                             '+
             ' AND    R.IDPESSJUR = RANT.IDPESSJUR                                                      '+
             ' AND    R.IDPLANOPREV = RANT.IDPLANOPREV                                                  '+
             ' AND    R.IDPESSOA = RANT.IDPESSOA                                                        '+
             ' AND    R.IDTIPORESERVA =RANT.IDTIPORESERVA                                               '+
             ' AND    ((RANT.VALORRESERVA <> R.VALORRESERVA) OR                                         '+
             '         ( (RANT.VALORRESERVA IS NULL) AND (R.VALORRESERVA IS NOT NULL) ) OR              '+
             '         ( (RANT.VALORRESERVA IS NOT NULL) AND (R.VALORRESERVA IS NULL) )                 '+
             '        )                                                                                 ');
     Open;
     First;
     while not Eof do
     begin
        IDPLANOPREV   := FIELDBYNAME('IDPLANOPREV').ASSTRING;
        IDPESSJUR     := FIELDBYNAME('IDPESSJUR').ASSTRING;
        IDPESSOA      := FIELDBYNAME('IDPESSOA').ASSTRING;
        IDTIPORESERVA := FIELDBYNAME('IDTIPORESERVA').ASSTRING;

        dtmAPrev.qryAux.Close;
        dtmAPrev.qryAux.SQL.CLEAR;
        dtmAPrev.qryAux.SQL.ADD(' UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero(FieldByname('ANTES').AsString)+
                                ' WHERE  IDPLANOPREV   = '+IDPLANOPREV +
                                ' AND    IDPESSJUR     = '+IDPESSJUR  +
                                ' AND    IDTIPORESERVA = '+IDTIPORESERVA+
                                ' AND    IDPESSOA      = '+IDPESSOA+
                                ' AND    SEQPROPOSTA   = 1 ');

        dtmaprev.qryaux.execsql;
        Next;
     end

  end;
}
  // query 2
  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 660 AS IDADEAPOS,  ''355529-00'' AS MATRICULA FROM DUAL UNION '+
             ' SELECT 660 AS IDADEAPOS,  ''355123-00'' AS MATRICULA FROM DUAL UNION '+
             ' SELECT 660 AS IDADEAPOS,  ''357780-00'' AS MATRICULA FROM DUAL UNION '+
             ' SELECT 768 AS IDADEAPOS,  ''179630-00'' AS MATRICULA FROM DUAL UNION '+
             ' SELECT 759 AS IDADEAPOS,  ''183574-00'' AS MATRICULA FROM DUAL UNION '+
             ' SELECT 780 AS IDADEAPOS,  ''167296-00'' AS MATRICULA FROM DUAL UNION '+
             ' SELECT 660 AS IDADEAPOS,  ''226696-00'' AS MATRICULA FROM DUAL UNION '+
             ' SELECT 780 AS IDADEAPOS,  ''358770-00'' AS MATRICULA FROM DUAL       ');
     Open;
     First;
     while not Eof do
     begin
//        IDPLANOPREV   := FIELDBYNAME('IDPLANOPREV').ASSTRING;
//        IDPESSJUR     := FIELDBYNAME('IDPESSJUR').ASSTRING;
//        IDPESSOA      := FIELDBYNAME('IDPESSOA').ASSTRING;

        dtmAPrev.qryAux.Close;
        dtmAPrev.qryAux.SQL.CLEAR;
        dtmAPrev.qryAux.SQL.ADD(' UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero(FieldByname('IDADEAPOS').AsString)+
                                ' WHERE  IDTIPORESERVA = 70 '+
                                ' AND    IDPESSOA      = (SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+FieldByName('MATRICULA').AsString+''') ');

        dtmaprev.qryaux.execsql;
        Next;
     end
  end;

  if msgdlg('confirma ? ','confirmação',mtconfirmation,[mbYes,mbNo],0) = mryes
  then dtmBaseDados.dbBaseDados.Commit
  else dtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmPrincipal.mnuProcAcertaPeculioClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAcertaPeculio, TfrmAcertaPeculio, False);

end;

procedure TfrmPrincipal.mnuSimulacaoSubClick(Sender: TObject);
begin
  inherited;

  //P.RAMOS-05.07.2005-DESATIVADO POIS SE IDENTIFICA A SIMULAÇÃO PELO EVENTO GERADOR GRAVADO NA TABELA DE SIMULAMIGRACAO
  //sTipoSimulador    := '1';// CAMILLE - 23.11.2004
  //leocm - 0909 -
  //modificação para testes de transferência de plano no
  //cliente FCRT
  Application.CreateForm(TfrmEventoTransfPlanoFCRT, frmEventoTransfPlanoFCRT);
  frmEventoTransfPlanoFCRT.Caption := 'Transferência de Plano';
  frmEventoTransfPlanoFCRT.ShowModal;

end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  if Sistema.NomeUsuario = 'PAULO.CM' then
  begin
     mnuExportaDados.Enabled := True;
     mnuImportaDados.Enabled := True;
     mnuAcertaReserva.Enabled := True;
  end;
  if Sistema.NomeUsuario = 'CAMILLE'
  then begin
     mnuAuxiliar.Visible := True;
     mnuAuxiliar.Enabled := True;
  end;
  //mnuSimulacaoSub2Periodo.Enabled := True;
  iIdFundacao                := Sistema.IdEmpresa;
  iIdCalculoGeral            := -1;
  prmCalculaSRBNoRetroativo  := True;
  sTipoTelaBenef             := 'CO';
  prmNumTentativasSalario    := 36;
  with dtmAPrev.qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT VLRBENEFMIN '+
              ' FROM   PARAMAPREV  '+
              ' WHERE  IDFUNDACAO = '+IntToStr(iIdFundacao));
     Open;
     prmIdRegraCalcBenefMin     := FieldByName('VLRBENEFMIN').AsInteger; 
     Close;
  end;

end;

procedure TfrmPrincipal.mnuAuxiliarClick(Sender: TObject);
begin
  inherited;
//  AbrirForm(frmSimulaAuxiliar, TfrmSimulaAuxiliar, False);

end;

procedure TfrmPrincipal.mnuSimulacaoSub2PeriodoClick(Sender: TObject);
begin
  inherited;

  //P.RAMOS-05.07.2005-DESATIVADO POIS SE IDENTIFICA A SIMULAÇÃO PELO EVENTO GERADOR GRAVADO NA TABELA DE SIMULAMIGRACAO
//  sTipoSimulador    := '2';// CAMILLE - 23.11.2004
//  //leocm - 0909 -
//  //modificação para testes de transferência de plano no
//  //cliente FCRT
//  Application.CreateForm(TfrmEventoTransfPlanoNOVO, frmEventoTransfPlanoNOVO);
//  frmEventoTransfPlanoNOVO.Caption := 'Transferência de Plano';
//  frmEventoTransfPlanoNOVO.ShowModal;

end;

procedure TfrmPrincipal.mnuExportaDadosClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmExportaSimuladorNOVO, TfrmExportaSimuladorNOVO, False);
end;

procedure TfrmPrincipal.mnuImportaDadosClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaSimulador,TfrmImportaSimulador,False);
end;

procedure TfrmPrincipal.mnuAcertaReservaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAcertaReservaMigracao, TfrmAcertaReservaMigracao, False);
end;

procedure TfrmPrincipal.DemonstrativodeClculodoSRBeINSS1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmParamRelDemonsSRB, TfrmParamRelDemonsSRB, False);
end;

procedure TfrmPrincipal.mnuRelExtratoMovReservaClick(
  Sender: TObject);
begin
  inherited;
  //ClaudioR - 26094 - 14/08/2007
  AbrirForm(frmParamRelMovReserva_EspFCRT,TfrmParamRelMovReserva_EspFCRT,false);
end;

initialization
   Sistema.NomeModulo     := 'SimuladorBrTPREV';            // Nome do Módulo
   Sistema.IdModulo       := 633;                           // IdModulo cadastrado no SAD
   Sistema.Versao := '3.03.08a';
   Sistema.NomeAplicativo := 'SimuladorBrTPREV';
   Modulo                 := TModulo.Create  ;

finalization
   Modulo.free;
end.




