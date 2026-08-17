unit uCtrlConfigRelatorio;

interface

Uses DB, SysUtils, uCmControlObject, DbClient, uDbCartacobranca, uDbReportsRelCM,
     uCMTypes;

Type

  TCtrlConfigRelatorio = class(TCmControlObject)
  Protected
    _Operacao: TOperacao;
    _DbCartacobranca: TDbCartacobranca;
    _DbReportsRelCM: TDbReportsRelCM;

    _CdsReport: TClientDataSet;
    _Cds: TClientDataSet;

    procedure DoChangeDataBase; Override;
    procedure ProcessaCds(ovCds: OleVariant); Virtual;
    function ExecAppServer(ovCds, ovCdsReport: OleVariant; Operacao: TOperacao): Boolean; Virtual;
  private

  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;

    function ProcessaConfig(ovCds, ovCdsReport: OleVariant; Operacao: TOperacao): Boolean;
  End;

implementation

{ TCtrlConfigRelatorio }

constructor TCtrlConfigRelatorio.Create;
begin
  inherited;
  _DbCartacobranca := TDbCartacobranca.Create(Self);
  _DbReportsRelCM := TDbReportsRelCM.Create(Self);

  _CdsReport := TClientDataSet.Create(nil);
  _Cds := TClientDataSet.Create(nil);
end;

destructor TCtrlConfigRelatorio.Destroy;
begin
  _DbCartacobranca.Free;
  _DbReportsRelCM.Free;

  _CdsReport.Free;
  _Cds.Free;
  inherited;
end;

procedure TCtrlConfigRelatorio.DoChangeDataBase;
begin
  inherited;
  _DbCartacobranca.DataBaseName := DataBaseName;
  _DbReportsRelCM.DataBaseName := DataBaseName;
end;

function TCtrlConfigRelatorio.ExecAppServer(ovCds, ovCdsReport: OleVariant; Operacao: TOperacao): Boolean;
Begin
   Result := Connection.AppServer.ProcessaConfig(ovCds, ovCdsReport, Integer(Operacao));
End;

procedure TCtrlConfigRelatorio.ProcessaCds(ovCds: OleVariant);
begin
  If _Cds.Active Then _Cds.Close;
  _Cds.Data := ovCds;

  If _Operacao = OpApagar Then
  Begin
     While Not _Cds.Eof Do
        _Cds.Delete;
  End; 

  If Not ApplyCds(_Cds, _DbCartacobranca, [_DbReportsRelCM.Idreports, _DbReportsRelCM.Origemcm], [_DbCartacobranca.Idreports, _DbCartacobranca.Origemcm ]) Then
     Raise Exception.Create(_DbCartacobranca.MessageInfo)
end;

function TCtrlConfigRelatorio.ProcessaConfig(ovCds,
  ovCdsReport: OleVariant; Operacao: TOperacao): Boolean;

  procedure ProcessaCdsReport;
  Begin
     If _CdsReport.Active Then _CdsReport.Close;
     _CdsReport.Data := ovCdsReport;

     If Operacao = OpApagar Then
     Begin
        While Not _CdsReport.Eof Do
           _CdsReport.Delete;
     End;

     If Not ApplyCds(_CdsReport, _DbReportsRelCM, [], []) Then
        Raise Exception.Create(_DbReportsRelCM.MessageInfo)
  End;

begin
  If ConnectionSide = CnsClient Then
  Begin

     Result := ExecAppServer(ovCds, ovCdsReport, Operacao);

     If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     _Operacao := Operacao;

     Result := True;
     Try
        StartTransaction;
                     
        Case Operacao of
          opInserir, opAlterar:
          Begin
             ProcessaCdsReport;
             ProcessaCds(ovCds);
          End;
          opApagar:
          Begin
             ProcessaCds(ovCds);
             ProcessaCdsReport;
          End;
        End;

        Commit;
     Except
        On E:Exception Do
        Begin
           Result := False;
           Rollback;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

end.
