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
    mnuExportar: TMenuItem;
    mnuImportarSimulador: TMenuItem;
    N2: TMenuItem;
    mnuExportarSimulador: TMenuItem;
    mnuExportarAtuarial: TMenuItem;
    N1: TMenuItem;
    mnuGeraINSSHistRubrica: TMenuItem;
    mnuExportarAtuarialNOVA: TMenuItem;
    mnuExportarNOVO: TMenuItem;

    procedure mnuExportarClick(Sender: TObject);
    procedure mnuImportarSimuladorClick(Sender: TObject);
    procedure mnuExportarAtuarialClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mnuAcertaPeculioClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuGeraINSSHistRubricaClick(Sender: TObject);
    procedure mnuExportarAtuarialNOVAClick(Sender: TObject);
    procedure mnuExportarNOVOClick(Sender: TObject);

  private

  public

  end;



var
  frmPrincipal: TfrmPrincipal;

implementation

uses UMensErro,DBaseDados, {FExportaSimulador, FImportaSimulador,}
     UAdmPrev, FExportaSimuladorATUARIAL,
     DAPrev, FAcertaPeculio, FGeraINSSHistRubSal, FExportaATUARIALNOVA{,
     FExportaSimuladorNOVO};
{$R *.DFM}

procedure TfrmPrincipal.mnuExportarClick(Sender: TObject);
begin
  inherited;
//  AbrirForm(frmExportaSimulador, TfrmExportaSimulador,False);
end;

procedure TfrmPrincipal.mnuImportarSimuladorClick(
  Sender: TObject);
begin
  inherited;
//  AbrirForm(frmImportaSimulador,TfrmImportaSimulador,False);
end;

procedure TfrmPrincipal.mnuExportarAtuarialClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmExportaSimuladorATUARIAL, TfrmExportaSimuladorATUARIAL,False);
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var SAUX,idpessoa, IDPLANOprev, IDPESSJUR, idtiporeserva : string;

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

procedure TfrmPrincipal.mnuAcertaPeculioClick(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmAcertaPeculio, TfrmAcertaPeculio, False);

end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
  inherited;
  mnuExportarSimulador.Enabled    := True;
  mnuExportar.Enabled             := True;
  mnuImportarSimulador.Enabled    := True;
  mnuExportarAtuarial.Enabled     := True;
  mnuGeraINSSHistRubrica.Enabled  := True;
  mnuExportarAtuarialNOVA.Enabled := True;
  mnuExportarNOVO.Enabled         := True;
end;

procedure TfrmPrincipal.mnuGeraINSSHistRubricaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmGeraINSSHistRubSal, TfrmGeraINSSHistRubSal, False);
end;

procedure TfrmPrincipal.mnuExportarAtuarialNOVAClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExportaATUARIALNOVA, TfrmExportaATUARIALNOVA, False);
end;

procedure TfrmPrincipal.mnuExportarNOVOClick(
  Sender: TObject);
begin
  inherited;
//  AbrirForm(frmExportaSimuladorNOVO, TfrmExportaSimuladorNOVO, False);

end;

initialization
   Sistema.NomeModulo     := 'FCRT';             // Nome do Módulo
   Sistema.IdModulo       := 598;                // IdModulo cadastrado no SAD
   Sistema.Versao := '3.01.10';
   Sistema.NomeAplicativo := 'TotalPREV - Importações e Exportações de Arquivos';
   Modulo                 := TModulo.Create  ;

finalization
   Modulo.free;
end.


