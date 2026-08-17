unit uCtrlConfigEtiq;

interface

Uses DB, SysUtils, uCmControlObject, DbClient, uDbEtiqueta, uDbReportsRelCM,
     uCMTypes;

Type

  TCtrlConfigEtiq = class(TCmControlObject)
  Protected
    _Operacao: TOperacao;
    _DbEtiqueta: TDbEtiqueta;
    _DbReportsRelCM: TDbReportsRelCM;

    _CdsReport: TClientDataSet;
    _Cds: TClientDataSet;

    procedure DoChangeDataBase; Override;
  private

  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;

    function ProcessaConfig(ovCds, ovCdsReport: OleVariant; Operacao: TOperacao): Boolean;
  End;

implementation

{ TCtrlConfigEtiq }

constructor TCtrlConfigEtiq.Create;
begin
  inherited;
  _DbEtiqueta := TDbEtiqueta.Create(Self);
  _DbReportsRelCM := TDbReportsRelCM.Create(Self);

  _CdsReport := TClientDataSet.Create(nil);
  _Cds := TClientDataSet.Create(nil);
end;

destructor TCtrlConfigEtiq.Destroy;
begin
  _DbEtiqueta.Free;
  _DbReportsRelCM.Free;

  _CdsReport.Free;
  _Cds.Free;
  inherited;
end;

procedure TCtrlConfigEtiq.DoChangeDataBase;
begin
  inherited;
  _DbEtiqueta.DataBaseName := DataBaseName;
  _DbReportsRelCM.DataBaseName := DataBaseName;
end;


function TCtrlConfigEtiq.ProcessaConfig(ovCds,
  ovCdsReport: OleVariant; Operacao: TOperacao): Boolean;

  procedure ProcessaCds(ovCds: OleVariant);
  begin
    If _Cds.Active Then _Cds.Close;
    _Cds.Data := ovCds;

    If _Operacao = OpApagar Then
    Begin
       While Not _Cds.Eof Do
          _Cds.Delete;
    End;

    If Not ApplyCds(_Cds, _DbEtiqueta, [_DbReportsRelCM.Idreports, _DbReportsRelCM.Origemcm], [_DbEtiqueta.Idreports, _DbEtiqueta.Origemcm ]) Then
       Raise Exception.Create(_DbEtiqueta.MessageInfo)
  end;

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

     Result := Connection.AppServer.ProcessaConfigEtiquetas(ovCds, ovCdsReport, Integer(Operacao));

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
