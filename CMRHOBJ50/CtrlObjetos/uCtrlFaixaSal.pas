
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 06/02/2002                                 }
{                                                       }
{*******************************************************}


{*******************************************************************************
RESPONSÁVEL.: William Santana
Nº SOL......: 199707
Nº KINTANA..: 1922320
Data........: 09/08/2013
Descrição...: Alteração na forma de Correção das Faixas Salariais.
********************************************************************************
RESPONSÁVEL.: Marcio Sanches Spinosa
Nº SOL......: 149111
Nº KINTANA..: 1066131
Data........: 12/12/2012
Descrição...: Inclusão do campo CODFAIXAPCDS
*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
******************************************************************************}


unit uCtrlFaixaSal;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbFaixaSal, uDbParamRH,
  uDBFaixaNivel;  //alterado por William Santana - SOL: 199707 KIN: 1922320;

type
  TCtrlFaixaSal = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDb: TDbFaixaSal;
    FDbFaixaNivel : TDbFaixaNivel; // William Santana - SOL: 199707 KIN: 1922320
    FDbParamRH: TDbParamRH;
    FCds: TCMClientDataSet;
    FCdsFaixaNivel : TCMClientDataSet; // William Santana - SOL: 199707 KIN: 1922320
    FCdsAux : TCMClientDataSet;
    FTipoEmpresa: string;
    FIdEmpresa: integer;
  public
    constructor Create(IdEmpresa: integer); reintroduce;
    destructor  Destroy; override;

    function ListFaixaSal(IdFaixaSalarial: double = 0): OleVariant;
    function ListFaixaCargo(IdCargo: double): OleVariant;

    function Gravar: boolean;

   // William Santana - SOL: 199707 KIN: 1922320
    function ApagarHistFaixa: boolean;
    function AlterarHistFaixa(step : Integer; idnivel, valor, dataef: string): Boolean;
    function DataFaixaSalMaior:Boolean;
    function VerificaSePodeApagar(codigo: Double; datafaixa :string):Boolean;
    function CorrigeFaixaSal: boolean;
    procedure CorrigeFaixaNivel;                                               
   //END - William Santana - SOL: 199707 KIN: 1922320

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsFaixaNivel : TCMClientDataSet read FCdsFaixaNivel write FCdsFaixaNivel;// William Santana - SOL: 199707 KIN: 1922320;
    property DbParamRH: TDbParamRH read FDbParamRH write FDbParamRH;
    property TipoEmpresa: string read FTipoEmpresa;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlFaixaSal }

constructor TCtrlFaixaSal.Create(IdEmpresa: integer);
begin
  inherited Create;
  FDb := TDbFaixaSal.Create(Self);
  FDbFaixaNivel := TDbFaixaNivel.Create(Self);  // William Santana - SOL: 199707 KIN: 1922320;
  FDbParamRH := TDbParamRH.Create(Self);
  FIdEmpresa := IdEmpresa;
  FCdsAux := TCMClientDataSet.Create(nil);      // William Santana - SOL: 199707 KIN: 1922320;
end;

destructor TCtrlFaixaSal.Destroy;
begin
  FDbParamRH.Free;
  FDb.Free;
  FDbFaixaNivel.Free; // William Santana - SOL: 199707 KIN: 1922320;

  if (IsAppServer) then
    FCds.Free;
  // William Santana - SOL: 199707 KIN: 1922320;
  FCdsFaixaNivel.Free;   
  FCdsAux.Free;
  //END-  William Santana - SOL: 199707 KIN: 1922320;
  inherited;
end;

procedure TCtrlFaixaSal.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsFaixaNivel := TCMClientDataSet.Create(nil); // William Santana - SOL: 199707 KIN: 1922320;
end;

procedure TCtrlFaixaSal.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
  FDbFaixaNivel.DataBaseName := DataBaseName; // William Santana - SOL: 199707 KIN: 1922320;
  FDbParamRH.DatabaseName := DataBaseName;

  // Verifica a rotina de integraçao dos sistemas previdenciários com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  _Cds.Data := GetDataPacket('SELECT TIPOEMPRESA FROM EMPRESAPROP '+
    'WHERE IDPESSOA = ' + IntToStr(FIdEmpresa));
  FTipoEmpresa := _Cds.FieldByName('TIPOEMPRESA').asString;
