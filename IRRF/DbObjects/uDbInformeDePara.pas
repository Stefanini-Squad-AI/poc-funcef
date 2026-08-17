unit uDbInformeDePara;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbInformeDePara = class(TCmDbObject)

  private
    FIdSituacao: TCmDbField;
    FIdInformeOrigem: TCmDbField;
    FIdInformeDestino: TCmDbField;
    procedure SetIdSituacao(const Value: TCmDbField);
    procedure SetIdInformeDestino(const Value: TCmDbField);
    procedure SetIdInformeOrigem(const Value: TCmDbField);

  public

     Property IdSituacao       : TCmDbField read FIdSituacao       write SetIdSituacao;
     Property IdInformeOrigem  : TCmDbField read FIdInformeOrigem  write SetIdInformeOrigem;
     Property IdInformeDestino : TCmDbField read FIdInformeDestino write SetIdInformeDestino;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert     : Boolean; Override;
     Function UpDate     : Boolean; Override;
     Function Delete     : Boolean; Override;
     Function LoadFromDb : Boolean; Override;
  End;

implementation


{ TDbInformeDePara }

constructor TDbInformeDePara.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  TableName             := 'INFORMEDEPARA';
  FIdSituacao           := CreateCmDbField('IdSituacao',       ftFloat, False, True,  False, True, '');
  FIdInformeOrigem      := CreateCmDbField('IdInformeOrigem',  ftFloat, False, True,  False, True, '');
  FIdInformeDestino     := CreateCmDbField('IdInformeDestino', ftFloat, False, False, False, True, '');
end;

function TDbInformeDePara.Delete: Boolean;
begin
  Result := inherited Delete;
end;

function TDbInformeDePara.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbInformeDePara.UpDate: Boolean;
begin
  Result := inherited Update;
end;

function TDbInformeDePara.LoadFromDb: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbInformeDePara.SetIdInformeDestino(const Value: TCmDbField);
begin
  FIdInformeDestino := Value;
end;

procedure TDbInformeDePara.SetIdInformeOrigem(const Value: TCmDbField);
begin
  FIdInformeOrigem := Value;
end;

procedure TDbInformeDePara.SetIdSituacao(const Value: TCmDbField);
begin
  FIdSituacao := Value;
end;


end.



