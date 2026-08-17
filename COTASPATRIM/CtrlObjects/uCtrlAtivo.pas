{ --------------------------------------------------------------------------------------------------
Data      : 18/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : 23004
Descrição : CTRL do Cadastro do Ativo.
---------------------------------------------------------------------------------------------------}

unit uCtrlAtivo;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     udbCpAtivo, uCMClientDataSet, UCMTypes,
     Dialogs, uCtrlPadroes;

type
   TCtrlAtivo = Class(TCmControlObject)
   private

    dbcpAtivo: TDbCpativo;

   public
   Cds        : TCMClientDataSet;
   CdsCarrega : TCMClientDataSet;
   CdsRegra   : TCMClientDataSet;

      Function CarregaAtivo( sListaId : string = '' ): OleVariant;
      Function CarregaRegra: OleVariant;
      function VerificaNome(iIdCpAtivo : integer; sPlano, sPatro: String): Boolean;
      Function GravaDados: Boolean;
      constructor Create; override;
      destructor Destroy; override;

      function SelecionaAtivo( iIdCpAtivo : integer ) : OleVariant;

   protected
      procedure DoChangeDataBase; override;
   end;


implementation

constructor TctrlAtivo.Create;
begin
  inherited;
  dbcpAtivo  := TDbCpativo.Create(self);
  Cds        := TCMClientDataSet.Create(nil);
  CdsCarrega := TCMClientDataSet.Create(nil);
  CdsRegra   := TCMClientDataSet.Create(nil);   
end;

destructor TctrlAtivo.Destroy;
begin
  dbcpAtivo.Free;

  if IsAppServer then
  begin
    Cds.Free;
    CdsCarrega.Free;
    CdsRegra.Free;
  end;
     
  inherited;
end;

procedure TCtrlAtivo.DoChangeDataBase;
begin
  inherited;
  dbcpAtivo.DataBaseName := databasename;

end;

function TCtrlAtivo.GravaDados: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaDados;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result := ApplyCds( Cds, dbcpAtivo, [],[]);

          if not(Result) then
              Raise Exception.Create(dbcpAtivo.MessageInfo);

           Commit;
           Result:= True;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;


function TCtrlAtivo.CarregaAtivo( sListaId : string = '' ): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   'SELECT                                               ' +
   '  RG.NOMEREGRA,                                      ' +
   '  C.IDPLANOPREV,                                     ' +
   '  PP.NOME AS NOMEPLANOPREV,                          ' +
   '  PTR.IDPESSOA AS IDPATRO,                           ' +
   '  PTR.NOME AS NOMEPATRO,                             ' +
   '  C.NOME, C.IDREGRA, C.DESCRICAO, C.IDCPATIVO,       ' +
   '  C.DTABERT, C.VLABERT                               ' +
   'FROM                                                 ' +
   '  CPATIVO C,                                         ' +
   '  REGRA RG,                                          ' +
   '    (SELECT P.NOME, P.IDPESSOA                       ' +
   '     FROM PESSOA P, PATRO PT                         ' +
   '     WHERE P.IDPESSOA = PT.IDPESSOA)  PTR,           ' +
   '  PLANPREVCONTABIL PP                                ' +
   'WHERE                                                ' +
   '      (C.IDPLANOPREV  = PP.IDPLANOPREV(+))           ' +
   '  AND (C.IDPATRO      = PTR.IDPESSOA(+))             ' +
   '  AND (C.IDREGRA      = RG.IDREGRA(+))               ' ;

  if sListaId <> '' then
    sSQL := sSQL +
     ' AND c.IDCPATIVO in ( ' + sListaId + ' ) ';

  Result:=GetDataPacket( sSQL + ' ORDER BY NOME ' );
end;

function TCtrlAtivo.VerificaNome(iIdCpAtivo : integer; sPlano, sPatro: String): Boolean;
begin

      //Se o Patro e Patrocinada já forem cadastradas
   if ((Trim(sPlano) <> '') and (Trim(sPatro) <> '')) then

   CdsCarrega.Data := GetDataPacket('SELECT IDPATRO, IDPLANOPREV, NOME, DESCRICAO, IDCPATIVO '+
                                     ' FROM CPATIVO ' +
                                     ' WHERE        ' +
                                     ' IDPATRO = '+(sPatro)+
                                     ' AND IDPLANOPREV = '+(sPlano)+
                                     ' AND IDCPATIVO <> ' + IntToStr( iIdCpAtivo ) )

   else  //Se o patro já foi cadastrado.
   if ((Trim(sPlano) = '') and (Trim(sPatro) <> '')) then
   CdsCarrega.Data := GetDataPacket('SELECT IDPATRO, IDPLANOPREV, NOME, DESCRICAO, IDCPATIVO '+
                                     ' FROM CPATIVO ' +
                                     ' WHERE        ' +
                                     ' IDPATRO = '+(sPatro)+
                                     ' AND IDPLANOPREV IS NULL ' +
                                     ' AND IDCPATIVO <> ' + IntToStr( iIdCpAtivo ))

   else //Se o plano já foi cadastrado.
   if ((Trim(sPlano) <> '') and (Trim(sPatro) = '')) then
   CdsCarrega.Data := GetDataPacket('SELECT IDPATRO, IDPLANOPREV, NOME, DESCRICAO, IDCPATIVO '+
                                     ' FROM CPATIVO ' +
                                     ' WHERE        ' +
                                     ' IDPLANOPREV = '+(sPlano)+
                                     ' AND IDPATRO IS NULL ' +
                                     ' AND IDCPATIVO <> ' + IntToStr( iIdCpAtivo ));

   Result:= CdsCarrega.IsEmpty;
end;


function TCtrlAtivo.CarregaRegra: OleVariant;
begin
  Result:= GetDataPacket('SELECT                                                   '+
                         '   R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA,                '+
                         '   P.IDGRUPOREGRA                                        '+
                         'FROM                                                     '+
                         '   REGRA R,  TIPOREGRA  T,                               '+
                         '   GRUPOREGRA GR, PARAMCOTAPATRIM P                      '+
                         'WHERE                                                    '+
                         '   (R.IDTIPOREGRA = T.IDTIPOREGRA) AND                   '+
                         '   (GR.IDGRUPOREGRA = T.IDGRUPOREGRA) AND                '+
                         '   (GR.IDGRUPOREGRA = P.IDGRUPOREGRA)' );
end;


function TCtrlAtivo.SelecionaAtivo(iIdCpAtivo: integer): OleVariant;
begin
  dbcpAtivo.Idcpativo.AsInteger := iIdCpAtivo;
  Result := GetDataPacket( dbcpAtivo.SSqlSelect );
end;

end.
