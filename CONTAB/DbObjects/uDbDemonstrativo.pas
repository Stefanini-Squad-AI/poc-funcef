{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbDemonstrativo;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbDemonstrativo = class(TCmDbObject)

  private
      FIdpessoa         :TCmDbField;
      FIddemonstrativo  :TCmDbField;
      FFlgtracoacima    :TCmDbField;
      FFlgtracoabaixo   :TCmDbField;
      FDemtitulocompl2  :TCmDbField;
      FDemtitulocompl   :TCmDbField;
      FDemtipo          :TCmDbField;
      FDemsequencia     :TCmDbField;
      FDemnatureza      :TCmDbField;
      FDemdescdemonstrat:TCmDbField;
      procedure SetIdpessoa         (const Value: TCmDbField);
      procedure SetIddemonstrativo  (const Value: TCmDbField);
      procedure SetFlgtracoacima    (const Value: TCmDbField);
      procedure SetFlgtracoabaixo   (const Value: TCmDbField);
      procedure SetDemtitulocompl2  (const Value: TCmDbField);
      procedure SetDemtitulocompl   (const Value: TCmDbField);
      procedure SetDemtipo          (const Value: TCmDbField);
      procedure SetDemnatureza      (const Value: TCmDbField);
      procedure SetDemsequencia     (const Value: TCmDbField);
      procedure SetDemdescdemonstrat(const Value: TCmDbField);
  protected
    function GetSqlSelect: String; Override;
  public
      Property Idpessoa          :TCmDbField  Read FIdpessoa          Write SetIdpessoa;
      Property DemTipo           :TCmDbField  Read FDemTipo           Write SetDemTipo;
      Property Iddemonstrativo   :TCmDbField  Read FIddemonstrativo   Write SetIddemonstrativo;
      Property Flgtracoacima     :TCmDbField  Read FFlgtracoacima     Write SetFlgtracoacima;
      Property Flgtracoabaixo    :TCmDbField  Read FFlgtracoabaixo    Write SetFlgtracoabaixo;
      Property Demtitulocompl2   :TCmDbField  Read FDemtitulocompl2   Write SetDemtitulocompl2;
      Property Demtitulocompl    :TCmDbField  Read FDemtitulocompl    Write SetDemtitulocompl;
      Property Demsequencia      :TCmDbField  Read FDemsequencia      Write SetDemsequencia;
      Property Demnatureza       :TCmDbField  Read FDemnatureza       Write SetDemnatureza;
      Property Demdescdemonstrat :TCmDbField  Read FDemdescdemonstrat Write SetDemdescdemonstrat;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDemonstrativo }

constructor TDbDemonstrativo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEMONSTRATIVO';

   FIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,False);
   FIddemonstrativo   := CreateCmDbField('IDDEMONSTRATIVO',ftfloat,True,True,False,False);
   FFlgtracoacima     := CreateCmDbField('FLGTRACOACIMA',ftString);
   FFlgtracoabaixo    := CreateCmDbField('FLGTRACOABAIXO',ftString);
   FDemtitulocompl2   := CreateCmDbField('DEMTITULOCOMPL2',ftString);
   FDemtitulocompl    := CreateCmDbField('DEMTITULOCOMPL',ftString);
   FDemtipo           := CreateCmDbField('DEMTIPO',ftString);
   FDemsequencia      := CreateCmDbField('DEMSEQUENCIA',ftfloat,False,False,False,True);
   FDemnatureza       := CreateCmDbField('DEMNATUREZA',ftString);
   FDemdescdemonstrat := CreateCmDbField('DEMDESCDEMONSTRAT',ftString);
end;

function TDbDemonstrativo.Insert: Boolean;
begin
   FIddemonstrativo.AsFloat := GetSequence('DEMONSTRATIVO');
   Result := Inherited Insert;
end;

function TDbDemonstrativo.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

function TDbDemonstrativo.GetSqlSelect: String;
begin
  If IdDemonstrativo.AsInteger = -1 Then
    Result := 'SELECT IdDemonstrativo, Flgtracoacima, Flgtracoabaixo, Demtitulocompl2, ' +
                 ' Demtitulocompl, Demtipo, Demsequencia ,Demnatureza, Demdescdemonstrat, IdPessoa '+
                 ' FROM DEMONSTRATIVO ORDER BY Demdescdemonstrat'
  Else
    Result := inherited GetSqlSelect;
end;

procedure TDbDemonstrativo.SetDemdescdemonstrat(const Value: TCmDbField);
begin
   FDemdescdemonstrat := Value;
end;

procedure TDbDemonstrativo.SetDemnatureza(const Value: TCmDbField);
begin
   FDemnatureza := Value;
end;

procedure TDbDemonstrativo.SetDemsequencia(const Value: TCmDbField);
begin
   FDemsequencia := Value;
end;

procedure TDbDemonstrativo.SetDemtipo(const Value: TCmDbField);
begin
   FDemtipo := Value;
end;

procedure TDbDemonstrativo.SetDemtitulocompl(const Value: TCmDbField);
begin
   FDemtitulocompl := Value;
end;

procedure TDbDemonstrativo.SetDemtitulocompl2(const Value: TCmDbField);
begin
   FDemtitulocompl2 := Value;
end;

procedure TDbDemonstrativo.SetFlgtracoabaixo(const Value: TCmDbField);
begin
   FFlgtracoabaixo := Value;
end;

procedure TDbDemonstrativo.SetFlgtracoacima(const Value: TCmDbField);
begin
   FFlgtracoacima := Value;
end;

procedure TDbDemonstrativo.SetIddemonstrativo(const Value: TCmDbField);
begin
   FIddemonstrativo := Value;
end;

procedure TDbDemonstrativo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

end.



