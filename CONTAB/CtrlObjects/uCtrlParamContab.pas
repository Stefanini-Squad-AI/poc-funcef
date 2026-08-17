unit uCtrlParamContab;

interface

Uses DB, uDataBase, uDbParamContab, uCmControlObject, dbclient, sysutils,Provider,
     ComCtrls,CMProcuraMask, CMProcura,DBTables,
     uCMTypes;

  Type

    TCtrlParamContab = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbParamContab  : TDbParamContab;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FcdsParamContab : TClientDataSet;

      procedure SetcdsParamContab(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsParamContab: TClientDataSet Read FcdsParamContab Write SetcdsParamContab;

      {Esta função tem o Objetivo de retornar regsitros da tabela de Plano}
      Function ListParamContab(dEmp :Double):OleVariant;

      {Esta função tem o objetivo de gravar registros na tabela Plano}
      Function Gravar :Boolean;

      {Esta função verifica se existe alguma planilha}
      Function ExistePlanilha(dEmp:Double) :Boolean;

      {Esta função verifica se existe conta para o plano informado}
      Function PlanoExisteConta(dPlano:Double) :Boolean;

      Function ExisteContaPlano(iplano:Integer) :boolean;
    End;


implementation

{ TCtrlPlano }

constructor TCtrlParamContab.Create;
begin
  inherited;
  _dbParamContab  := TDbParamContab.Create(Self);
end;

destructor TCtrlParamContab.Destroy;
begin
  inherited;

  _dbParamContab.Free;
  if isAppServer then FCdsParamContab.Free;

end;

function TCtrlParamContab.ListParamContab(dEmp :Double): OleVariant;
var
  sSql,sFiltro :string;
begin
      sSql := 'SELECT ' +
              '   IDPATRO,           ' +
              '   IDPLANOPREV,       ' +
      
              '   PACREDUEF,         ' +
              '   PACTIPOPERIMPTXT,  ' +
              '   PACOBRIGADATA,     ' +
              '   PACCONTRANATUR,    ' +
              '   PACCORRESPOND,     ' +
              '   PACORDEMSUBCONTA,  ' +
              '   PACMOEDACOTAS,     ' +
              '   PACNUMDOC,         ' +
              '   PACATIVPROJ,       ' +
              '   PACTIPOOPER,       ' +
              '   PACVALIDAPROC,     ' +
              '   FLGTIPOFECHAMENTO, ' +
              '   DATAULTFECHA,      ' +
              '   IDULTREFERENCIA,   ' +
              '   CAMINHOFIDELIO,    ' +
              '   PACFDOCOBOSCRISCA, ' +
              '   PACPESQPLALANC,    ' +
              '   PACDEFITECNA,      ' +
              '   PACRESECONTA,      ' +
              '   PACDATABLOQ,       ' +
              '   CONTACONTABCLI,    ' +
              '   CONTACREDCLI,      ' +
              '   PACCONTACUSTOTEL,  ' +
              '   PACPERCCUSTOTEL,   ' +
              '   FLGPERMITEZERO,    ' +
              '   FLGHISTCAIXAALTA,  ' +
              '   IDPESSOA,          ' +
              '   PACHISTDEFSUP,     ' +
              '   PACFORMDEFITECN,   ' +
              '   PACRESEMAT,        ' +
              '   PACPROGPREV,       ' +
              '   PACRESECONT,       ' +
              '   PACREVEDEFITECN,   ' +
              '   PACFORMSUPETECN,   ' +
              '   PACREVESUPETECN,   ' +
              '   PACDEFITECN,       ' +
              '   PACFDOCOBOSCRISC,  ' +
              '   PACCONRESULT,      ' +
              '   PACTIPOPERLANC,    ' +
              '   PLANO,             ' +
              '   PACPERDAGANHO,     ' +
              '   PACTIPOPERMOEDA,   ' +
              '   IDUSUARIOINCLUSAO, ' +
              '   PACREDUZA,         ' +
              '   PACREDUZP,         ' +
              '   PACREDUZR,         ' +
              '   PACREDUZD,         ' +
              '   PACREDUZC,         ' +
              '   PACREDUAI,         ' +
              '   PACREDUPI,         ' +
              '   PACREDURI,         ' +
              '   PACREDUDI,         ' +
              '   PACREDUCI,         ' +
              '   PACREDUAF,         ' +
              '   PACREDUPF,         ' +
              '   PACREDURF,         ' +
              '   PACREDUDF,         ' +
              '   PACREDUCF,         ' +
              '   PACDIAMES,         ' +
              '   PACDEBCRE,         ' +
              '   PACTOTPLANERRO,    ' +
              '   PACTOTAIS,         ' +
              '   PACDEBCREPLANERRO, ' +
              '   PACCODRED,         ' +
              '   PACPAGINA,         ' +
              '   PACULTDAT,         ' +
              '   PACENCER,          ' +
              '   PACINDICE,         ' +
              '   PACATSAL,          ' +
              '   PACMANTEM,         ' +
              '   PACMOEDAGERENCIAL, ' +
              '   PACMOEDAGEREN1,    ' +
              '   PACMOEDAGEREN2,    ' +
              '   PACMOEDAOFICIAL,   ' +
              '   PACSUBGRP1,        ' +
              '   PACSUBGRP2,        ' +
              '   PACSUBGRP3,        ' +
              '   PACSUBGRP4,        ' +
              '   PACREDUZO,         ' +
              '   PACREDUOI,         ' +
              '   PACREDUOF,         ' +
              '   PACEXERCICIOATUAL, ' +
              '   PACPERNULLATUALIZ, ' +
              '   PACESTORNA,        ' +
              '   PACOBRIGAHIST,     ' +
              '   PACDOBRADA,        ' +
              '   PACTIPOPERRESULT,  ' +
              '   PACREDUZE,         ' +
              '   PACREDUEI,         ' +
              '   PACPLNCODIGO,      ' +
              '   NVL( TRIM( FLGPLNSEQUENCE ), ''N'') AS FLGPLNSEQUENCE,  ' +
              '   NVL(FLGUSASPLANCASLD, ''N'') AS FLGUSASPLANCASLD '+ //pendência 25244 - 07/01/2008
              'FROM ' +
              '  PARAMCONTAB ';

      sfiltro := '';
      If (dEmp <> 0) Then
         sfiltro :=   'WHERE (IDPESSOA = ' + FloatToStr(dEmp) + ') ';

     sSql := Ssql + sFiltro;

     Result := GetDataPacket(sSql);


end;

function TCtrlParamContab.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarParamContab ( FcdsParamContab.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsParamContab,_dbParamContab,[],[] );
           Msg    := _dbParamContab.MessageInfo;
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


procedure TCtrlParamContab.DoChangeDataBase;
begin
  inherited;
  _dbParamContab.DataBaseName := DataBaseName;

end;


procedure TCtrlParamContab.SetCdsParamContab(const Value: TClientDataSet);
begin
  FCdsParamContab := Value;
end;



procedure TCtrlParamContab.OnCreateAppServer;
begin
  inherited;
  FCdsParamContab  := TClientDataSet.Create(nil);

end;

function TCtrlParamContab.ExistePlanilha(dEmp: Double): Boolean;
var
  sSql :string;
begin
    sSql := 'SELECT COUNT(PLNCODIGO) AS CONTAPLA ' +
            'FROM PLANILHA ' +
            'WHERE IDPESSOA = ' + FloatToStr(dEmp);

     _cds.Data := GetDataPacket(sSql);

     If _cds.FieldByName('CONTAPLA').asFloat <> 0 Then
        Result := True
     Else
        Result := False;

end;

function TCtrlParamContab.PlanoExisteConta(dPlano: Double): Boolean;
var
 sSql :string;
begin
     sSql := 'SELECT PLACONTA '+
             'FROM ' +
             '  PLANOCONTA '+
             'WHERE PLANO = ' + FloatTostr(dPlano);

     _cds.Data := GetDataPacket(sSql);
     
     If _cds.IsEmpty Then
        Result := False
     Else
        Result := True;

end;

function TCtrlParamContab.ExisteContaPlano(iplano: Integer): boolean;
var
  sSql :string;
begin
   sSql := 'Select PACPERDAGANHO, PACCONRESULT, PACREVESUPETECN,  '+
           '        PACFORMDEFITECN, PACREVEDEFITECN, PACRESEMAT, '+
           '        PACFDOCOBOSCRISC, PACHISTDEFSUP, PACPROGPREV, '+
           '        PACRESECONT, PACDEFITECN, PACFORMSUPETECN,    '+
           '        PACRESECONTA, PACDEFITECNA,PACFDOCOBOSCRISCA  '+
           'From PARAMCONTAB                                      '+
           'Where (PLANO = '+ IntToStr(iPlano) + ')               ';
    _cds.Data := GetDataPacket(sSql);
    if _cds.IsEmpty then
       result := False
    else
       result := true;
end;

end.