end;

function TCtrlFaixaSal.ListFaixaSal(IdFaixaSalarial: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdFaixaSalarial=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDFAIXASALARIAL, DATAEFETIV, STEP1, STEP2, STEP3, STEP4, STEP5,'+CR_LF+
    '  STEP6, STEP7, STEP8, STEP9, Step10, Step11, Step12, Step13, Step14,'+CR_LF+ //Douglas.Siqueira SOL 171426 Kintana 1537613
    '  Step15,Step16,Step17,Step18,Step19,Step20'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
    '  , CODFAIXAPCS ' + CR_LF + //Marcio Sanches Spinosa SOL 149111 Kintana 1066131
    'FROM'+CR_LF+
    '  FAIXASAL'+CR_LF+
    IFF(IdFaixaSalarial=-1, 'WHERE (1 = 2)',
      IFF(IdFaixaSalarial=0, 'ORDER BY'+CR_LF+'  IDFAIXASALARIAL', 'WHERE'+CR_LF+
      '  (IDFAIXASALARIAL = '+FloatToStr(IdFaixaSalarial)+')')));
end;

function TCtrlFaixaSal.ListFaixaCargo(IdCargo: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  F.*'+CR_LF+
    'FROM'+CR_LF+
    '  FAIXASAL F, CARGO C'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.IDCARGO         = ' +FloatToStr(IdCargo)+ ') AND'+CR_LF+
    '  (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL)');
end;

function TCtrlFaixaSal.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);

      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

// William Santana - SOL: 199707 KIN: 1922320;
//As funções de manipulação de histórico não são possiveis de serem feitas pelas funções da herança

function TCtrlFaixaSal.ApagarHistFaixa: boolean;
begin

   try
      StartTransaction;

      Result := ExecSQL(' DELETE ' + CR_LF +
                        ' FROM FAIXANIVEL ' + CR_LF +
                        ' WHERE TRUNC(IDNIVEL/100) = '+ CdsFaixaNivel.FieldByName('IDNIVEL').AsString  +
                        ' AND DATAEFETIVACAO = ' +QuotedStr(CdsFaixaNivel.FieldByName('DATAEFETIVACAO').AsString) );
                                                                                                        
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbFaixaNivel.MessageInfo);
   except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
   end;
