{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/02/2003                             }
{                                                       }
{*******************************************************}

unit uDbInputSimulaBenef;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbInputSimulaBenef = class(TCmDbObject)

  private
    FCampo: TCmDbField;
    FTipodado: TCmDbField;
    FIdregravalida: TCmDbField;
    FValordefault: TCmDbField;
    FQuerypreenche: TCmDbField;
    FIdinput: TCmDbField;
    FIdregrapreenche: TCmDbField;
    FFlgquerypreenche: TCmDbField;
    FFlgqueryvalida: TCmDbField;
    FFlgpodealterar: TCmDbField;
    FQueryvalida: TCmDbField;
    FNomepararegra: TCmDbField;
    FFlgativo: TCmDbField;
    FTitulo: TCmDbField;
    FOrigemdado: TCmDbField;
    FFormato: TCmDbField;
    FFlgvisivel: TCmDbField;
    FListaitens: TCmDbField;
    FFlgrequerido: TCmDbField;
    procedure SetCampo(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgpodealterar(const Value: TCmDbField);
    procedure SetFlgquerypreenche(const Value: TCmDbField);
    procedure SetFlgqueryvalida(const Value: TCmDbField);
    procedure SetOrigemdado(const Value: TCmDbField);
    procedure SetIdinput(const Value: TCmDbField);
    procedure SetIdregrapreenche(const Value: TCmDbField);
    procedure SetIdregravalida(const Value: TCmDbField);
    procedure SetNomepararegra(const Value: TCmDbField);
    procedure SetQuerypreenche(const Value: TCmDbField);
    procedure SetQueryvalida(const Value: TCmDbField);
    procedure SetTipodado(const Value: TCmDbField);
    procedure SetTitulo(const Value: TCmDbField);
    procedure SetValordefault(const Value: TCmDbField);
    procedure SetFormato(const Value: TCmDbField);
    procedure SetFlgvisivel(const Value: TCmDbField);
    procedure SetListaitens(const Value: TCmDbField);
    procedure SetFlgrequerido(const Value: TCmDbField);

  public

     Property Valordefault: TCmDbField read FValordefault write SetValordefault;
     Property Titulo: TCmDbField read FTitulo write SetTitulo;
     Property Tipodado: TCmDbField read FTipodado write SetTipodado;
     Property Queryvalida: TCmDbField read FQueryvalida write SetQueryvalida;
     Property Querypreenche: TCmDbField read FQuerypreenche write SetQuerypreenche;
     Property Nomepararegra: TCmDbField read FNomepararegra write SetNomepararegra;
     Property Idregravalida: TCmDbField read FIdregravalida write SetIdregravalida;
     Property Idregrapreenche: TCmDbField read FIdregrapreenche write SetIdregrapreenche;
     Property Idinput: TCmDbField read FIdinput write SetIdinput;
     Property Origemdado: TCmDbField read FOrigemdado write SetOrigemdado;
     Property Flgqueryvalida: TCmDbField read FFlgqueryvalida write SetFlgqueryvalida;
     Property Flgquerypreenche: TCmDbField read FFlgquerypreenche write SetFlgquerypreenche;
     Property Flgpodealterar: TCmDbField read FFlgpodealterar write SetFlgpodealterar;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Flgvisivel: TCmDbField read FFlgvisivel write SetFlgvisivel;
     Property Flgrequerido: TCmDbField read FFlgrequerido write SetFlgrequerido;
     Property Campo: TCmDbField read FCampo write SetCampo;
     Property Formato: TCmDbField read FFormato write SetFormato;
     Property Listaitens: TCmDbField read FListaitens write SetListaitens;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbInputSimulaBenef }

