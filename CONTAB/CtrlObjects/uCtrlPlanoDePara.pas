unit uCtrlPlanoDePara;

{===============================================================================
Analista.....: André Imakawa
SIG..........: 111721
Data.........: 09/12/2020
Rotina.......: _ExecutaParte5DePar
Descrição....: Add campo COMPETENCIADEPARA na rotina ListTabelaDePara       
===============================================================================
Alteração  : getDeparaAgrupamentoMesmoPlano
Nº SIG.....: 80504
Data.......: 08/01/2018
Responsável: Andre Imakawa
Descrição..: Criação da rotina getDeparaAgrupamentoMesmoPlano
===============================================================================
Analista.....: Ricardo Alves
SOL..........: 124343
KINTANA......: 630539
Data.........: 06/10/2009
Descrição....: Modificação do processamento do De/Para de plano de contas para que o 
  processamento das tabelas de configuração levem em consideração os três novos
  campos de indicação de período do cadastro de De/Para.
}

interface

Uses DB, uDataBase, uDbPlanoDePara, uCmControlObject, dbclient, sysutils,Provider,
     uCtrlGeral, ComCtrls,CMProcuraMask, CMProcura,DBTables, usistema,
     uCMTypes;

  Type

    TCtrlPlanoDePara = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbPlanoDePara  : TDbPlanoDePara;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsPlanoDePara : TClientDataSet;

      procedure SetcdsPlanoDePara(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsPlanoDePara: TClientDataSet Read FCdsPlanoDePara Write SetCdsPlanoDePara;

      {Esta função tem o Objetivo de retornar regsitros da tabela de Plano De-Para}
      Function ListPlanoDePara(dPlanoDePara :Double):OleVariant;

      {Esta função tem o Objetivo de retornar registros da tabela de De-Para}
      Function ListTabelaDePara:OleVariant;

      {Esta função tem o Objetivo de retornar registros da tabela campo De-Para}
      Function ListCampoDePara(dTabela :Double):OleVariant;


      {Esta função tem o objetivo de gravar registros na tabela Plano}
      function Gravar :Boolean;

      //cria depara automático para agrupamento de contas - andré tavares - 06/07/2007
      function DeparaAgrupa(const sPlaconta: string; const plano: integer): boolean;

      //andre tavares - 31/07/2007 - Cadastra o depara do desmembramento automaticamente 
      function DeparaDesmembra(const sPlacontaDe:   string; const planoDe: integer;
                               const sPlacontaPara: string; const planoPara: integer): boolean;

      //andré tavares - 02/08/2008 - método para retornar a conta origem e destino do de/para do agrupamento
      function getDeparaAgrupamento(const idplanocontaper: integer): olevariant;

      function getDeparaAgrupamentoMesmoPlano(const idplanocontaper: integer): olevariant; // Andre Imakawa - SIG 80504

    End;


implementation

{ TCtrlPlanoDePara }

constructor TCtrlPlanoDePara.Create;
begin
  inherited;
  _dbPlanoDePara  := TDbPlanoDePara.Create(Self);
end;

destructor TCtrlPlanoDePara.Destroy;
begin
  inherited;

  _dbPlanoDePara.Free;
  if isAppServer then FCdsPlanoDePara.Free;

end;


function TCtrlPlanoDePara.Gravar: Boolean;
Var
   sidEmpresa1, sidEmpresa2, Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarPlanoDePara ( FCdsPlanoDePara.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           sidEmpresa1 := ' IS NULL ';
           sidEmpresa2 := ' IS NULL ';
           if FCdsPlanoDePara.fieldByName('IDEMPRESA1').asString <> '' then
             sidEmpresa1 := ' = ' + FCdsPlanoDePara.fieldByName('IDEMPRESA1').asString;

           if FCdsPlanoDePara.fieldByName('IDEMPRESA2').asString <> '' then
             sidEmpresa2 := ' = ' + FCdsPlanoDePara.fieldByName('IDEMPRESA2').asString;

           _cds.Data := getDataPacket('SELECT * FROM PLANODEPARA '+
                                      ' WHERE CONTA1 = '+ quotedStr(FCdsPlanoDePara.fieldByName('CONTA1').asString) +
                                      '   AND CONTA2 = '+ quotedStr(FCdsPlanoDePara.fieldByName('CONTA2').asString) +
                                      '   AND PLANO1 = '+ FCdsPlanoDePara.fieldByName('PLANO1').asString +
                                      '   AND IDEMPRESA1 '+ sidEmpresa1 +
                                      '   AND IDEMPRESA2 '+ sidEmpresa2 +
                                      '   AND PLANO2 = '+ FCdsPlanoDePara.fieldByName('PLANO2').asString );
           if _cds.isEmpty then
             Result := ApplyCds(FCdsPlanoDePara,_dbPlanoDePara,[],[] )
           else
             result := true;

           Msg    := _dbPlanoDePara.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;

        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;


procedure TCtrlPlanoDePara.DoChangeDataBase;
begin
  inherited;
  _dbPlanoDePara.DataBaseName := DataBaseName;

end;

function TCtrlPlanoDePara.ListPlanoDePara(dPlanoDePara:Double): OleVariant;
var
  sSql, sfiltro :string;

begin
          sSql := 'SELECT  IDPLANODEPARA,  '+
                  '    CONTA1, PLANO1, CENTROCUSTO1, IDEMPRESA1, ' +
                  '    CONTA2, PLANO2, CENTROCUSTO2, IDEMPRESA2  ' +
                  'FROM  PLANODEPARA ';

      sfiltro := '';
      If (dPlanoDePara <> 0) Then
         sfiltro :=   'WHERE (IDPLANODEPARA = ' + FloatToStr(dPlanoDePara) + ') ';

     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);

end;

procedure TCtrlPlanoDePara.SetCdsPlanoDePara(const Value: TClientDataSet);
begin
  FCdsPlanoDePara := Value;
end;



procedure TCtrlPlanoDePara.OnCreateAppServer;
begin
  inherited;
  FCdsPlanoDePara := TClientDataSet.Create(nil);

end;

function TCtrlPlanoDePara.ListTabelaDePara: OleVariant;
var
  sSql :string;

begin
          sSql := 'SELECT '+
                  '    IDTABELADEPARA, NOMETABELA, '+

                  // Ricardo A. SOL 124343 KTN 630539
                  '    NOMECAMPOPLANO, IDTABELAREF, '+
                  '    ANODEPARA, MESDEPARA, DATADEPARA ' +
                  '    ,COMPETENCIADEPARA '+ // Andre Imakawa - SIG 111721
                  'FROM '+
                  '    TABELADEPARA '+
                  ' ORDER BY  '+
                  '    IDTABELAREF DESC ';



     Result := GetDataPacket(sSql);



end;
function TCtrlPlanoDePara.ListCampoDePara(dTabela: Double): OleVariant;
var
  sSql, sFiltro :string;

begin
          sSql := 'SELECT '+
                  '    IDCAMPODEPARA, IDTABELADEPARA, NOMECAMPOCONTA '+
                  'FROM ' +
                  '    CAMPODEPARA ';

      //----------------------------------------------------------
      sfiltro := '';
      If (dTabela <> 0) Then
         sfiltro :=   'WHERE (IDTABELADEPARA = ' + FloatToStr(dTabela) + ') ';
     //----------------------------------------------------------

     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);

