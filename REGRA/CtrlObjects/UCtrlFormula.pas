unit UCtrlFormula;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbFormula;
Type

  TCtrlFormula = class(TCmControlObject)
  private
    FCdsFormula: TCMClientDataSet;
    FDbFormula: TDbFormula;
    procedure SetCdsFormula(const Value: TCMClientDataSet);
    procedure SetDbFormula(const Value: TDbFormula);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbFormula : TDbFormula     read FDbFormula  write SetDbFormula;
    property CdsFormula : TCMClientDataSet read FCdsFormula write SetCdsFormula;

    function SelecionaFormula( iIdFormula : Integer ) : OleVariant;
    function ExisteFormula   ( iIdFormula : Integer ) : Boolean;
    function CopiaFormula    ( iIdFormula : Integer ) : Boolean;
    function GravaFormula : Boolean;

    Function Publicada( iIdFormula : Integer ) : OleVariant;

  published

end;

implementation

{ TCtrlFormula }

constructor TCtrlFormula.Create;
begin
  inherited;
  FDbFormula  := TDbFormula.Create(Self);
  FCdsFormula := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlFormula.Destroy;
begin
  FDbFormula.Free;
  FCdsFormula.Free;
  inherited;
end;

procedure TCtrlFormula.DoChangeDataBase;
begin
  inherited;
  FDbFormula.DataBaseName := Self.DataBaseName;
end;


function TCtrlFormula.GravaFormula: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarFormula( CdsFormula.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsFormula, DbFormula, [], [] );

      Msg := DbFormula.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


procedure TCtrlFormula.SetCdsFormula(const Value: TCMClientDataSet);
begin
  FCdsFormula := Value;
end;

procedure TCtrlFormula.SetDbFormula(const Value: TDbFormula);
begin
  FDbFormula := Value;
end;

function TCtrlFormula.SelecionaFormula( iIdFormula : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaFormula( iIdFormula );
  end else begin
    FDbFormula.IdFormula.AsInteger := iIdFormula;
    Result := GetDataPacket( FDbFormula.SSqlSelect );
  end;
end;


function TCtrlFormula.ExisteFormula(iIdFormula: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbFormula.IdFormula.AsInteger := iIdFormula;
    CdsFormula.Data := GetDataPacket( FDbFormula.SSqlSelect );
    Result := Not CdsFormula.IsEmpty;
  end;
end;

function TCtrlFormula.CopiaFormula  ( iIdFormula : Integer ) : Boolean;
Var
  iTamanho : Integer;
  sIdFormula, sDescricao,
  sDescricaoAux, sExpressaoFormula, sExpressaoReal,
  sSQL : String;
begin
  sIdFormula := IntToStr(FDbFormula.GetNextID);
  iTamanho   := CdsFormula.FieldbyName('EXPRESSAOREAL').Size;

  { Gera novo nome, preocupando-se com o tamanho da string }
  sDescricaoAux := 'Cópia de '+FDbFormula.Descricaoformula.AsString;
  if Length(sDescricaoAux) > iTamanho then
    sDescricaoAux := Copy(sDescricaoAux,1,iTamanho);
  { Gera novo nome, preocupando-se com o tamanho da string }
  sDescricaoAux := 'Cópia de '+CdsFormula.FieldbyName('DESCRICAOFORMULA').AsString;
  if Length(sDescricaoAux) > iTamanho then
    sDescricaoAux := Copy(sDescricaoAux,1,iTamanho);
  sExpressaoFormula := CdsFormula.FieldbyName('EXPRESSAOFORMULA').AsString;
  sExpressaoReal    := CdsFormula.FieldbyName('EXPRESSAOREAL').AsString;

  { Insere novo registro }
  sSQL := 'INSERT INTO FORMULA '+
          '  (IDFORMULA, DESCRICAOFORMULA, CODGRUPOFORMULA, EXPRESSAOFORMULA, EXPRESSAOREAL) '+
          'VALUES ('+sIdFormula                                             +','+
                     QuotedStr(sDescricaoAux)                               +','+
                     QuotedStr(CdsFormula.FieldbyName('CODGRUPOFORMULA').AsString) +','+
                     QuotedStr(sExpressaoFormula)+','+
                     QuotedStr(sExpressaoReal)   +')';

  ExecSQL(sSQL);
end;

function TCtrlFormula.Publicada( iIdFormula : Integer ) : OleVariant;
Var
  sSQL : String;
begin

 sSQL := ' SELECT R.IDREGRA, R.NOMEREGRA '+
         ' FROM REGRA R,ALGREGRA A       '+
         ' WHERE '+
         '   R.IDREGRA   = A.IDREGRA AND '+
         '   R.PUBLICADA = 1         AND '+
         '   A.FORMULA1  ='+IntToStr(iIdFormula) +
         ' ORDER BY R.NOMEREGRA';

  Result := GetDataPacket(sSQL);
end;

end.

