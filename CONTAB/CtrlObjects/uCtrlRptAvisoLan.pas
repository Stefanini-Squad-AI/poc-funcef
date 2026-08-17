//***************************************************************************************
//Nº SOL...........: 199256
//Nº KINTANA.......: 2007140
//Data da Alteração: 22/05/2013
//Responsável......: Marcio Sanches Spinosa SOL 199256 Kintana 2007140
//Descrição........: Verifica se existe uma transação aberta e commit caso esteja correta
//**************************************************************************************
unit uCtrlRptAvisoLan;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
     uCMTypes, dBaseDados;

  Type

    TCtrlRptAvisoLan = Class(TCmControlObject)

    private
      FcdsPlanilSRef : TClientDataSet;
      FPlncodigo     : String;

      procedure SetcdsPlanilSRef(const Value: TClientDataSet);

    protected
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      property cdsPlanilSRef: TClientDataSet Read FcdsPlanilSRef Write SetcdsPlanilSRef;
      Property PlnCodigo : String read FPlnCodigo write FPlnCodigo;

      {Esta função Atualiza a tabela planilha, dado um novo numero de referencia}
      function ProcessaRptAvisoLan(dEmpresa:Double;iExercicio,iPeriodo:Integer;bChecado:Boolean) :Boolean;

    End;


implementation

constructor TCtrlRptAvisoLan.Create;
begin
  inherited;

end;

destructor TCtrlRptAvisoLan.Destroy;
begin
  inherited;

  If IsAppServer Then
     FcdsPlanilSRef.Free;

end;

procedure TCtrlRptAvisoLan.OnCreateAppServer;
begin
  inherited;
  FcdsPlanilSRef := TClientDataSet.Create(nil);

end;

procedure TCtrlRptAvisoLan.SetCdsPlanilSRef(const Value: TClientDataSet);
begin
   FcdsPlanilSRef := Value;
end;

function TCtrlRptAvisoLan.ProcessaRptAvisoLan(dEmpresa:Double;iExercicio,iPeriodo:Integer;bChecado:Boolean) :Boolean;
var
 iNumRef    : LongInt;
 sSql       : string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ProcessaRptAvisoLan(dEmpresa,iExercicio,iPeriodo,bChecado);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      FPlnCodigo := '';
      Result := True;

      If cdsPlanilSRef.Eof then
         Abort;

      cdsPlanilSRef.First;
      While not cdsPlanilSRef.EOF do begin

         if FPlnCodigo = '' then
            FPlnCodigo := cdsPlanilSRef.FieldByName('PLNCODIGO').AsString
         else
            FPlnCodigo := FPlnCodigo+','+cdsPlanilSRef.FieldByName('PLNCODIGO').AsString;

         if (cdsPlanilSRef.FieldByName('PLNREFERENCIA').isNull) or (bChecado = True) then begin

            Try

//               StartTransaction;Marcio Sanches Spinosa SOL 199256 Kintana 2007140
               //Marcio Sanches Spinosa SOL 199256 Kintana 2007140 - Inicio
               if not(dtmBaseDados.dbBaseDados.InTransaction) then
                 dtmBaseDados.dbBaseDados.StartTransaction;
               //Marcio Sanches Spinosa SOL 199256 Kintana 2007140 - Fim

               if bChecado = True then begin
                  iNumRef := cdsPlanilSRef.FieldByName('NUMAPGR').AsInteger;
               end else begin
                  // pega ultima referencia
                  _Cds.Data := GetDataPacket('SELECT MAX(PLNREFERENCIA) AS IDULTREFERENCIA '+
                                             'FROM PLANILHA '+
                                             'WHERE (IDPESSOA     = ' + FloatToStr(dEmpresa) + ')  AND '+
                                             '      (PERNUMERO    = ' + IntToStr(iPeriodo)   + ')  AND '+
                                             '      (PEREXERCICIO = ' + IntToStr(iExercicio) + ')');

                  iNumRef := _Cds.FieldByName('IDULTREFERENCIA').AsInteger + 1;

               end;
               if iNumRef > 0 then begin
                  sSql := 'UPDATE PLANILHA SET PLNREFERENCIA = '+ IntToStr(iNumRef) +
                           'WHERE (PLNCODIGO = ' + IntToStr(cdsPlanilSRef.FieldByName('PLNCODIGO').AsInteger) + ')';

                  Result := ExecSql(sSql);
                  If Not Result Then
                     Abort;
               end;
//               Commit; //Marcio Sanches Spinosa SOL 199256 Kintana 2007140
               //Marcio Sanches Spinosa SOL 199256 Kintana 2007140 - Inicio
               if (dtmBaseDados.dbBaseDados.InTransaction) then
                 dtmBaseDados.dbBaseDados.Commit;
               //Marcio Sanches Spinosa SOL 199256 Kintana 2007140 - Fim
            Except
               RollBack;
               Result := false;
            End;
         End;
         cdsPlanilSRef.Next;
      End;
   End;


end;

end.
