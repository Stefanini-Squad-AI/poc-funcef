{
Rotina............: Destroy
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
					da memória após sua utilização.
}

//======================================================================================
//
//   Data      : 16/02/2005
//   Pendência : 18646
//   Descrição : Retirar a linha:    if Result  then MessageInfo := 'Registro já existe';
//
//======================================================================================

unit uCtrlPlanPrevContabPatro;

interface

uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPlanPrevContabPatro, uCMClientDataSet;

type
   TCtrlPlanPrevContabPatro = class(TCmControlObject)

   protected
      procedure AfterInitialize; Override;


   private
      //--------------------------------------------------------------------------------------------
      //    Classes de Persistência
      //--------------------------------------------------------------------------------------------

      _DbPlanPrevContabPatro  : TDbPlanPrevContabPatro;
      Fcds                    : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); override;

   public

      property cds: TClientDataSet read Fcds write Setcds;

      //--------------------------------------------------------------------------------------------
      //    Métodos
      //--------------------------------------------------------------------------------------------

      function ListaPlanoPatro(const iIdPlanoPrev: Integer = -1;
                               const iIdPatro: integer = -1;
                               const iIDPLANPREVCTBPATR : Integer = -1
                              ): OLEVariant;

      function Gravar : Boolean;
      function ValidaPlanoPatro(iIdPatro : Integer;
                                iIdPlano : Integer
                               ) : Boolean;

      constructor Create;  override;
      destructor  Destroy; override;
  end;




implementation



{$IFNDEF VERSAO0505}
uses
   uCmTypes;
{$ENDIF}


procedure TCtrlPlanPrevContabPatro.AfterInitialize;
begin
   inherited;
   _DbPlanPrevContabPatro.DataBaseName := DataBaseName;
end;



constructor TCtrlPlanPrevContabPatro.Create;
begin
   inherited;
   _DbPlanPrevContabPatro := TDbPlanPrevContabPatro.Create(Self);
   FCds := TClientDataSet.Create( nil );
end;



destructor TCtrlPlanPrevContabPatro.Destroy;
begin
  // Ricardo A. SOL: 103843 KTN: 464129
  FreeAndNil( Fcds );
  FreeAndNil(  _DbPlanPrevContabPatro );

   inherited;
end;



function TCtrlPlanPrevContabPatro.Gravar: Boolean;
Var
  Msg: String;
begin

   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.Gravar( Fcds.Data );

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      Try
         StartTransaction;
         Result := ApplyCds( Fcds, _DbPlanPrevContabPatro, [], [] );
         Msg    := _DbPlanPrevContabPatro.MessageInfo;

         If Not Result Then
            Raise Exception.Create( Msg );

         Commit;
      Except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;



function TCtrlPlanPrevContabPatro.ListaPlanoPatro(const iIdPlanoPrev       : Integer = -1;
                                                  const iIdPatro           : integer = -1;
                                                  const iIDPLANPREVCTBPATR : Integer = -1
                                                 ): OLEVariant;
var
  sSql, sParam : string;
begin
   sParam := '';
   if iIdPlanoPrev       <> -1 then sParam := sParam + '   AND PCP.IDPLANOPREV       = ' + IntToStr (iIdPlanoPrev)       + #13;
   if iIdpatro           <> -1 then sParam := sParam + '   AND PCP.IDPATRO           = ' + IntToStr (iIdPatro)           + #13;
   if iIDPLANPREVCTBPATR <> -1 then sParam := sParam + '   AND PCP.IDPLANPREVCTBPATR = ' + IntToStr (iIDPLANPREVCTBPATR) + #13;

   sSql :=
   'SELECT '                                  + #13 +
   '    PES.NOME AS NOMEPATRO, '              + #13 +
   '    PLP.NOME AS NOMEPLANO, '              + #13 +
   '    PCP.IDPLANPREVCTBPATR, '              + #13 +
   '    PCP.IDPATRO,           '              + #13 +
   '    PCP.IDPLANOPREV        '              + #13 +
   'FROM                       '              + #13 +
   '    PESSOA PES,            '              + #13 +
   '    PLANPREVCONTABIL PLP,  '              + #13 +
   '    PLANPREVCONTABPATRO PCP '             + #13 +
   'WHERE '                                   + #13 +
   '    PLP.IDPLANOPREV = PCP.IDPLANOPREV '   + #13 +
   'AND PES.IDPESSOA    = PCP.IDPATRO     '   + #13 +
   // Pendência 17346
   'AND PLP.ATIVO = ''S''';

   if sParam <> '' then sSQL := sSQL + sParam;

   Result := GetDataPacket ( sSql );
end;



procedure TCtrlPlanPrevContabPatro.OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean);
begin
   inherited;
end;



procedure TCtrlPlanPrevContabPatro.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;



function TCtrlPlanPrevContabPatro.ValidaPlanoPatro(iIdPatro, iIdPlano: Integer): Boolean;
var
   cdsAux : TClientDataSet;
begin
   cdsAux      := TClientDataSet.Create(nil);

   try
     cdsAux.Data := ListaPlanoPatro(iIdPlano, iIDPatro, -1);
     Result      := not(cdsAux.IsEmpty);
     // início - pendência 19243
     if not Result then
     begin
       cdsAux.Data := GetDataPacket('SELECT NOME FROM PESSOA WHERE IDPESSOA = ' + intToStr(iIdPatro));
       MessageInfo := ' O Relacionamento da Patro '+ CdsAux.fieldByName('NOME').asString;
       cdsAux.Data := GetDataPacket('SELECT NOME FROM PLANPREVCONTABIL WHERE IDPLANOPREV = ' + intToStr(iIdPlano));
       MessageInfo := MessageInfo + ' com o Plano '+ CdsAux.fieldByName('NOME').asString + ' é inválido';
     end;
   finally
     cdsAux.Free;
   end;
   // fim - pendência 19243

end;



end.