end;


//cria depara automático para agrupamento de contas
function TCtrlPlanoDePara.DeparaAgrupa(const sPlaconta: string; const plano: integer): boolean;
var sSql: string;
    cdsAux: TclientDataSet;
begin
  result := true;
  cdsAux := TclientDataSet.Create(nil);
  cdsAux.data := getDataPacket('SELECT PLACCUST FROM PLANOCONTA WHERE PLACONTA = ' + quotedStr(trim(sPlaconta)) );
  if cdsAux.fieldByName('PLACCUST').asString = 'S' then
  begin
    sSql := ' SELECT P.PLACONTA, P.PLATIPO, CC.CODCENTROCUSTO, CC.IDEMPRESA '+
            ' FROM PLANOCONTA P, CONTASXCC CC '+
            ' WHERE (P.PLACONTA > ' + quotedStr(trim(sPlaconta)) + ' OR CC.CODCENTROCUSTO IS NULL) AND P.PLACONTA LIKE ' + quotedStr(trim(sPlaconta)+'%') + ' AND P.PLANO = ' + intToStr(plano)+
            ' AND CC.PLACONTA(+) = P.PLACONTA '+
            ' AND CC.PLANO(+)    = P.PLANO ';
  end
  else
  begin
    sSql := ' SELECT P.PLACONTA, P.PLATIPO, 0 AS IDEMPRESA '+
            ' FROM PLANOCONTA P '+
            ' WHERE (P.PLACONTA > ' + quotedStr(trim(sPlaconta)) +
            ' ) AND P.PLACONTA LIKE ' + quotedStr(trim(sPlaconta)+'%') + ' AND P.PLANO = ' + intToStr(plano);
  end;

  try
    cdsAux.Data := getDataPacket(sSql);
    cdsAux.First;

    FCdsPlanoDePara.Data := getDataPacket('SELECT * FROM PLANODEPARA WHERE 1 = 2');
    while not cdsAux.Eof do
    begin
      if (cdsAux.FieldByName('PLATIPO').asString = 'S') then
      begin
        result := false;
        FCdsPlanoDePara.EmptyDataSet;
        messageInfo := 'Não será possível fazer agrupamento na conta '+ sPlaconta + ' pois a mesma já possui uma conta filha do tipo sintética.';
        Raise Exception.Create(messageInfo);
      end;

      FCdsPlanoDePara.Insert;
      FCdsPlanoDePara.FieldByName('PLANO1').asinteger      := plano;

      FCdsPlanoDePara.FieldByName('CONTA1').asstring       := cdsAux.fieldByName('PLACONTA').asString;

      if cdsAux.findField('CODCENTROCUSTO') <> nil then
        FCdsPlanoDePara.FieldByName('CENTROCUSTO1').asstring := cdsAux.fieldByName('CODCENTROCUSTO').asString
      else
        FCdsPlanoDePara.FieldByName('CENTROCUSTO1').Clear;

      if (cdsAux.findfield('IDEMPRESA') <> nil) then
        if cdsAux.fieldByName('IDEMPRESA').asInteger > 0 then
          FCdsPlanoDePara.FieldByName('IDEMPRESA1').asInteger := cdsAux.fieldByName('IDEMPRESA').asInteger
        else
          FCdsPlanoDePara.FieldByName('IDEMPRESA1').asInteger := sistema.Idempresa;


      FCdsPlanoDePara.FieldByName('PLANO2').asinteger      := plano;
      FCdsPlanoDePara.FieldByName('CONTA2').asstring       := trim(sPlaconta);

      if cdsAux.findField('CODCENTROCUSTO') <> nil then
        FCdsPlanoDePara.FieldByName('CENTROCUSTO2').asstring := cdsAux.fieldByName('CODCENTROCUSTO').asString
      else
        FCdsPlanoDePara.FieldByName('CENTROCUSTO2').Clear;


      if (cdsAux.findfield('IDEMPRESA') <> nil) then
        if not cdsAux.fieldByName('IDEMPRESA').isNull then
          FCdsPlanoDePara.FieldByName('IDEMPRESA2').asInteger := cdsAux.fieldByName('IDEMPRESA').asInteger
        else
          FCdsPlanoDePara.FieldByName('IDEMPRESA2').asInteger := sistema.Idempresa;

      cdsAux.Next;
    end;

    if FCdsPlanoDePara.recordCount > 0 then
      if not Gravar then
      begin
        result := false;
        Raise Exception.Create(messageInfo);
      end;

  finally
    cdsAux.Free;
  end;
