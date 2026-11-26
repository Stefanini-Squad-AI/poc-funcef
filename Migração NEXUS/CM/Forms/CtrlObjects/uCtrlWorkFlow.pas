unit uCtrlWorkFlow;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, Db, uCMTypes, uDbPassoworkflow,
     uDbWorkflow, uDbWorkflowusuario;

Type
  TCtrlWorkFlow = Class(TCmControlObject)

  private
    _DbWorkflow: TDbWorkflow;
    _DbPassoworkflow: TDbPassoworkflow;
    _DbWorkflowusuario: TDbWorkflowusuario;
    FCdsWorkflowusuario: TClientDataSet;
    FCdsWorkflow: TClientDataSet;
    FCdsPassoworkflow: TClientDataSet;
    procedure SetCdsPassoworkflow(const Value: TClientDataSet);
    procedure SetCdsWorkflow(const Value: TClientDataSet);
    procedure SetCdsWorkflowusuario(const Value: TClientDataSet);
  protected
    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;
    function ProcessaWorkFlow(Operacao: TOperacao): Boolean;

    Property CdsWorkflow: TClientDataSet read FCdsWorkflow write SetCdsWorkflow;
    Property CdsPassoworkflow: TClientDataSet read FCdsPassoworkflow write SetCdsPassoworkflow;
    Property CdsWorkflowusuario: TClientDataSet read FCdsWorkflowusuario write SetCdsWorkflowusuario;

  end;


implementation

Uses uMidasUtil, uDataBase;

{ TCtrlWorkFlow }

constructor TCtrlWorkFlow.Create;
begin
  inherited;
  _DbWorkflow := TDbWorkflow.Create(Self);
  _DbPassoworkflow := TDbPassoworkflow.Create(Self);
  _DbWorkflowusuario := TDbWorkflowusuario.Create(Self);
end;

destructor TCtrlWorkFlow.Destroy;
begin
  _DbWorkflow.Free;
  _DbPassoworkflow.Free;
  _DbWorkflowusuario.Free;

  If IsAppServer Then
     FreeCds([fCdsWorkflow, fCdsPassoworkflow, fCdsWorkflowusuario]);

  inherited;
end;

procedure TCtrlWorkFlow.DoChangeDataBase;
begin
  inherited;
  _DbWorkflow.DataBaseName := DataBaseName;
  _DbPassoworkflow.DataBaseName := DataBaseName;
  _DbWorkflowusuario.DataBaseName := DataBaseName;
end;

procedure TCtrlWorkFlow.OnCreateAppServer;
begin
  inherited;
  fCdsWorkflow := TClientDataSet.Create(nil);
  fCdsPassoworkflow := TClientDataSet.Create(nil);
  fCdsWorkflowusuario := TClientDataSet.Create(nil);
end;

function TCtrlWorkFlow.ProcessaWorkFlow(Operacao: TOperacao): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaWorkFlow( FCdsWorkflowusuario.Data, FCdsWorkflow.Data, FCdsPassoworkflow.Data, Integer(Operacao));


     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := False;

     Try
        StartTransaction;

        Case Operacao of
        opInserir, opAlterar:
           Begin
              Result := ApplyCds(fCdsWorkflow, _DbWorkflow ,[],[] );
              If Not Result Then Raise Exception.Create(_DbWorkflow.MessageInfo);

              result := ExecSQL('DELETE FROM PASSOWORKFLOW WHERE IDWORKFLOW = ' + _DbWorkflow.Idworkflow.AsString);
              If Not Result Then Raise Exception.Create(MessageInfo);

              _DbPassoworkflow.Idworkflow.AsInteger := -1;
              _Cds.Data := GetDataPacket(_DbPassoworkflow.SSqlSelect);

              fCdsPassoworkflow.first;
              while not fCdsPassoworkflow.eof do
              begin
                 MoveFields(fCdsPassoworkflow, _Cds, OpInserir, false);
                 fCdsPassoworkflow.next;
              end;

              Result := ApplyCds(_Cds, _DbPassoworkflow ,[_DbWorkflow.Idworkflow],[_DbPassoworkflow.Idworkflow], True);
              If Not Result Then Raise Exception.Create(_DbPassoworkflow.MessageInfo);

              Result := ApplyCds(FCdsWorkflowusuario, _DbWorkflowusuario ,[_DbWorkflow.Idworkflow],[_DbWorkflowusuario.Idworkflow], True);
              If Not Result Then Raise Exception.Create(_DbWorkflowusuario.MessageInfo);
           End;
        opApagar:
           Begin
              fCdsPassoworkflow.First;
              While Not fCdsPassoworkflow.Eof Do fCdsPassoworkflow.Delete;

              FCdsWorkflowusuario.First;
              While Not FCdsWorkflowusuario.Eof Do FCdsWorkflowusuario.Delete;

              fCdsWorkflow.First;
              While Not fCdsWorkflow.Eof Do fCdsWorkflow.Delete;

              Result := ApplyCds(fCdsPassoworkflow, _DbPassoworkflow ,[],[] );
              If Not Result Then Raise Exception.Create(_DbPassoworkflow.MessageInfo);

              Result := ApplyCds(FCdsWorkflowusuario, _DbWorkflowusuario ,[],[] );
              If Not Result Then Raise Exception.Create(_DbWorkflowusuario.MessageInfo);
           
              Result := ApplyCds(fCdsWorkflow, _DbWorkflow ,[],[] );
              If Not Result Then Raise Exception.Create(_DbWorkflow.MessageInfo);
           End;
        End;

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

procedure TCtrlWorkFlow.SetCdsPassoworkflow(const Value: TClientDataSet);
begin
  FCdsPassoworkflow := Value;
end;

procedure TCtrlWorkFlow.SetCdsWorkflow(const Value: TClientDataSet);
begin
  FCdsWorkflow := Value;
end;

procedure TCtrlWorkFlow.SetCdsWorkflowusuario(const Value: TClientDataSet);
begin
  FCdsWorkflowusuario := Value;
end;

end.
