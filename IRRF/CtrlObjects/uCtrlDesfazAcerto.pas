unit uCtrlDesfazAcerto;

{******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 236090 PPM 462974
Data.....: 25/07/2014
Sol......: 236090
PPM......: 462974
Rotina...: ApagaLancIRAcerto
Descrição: Ajuste na rotina de desfazer acerto
*******************************************************************************
Analista.: Marcio Sanches Spinosa SOL 217767 KINTANA 2049332
Data.....: 14/10/2013
Sol......: 217767
Kintana..: 2049332
Rotina...: bbtnConfirmarClick
Descrição: Ajuste na rotina de desfazer acerto
*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 21/08/2013
Sol......: 202259
Kintana..: 2042903
Rotina...: ApagaLancIRAcerto, ApagaLancIRRF, DesfazAcerto 
Descrição: rotina de desfaz não apaga todos as compensações
*******************************************************************************}



interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     classes, Forms, uCMMath,
     dbtables, mconnect, ucmFileUtils,
     uCmCustomCdbObject, ADODb, provider, {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
     uCripto, wwQuery, dBasedados;


  Type
    TCtrlDesfazAcerto = Class(TCmControlObject)

    private

    protected

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      function DesfazAcerto      (const piIdLista  : Integer;
                                  const pbUsaLista : Boolean;
                                  const psAno      : String ) : Boolean;

      function ApagaLancIRAcerto (const sListaId   : string ) : Boolean; overload; // Edilaine - SOL 202259 / KTN 2042903
      function ApagaLancIRAcerto (const piIdLista  : Integer;
                                  const pbUsaLista : Boolean;
                                  const psAno      : String ) : Boolean; overload;

      function ApagaLancIRRF     (const sListaId : string): Boolean;  overload;    // Edilaine - SOL 202259 / KTN 2042903
      function ApagaLancIRRF     (Const oQry : TCLientDataSet) : Boolean; overload;

    protected

    End;


implementation

{ TCtrlDesfazAcerto }


// Edilaine - SOL 202259 / KTN 2042903
function TCtrlDesfazAcerto.ApagaLancIRAcerto(const sListaId   : string): Boolean;
var
  sSql : String;
begin
  try
    result := True;

    ssql := 'UPDATE LANCXINFORME SET FLGAGRUPADO = NULL WHERE IDLANCIRRF IN ( '+
            'SELECT IDLANCIRRFCOMP FROM LANCIRRFACERTO WHERE IDLANCIRRFACERTO IN ('+sListaId+'))' ;
    ExecSQL(ssql);


    sSql   := 'DELETE LANCIRRFACERTO'+#13#10+
              ' WHERE IDLANCIRRFACERTO IN ( '+sListaId+')'; //Marcio Sanches Spinosa SOL 236090 PPM 462974
//              ' WHERE IDLANCIRRFCOMP IN ( '+sListaId+')';

    if not ExecSql(sSql) then
      result := false;
  except
    result := false;
  end;
end;

function TCtrlDesfazAcerto.ApagaLancIRRF(const sListaId : string): Boolean;
var sSql : String;
begin
  try
    result := True;

    sSql   := 'DELETE LANCXINFORME WHERE IDLANCIRRF IN ( '+sListaId+')';
    Result := ExecSql(sSql);

    If Result then
    begin
      sSql := 'DELETE LANCIRRF WHERE IDLANCIRRF IN ( '+sListaId+')';
      Result :=  ExecSql(sSql);
    end;
  except
    result := false;
  end;
end;
// Edilaine - SOL 202259 / KTN 2042903 - fim

function TCtrlDesfazAcerto.ApagaLancIRAcerto(const piIdLista  : Integer;
                                             const pbUsaLista : Boolean;
                                             const psAno      : String): Boolean;
var
  sSql : String;
begin
  try
    result := True;

    if pbUsaLista then
    begin
      sSql   := 'DELETE LANCIRRFACERTO'+#13#10+
                'WHERE IDLANCIRRFACERTO IN ( SELECT LIR.IDLANCIRRF'+#13#10+
                '                            FROM LANCIRRF           LIR, '+#13#10+
                '                                 LISTAFOLHABENEFDET LFD  '+#13#10+
                '                            WHERE LIR.DATAPAGAMENTO BETWEEN TO_DATE('+quotedstr('01/01/'+psano)+', ''DD/MM/YYYY'') '+#13#10+
                '                                                        AND TO_DATE('+quotedstr('31/12/'+psano)+', ''DD/MM/YYYY'') '+#13#10+
                '                              AND LIR.IDMODULO    = 18 '+#13#10+
                '                              AND LIR.IDBENEFIRRF = LFD.IDPESSOA '+#13#10+
                '                              AND LFD.IDLISTA     = '+IntToStr(piIdLista)+')';
    end
    else
    begin
      sSql   := 'DELETE LANCIRRFACERTO'+#13#10+
                'WHERE IDLANCIRRFACERTO IN ( SELECT LIR.IDLANCIRRF'+#13#10+
                '                            FROM LANCIRRF LIR,'+#13#10+
                '                                 LANCIRRFACERTO LIA'+#13#10+
                '                            WHERE LIR.DATAPAGAMENTO BETWEEN TO_DATE('+quotedstr('01/01/'+psano)+', ''DD/MM/YYYY'') '+
                '                                                        AND TO_DATE('+quotedstr('31/12/'+psano)+', ''DD/MM/YYYY'') '+
                '                              AND LIA.IDLANCIRRFACERTO = LIR.IDLANCIRRF'+#13#10+
                '                              AND LIR.IDMODULO    = 18)';
    end;

    if not ExecSql(sSql) then
      result := false;
  except
    result := false;
  end;
end;

function TCtrlDesfazAcerto.ApagaLancIRRF(const oQry : TClientDataSet): Boolean;
var sSql : String;
begin
  try
    result := True;

    oQry.First;
    while Not oQry.eof do
    begin
      sSql   := 'DELETE LANCXINFORME WHERE IDLANCIRRF = '+IntToStr(oQry.FieldByName('IdLancIrrf').asinteger);
      Result := ExecSql(sSql);
      If Result then
      begin
        sSql := 'DELETE LANCIRRF WHERE IDLANCIRRF = '+IntToStr(oQry.FieldByName('IdLancIrrf').asinteger);
        Result :=  ExecSql(sSql);
      end;
      If Not Result then
        break;
      oQry.Next;
    end;
  except
    result := false;
  end;
end;

constructor TCtrlDesfazAcerto.Create;
begin
  inherited;

end;

function TCtrlDesfazAcerto.DesfazAcerto(const piIdLista  : Integer;
                                        const pbUsaLista : Boolean;
                                        const psAno      : String ): Boolean;
var
  QtdReg, i : Integer;
  cdsAux : TClientDataSet;
  sLstLancIRRF : string;   // Edilaine - SOL 202259 / KTN 2042903
  sSQL   : string;         // Edilaine - SOL 202259 / KTN 2042903
  BtotalRegistro : integer;

begin
  cdsAux := TClientDataSet.Create(nil);

  Try
    result := True;

    sSQL := 'SELECT DISTINCT lx.IDLANCIRRF '+#13#10+
            '  FROM LANCXINFORME lx '+#13#10+
            ' WHERE IDLANCIRRF IN ( SELECT DISTINCT LIR.IDLANCIRRF '+#13#10+
            '                         FROM LANCIRRF           LIR '+#13#10;

    if pbUsaLista then
       sSQL := sSQL +
            '                              , LISTAFOLHABENEFDET LFD '+#13#10;

     sSQL := sSQL +
            '               WHERE LIR.DATAPAGAMENTO BETWEEN TO_DATE('+quotedstr('01/01/'+psano)+', ''DD/MM/YYYY'') '+#13#10+      // Marcio Sanches Spinosa SOL 215621 KINTANA 2044679
            '                                           AND TO_DATE('+quotedstr('31/12/'+psano)+', ''DD/MM/YYYY'') '+#13#10+
            '                 AND LIR.IDMODULO    = 18 '+#13#10;

    if pbUsaLista then
       sSQL := sSQL +
            '                 AND LIR.IDBENEFIRRF(+) = LFD.IDPESSOA '+#13#10+
            '                 AND LFD.IDLISTA     = '+IntToStr(piIdLista)+#13#10;

     sSQL := sSQL +
            '                     )'+#13#10+
            '   AND LX.FLGTIPOREG IN (''P'', ''C'', ''A'') '+#13#10;

    { // Edilaine - SOL 202259 / KTN 2042903 - comentado
    if pbUsaLista then
    begin
      cdsAux.data := GetDataPacket(' SELECT LIR.IDLANCIRRF '+#13#10+
                                   ' FROM LANCIRRF           LIR,'+#13#10+
                                   '      LANCIRRFACERTO     LIA,'+#13#10+
                                   '      LISTAFOLHABENEFDET LFD '+#13#10+
                                   ' WHERE LIR.DATAPAGAMENTO BETWEEN TO_DATE('+quotedstr('01/01/'+psano)+', ''DD/MM/YYYY'') '+#13#10+
                                   '                             AND TO_DATE('+quotedstr('31/12/'+psano)+', ''DD/MM/YYYY'') '+#13#10+
                                   '  AND LIR.IDMODULO    = 18 '+#13#10+
                                   '  AND LIR.IDBENEFIRRF = LFD.IDPESSOA '+#13#10+
                                   '  AND LIR.IDLANCIRRF  = LIA.IDLANCIRRFACERTO'+#13#10+
                                   '  AND LFD.IDLISTA     = '+IntToStr(piIdLista));
    end
    else
    begin
      cdsAux.data := GetDataPacket(' SELECT LIR.IDLANCIRRF'+#13#10+
                                   ' FROM LANCIRRF       LIR,'+#13#10+
                                   '      LANCIRRFACERTO LIA'+#13#10+
                                   ' WHERE LIR.DATAPAGAMENTO BETWEEN TO_DATE('+quotedstr('01/01/'+psano)+', ''DD/MM/YYYY'') '+#13#10+
                                   '                             AND TO_DATE('+quotedstr('31/12/'+psano)+', ''DD/MM/YYYY'') '+#13#10+
                                   '   AND LIR.IDLANCIRRF = LIA.IDLANCIRRFACERTO'+#13#10+
                                   '   AND LIR.IDMODULO   = 18 ')
    end;
    } // Edilaine - SOL 202259 / KTN 2042903 - fim

    cdsAux.data := GetDataPacket( sSQL );

    //Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Inicio
    QtdReg := cdsAux.RecordCount;
    BtotalRegistro := 0;
    if QtdReg > 0 then
    begin
      // Edilaine - SOL 202259 / KTN 2042903
      // monta lista de Id's

      sLstLancIRRF := EmptyStr;
      cdsAux.First;

      if (QtdReg > 990) then
        BtotalRegistro := 990
      else
        BtotalRegistro := QtdReg;

//      while not cdsAux.eof do
//      begin

      for i := 0 to BtotalRegistro - 1 do
      begin

        sLstLancIRRF := sLstLancIRRF + cdsAux.Fields[0].AsString;

        cdsAux.Delete;
//            if not cdsAux.eof then
        sLstLancIRRF := sLstLancIRRF + ', ';
      end;
      // Edilaine - SOL 202259 / KTN 2042903 -  fim

    // Edilaine - SOL 202259 / KTN 2042903 -  fim
      sLstLancIRRF := Trim(sLstLancIRRF);
      sLstLancIRRF := Copy(sLstLancIRRF, 0 ,Length(sLstLancIRRF) - 1);


      //if not ApagaLancIRAcerto(piIdLista, pbUsaLista, sLstLancIRRF, psAno) then   // Edilaine - SOL 202259 / KTN 2042903 - comentado
      if not ApagaLancIRAcerto(sLstLancIRRF) then                                   // Edilaine - SOL 202259 / KTN 2042903
      begin
        MessageInfo := 'Erro ao tentar excluir os lançamentos do acerto!';
        result      := False;
//        rollback;
        exit;
      end;

      //if not ApagaLancIRRF(CdsAux) then               // Edilaine - SOL 202259 / KTN 2042903 - comentado
      if not ApagaLancIRRF(sLstLancIRRF) then           // Edilaine - SOL 202259 / KTN 2042903
      begin
        MessageInfo := 'Erro ao tentar excluir os lançamentos principais!';
        result      := False;
//        rollback;
        exit;
      end;

     QtdReg := QtdReg - BtotalRegistro;
     if QtdReg > 0 then
        DesfazAcerto(piIdLista, pbUsaLista, psAno);

//      end;

    end
    else
    //  MessageInfo := 'Não há registro a ser desfeito.';

    cdsAux.Free;
//Marcio Sanches Spinosa SOL 217767 KINTANA 2049332 - Fim    
  Except
    On E:Exception Do
    Begin
      If InTransaction Then
        Rollback;

      Result      := False;
      MessageInfo := E.Message;
    End
  End;
end;

destructor TCtrlDesfazAcerto.Destroy;
begin
  inherited;

end;

end.