end;

function TCtrlPlanoDePara.DeparaDesmembra(const sPlacontaDe: string; const planoDe: integer;
                                          const sPlacontaPara: string; const planoPara: integer): boolean;
begin
  result := true;
  try
    FCdsPlanoDePara.Data  := ListPlanoDePara(-1);
    FCdsPlanoDePara.Insert;

    FCdsPlanoDePara.fieldByName('CONTA1').asString   := sPlacontaDe;
    FCdsPlanoDePara.fieldByName('PLANO1').AsInteger  := planoDe;

    FCdsPlanoDePara.fieldByName('CONTA2').asString   := sPlacontaPara;
    FCdsPlanoDePara.fieldByName('PLANO2').AsInteger  := planoPara;

    if not Gravar then
    begin
      Raise Exception.Create('Ocorreu o seguinte erro ao inserir o De/Para: '+ MessageInfo);
    end;

  except
    on E: Exception do
      messageInfo := e.Message;
    end;
    result := false;
end;//except


function TCtrlPlanoDePara.getDeparaAgrupamento(const idplanocontaper: integer): olevariant;
begin
  result := getDataPacket(' SELECT  PCP.IDPLANOCONTAPER, PD.IDPLANODEPARA, PD.PLANO1, PD.PLANO2, PD.CONTA1 AS CONTADE, PC.PLANOME AS NOMECONTADE, '+
                          '         PD.CONTA2 AS CONTAPARA, PC2.PLANOME AS NOMECONTAPARA, PD.PLANO1, '+
                          '         PCP.PEREXERCICIO, (PCP.PERNUMERO + 1) AS PERNUMERO '+
                          ' FROM PLANODEPARA PD, PLANOCONTAPER PCP, PLANOCONTA PC, PLANOCONTA PC2 '+
                          ' WHERE (PD.CONTA1 = PCP.PLACONTA OR PD.CONTA2 = PCP.PLACONTA) AND '+
                          '       (PD.PLANO1 = PCP.PLANO OR PD.PLANO2 = PCP.PLANO)       AND '+
                          '       (PC.PLACONTA = PD.CONTA1)  AND '+
                          '       (PC.PLANO = PD.PLANO1)     AND '+
                          '       (PC2.PLACONTA = PD.CONTA2) AND '+
                          '       (PC2.PLANO = PD.PLANO2)    AND '+
                          '       PCP.IDPLANOCONTAPER = '+ intTostr(idplanocontaper)
                         );
