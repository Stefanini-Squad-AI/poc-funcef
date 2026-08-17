{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: ListaPlanoPrev, ListaPatrocionadora
N. Sol..........: 191844
N. Kintana......: 1822119
Data............: 15/07/2013
Responsável.....: Edilaine Ferraresi
Descrição.......: adicionado seleção de Plano e Patro na parametrizacao de medicao
-------------------------------------------------------------------------------- }

unit uCtrlParamContrato;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uCMTypes, uDbParamContrato, uDbImpostoImpNF;

type
   TCtrlParamContrato = Class(TCmControlObject)

   private
      FDbParamContrato      : TDbParamContrato;
      FDbImpostoImpNF       : TDbImpostoImpNF;
      FcdsParamContrato     : TCMClientDataSet;
      FcdsImpostoImpNF      : TCMClientDataSet;
   public
      property cdsParamContrato: TCMClientDataSet read FcdsParamContrato write FcdsParamContrato;
      property cdsImpostoImpNF : TCMClientDataSet read FcdsImpostoImpNF write FcdsImpostoImpNF;

      constructor Create; override;
      destructor Destroy; override;

      function AplicaAtualParamContrato: Boolean;
      function ListParamContrato(rIDPessoa: Double): OleVariant;
      function ListImpostosImpNF(rIDPessoa: Double; bSoDisponiveis: Boolean): Olevariant;

      // Edilaine - SOL 191844 / KTN 1822119
      function ListaPlanoPrev : OleVariant;
      function ListaPatrocionadora : OleVariant;
      // Edilaine - SOL 191844 / KTN 1822119 - fim
      
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlParamContrato }

constructor TCtrlParamContrato.Create;
begin
   inherited;
   FDbParamContrato:=TDbParamContrato.Create(Self);
   FDbImpostoImpNF:=TDbImpostoImpNF.Create(Self);
end;

procedure TCtrlParamContrato.OnCreateAppServer;
begin
   inherited;
   FcdsParamContrato:=TCMClientDataSet.Create(nil);
   FcdsImpostoImpNF:=TCMClientDataSet.Create(nil);
end;

procedure TCtrlParamContrato.AfterInitialize;
begin
   inherited;
end;

destructor TCtrlParamContrato.Destroy;
begin
   inherited;
   FDbParamContrato.Free;
   FDbImpostoImpNF.Free;
   if IsAppServer then
    begin
       FcdsParamContrato.Free;
       FcdsImpostoImpNF.Free;
    end;
end;

procedure TCtrlParamContrato.DoChangeDataBase;
begin
   inherited;
   FDbParamContrato.DataBaseName:=DataBaseName;
   FDbImpostoImpNF.DataBaseName:=DataBaseName;
end;

function TCtrlParamContrato.AplicaAtualParamContrato: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualParamContrato(FcdsParamContrato.Data,
                                                               FcdsImpostoImpNF.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FcdsParamContrato, FDbParamContrato,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbParamContrato.MessageInfo;
              Rollback;
           end
          else
           begin
              Result:=ApplyCds(FcdsImpostoImpNF, FDbImpostoImpNF,[],[]);
              if not(Result) then
               begin
                  MessageInfo:=FDbImpostoImpNF.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlParamContrato.ListParamContrato(
  rIDPessoa: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM PARAMCONTRATO WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlParamContrato.ListImpostosImpNF(rIDPessoa: Double;
  bSoDisponiveis: Boolean): Olevariant;
var
   sSql : String;
begin
   if bSoDisponiveis then
      sSql:='SELECT '+
            '   TA.* '+
            'FROM '+
            '   TIPOALTERADOR TA '+
            'WHERE '+
            '   (TA.IDPESSOA = '+FloatTosTr(rIDPessoa)+') AND '+
            '   (TA.RECPAG = ''R'') AND '+
            '   (NOT EXISTS(SELECT I.CODALTERADOR '+
            '               FROM IMPOSTOIMPNF I '+
            '               WHERE (I.IDPESSOA = TA.IDPESSOA) AND '+
            '                     (I.CODALTERADOR = TA.CODALTERADOR))) '+
            'ORDER BY TA.DESCRICAO '
   else
      sSql:='SELECT '+
            '   TA.DESCRICAO, '+
            '   I.* '+
            'FROM '+
            '   TIPOALTERADOR TA, '+
            '   IMPOSTOIMPNF I '+
            'WHERE '+
            '   (I.IDPESSOA = '+FloatTosTr(rIDPessoa)+') AND '+
            '   (I.IDPESSOA = TA.IDPESSOA) AND '+
            '   (I.CODALTERADOR = TA.CODALTERADOR) '+
            'ORDER BY TA.DESCRICAO ';
   Result:=GetDataPacket(sSql);
end;


function TCtrlParamContrato.ListaPatrocionadora: OleVariant;
var
   sSql : String;
begin
   sSQl := 'SELECT DISTINCT VW.IDPATRO, '+
           '       DECODE(P.RAZAOSOCIAL, NULL, P.NOME, P.RAZAOSOCIAL) AS NOME '+
           '  FROM VWPLANPREVCTBPATR VW, PESSOA P '+
           ' WHERE VW.IDPATRO = P.IDPESSOA ';

   Result:=GetDataPacket(sSql);
end;


function TCtrlParamContrato.ListaPlanoPrev: OleVariant;
var
   sSql : String;
begin
   sSQl := 'SELECT IDPLANOPREV, NOME '+
           '  FROM PLANPREVCONTABIL ' +
           ' WHERE ATIVO = ''S'' ' +
           ' ORDER BY NOME ';

   Result:=GetDataPacket(sSql);
end;

end.
