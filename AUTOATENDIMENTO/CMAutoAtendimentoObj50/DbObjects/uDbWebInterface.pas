{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/11/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebInterface;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWebInterface = class(TCmDbObject)

  private
    FFlgusamenu: TCmDbField;
    FFlgdemo: TCmDbField;
    FMenudistancia: TCmDbField;
    FMenucorfundosel: TCmDbField;
    FIdwebinterface: TCmDbField;
    FMenunomefonte: TCmDbField;
    FMenuposx: TCmDbField;
    FMenulargura: TCmDbField;
    FMenuposy: TCmDbField;
    FMenutamfonte: TCmDbField;
    FTimeout: TCmDbField;
    FEmail: TCmDbField;
    FFlgusalayers: TCmDbField;
    FEndlogin: TCmDbField;
    FMenucorfontesel: TCmDbField;
    FNomeinterface: TCmDbField;
    FMenucorfundo: TCmDbField;
    FMenualtura: TCmDbField;
    FMenucorfonte: TCmDbField;
    FFlgjanelarelat: TCmDbField;
    FDirFisico: TCmDbField;
    procedure SetEmail(const Value: TCmDbField);
    procedure SetEndlogin(const Value: TCmDbField);
    procedure SetFlgdemo(const Value: TCmDbField);
    procedure SetFlgusalayers(const Value: TCmDbField);
    procedure SetFlgusamenu(const Value: TCmDbField);
    procedure SetIdwebinterface(const Value: TCmDbField);
    procedure SetMenualtura(const Value: TCmDbField);
    procedure SetMenucorfonte(const Value: TCmDbField);
    procedure SetMenucorfontesel(const Value: TCmDbField);
    procedure SetMenucorfundo(const Value: TCmDbField);
    procedure SetMenucorfundosel(const Value: TCmDbField);
    procedure SetMenudistancia(const Value: TCmDbField);
    procedure SetMenulargura(const Value: TCmDbField);
    procedure SetMenunomefonte(const Value: TCmDbField);
    procedure SetMenuposx(const Value: TCmDbField);
    procedure SetMenuposy(const Value: TCmDbField);
    procedure SetMenutamfonte(const Value: TCmDbField);
    procedure SetNomeinterface(const Value: TCmDbField);
    procedure SetTimeout(const Value: TCmDbField);
    procedure SetFlgjanelarelat(const Value: TCmDbField);
    procedure SetDirFisico(const Value: TCmDbField);

  public

     Property Timeout: TCmDbField read FTimeout write SetTimeout;
     Property Nomeinterface: TCmDbField read FNomeinterface write SetNomeinterface;
     Property Menutamfonte: TCmDbField read FMenutamfonte write SetMenutamfonte;
     Property Menuposy: TCmDbField read FMenuposy write SetMenuposy;
     Property Menuposx: TCmDbField read FMenuposx write SetMenuposx;
     Property Menunomefonte: TCmDbField read FMenunomefonte write SetMenunomefonte;
     Property Menulargura: TCmDbField read FMenulargura write SetMenulargura;
     Property Menudistancia: TCmDbField read FMenudistancia write SetMenudistancia;
     Property Menucorfundosel: TCmDbField read FMenucorfundosel write SetMenucorfundosel;
     Property Menucorfundo: TCmDbField read FMenucorfundo write SetMenucorfundo;
     Property Menucorfontesel: TCmDbField read FMenucorfontesel write SetMenucorfontesel;
     Property Menucorfonte: TCmDbField read FMenucorfonte write SetMenucorfonte;
     Property Menualtura: TCmDbField read FMenualtura write SetMenualtura;
     Property Idwebinterface: TCmDbField read FIdwebinterface write SetIdwebinterface;
     Property Flgusamenu: TCmDbField read FFlgusamenu write SetFlgusamenu;
     Property Flgusalayers: TCmDbField read FFlgusalayers write SetFlgusalayers;
     Property Flgjanelarelat: TCmDbField read FFlgjanelarelat write SetFlgjanelarelat;
     Property Flgdemo: TCmDbField read FFlgdemo write SetFlgdemo;
     Property Endlogin: TCmDbField read FEndlogin write SetEndlogin;
     Property Email: TCmDbField read FEmail write SetEmail;
     Property DirFisico: TCmDbField read FDirFisico write SetDirFisico;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbWebInterface }

constructor TDbWebInterface.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBINTERFACE';

   fIdwebinterface := CreateCmDbField('IDWEBINTERFACE',ftfloat,True,True,False,True,'Interface');
   fNomeinterface := CreateCmDbField('NOMEINTERFACE',ftString,True,False,False,True,'Descrição da Interface');
   fFlgusamenu := CreateCmDbField('FLGUSAMENU',ftString,True,False,False,True,'Usa Menu');
   fFlgusalayers := CreateCmDbField('FLGUSALAYERS',ftString,True,False,False,True,'Usa Layers');
   fEmail := CreateCmDbField('EMAIL',ftString,True,False,False,True,'Email para Contato');
   fEndlogin := CreateCmDbField('ENDLOGIN',ftString,True,False,False,True,'Endereço da Página de Login');
   fTimeout := CreateCmDbField('TIMEOUT',ftfloat,True,False,False,False,'TimeOut');
   fFlgdemo := CreateCmDbField('FLGDEMO',ftString,True,False,False,True,'Demonstração');
   fFlgjanelarelat := CreateCmDbField('FLGJANELARELAT',ftString,True,False,False,True,'Abre nova janela para relatórios');
   fMenualtura := CreateCmDbField('MENUALTURA',ftfloat,True,False,False,True,'Altura do Item de Menu');
   fMenulargura := CreateCmDbField('MENULARGURA',ftfloat,True,False,False,True,'Lagura do Item de Menu');
   fMenutamfonte := CreateCmDbField('MENUTAMFONTE',ftfloat,True,False,False,True,'Tamanho da Fonte');
   fMenudistancia := CreateCmDbField('MENUDISTANCIA',ftfloat,True,False,False,True,'Distância Entre Menus');
   fMenuposx := CreateCmDbField('MENUPOSX',ftfloat,True,False,False,True,'Posição X do Menu');
   fMenuposy := CreateCmDbField('MENUPOSY',ftfloat,True,False,False,True,'Posição Y do Menu');
   fMenunomefonte := CreateCmDbField('MENUNOMEFONTE',ftString,True,False,False,True,'Fonte');
   fMenucorfonte := CreateCmDbField('MENUCORFONTE',ftString,True,False,False,True,'Cor da Fonte (não selecionado)');
   fMenucorfontesel := CreateCmDbField('MENUCORFONTESEL',ftString,True,False,False,True,'Cor da Fonte (selecionado)');
   fMenucorfundo := CreateCmDbField('MENUCORFUNDO',ftString,True,False,False,True,'Cor do Fundo (não selecionado)');
   fMenucorfundosel := CreateCmDbField('MENUCORFUNDOSEL',ftString,True,False,False,True,'Cor do Fundo (selecionado)');
   fDirfisico := CreateCmDbField('DIRFISICO',ftString,False,False,False,True,'Diretório Físico');   
end;

function TDbWebInterface.Insert: Boolean;
begin

   fIdwebinterface.AsFloat := GetSequence('WEBINTERFACE');
   Result := Inherited Insert;

end;

procedure TDbWebInterface.SetDirFisico(const Value: TCmDbField);
begin
  FDirFisico := Value;
end;

procedure TDbWebInterface.SetEmail(const Value: TCmDbField);
begin
  FEmail := Value;
end;

procedure TDbWebInterface.SetEndlogin(const Value: TCmDbField);
begin
  FEndlogin := Value;
end;

procedure TDbWebInterface.SetFlgdemo(const Value: TCmDbField);
begin
  FFlgdemo := Value;
end;

procedure TDbWebInterface.SetFlgjanelarelat(const Value: TCmDbField);
begin
  FFlgjanelarelat := Value;
end;

procedure TDbWebInterface.SetFlgusalayers(const Value: TCmDbField);
begin
  FFlgusalayers := Value;
end;

procedure TDbWebInterface.SetFlgusamenu(const Value: TCmDbField);
begin
  FFlgusamenu := Value;
end;

procedure TDbWebInterface.SetIdwebinterface(const Value: TCmDbField);
begin
  FIdwebinterface := Value;
end;

procedure TDbWebInterface.SetMenualtura(const Value: TCmDbField);
begin
  FMenualtura := Value;
end;

procedure TDbWebInterface.SetMenucorfonte(const Value: TCmDbField);
begin
  FMenucorfonte := Value;
end;

procedure TDbWebInterface.SetMenucorfontesel(const Value: TCmDbField);
begin
  FMenucorfontesel := Value;
end;

procedure TDbWebInterface.SetMenucorfundo(const Value: TCmDbField);
begin
  FMenucorfundo := Value;
end;

procedure TDbWebInterface.SetMenucorfundosel(const Value: TCmDbField);
begin
  FMenucorfundosel := Value;
end;

procedure TDbWebInterface.SetMenudistancia(const Value: TCmDbField);
begin
  FMenudistancia := Value;
end;

procedure TDbWebInterface.SetMenulargura(const Value: TCmDbField);
begin
  FMenulargura := Value;
end;

procedure TDbWebInterface.SetMenunomefonte(const Value: TCmDbField);
begin
  FMenunomefonte := Value;
end;

procedure TDbWebInterface.SetMenuposx(const Value: TCmDbField);
begin
  FMenuposx := Value;
end;

procedure TDbWebInterface.SetMenuposy(const Value: TCmDbField);
begin
  FMenuposy := Value;
end;

procedure TDbWebInterface.SetMenutamfonte(const Value: TCmDbField);
begin
  FMenutamfonte := Value;
end;

procedure TDbWebInterface.SetNomeinterface(const Value: TCmDbField);
begin
  FNomeinterface := Value;
end;

procedure TDbWebInterface.SetTimeout(const Value: TCmDbField);
begin
  FTimeout := Value;
end;

end.