end;

// Andre Imakawa - SIG 80504 - Inicio
function TCtrlPlanoDePara.getDeparaAgrupamentoMesmoPlano(const idplanocontaper: integer): olevariant;
begin
  result := getDataPacket(' SELECT  PCP.IDPLANOCONTAPER, PD.IDPLANODEPARA, PD.PLANO1, PD.PLANO2, PD.CONTA1 AS CONTADE, PC.PLANOME AS NOMECONTADE, '+
                          '         PD.CONTA2 AS CONTAPARA, PC2.PLANOME AS NOMECONTAPARA, PD.PLANO1, '+
                          '         PCP.PEREXERCICIO, (PCP.PERNUMERO + 1) AS PERNUMERO '+
                          ' FROM PLANODEPARA PD, PLANOCONTAPER PCP, PLANOCONTA PC, PLANOCONTA PC2 '+
                          ' WHERE (PD.CONTA1 = PCP.PLACONTA OR PD.CONTA2 = PCP.PLACONTA) AND '+
                          '       (PD.PLANO1 = PCP.PLANO OR PD.PLANO2 = PCP.PLANO)       AND '+
                          '       (PD.PLANO1 = PD.PLANO2)    AND '+
                          '       (PC.PLACONTA = PD.CONTA1)  AND '+
                          '       (PC.PLANO = PD.PLANO1)     AND '+
                          '       (PC2.PLACONTA = PD.CONTA2) AND '+
                          '       (PC2.PLANO = PD.PLANO2)    AND '+
                          '       PCP.IDPLANOCONTAPER = '+ intTostr(idplanocontaper)
                         );
end;
// Andre Imakawa - SIG 80504 - Fim
end.
