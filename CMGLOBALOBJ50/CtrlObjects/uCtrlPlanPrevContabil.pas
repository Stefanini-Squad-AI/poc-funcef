unit uCtrlPlanPrevContabil;

//***************************************************************************************
//Rotina:            ListaPlanPrevContabil
//Nº SOL:            126865
//Nº KINTANA         667421
//Data da Alteração: 02/02/2010
//Responsável:       Ricardo A.
//Descrição:         Criação do campo FLGEXCLUSIVOCONTAB.
//**************************************************************************************

// Alterações:
//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 09/11/2009
// Sol........: 126170
// Kintana....: 657025
// Descrição..: Inclusão de Campo para USO PGA no cadastro de Plano Previdenciario
//              Contabil
//
//--------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
    : ListaPlanPrevContabil(
Data      : 03/02/2005
Pendencia : 18537
Descrição : Incluir os campos CODIGOSPC e NOME do  SELECT
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaPlanPrevContabil(
Data      : 03/02/2005
Pendencia : 18537
Descrição : Incluir os campos CODIGOSPC e NOME do  SELECT
---------------------------------------------------------------------------------------------------}
// pendência 16751 - 10/05/2004
// Criação do método ListaCodSpcPlanoPrevAdmPrev que lista os códigos SPC dos planoprev do ADMPREV para auxiliar no cadastro do PlanPrevContabil

{ --------------------------------------------------------------------------------------------------
Rotina    : ListaPlanPrevContabil(
Data      : 17/12/2003
Pendencia : 15699
Pendencia : 14451
Descrição : Nova Segregação. Não trazer na query a informação do plano parametrizado
            no PARAMGLOGAL.IDPLANOPREV.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ListaPlanPrevContabil(
Data      : 26/11/2003
Pendencia : 15699
Descrição : Adicionados à query os novos campos SIGLAORCAMENTO e CODSPC
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/09/2003
Pendencia : 10065
Descrição : Retirado o campo FlgOrcamento. Alterações de acordo.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 04/09/2003
Pendencia : 10065
Descrição : Criados novos campos na PlanPrevContabil:
            - FlgOrcamento: NUMBER;
            - CodOrcamento: NUMBER(1);
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 03/08/2006
Pendencia : 22218
Descrição : Criado nova Flag no Form FCadPlanPrevContabilMT
            - FlgNaoIdentificado: Char
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

interface

uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPlanPrevContabil;

type
   TCtrlPlanPrevContabil = class(TCmControlObject)

   protected
      procedure DoChangeDataBase; override;


   private
      //--------------------------------------------------------------------------------------------
      //    Classes de Persistência
      //--------------------------------------------------------------------------------------------

      _DbPlanPrevContabil  : TDbPlanPrevContabil;
      Fcds                 : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);


   public

      property cds: TClientDataSet read Fcds write Setcds;

      //--------------------------------------------------------------------------------------------
      //    Métodos
      //--------------------------------------------------------------------------------------------

      constructor Create;  override;
      destructor  Destroy; override;

      //--------------------------------------------------------------------------------------------
      //    Metodos da Regra de Negócio
      //--------------------------------------------------------------------------------------------

      function  ListaPlanPrevContabil(IDPlanPrevContabil: Double = 0; iExcluiIdPlanPrevContabil: integer = 0;
                                     // P. 22218 03/08/2006
                                     bListaNaoIdentificada: boolean = False
                                     ): OleVariant;

      function  ListaCodSpcPlanoPrevAdmPrev: Olevariant;
      Function  ExistePlanoPrevContabilPGA : OleVariant;
      function  Gravar: Boolean;

  end;




implementation



{$IFNDEF VERSAO0505}
uses
   uCmTypes, USistema;
{$ENDIF}



function TCtrlPlanPrevContabil.Gravar: Boolean;
var
   sMsg: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravarPlanPrevContabil( Fcds.Data );

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
        StartTransaction;
        Result := ApplyCds(Fcds, _DbPlanPrevContabil, [], [] );
        sMsg   := _DbPlanPrevContabil.MessageInfo;

        if not(Result) then Raise Exception.Create(sMsg);

        Commit;
      except
         on E:Exception do
         begin
            Rollback;
            Result       := False;
            MessageInfo  := E.Message;
         end;
      end;
   end;
end;



constructor TCtrlPlanPrevContabil.Create;
begin
   inherited;
   _DbPlanPrevContabil := TDbPlanPrevContabil.Create(Self);
   FCds := TClientDataSet.Create( nil );
end;



destructor TCtrlPlanPrevContabil.Destroy;
begin
   if Fcds.Active then Fcds.Close;

   Fcds := nil;
   Fcds.Free;

   _DbPlanPrevContabil.Free;

   inherited;
end;



procedure TCtrlPlanPrevContabil.DoChangeDataBase;
begin
   inherited;
   _DbPlanPrevContabil.DataBaseName := DatabaseName;
end;



function TCtrlPlanPrevContabil.ListaPlanPrevContabil(IDPlanPrevContabil: Double;
                iExcluiIdPlanPrevContabil: integer;
                // P. 22218 03/08/2006
                bListaNaoIdentificada: boolean
                ): OleVariant;
var
  sSQL, sParam: String;
begin
  // 17/12/03 - pend 14451
  // Excluir da query o id registrado no parâmetro do global IDPLANOPREV

  sParam := '';
  if IDPlanPrevContabil        <> 0  then
    sParam := sParam + '  AND ( IDPLANOPREV =  ' + FormatFloat('#0', IDPlanPrevContabil)        + ' ) ' +#13;
  if iExcluiIdPlanPrevContabil <> 0  then
    sParam := sParam + '  AND ( IDPLANOPREV <> ' + FormatFloat('#0', iExcluiIdPlanPrevContabil) + ' ) ' +#13;

  // P. 22218 03/08/2006
  if bListaNaoIdentificada then
    sParam := sParam + ' AND (FLGNAOIDENTIFICAD = ''S'' ) ';

  // Ricardo A. SOL 126865 KTN 667421
  // apenas o Contabilidade e o Global pode enxergar todos os planos
  if not ( Sistema.IdModulo  in [ 1, 2 ] ) then
    sParam := sParam + ' AND ( FLGEXCLUSIVOCONTAB = ''N'') ' +#13;
  // FIM Ricardo A. SOL 126865 KTN 667421

  sSQL   := 'SELECT  '            + #13 +
            '  IDPLANOPREV, '     + #13 +
            '  NOME, '            + #13 +
            '  CODORCAMENTO, '    + #13 +
            '  SIGLAORCAMENTO, '  + #13 +
            '  ATIVO, '           + #13 +
            '  CODSPC, '          + #13 +
            '  IDPLANOPREVPREV, ' + #13 +
            // 03/08/2006 - 22218
            '  FLGNAOIDENTIFICAD, '+ #13 +
            '  FLGUSOPGA, '+ #13 +

            // Ricardo A. SOL 126865 KTN 667421
            '  FLGEXCLUSIVOCONTAB ' + #13 +
            // FIM Ricardo A. SOL 126865 KTN 667421

            'FROM '               + #13 +
            '  PLANPREVCONTABIL ' + #13 +
            'WHERE 1=1 '          + #13 +
            sParam +
            'ORDER BY NOME ';

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlPlanPrevContabil.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

// início - pendência 16751 - 10/05/2004
function TCtrlPlanPrevContabil.ListaCodSpcPlanoPrevAdmPrev: Olevariant;
begin
  //  P: 18537 - 03/02/2005

  Result := GetDataPacket('SELECT '          +
                          '   NOME, '        +
                          '   CODIGOSPC, '   +
                          '   IDPLANOPREV '  +

                          'FROM '            +
                          '   PLANPREV '     +
                          'ORDER BY '        +
                          '   NOME ');



end;
// fim  - pendência 16751 - 10/05/2004



function TCtrlPlanPrevContabil.ExistePlanoPrevContabilPGA: OleVariant;
begin
  Result := GetDataPacket('SELECT IDPlanoPrev, Nome '+#13+
                          'FROM PLANPREVCONTABIL'+#13+
                          'WHERE FLGUSOPGA = ''S''');
end;

end.