constructor TDbInputSimulaBenef.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INPUTSIMULABENEF';

   fIdinput := CreateCmDbField('IDINPUT',ftfloat,True,True,False,False,'Id. do Input');
   fTitulo := CreateCmDbField('TITULO',ftString,True,False,False,False,'Título');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False,False,False,'Ativo');
   fNomepararegra := CreateCmDbField('NOMEPARAREGRA',ftString,False,False,False,False,'Nome para Regra');
   fTipodado := CreateCmDbField('TIPODADO',ftString,True,False,False,False,'Tipo de Dado');
   fFormato := CreateCmDbField('FORMATO',ftString,False,False,False,False,'Formato');
   fOrigemdado := CreateCmDbField('ORIGEMDADO',ftString,False,False,False,False,'Origem do Dado');
   fFlgpodealterar := CreateCmDbField('FLGPODEALTERAR',ftfloat,True,False,False,False,'Pode ser alterado');
   fFlgvisivel := CreateCmDbField('FLGVISIVEL',ftfloat,True,False,False,False,'Visível');
   FFlgrequerido := CreateCmDbField('FLGREQUERIDO',ftfloat,True,False,False,False,'Requerido');   
   fCampo := CreateCmDbField('CAMPO',ftString,False,False,False,False,'Campo');
   fIdregravalida := CreateCmDbField('IDREGRAVALIDA',ftfloat,False,False,False,True,'Regra de Validação');
   fFlgqueryvalida := CreateCmDbField('FLGQUERYVALIDA',ftfloat,False,False,False,False,'Utiliza Query Própria');
   fQueryvalida := CreateCmDbField('QUERYVALIDA',ftString,False,False,False,False,'Query de Validação');
   fValordefault := CreateCmDbField('VALORDEFAULT',ftString,False,False,False,False,'Conteúdo Fixo');
   fIdregrapreenche := CreateCmDbField('IDREGRAPREENCHE',ftfloat,False,False,False,True,'Regra de Preenchimento');
   fFlgquerypreenche := CreateCmDbField('FLGQUERYPREENCHE',ftfloat,False,False,False,False,'Utiliza Query Própria');
   fQuerypreenche := CreateCmDbField('QUERYPREENCHE',ftString,False,False,False,False,'Query de Preenchimento');
   FListaitens := CreateCmDbField('LISTAITENS',ftString,False,False,False,False,'Lista de Itens');
end;

function TDbInputSimulaBenef.Insert: Boolean;
begin

   fIdinput.AsFloat := GetSequence('INPUTSIMULABENEF');
   Result := Inherited Insert;

end;


procedure TDbInputSimulaBenef.SetCampo(const Value: TCmDbField);
begin
  FCampo := Value;
end;

procedure TDbInputSimulaBenef.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbInputSimulaBenef.SetFlgpodealterar(const Value: TCmDbField);
begin
  FFlgpodealterar := Value;
end;

procedure TDbInputSimulaBenef.SetFlgquerypreenche(const Value: TCmDbField);
begin
  FFlgquerypreenche := Value;
end;

procedure TDbInputSimulaBenef.SetFlgqueryvalida(const Value: TCmDbField);
begin
  FFlgqueryvalida := Value;
end;

procedure TDbInputSimulaBenef.SetOrigemdado(const Value: TCmDbField);
begin
  FOrigemdado := Value;
end;

procedure TDbInputSimulaBenef.SetIdinput(const Value: TCmDbField);
begin
  FIdinput := Value;
end;

procedure TDbInputSimulaBenef.SetIdregrapreenche(const Value: TCmDbField);
begin
  FIdregrapreenche := Value;
end;

procedure TDbInputSimulaBenef.SetIdregravalida(const Value: TCmDbField);
begin
  FIdregravalida := Value;
end;

procedure TDbInputSimulaBenef.SetNomepararegra(const Value: TCmDbField);
begin
  FNomepararegra := Value;
end;

procedure TDbInputSimulaBenef.SetQuerypreenche(const Value: TCmDbField);
begin
  FQuerypreenche := Value;
end;

procedure TDbInputSimulaBenef.SetQueryvalida(const Value: TCmDbField);
begin
  FQueryvalida := Value;
end;

procedure TDbInputSimulaBenef.SetTipodado(const Value: TCmDbField);
begin
  FTipodado := Value;
end;

procedure TDbInputSimulaBenef.SetTitulo(const Value: TCmDbField);
begin
  FTitulo := Value;
end;

procedure TDbInputSimulaBenef.SetValordefault(const Value: TCmDbField);
begin
  FValordefault := Value;
end;

procedure TDbInputSimulaBenef.SetFormato(const Value: TCmDbField);
begin
  FFormato := Value;
end;

procedure TDbInputSimulaBenef.SetFlgvisivel(const Value: TCmDbField);
begin
  FFlgvisivel := Value;
end;

procedure TDbInputSimulaBenef.SetListaitens(const Value: TCmDbField);
begin
  FListaitens := Value;
end;

procedure TDbInputSimulaBenef.SetFlgrequerido(const Value: TCmDbField);
begin
  FFlgrequerido := Value;
end;

end.



