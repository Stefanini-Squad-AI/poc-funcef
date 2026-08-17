unit uCtrlPlanilhaContabil;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils,wwQuery, provider, uCMTypes;

Type
  TCtrlPlanilhaContabil = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      Function ListaPlanilhaContabil : OleVariant;

  end;

implementation


procedure TCtrlPlanilhaContabil.DoChangeDataBase;
begin
  inherited;
  //
end;

constructor TCtrlPlanilhaContabil.Create;
begin
  inherited;
  //
end;

destructor TCtrlPlanilhaContabil.Destroy;
begin
  inherited;
  //
end;

function TCtrlPlanilhaContabil.ListaPlanilhaContabil : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                                          '+
           '   PLANILHA.PLNCODIGO, LANCAMENTO.LACHIST1, LANCAMENTO.LACHIST2 '+
           'FROM                                                            '+
           '   PLANILHA, LANCAMENTO                                         '+
           'WHERE                                                           '+
           '   PLANILHA.PLNCODIGO = LANCAMENTO.PLNCODIGO                    '+
           'ORDER BY                                                        '+
           '   LANCAMENTO.LACHIST1                                          ';
   Result := GetDataPacket(sSql);
end;



end.


