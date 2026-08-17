{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/07/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlModelopersonalisado;

interface

Uses sysutils, uCmControlObject, DbClient, uCMTypes, uDbModelopersonalisado, uCtrlConfigRelatorio;

Type

  TCtrlModelopersonalisado = class(TCtrlConfigRelatorio)
  Protected
    procedure DoChangeDataBase; Override;

    procedure ProcessaCds(ovCds: OleVariant); Override;
  private
    _DbModelopersonalisado: TDbModelopersonalisado;
    
  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;
  End;

implementation

{ TCtrlConfigRelatorio }

constructor TCtrlModelopersonalisado.Create;
begin
  inherited;
  _DbModelopersonalisado := TDbModelopersonalisado.Create(Self);
end;

destructor TCtrlModelopersonalisado.Destroy;
begin
  _DbModelopersonalisado.Free;  
  inherited;
end;

procedure TCtrlModelopersonalisado.DoChangeDataBase;
begin
  inherited;
  _DbModelopersonalisado.DataBaseName := DataBaseName;
end;

procedure TCtrlModelopersonalisado.ProcessaCds(ovCds: OleVariant);
begin
  If _Cds.Active Then _Cds.Close;
  _Cds.Data := ovCds;

  If _Operacao = OpApagar Then
  Begin
     While Not _Cds.Eof Do  _Cds.Delete;                                
  End;

  If Not ApplyCds(_Cds, _DbModelopersonalisado,
                        [_DbReportsRelCM.Idreports, _DbReportsRelCM.Origemcm],
                        [_DbModelopersonalisado.Idreports, _DbModelopersonalisado.Origemcm ]) Then
     Raise Exception.Create(_DbCartacobranca.MessageInfo)
end;

end.