end;
//Foi decidio que será possível alterar o histórico
// e mesmo quando a faixa não existir deverá ser possível incluir uma faixa.
function TCtrlFaixaSal.AlterarHistFaixa(step : Integer; idnivel, valor, dataef: string): boolean;
var
Nstep, sSql, val : string;
begin
     if (step < 10) then
      Nstep := '0'+ inttostr(step)
     else
      Nstep := inttostr(step);

     Nstep := idnivel+Nstep;
     val := StringReplace(valor,'.','',[rfReplaceAll]);

     FCdsAux.Data := GetDataPacket(' SELECT VALOR FROM FAIXANIVEL WHERE ' +
                                   ' IDNIVEL = '+Nstep+' AND            ' +
                                   ' DATAEFETIVACAO = '''+dataef+'''');

    If (FCdsAux.IsEmpty) then
     begin
       if (StrTofloat(val) = 0) then
        begin
         result := false;
         Exit;
        end
       else
        sSql := 'INSERT INTO FAIXANIVEL                                             '+
                       ' (IDPESSJUR, IDNIVEL, IDFAIXASALEXT, DATAEFETIVACAO, VALOR) '+
                       ' VALUES                                                     '+
                       ' (1, ' +  Nstep + ', CM.SEQFAIXANIVEL.NEXTVAL ,' + QuotedStr(dataef) +
                       ', ' + QuotedStr(val) + ')';
     end
    else
     sSql :=  ('UPDATE FAIXANIVEL '                                   +
                        ' SET VALOR = '+ QuotedStr(val) +
                        ' WHERE IDNIVEL = '+ Nstep                    +
                        ' AND DATAEFETIVACAO = ' + QuotedStr(dataef));

    try
      StartTransaction;

      Result := ExecSQL(sSql);

      if (Result) then
        Commit
      else
        raise Exception.Create(FDbFaixaNivel.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;

end;

//verificar se a data da faixaSal é maior ou igual à maior data da faixaNivel
function TCtrlFaixaSal.DataFaixaSalMaior:Boolean;
begin
  Result := (cds.FieldByName('dataefetiv').AsDateTime > CdsFaixaNivel.FieldByName('dataefetivacao').AsDateTime);
end;

//fazer update copiando os registros com maior data da faixaNivel para o registro da faixaSal
//e da faixaSal para faixaNivel
procedure TCtrlFaixaSal.CorrigeFaixaNivel;
var
NIVEL1, NIVEL2, NIVEL3, NIVEL4, NIVEL5,
NIVEL6, NIVEL7, NIVEL8, NIVEL9, NIVEL10,
NIVEL11, NIVEL12, NIVEL13, NIVEL14, NIVEL15,
NIVEL16, NIVEL17, NIVEL18, NIVEL19, NIVEL20 :integer;
DATAEFETIVACAO : TDateTime;
begin

    NIVEL1         := cds.FieldByName('STEP1').AsInteger;
    NIVEL2         := cds.FieldByName('STEP2').AsInteger;
    NIVEL3         := cds.FieldByName('STEP3').AsInteger;
    NIVEL4         := cds.FieldByName('STEP4').AsInteger;
    NIVEL5         := cds.FieldByName('STEP5').AsInteger;
    NIVEL6         := cds.FieldByName('STEP6').AsInteger;
    NIVEL7         := cds.FieldByName('STEP7').AsInteger;
    NIVEL8         := cds.FieldByName('STEP8').AsInteger;
    NIVEL9         := cds.FieldByName('STEP9').AsInteger;
    NIVEL10        := cds.FieldByName('STEP10').AsInteger;
    NIVEL11        := cds.FieldByName('STEP11').AsInteger;
    NIVEL12        := cds.FieldByName('STEP12').AsInteger;
    NIVEL13        := cds.FieldByName('STEP13').AsInteger;
    NIVEL14        := cds.FieldByName('STEP14').AsInteger;
    NIVEL15        := cds.FieldByName('STEP15').AsInteger;
    NIVEL16        := cds.FieldByName('STEP16').AsInteger;
    NIVEL17        := cds.FieldByName('STEP17').AsInteger;
    NIVEL18        := cds.FieldByName('STEP18').AsInteger;
    NIVEL19        := cds.FieldByName('STEP19').AsInteger;
    NIVEL20        := cds.FieldByName('STEP20').AsInteger;
    DATAEFETIVACAO := cds.FieldByName('DATAEFETIV').AsDateTime;

    cds.FieldByName('STEP1').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL1').AsInteger ;
    cds.FieldByName('STEP2').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL2').AsInteger ;
    cds.FieldByName('STEP3').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL3').AsInteger ;
    cds.FieldByName('STEP4').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL4').AsInteger ;
    cds.FieldByName('STEP5').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL5').AsInteger ;
    cds.FieldByName('STEP6').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL6').AsInteger ;
    cds.FieldByName('STEP7').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL7').AsInteger ;
    cds.FieldByName('STEP8').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL8').AsInteger ;
    cds.FieldByName('STEP9').AsInteger       := CdsFaixaNivel.FieldByName('NIVEL9').AsInteger ;
    cds.FieldByName('STEP10').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL10').AsInteger;
    cds.FieldByName('STEP11').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL11').AsInteger;
    cds.FieldByName('STEP12').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL12').AsInteger;
    cds.FieldByName('STEP13').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL13').AsInteger;
    cds.FieldByName('STEP14').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL14').AsInteger;
    cds.FieldByName('STEP15').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL15').AsInteger;
    cds.FieldByName('STEP16').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL16').AsInteger;
    cds.FieldByName('STEP17').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL17').AsInteger;
    cds.FieldByName('STEP18').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL18').AsInteger;
    cds.FieldByName('STEP19').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL19').AsInteger;
    cds.FieldByName('STEP20').AsInteger      := CdsFaixaNivel.FieldByName('NIVEL20').AsInteger;
    cds.FieldByName('DATAEFETIV').AsDateTime := CdsFaixaNivel.FieldByName('DATAEFETIVACAO').AsDateTime;


    CdsFaixaNivel.edit;
    CdsFaixaNivel.FieldByName('NIVEL1').AsInteger          := NIVEL1;
    CdsFaixaNivel.FieldByName('NIVEL2').AsInteger          := NIVEL2;
    CdsFaixaNivel.FieldByName('NIVEL3').AsInteger          := NIVEL3;
    CdsFaixaNivel.FieldByName('NIVEL4').AsInteger          := NIVEL4;
    CdsFaixaNivel.FieldByName('NIVEL5').AsInteger          := NIVEL5;
    CdsFaixaNivel.FieldByName('NIVEL6').AsInteger          := NIVEL6;
    CdsFaixaNivel.FieldByName('NIVEL7').AsInteger          := NIVEL7;
    CdsFaixaNivel.FieldByName('NIVEL8').AsInteger          := NIVEL8;
    CdsFaixaNivel.FieldByName('NIVEL9').AsInteger          := NIVEL9;
    CdsFaixaNivel.FieldByName('NIVEL10').AsInteger         := NIVEL10;
    CdsFaixaNivel.FieldByName('NIVEL11').AsInteger         := NIVEL11;
    CdsFaixaNivel.FieldByName('NIVEL12').AsInteger         := NIVEL12;
    CdsFaixaNivel.FieldByName('NIVEL13').AsInteger         := NIVEL13;
    CdsFaixaNivel.FieldByName('NIVEL14').AsInteger         := NIVEL14;
    CdsFaixaNivel.FieldByName('NIVEL15').AsInteger         := NIVEL15;
    CdsFaixaNivel.FieldByName('NIVEL16').AsInteger         := NIVEL16;
    CdsFaixaNivel.FieldByName('NIVEL17').AsInteger         := NIVEL17;
    CdsFaixaNivel.FieldByName('NIVEL18').AsInteger         := NIVEL18;
    CdsFaixaNivel.FieldByName('NIVEL19').AsInteger         := NIVEL19;
    CdsFaixaNivel.FieldByName('NIVEL20').AsInteger         := NIVEL20;
    CdsFaixaNivel.FieldByName('DATAEFETIVACAO').AsDateTime := DATAEFETIVACAO;

end;

function TCtrlFaixaSal.CorrigeFaixaSal:Boolean;
var
  sSql: String;
begin

  sSql :=  ('UPDATE FAIXASAL  SET ' +
    'DATAEFETIV =  ' + QuotedStr(CdsFaixaNivel.FieldByName('DATAEFETIVACAO').AsString )   +
    ', STEP1      = ' + CdsFaixaNivel.FieldByName('NIVEL1').AsString   +
    ', STEP2      = ' + CdsFaixaNivel.FieldByName('NIVEL2').AsString   +
    ', STEP3      = ' + CdsFaixaNivel.FieldByName('NIVEL3').AsString   +
    ', STEP4      = ' + CdsFaixaNivel.FieldByName('NIVEL4').AsString   +
    ', STEP5      = ' + CdsFaixaNivel.FieldByName('NIVEL5').AsString   +
    ', STEP6      = ' + CdsFaixaNivel.FieldByName('NIVEL6').AsString   +
    ', STEP7      = ' + CdsFaixaNivel.FieldByName('NIVEL7').AsString   +
    ', STEP8      = ' + CdsFaixaNivel.FieldByName('NIVEL8').AsString   +
    ', STEP9      = ' + CdsFaixaNivel.FieldByName('NIVEL9').AsString   +
    ', STEP10     = ' + CdsFaixaNivel.FieldByName('NIVEL10').AsString  +
    ', STEP11     = ' + CdsFaixaNivel.FieldByName('NIVEL11').AsString  +
    ', STEP12     = ' + CdsFaixaNivel.FieldByName('NIVEL12').AsString  +
    ', STEP13     = ' + CdsFaixaNivel.FieldByName('NIVEL13').AsString  +
    ', STEP14     = ' + CdsFaixaNivel.FieldByName('NIVEL14').AsString  +
    ', STEP15     = ' + CdsFaixaNivel.FieldByName('NIVEL15').AsString  +
    ', STEP16     = ' + CdsFaixaNivel.FieldByName('NIVEL16').AsString  +
    ', STEP17     = ' + CdsFaixaNivel.FieldByName('NIVEL17').AsString  +
    ', STEP18     = ' + CdsFaixaNivel.FieldByName('NIVEL18').AsString  +
    ', STEP19     = ' + CdsFaixaNivel.FieldByName('NIVEL19').AsString  +
    ', STEP20     = ' + CdsFaixaNivel.FieldByName('NIVEL20').AsString  +

    ' WHERE IDFAIXASALARIAL = '+ CdsFaixaNivel.FieldByName('IDNIVEL').AsString );


    try
      StartTransaction;

      Result := ExecSQL(Ssql);

      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;

end;

function TCtrlFaixaSal.VerificaSePodeApagar(codigo: Double; datafaixa :string):Boolean;
begin

  FCdsAux.Data := GetDataPacket(' SELECT FUNC.MATRICULA, FUNC.IDFAIXASALARIAL, FUNC.DATAALTERFUNC, FUNC.SALARIO '+
                                ' FROM (SELECT N.IDNIVEL, TRUNC(N.IDNIVEL / 100) AS FAIXASALARIAL, N.VALOR,     '+
                                ' N.DATAEFETIVACAO AS DATAINICIAL,                                              '+
                                '   CASE                                                                        '+
                                '     WHEN LEAD(N.IDNIVEL, 1, NULL)                                             '+
                                '     OVER(ORDER BY N.IDNIVEL, N.DATAEFETIVACAO) = N.IDNIVEL THEN               '+
                                '     LEAD(N.DATAEFETIVACAO, 1, NULL)                                           '+
                                '     OVER(ORDER BY N.IDNIVEL, N.DATAEFETIVACAO) - 1                            '+
                                '    ELSE                                                                       '+
                                '      (SELECT TO_DATE(''31/12/9999'')FROM DUAL)                                '+
                                '    END AS DATAFINAL                                                           '+
                                ' FROM FAIXANIVEL N                                                             '+
                                ' WHERE TRUNC(N.IDNIVEL / 100) = '+ FloatToStr(codigo)                           +
                                '  ORDER BY 1, 4 ASC) FAIXA,                                                    '+
                                ' (SELECT F.MATRICULA, E.IDPESSOA, E.DATAALTERFUNC, E.IDCARGO,                  '+
                                ' C.IDFAIXASALARIAL, E.SALARIO                                                  '+
                                '    FROM EVOLFUNC E, FUNCIONARIO F, CARGO C                                    '+
                                '   WHERE E.IDPESSOA = F.IDPESSOA                                               '+
                                '     AND E.IDCARGO = C.IDCARGO) FUNC                                           '+
                                ' WHERE FUNC.IDFAIXASALARIAL = FAIXA.FAIXASALARIAL                              '+
                                ' AND FUNC.SALARIO = FAIXA.VALOR                                                '+
                                ' AND FUNC.DATAALTERFUNC BETWEEN FAIXA.DATAINICIAL AND FAIXA.DATAFINAL          '+
                                ' AND FAIXA.DATAINICIAL = '+ QuotedStr(datafaixa)                                 );

  Result := FCdsAux.IsEmpty;

end;

// END - William Santana - SOL: 199707 KIN: 1922320;
end.
